library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk_src     : in  std_logic;
    clk_dst     : in  std_logic;
    reset_n     : in  std_logic;
    data_src    : out std_logic_vector(11 downto 0);
    req         : out std_logic;
    data_dst    : out std_logic_vector(11 downto 0);
    ack         : out std_logic;
    clk_src_out : out std_logic_vector(1 downto 0);
    clk_dst_out : out std_logic_vector(1 downto 0)
    );
end entity;

library ieee;
use ieee.std_logic_1164.all;

entity src is
  port (
    clk     : in  std_logic;
    reset_n : in  std_logic;
    data    : out std_logic_vector(11 downto 0);
    req     : out std_logic;
    ack     : in  std_logic
    );
end entity;

library ieee;
use ieee.std_logic_1164.all;

entity dst is
  port (
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    data     : in  std_logic_vector(11 downto 0);
    req      : in  std_logic;
    data_out : out std_logic_vector(11 downto 0);
    ack      : out std_logic
    );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture nosync of src is
  signal data_tgl            : std_logic_vector(7 downto 0);
  attribute keep             : boolean;
  attribute keep of data_tgl : signal is true;
  signal data_cnt            : unsigned(3 downto 0);
  signal reqreg              : std_logic;
  signal reset_sync          : std_logic_vector(1 downto 0);
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  sync : process(clk, reset_sync)
  begin
    if reset_sync(0) = '0' then
      data_tgl <= "10101010";
      data_cnt <= to_unsigned(0, data_cnt'length);
      reqreg   <= '0';
    elsif rising_edge(clk) then
      data_tgl <= not data_tgl;
      data_cnt <= data_cnt + 1;
      reqreg   <= not reqreg;
    end if;
  end process sync;

  data <= data_tgl & std_logic_vector(data_cnt);
  req  <= reqreg;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture flowcontrol of src is
  signal data_tgl            : std_logic_vector(7 downto 0);
  attribute keep             : boolean;
  attribute keep of data_tgl : signal is true;
  signal data_cnt            : unsigned(3 downto 0);
  signal reqreg              : std_logic;
  signal reset_sync          : std_logic_vector(1 downto 0);
  signal acksync0				  : std_logic;
  signal deadlock				  : std_logic;
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  sync : process(clk, reset_sync, ack)
  begin
    if reset_sync(0) = '0' then
      data_tgl <= "10101010";
      data_cnt <= to_unsigned(0, data_cnt'length);
		acksync0 <= '1';
		reqreg   <= '1';
		deadlock <= '0';
    elsif rising_edge(clk) then
      acksync0 <= ack;
      if acksync0 /= ack or deadlock = '1' then
			if reqreg = '1' then
				data_tgl <= "10101010";
			else
				data_tgl <= "01010101";
			end if;
        data_cnt <= data_cnt + 1;
        reqreg   <= not reqreg;
		  deadlock <= '0';
		else
		  deadlock <= '1';
      end if;
    end if;
  end process sync;

  data <= data_tgl & std_logic_vector(data_cnt);
  req  <= reqreg;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sync of src is
  signal data_tgl            : std_logic_vector(7 downto 0);
  attribute keep             : boolean;
  attribute keep of data_tgl : signal is true;
  signal data_cnt            : unsigned(3 downto 0);
  signal reqreg              : std_logic;
  signal reset_sync          : std_logic_vector(1 downto 0);
  signal acksync				  : unsigned(3 downto 0);
  signal deadlock				  : std_logic;
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  sync : process(clk, reset_sync, ack)
  begin
    if reset_sync(0) = '0' then
      data_tgl <= "10101010";
      data_cnt <= to_unsigned(0, data_cnt'length);
		acksync <= "1010";
		reqreg   <= '1';
		deadlock <= '0';
    elsif rising_edge(clk) then
      acksync <= shift_left(acksync, 1);
		acksync(0) <= ack;
      if acksync(3) /= acksync(2) or deadlock = '1' then
			if reqreg = '1' then
				data_tgl <= "10101010";
			else
				data_tgl <= "01010101";
			end if;
        data_cnt <= data_cnt + 1;
        reqreg   <= not reqreg;
		  deadlock <= '0';
		else
		  deadlock <= '1';
      end if;
    end if;
  end process sync;

  data <= data_tgl & std_logic_vector(data_cnt);
  req  <= reqreg;
end architecture;



architecture nosync of dst is
  signal reset_sync : std_logic_vector(1 downto 0);
  signal datareg    : std_logic_vector(data'range);
  signal oldreq     : std_logic;
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  reg : process(clk, reset_sync, req)
  begin
    if reset_sync(0) = '0' then
      datareg <= (others => '0');
      oldreq   <= '0';
    elsif rising_edge(clk) then
      oldreq <= req;
      if oldreq /= req then
        datareg <= data;
      end if;
    end if;
  end process reg;

  data_out <= datareg;
end architecture;

architecture flowcontrol of dst is
  signal reset_sync : std_logic_vector(1 downto 0);
  signal datareg    : std_logic_vector(data'range);
  signal reqsync0     : std_logic;
  signal reqsync1     : std_logic;
  signal reqsync2     : std_logic;
  signal ackreg     : std_logic;
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  reg : process(clk, reset_sync, req)
  begin
    if reset_sync(0) = '0' then
      datareg <= (others => '0');
		reqsync0 <= '0';
		reqsync1 <= '1';
		reqsync2 <= '0';
      ackreg  <= '0';
    elsif rising_edge(clk) then
      reqsync0 <= req;
		reqsync1 <= reqsync0;
		reqsync2 <= reqsync1;
      if reqsync0 /= req then
        datareg <= data;
        ackreg <= not ackreg;
      end if;
    end if;
  end process reg;

  data_out <= datareg;
  ack <= ackreg;
end architecture;


use ieee.numeric_std.all;

architecture sync of dst is
  signal reset_sync : std_logic_vector(1 downto 0);
  signal datareg    : unsigned(47 downto 0);
  signal reqsync    : unsigned(3 downto 0);
  signal ackreg     : std_logic;
begin
  rst : process(clk, reset_n)
  begin
    if reset_n = '0' then
      reset_sync <= (others => '0');
    elsif rising_edge(clk) then
      reset_sync <= '1' & reset_sync(1);
    end if;
  end process rst;

  reg : process(clk, reset_sync, req)
  begin
    if reset_sync(0) = '0' then
      datareg <= to_unsigned(0, datareg'length);
		reqsync <= "1010";
      ackreg  <= '0';
    elsif rising_edge(clk) then
      reqsync <= shift_left(reqsync, 1);
		reqsync(0) <= req;
      if reqsync(3) /= reqsync(2) then
        datareg <= shift_left(datareg, 12);
		  datareg(data'range) <= unsigned(data);
        ackreg <= not ackreg;
      end if;
    end if;
  end process reg;

  data_out <= std_logic_vector(datareg(47 downto 36));
  ack <= ackreg;
end architecture;

architecture top_arch of top is
  signal s_data : std_logic_vector(11 downto 0);
  signal s_req  : std_logic;
  signal s_ack  : std_logic;
begin
  src_inst : entity work.src(sync)
    port map (
      clk     => clk_src,
      reset_n => reset_n,
      data    => s_data,
      req     => s_req,
      ack     => s_ack
      );

  dst_inst : entity work.dst(sync)
    port map (
      clk      => clk_dst,
      reset_n  => reset_n,
      data     => s_data,
      req      => s_req,
      data_out => data_dst,
      ack      => s_ack
      );

  clk_src_out <= (others => clk_src);
  clk_dst_out <= (others => clk_dst);
  data_src    <= s_data;
  req         <= s_req;
  ack         <= s_ack;
end architecture;

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
    req     : out std_logic
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
    data_out : out std_logic_vector(11 downto 0)
    );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture src_arch of src is
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

architecture dst_arch of dst is
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
      oldreq   <= req;
    elsif rising_edge(clk) then
      oldreq <= req;
      if oldreq /= req then
        datareg <= data;
      end if;
    end if;
  end process reg;

  data_out <= datareg;
end architecture;

architecture top_arch of top is
  signal s_data : std_logic_vector(11 downto 0);
  signal s_req  : std_logic;
begin
  src_inst : entity work.src
    port map (
      clk     => clk_src,
      reset_n => reset_n,
      data    => s_data,
      req     => s_req
      );

  dst_inst : entity work.dst
    port map (
      clk      => clk_dst,
      reset_n  => reset_n,
      data     => s_data,
      req      => s_req,
      data_out => data_dst
      );

  clk_src_out <= (others => clk_src);
  clk_dst_out <= (others => clk_dst);
  data_src    <= s_data;
  req         <= s_req;
  ack         <= '-';
end architecture;

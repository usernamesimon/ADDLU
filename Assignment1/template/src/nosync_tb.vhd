library ieee;
use ieee.std_logic_1164.all;

entity tb_top is
end tb_top;

architecture tb of tb_top is

    component top
        port (clk_src     : in std_logic;
              clk_dst     : in std_logic;
              reset_n     : in std_logic;
              data_src    : out std_logic_vector (11 downto 0);
              req         : out std_logic;
              data_dst    : out std_logic_vector (11 downto 0);
              ack         : out std_logic;
              clk_src_out : out std_logic_vector (1 downto 0);
              clk_dst_out : out std_logic_vector (1 downto 0));
    end component;

    signal clk_src     : std_logic;
    signal clk_dst     : std_logic;
    signal reset_n     : std_logic;
    signal data_src    : std_logic_vector (11 downto 0);
    signal req         : std_logic;
    signal data_dst    : std_logic_vector (11 downto 0);
    signal ack         : std_logic;
    signal clk_src_out : std_logic_vector (1 downto 0);
    signal clk_dst_out : std_logic_vector (1 downto 0);

    constant clk_src_period : time := 16.6667 ns;
    constant clk_dst_period : time := 16.86 ns;
    signal clk_src_gen : std_logic := '0';
    signal clk_dst_gen : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top
    port map (clk_src     => clk_src,
              clk_dst     => clk_dst,
              reset_n     => reset_n,
              data_src    => data_src,
              req         => req,
              data_dst    => data_dst,
              ack         => ack,
              clk_src_out => clk_src_out,
              clk_dst_out => clk_dst_out);

    -- Clock generation
    clk_src_gen <= not clk_src_gen after clk_src_period/2 when TbSimEnded /= '1' else '0';
    clk_dst_gen <= not clk_dst_gen after clk_dst_period/2 when TbSimEnded /= '1' else '0';

    clk_src <= clk_src_gen;
    clk_dst <= clk_dst_gen;

    stimuli : process
    begin
        -- Reset generation
        reset_n <= '0';
        wait for 10 ns;
        reset_n <= '1';
        wait for 10 ns;

        wait for 100 * clk_src_period;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;
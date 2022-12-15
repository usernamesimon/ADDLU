library ieee;
use ieee.STD_LOGIC_1164.all;

entity top is
port(
		clk : in std_logic;
		data : in std_logic;
		q_out : out std_logic;
		clk_out : out std_logic
	);
end top;	
	
architecture beh of top is
begin
	clk_out <= clk;
	process (clk)
	begin
		if rising_edge(clk) then
			q_out <= data;
		end if;
	end process;			
end beh;

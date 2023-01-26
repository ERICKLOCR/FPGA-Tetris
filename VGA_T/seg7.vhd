library ieee;
use ieee.std_logic_1164.all;

entity seg7 is
	port( puntos: in std_logic;
			HEX: out std_logic_vector(6 downto 0));
end seg7;

architecture behavior of seg7 is
	begin
		with puntos select
			HEX<= 
				"0010010" when '0',
				"0000010" when '1',
				"1111111" when others;
end behavior;
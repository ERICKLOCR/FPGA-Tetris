library ieee;
use ieee.std_logic_1164.all;

entity vga is
	port(
		input_clk: in std_logic;  --for this example is 50MHz
		pixel_clk: out std_logic;  --monitor del reloj a 25MHz
	
		R: out std_logic_vector (3 downto 0);
		G: out std_logic_vector (3 downto 0);
		B: out std_logic_vector (3 downto 0);
		dipsw: in std_logic_vector (1 downto 0);
		led, led2, led3, led4, led5, led6 : out std_logic;
		puntos: inout std_logic;
		HEX: out std_logic_vector(6 downto 0);
		
		HS: out std_logic;
		VS: out std_logic);
end;

architecture behavioral of vga is
	signal pix_clock: STD_LOGIC;
	signal disp_ena : STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
	signal column   : INTEGER;    --horizontal pixel coordinate
	signal row      : INTEGER;    --vertical pixel coordinate
	signal reset,cs : std_logic;
	signal reloj, reloj2, reloj3, reloj4, reloj5, reloj6 : std_logic;
	
	begin

	pixel_clk<=pix_clock;
	reset<='1';
	cs<='1';
		

	u1: entity work.Gen25MHz(behavior) port map(input_clk,pix_clock);
													
	u2: entity work.vga_controller (behavior) port map 
		 (pix_clock, '1', HS, VS, disp_ena, column,row);
																			
	u3: entity work.hw_image_generator (behavior) port map 
		 (disp_ena, row, column, R, G, B, dipsw, dipsw, dipsw, dipsw, 
		 dipsw, dipsw, reloj, reloj2, reloj3, reloj4, reloj5, reloj6, 
		 led, led2, led3, led4, led5, led6, puntos);	

	u4: entity work.relojlento (behavior) port map 
		 (input_clk,reloj);
		 
	u5: entity work.relojlento (behavior) port map 
		 (input_clk,reloj2);
		 
	u6: entity work.relojlento (behavior) port map 
		 (input_clk,reloj3);
		 
	u7: entity work.relojlento (behavior) port map 
		 (input_clk,reloj4);
		 
	u8: entity work.relojlento (behavior) port map 
		 (input_clk,reloj5);
		 
	u9: entity work.relojlento (behavior) port map 
		 (input_clk,reloj6);
		 
	u10: entity work.seg7 (behavior) port map 
		 (puntos,HEX);
end;
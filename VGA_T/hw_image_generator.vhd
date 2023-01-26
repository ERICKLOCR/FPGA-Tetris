library IEEE;
use ieee.std_logic_1164.all;


ENTITY hw_image_generator IS
  GENERIC(
   pixels_y :  INTEGER := 478;   --row that first color will persist until
   pixels_x :  INTEGER := 600);  --column that first color will persist until
  
  PORT(
	 disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
	 dipsw	 :  IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
	 dipsw2, dipsw3, dipsw4, dipsw5, dipsw6 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	 reloj	 :  IN   STD_LOGIC;
	 reloj2, reloj3, reloj4, reloj5, reloj6 : IN STD_LOGIC;
	 led		 :  OUT   STD_LOGIC;
	 led2, led3, led4, led5, led6 : OUT STD_LOGIC;
	 puntos	 :  INOUT STD_LOGIC);
END hw_image_generator;



ARCHITECTURE behavior OF hw_image_generator IS

signal x: INTEGER RANGE 10 TO 310;
signal y: INTEGER RANGE 10 TO 418;
signal x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, l_x, l_y, l_y1: INTEGER RANGE 0 TO 600;
--signal a, b, c, d: INTEGER RANGE 0 TO 1;

--- ESPACIO DE JUEGO ---
begin
	
	process(disp_ena, row, column)
	begin
		if(disp_ena = '1') THEN 
			
			-- LETRAS --
			-- T --
			if ((row > 373 and row <433) and (column>440 and column<460)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			elsif ((row > 393 and row <413) and (column>459 and column<520)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
					
			-- E --	
			elsif ((row > 342 and row <363) and (column>440 and column<520)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
				
			elsif ((row > 303 and row <343) and (column>440 and column<460)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
					
			elsif ((row > 303 and row <343) and (column>470 and column<490)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
					
			elsif ((row > 303 and row <343) and (column>500 and column<520)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
					
			-- T --
			elsif ((row > 233 and row <293) and (column>440 and column<460)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '0');
			
			elsif ((row > 253 and row <273) and (column>459 and column<520)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '0');
					
			-- R --
			elsif ((row > 163 and row <223) and (column>440 and column<450)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			elsif ((row > 203 and row <223) and (column>449 and column<470)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			elsif ((row > 163 and row <183) and (column>449 and column<470)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			elsif ((row > 163 and row <223) and (column>469 and column<480)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');		
			
			elsif ((row > 203 and row <223) and (column>479 and column<520)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			elsif ((row > 173 and row <193) and (column>479 and column<520)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
					
			-- I --
			elsif ((row > 133 and row <153) and (column>440 and column<520)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			-- S --
			elsif ((row > 63 and row <123) and (column>440 and column<460)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			 elsif ((row > 103 and row <123) and (column>459 and column<470)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');	
					
			elsif ((row > 63 and row <123) and (column>469 and column<490)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			elsif ((row > 63 and row <83) and (column>489 and column<500)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			elsif ((row > 63 and row <123) and (column>499 and column<520)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			-- FIGURA L --
			elsif ((row > 363 and row <463) and (column>408 and column<428)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
			
			elsif ((row > 443 and row <463) and (column>427 and column<468)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
			
			-- FIGURA I --
			elsif ((row > 223 and row <363) and (column>530 and column<550)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
					
			elsif ((row > 133 and row <283) and (column>408 and column<428)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '0');
			
			-- FIGURA Z --
			elsif ((row > 13 and row <53) and (column>490 and column<510)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
					
			elsif ((row > 33 and row <53) and (column>509 and column<530)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
					
			elsif ((row > 33 and row <73) and (column>529 and column<550)) THEN
					red <= (OTHERS => '0');
					green<=(OTHERS => '0');
					blue<=(OTHERS => '1');
			
			
			-- ESPACIO DE JUEGO --	
			elsif ((row > 150 and row <160) and (column>0 and column<350)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			elsif ((row > 468 and row <478) and (column>0 and column<350)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
					
			elsif ((row > 159 and row <478) and (column>0 and column<10)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
								
			elsif ((row > 159 and row <478) and (column>340 and column<350)) THEN
					red <= (OTHERS => '1');
					green<=(OTHERS => '1');
					blue<=(OTHERS => '1');
			
			--CUADRO DE FIGURAS--		
--			elsif ((row > 170 and row <320) and (column>450 and column<460)) THEN
--					red <= (OTHERS => '1');
--					green<=(OTHERS => '1');
--					blue<=(OTHERS => '1');
--			
--			elsif ((row > 170 and row <320) and (column>590 and column<600)) THEN
--					red <= (OTHERS => '1');
--					green<=(OTHERS => '1');
--					blue<=(OTHERS => '1');
--					
--			elsif ((row > 170 and row <180) and (column>450 and column<600)) THEN
--					red <= (OTHERS => '1');
--					green<=(OTHERS => '1');
--					blue<=(OTHERS => '1');
--					
--				
--			elsif ((row > 310 and row <320) and (column>450 and column<600)) THEN
--					red <= (OTHERS => '1');
--					green<=(OTHERS => '1');
--					blue<=(OTHERS => '1');

			
			-- Figura 1 --
			elsif ((row > x and row <x+100) and (column>y and column<y+100)) THEN
				red <= (OTHERS => '1');
				blue <= (OTHERS => '1');
				
			elsif ((row > x3 and row <x3+100) and (column>y3 and column<y3+100)) THEN
				red <= (OTHERS => '1');
			
			
			--Figura 2--
			elsif ((row > x1 and row <x1+40) and (column>y1 and column<y1+150)) THEN
				blue <= (OTHERS => '1');
				
			elsif ((row > x4 and row <x4+40) and (column>y4 and column<y4+150)) THEN
				green <= (OTHERS => '1');
				blue <= (OTHERS => '1');
				
				
			--Figura 3--
			elsif ((row > x2 and row <x2+150) and (column>y2 and column<y2+40)) THEN
				green	<= (OTHERS => '1');
				red <= (OTHERS => '1');
				
			elsif ((row > x5 and row <x5+150) and (column>y5 and column<y5+40)) THEN
				green <= (OTHERS => '1');
			
			
			-- LIMITES --
			l_x<=367;
			l_y<=10;
			l_y1<=239;
			
					
			--Fondo--		
			else		
					red <= (OTHERS => '0');
					green	<= (OTHERS => '0');
					blue <= (OTHERS => '0');
			end if;
		END IF;
	END PROCESS;

	
	
	--LIMITES PARA LA PRIMERA FIGURA --				
	PROCESS(reloj,dipsw,disp_ena)
	BEGIN
		if (reloj' event and reloj = '1') then
			led<='0';
			if ((dipsw(1)='0' and dipsw(0)='0') or (dipsw(1)='1' and dipsw(0)='1')) then
				if (((y=l_y or y=l_y1) and x<l_x) or ((y>l_y or y<l_y1) and x<l_x)) then 
					y<=y;
					x<=x+1;
					elsif (((y=l_y or y=l_y1) and x=l_x) or ((y>l_y or y<l_y1) and x=l_x)) then 
						y<=y;
						x<=x;
				end if;
					
				elsif (dipsw(1)='0' and dipsw(0)='1') then 
				if (y=l_y1 and x<l_x) then 
					x<=x+1;
					y<=y;
					elsif (y=l_y1 and x=l_x) then 
						x<=x;
						y<=y;
					elsif (y<l_y1 and x<l_x) then 
						x<=x+1;
						y<=y+1;
				end if;
					
				elsif (dipsw(1)='1' and dipsw(0)='0') then 
					if (y=l_y and x<l_x) then 
						x<=x+1;
						y<=y;
						elsif (y=l_y and x=l_x) then 
							x<=x;
							y<=y;
							
						elsif (y>l_y and x<l_x) then 
							x<=x+1;
							y<=y-1;
					end if;
			end if;
		end if;
		if (x=l_x) then
				led<='1';
		end if;
	end process;

	
	-- LIMITES PARA LA SEGUNDA FIGURA --
	PROCESS(reloj2, dipsw2)
	BEGIN
			if (reloj2' event and reloj2 = '1') then
				-- Condicion para que caiga la segunda pieza --
				if ((y=l_y and x=l_x) or (y=l_y1 and x=l_x) or ((y>l_y or y<l_y1) and x=l_x)) then
					led2 <='0';
					-- Apilación --
					if ((dipsw2(1)='0' and dipsw2(0)='0') or (dipsw2(1)='1' and dipsw2(0)='1')) then 
						if (((y1=l_y or y1=l_y1-50) and x1<l_x-40) or ((y1>l_y or y1<l_y1-50) and x1<l_x-40)) then 
							y1<=y1;
							x1<=x1+1;
							elsif (((y1=l_y or y1=l_y1-50) and x1=l_x-40) or ((y1>l_y or y1<l_y1-50) and x1=l_x-40)) then 
								y1<=y1;
								x1<=x1;
						end if;
					
					elsif (dipsw2(1)='0' and dipsw2(0)='1') then 
						if (y1=l_y1-50 and x1<l_x-40) then 
							x1<=x1+1;
							y1<=y1;
							elsif (y1=l_y1-50 and x1=l_x-40) then 
								x1<=x1;
								y1<=y1;
							elsif (y1<l_y1-50 and x1<l_x-40) then 
								x1<=x1+1;
								y1<=y1+1;
						end if;
						
					elsif (dipsw2(1)='1' and dipsw2(0)='0') then 
						if (y1=l_y and x1<l_x-40) then 
							x1<=x1+1;
							y1<=y1;
							elsif (y1=l_y and x1=l_x-40) then 
								x1<=x1;
								y1<=y1;
								
							elsif (y1>l_y and x1<l_x-40) then 
								x1<=x1+1;
								y1<=y1-1;
						end if;
					end if;
				else
					x1<=0;
			end if;
		end if;
		if (x1=l_x-40) then
			led2<='1';
		end if;
	end process;
	
	-- LIMITES PARA LA TERCERA FIGURA --
	PROCESS(reloj3, dipsw3)
	BEGIN
			if (reloj3' event and reloj3 = '1') then
				-- Condicion para que caiga la tercera pieza --
				if ((y1=l_y1-50 and x1=l_x-40) or (y1=l_y and x1=l_x-40) or ((y1>l_y or y1<l_y1-50) and x1=l_x-40)) then
					led3<='0';
					-- Apilación --
					if ((dipsw3(1)='0' and dipsw3(0)='0') or (dipsw3(1)='1' and dipsw3(0)='1')) then 
						if (((y2=l_y or y2=l_y1-150) and x2<l_x-50) or ((y2>l_y or y2<l_y1-150) and x2<l_x-50)) then 
							y2<=y2;
							x2<=x2+1;
							elsif (((y2=l_y or y2=l_y1-150) and x2=l_x-50) or ((y2>l_y or y2<l_y1-150) and x2=l_x-50)) then 
								y2<=y2;
								x2<=x2;
						end if;
					
					elsif (dipsw3(1)='0' and dipsw3(0)='1') then 
						if (y2=l_y1-150 and x2<l_x) then 
							x2<=x2+1;
							y2<=y2;
							elsif (y2=l_y1-150 and x2=l_x-50) then 
								x2<=x2;
								y2<=y2;
							elsif (y2<l_y1-150 and x2<l_x-50) then 
								x2<=x2+1;
								y2<=y2+1;
						end if;
						
					elsif (dipsw3(1)='1' and dipsw3(0)='0') then 
						if (y2=l_y and x2<l_x-50) then 
							x2<=x2+1;
							y2<=y2;
							elsif (y2=l_y and x2=l_x-50) then 
								x2<=x2;
								y2<=y2;
							
							elsif (y2>l_y and x2<l_x-50) then 
								x2<=x2+1;
								y2<=y2-1;
						end if;
					end if;
				else
					x2<=0;
			end if;
		end if;
		if (x2=l_x-50) then
			led3<='1';
		end if;
	end process;
	
	
	-- LIMITES PARA LA CUARTA FIGURA --
	PROCESS(reloj4, dipsw4)
	BEGIN
			if (reloj4' event and reloj4 = '1') then
				-- Condicion para que caiga la cuarta pieza --
				if ((y2=l_y1-150 and x2=l_x-50) or (y2=l_y and x2=l_x-50) or ((y2>l_y or y2<l_y1-150) and x2=l_x-50)) then
					led4<='0';
					-- Apilación --
					if ((dipsw4(1)='0' and dipsw4(0)='0') or (dipsw4(1)='1' and dipsw4(0)='1')) then 
						if (((y3=l_y+40 or y3=l_y1-150) and x3<l_x) or ((y3>l_y+40 or y3<l_y1-150) and x3<l_x)) then 
							y3<=y3;
							x3<=x3+1;
							elsif (((y3=l_y+40 or y3=l_y1-150) and x3=l_x) or ((y3>l_y+50 or y3<l_y1-150) and x3=l_x)) then 
								y3<=y3;
								x3<=x3;
						end if;
					
					elsif (dipsw3(1)='0' and dipsw3(0)='1') then 
						if (y3=l_y1-150 and x3<l_x) then 
							x3<=x3+1;
							y2<=y2;
							elsif (y3=l_y1-150 and x3=l_x) then 
								x3<=x3;
								y3<=y3;
							elsif (y3<l_y1-150 and x3<l_x) then 
								x3<=x3+1;
								y3<=y3+1;
						end if;
						
					elsif (dipsw3(1)='1' and dipsw3(0)='0') then 
						if (y3=l_y+40 and x3<l_x-50) then 
							x3<=x3+1;
							y3<=y3;
							elsif (y3=l_y+40 and x3=l_x) then 
								x3<=x3;
								y3<=y3;
							
							elsif (y3>l_y+40 and x3<l_x) then 
								x3<=x3+1;
								y3<=y3-1;
						end if;
					end if;
				else
					x3<=0;
			end if;
		end if;
		if (x3=l_x) then
			led4<='1';
		end if;
	end process;
	
	
	-- LIMITES PARA LA QUINTA FIGURA --
	PROCESS(reloj5, dipsw5)
	BEGIN
			if (reloj5' event and reloj5 = '1') then
				-- Condicion para que caiga la segunda pieza --
				if ((y3=l_y1-150 and x3=l_x) or (y3=l_y+40 and x3=l_x) or ((y3>l_y+50 or y3<l_y1-150) and x3=l_x)) then
					led5<='0';
					-- Apilación --
					if ((dipsw5(1)='0' and dipsw5(0)='0') or (dipsw5(1)='1' and dipsw5(0)='1')) then 
						if (((y4=l_y or y4=l_y1) and x4<l_x-90) or ((y4>l_y or y4<l_y1) and x4<l_x-90)) then 
							y4<=y4;
							x4<=x4+1;
							elsif (((y4=l_y or y4=l_y1) and x4=l_x-90) or ((y4>l_y or y4<l_y1) and x4=l_x-90)) then 
								y4<=y4;
								x4<=x4;
						end if;
					
					elsif (dipsw5(1)='0' and dipsw5(0)='1') then 
						if (y4=l_y1 and x4<l_x-90) then 
							x4<=x4+1;
							y4<=y4;
							elsif (y4=l_y1 and x4=l_x-90) then 
								x4<=x4;
								y4<=y4;
							elsif (y4<l_y1 and x4<l_x-90) then 
								x4<=x4+1;
								y4<=y4+1;
						end if;
						
					elsif (dipsw5(1)='1' and dipsw5(0)='0') then 
						if (y4=l_y and x4<l_x-90) then 
							x4<=x4+1;
							y4<=y4;
							elsif (y4=l_y and x4=l_x-90) then 
								x4<=x4;
								y4<=y4;
							
							elsif (y4>l_y and x4<l_x-90) then 
								x4<=x4+1;
								y4<=y4-1;
						end if;
					end if;
				else
					x4<=0;
			end if;
		end if;
		if (x4=l_x-90) then
			led5<='1';
		end if;
	end process;

	
	
	-- LIMITES PARA LA SEXTA FIGURA --
	PROCESS(reloj6, dipsw6)
	BEGIN
			if (reloj6' event and reloj6 = '1') then
				-- Condicion para que caiga la segunda pieza --
				if ((y4=l_y1 and x4=l_x-90) or (y4=l_y and x4=l_x-90) or ((y4>l_y or y4<l_y1) and x4=l_x-90)) then
					led6<='0';
					-- Apilación --
					if ((dipsw6(1)='0' and dipsw6(0)='0') or (dipsw6(1)='1' and dipsw6(0)='1')) then 
						if (((y5=l_y or y5=l_y1) and x5<l_x-240) or ((y5>l_y or y5<l_y1) and x5<l_x-240)) then 
							y5<=y5;
							x5<=x5+1;
							elsif (((y5=l_y or y5=l_y1) and x5=l_x-240) or ((y5>l_y or y5<l_y1) and x5=l_x-240)) then 
								y5<=y5;
								x5<=x5;
						end if;
					
					elsif (dipsw6(1)='0' and dipsw6(0)='1') then 
						if (y5=l_y1 and x5<l_x-240) then 
							x5<=x5+1;
							y5<=y5;
							elsif (y5=l_y1 and x5=l_x-240) then 
								x5<=x5;
								y5<=y5;
							elsif (y5<l_y1 and x5<l_x-240) then 
								x5<=x5+1;
								y5<=y5+1;
						end if;
						
					elsif (dipsw6(1)='1' and dipsw6(0)='0') then 
						if (y5=l_y and x5<l_x-240) then 
							x5<=x5+1;
							y5<=y5;
							elsif (y5=l_y and x5=l_x-240) then 
								x5<=x5;
								y5<=y5;
							
							elsif (y5>l_y and x5<l_x-240) then 
								x5<=x5+1;
								y5<=y5-1;
						end if;
					end if;
				else
					x5<=0;
			end if;
		end if;
		if (x5=l_x-240) then
			led6<='1';
		end if;
	end process;

	
	-- GAME OVER --
	PROCESS(puntos)
	BEGIN
			if (x5=l_x-240) then
				puntos<='1';
			else
				puntos<='0';
		end if;
	end process;
END behavior;
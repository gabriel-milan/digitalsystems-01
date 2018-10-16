----------------------------------------------------------------------------------
-- Company: UFRJ
-- Engineer: Patrick Franco Braz
-- 
-- Create Date:    10:15:31 09/19/2018 
-- Design Name: 
-- Module Name:    AND_4BIT - Behavioral 
----------------------------------------------------------------------------------
library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AND_4BIT is
    Port ( x: in STD_LOGIC_VECTOR (3 downto 0);
			  y: in STD_LOGIC_VECTOR (3 downto 0);
			  z: out STD_LOGIC_VECTOR (3 downto 0));
end AND_4BIT;

architecture Behavioral of AND_4BIT is

begin
  --> Pega cada entrada e tira os and's individuais
	process (x,y)
		begin
		  z(0) <= x(0) and y(0);
		  z(1) <= x(1) and y(1);
		  z(2) <= x(2) and y(2);
		  z(3) <= x(3) and y(3);
		end process;	  
end Behavioral;
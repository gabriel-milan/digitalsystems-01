----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:29 09/21/2018 
-- Design Name: 
-- Module Name:    OR_4BITS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_4BITS is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end OR_4BITS;

architecture Behavioral of OR_4BITS is

begin
	process(A,B)
		begin
		--Z <= A or B;
		Z(0) <= A(0) or B(0);
		Z(1) <= A(1) or B(1);
		Z(2) <= A(2) or B(2);
		Z(3) <= A(3) or B(3);
	end process;
end Behavioral;


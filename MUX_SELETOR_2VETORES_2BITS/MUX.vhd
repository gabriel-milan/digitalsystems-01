----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:33 08/24/2018 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    Port ( A : in  STD_LOGIC_VECTOR(1 downto 0);
           B : in  STD_LOGIC_VECTOR(1 downto 0);
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR(1 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

mux: process (A, B, S)
	begin
		if (S = '0') then
			Z <= A;
		else
			Z <= B;
		end if;
	end process mux;


end Behavioral;


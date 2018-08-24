----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:14 08/24/2018 
-- Design Name: 
-- Module Name:    FULL_ADDER_4BITS - Behavioral 
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

entity FULL_ADDER_4BITS is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Cout2 : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end FULL_ADDER_4BITS;

architecture Behavioral of FULL_ADDER_4BITS is

begin

full_adder: process (A, B, Cin)
	begin
		-- Criar variavel temp para atribuir os valores
		Z <= A xor B xor Cin;
		
	end process full_adder;

end Behavioral;


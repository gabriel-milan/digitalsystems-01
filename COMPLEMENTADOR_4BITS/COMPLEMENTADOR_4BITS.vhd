----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:25:53 08/24/2018 
-- Design Name: 
-- Module Name:    COMPLEMENTADOR_4BITS - Behavioral 
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

entity COMPLEMENTADOR_4BITS is
    Port ( I : in  STD_LOGIC_VECTOR(3 downto 0) ;
           K : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPLEMENTADOR_4BITS;

architecture Behavioral of COMPLEMENTADOR_4BITS is

begin

compl4: process (I, K)
begin
	if (K = '1') then
		Z <= not I;
	else
		Z <= I;
	end if;
end process compl4;

end Behavioral;


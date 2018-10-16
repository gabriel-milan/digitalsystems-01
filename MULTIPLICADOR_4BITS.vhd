----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:43 10/05/2018 
-- Design Name: 
-- Module Name:    MULTIPLICADOR_4BITS - Behavioral 
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

entity MULTIPLICADOR_4BITS is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end MULTIPLICADOR_4BITS;

architecture Behavioral of MULTIPLICADOR_4BITS is

-- 1-bit adder component
component ADDER_1BIT
	port (I0, I1, Cin : in STD_LOGIC;
			S, Cout: out STD_LOGIC);
end component;

signal tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9 : STD_LOGIC;
signal CoutZ1, CoutZ2, Cout2, Cout4, Cout5 : STD_LOGIC;
signal sum2, sum4, sum5 : STD_LOGIC;

begin

	Z(0) <= A(0) and B(0);
	tmp1 <= A(1) and B(0);
	tmp2 <= A(0) and B(1);
	tmp3 <= A(2) and B(0);
	tmp4 <= A(1) and B(1);
	tmp5 <= A(0) and B(2);
	tmp6 <= A(3) and B(0);
	tmp7 <= A(2) and B(1);
	tmp8 <= A(1) and B(2);
	tmp9 <= A(0) and B(3);
	U1: ADDER_1BIT port map (tmp1, tmp2, '0', Z(1), CoutZ1);
	U2: ADDER_1BIT port map (tmp3, tmp4, CoutZ1, sum2, Cout2);
	U3: ADDER_1BIT port map (sum2, tmp5, Cout2, Z(2), CoutZ2);
	U4: ADDER_1BIT port map (tmp6, tmp7, CoutZ2, sum4, Cout4);
	U5: ADDER_1BIT port map (sum4, tmp8, Cout4, sum5, Cout5);
	U6: ADDER_1BIT port map (sum5, tmp9, Cout5, Z(3));

end Behavioral;

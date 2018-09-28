
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MULTIPLICADOR_4BITS is
    Port ( X : in  STD_LOGIC_VECTOR (3	 DOWNTO 0);
           Y : in  STD_LOGIC_VECTOR (3	 DOWNTO 0);
           P : out  STD_LOGIC_VECTOR (3	 DOWNTO 0));
end MULTIPLICADOR_4BITS;

architecture Behavioral of MULTIPLICADOR_4BITS is

component FULL_ADDER_4BITS is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component FULL_ADDER_4BITS;

signal temp1, temp2 , temp3, temp4 : STD_LOGIC_VECTOR (3 downto 0);
signal Cout0,Cout1,Cout2: STD_LOGIC;
signal soma1, soma2 : STD_LOGIC_VECTOR (3 downto 0);

begin
 --> atribuindo valores aos sinais
  --> temp1
  temp1(0) <= X(0) and Y(0);
  temp1(1) <= X(1) and Y(0);
  temp1(2) <= X(2) and Y(0);
  temp1(3) <= X(3) and Y(0);
  --< end temp1
  --> temp2
  temp2(0) <= '0';
  temp2(1) <= x(0) and Y(1);
  temp2(2) <= x(1) and Y(1);
  temp2(3) <= x(2) and Y(1);
  --< end temp2
  --> temp3
  temp3(0) <= '0';
  temp3(1) <= '0';
  temp3(2) <= x(0) and Y(2);
  temp3(3) <= x(1) and Y(2);
  --< end temp3
    --> temp4
  temp4(0) <= '0';
  temp4(1) <= '0';
  temp4(2) <= '0';
  temp4(3) <= x(0) and Y(3);
  --< end temp4
  
		U1 : FULL_ADDER_4BITS port map (temp1,temp2, '0', soma1, Cout0);
		U2 : FULL_ADDER_4BITS port map (soma1 ,temp3,Cout0, soma2, Cout1);
		U3 : FULL_ADDER_4BITS port map (soma2 ,temp4,Cout1, P, Cout2);
				
end Behavioral;


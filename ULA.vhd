-- Import libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Defining the entity ports
entity ULA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Operation : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end ULA;

-- Começo da arquitetura
architecture Behavioral of ULA is

-- Componente AND de 4 bits
component AND_4BIT
	port (
		x: in STD_LOGIC_VECTOR (3 downto 0);
		y: in STD_LOGIC_VECTOR (3 downto 0);
		z: out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

-- Componente comparador de 4 bits
component COMPARADOR_4BITS
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		Gout : out  STD_LOGIC;
		Eout : out  STD_LOGIC;
		Sout : out  STD_LOGIC
	);
end component;

-- Componente complementador de 4 bits
component COMPLEMENTADOR_4BITS
	port (
		I : in STD_LOGIC_VECTOR (3 downto 0);
		K : in STD_LOGIC;
		Z : out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

-- Componente somador de 4 bits
component FULL_ADDER_4BITS
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
      B : in  STD_LOGIC_VECTOR (3 downto 0);
      Cin : in  STD_LOGIC;
      S : out  STD_LOGIC_VECTOR (3 downto 0);
      Cout : out  STD_LOGIC
	);
end component;

-- Componente multiplicador de 4 bits
component MULTIPLICADOR_4BITS
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		Z : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

-- Componente OR de 4 bits
component OR_4BITS
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		Z : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

-- Componente XOR de 4 bits
component XOR_4BITS
	port (
		A : in  STD_LOGIC_VECTOR(3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		Z : out  STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

-- Signals
signal Not_A, Compl_A, A_plus_B, A_times_B, Not_B, A_minus_B, A_and_B, A_xor_B, A_or_B, A_compare_B : STD_LOGIC_VECTOR (3 downto 0);

-- Comportamento da ULA
begin

	-- Declarando os componentes
	U1: COMPLEMENTADOR_4BITS port map (A, '1', Not_A); -- Para operação 1
	U2: FULL_ADDER_4BITS port map (Not_A, "0000", '1', Compl_A); -- Para operação 1
	U3: FULL_ADDER_4BITS port map (A, B, '0', A_plus_B); -- Para operação 2
	U4: MULTIPLICADOR_4BITS port map (A, B, A_times_B); -- Para operação 3
	U5: COMPLEMENTADOR_4BITS port map (B, '1', Not_B); -- Para operação 4
	U6: FULL_ADDER_4BITS port map (A, Not_B, '1', A_minus_B); -- Para operação 4
	U7: AND_4BIT port map (A, B, A_and_B); -- Para operação 5
	U8: XOR_4BITS port map (A, B, A_xor_B); -- Para operação 6
	U9: OR_4BITS port map (A, B, A_or_B); -- Para operação 7
	U10: COMPARADOR_4BITS port map (A, B, A_compare_B(2), A_compare_B(1), A_compare_B(0)); -- Para operação 8
	A_compare_B(3) <= '0'; -- Para operação 8
	
	-- Dando as saídas baseadas na escolha da operação
	process (Operation, Compl_A, A_plus_B, A_times_B, A_minus_B, A_and_B, A_xor_B, A_or_B, A_compare_B)
	begin
		case Operation is
			when "0000" =>
				Z <= Compl_A;
			when "1000" =>
				Z <= Compl_A;
			when "0001" =>
				Z <= A_plus_B;
			when "1001" =>
				Z <= A_plus_B;
			when "0010" =>
				Z <= A_times_B;
			when "1010" =>
				Z <= A_times_B;
			when "0011" =>
				Z <= A_minus_B;
			when "1011" =>
				Z <= A_minus_B;
			when "0100" =>
				Z <= A_and_B;
			when "1100" =>
				Z <= A_and_B;
			when "0101" =>
				Z <= A_xor_B;
			when "1101" =>
				Z <= A_xor_B;
			when "0110" =>
				Z <= A_or_B;
			when "1110" =>
				Z <= A_or_B;
			when "0111" =>
				Z <= A_compare_B;
			when "1111" =>
				Z <= A_compare_B;
			when others =>
				Z <= "0000";
		end case;
	end process;

end Behavioral;


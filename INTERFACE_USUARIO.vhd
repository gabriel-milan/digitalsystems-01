----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:17 10/16/2018 
-- Design Name: 
-- Module Name:    INTERFACE_USUARIO - Behavioral 
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

-- Entidade
entity INTERFACE_USUARIO is
	port (
		clock, reset, buttonA, buttonB, buttonOp : in  STD_LOGIC;
		input : in  STD_LOGIC_VECTOR (3 downto 0);
		ledA, ledB, ledOp : out STD_LOGIC; -- Vou usar esse ledOp para indicar a operação, no estado de input, e o resultado, no estado de output.
		output : out STD_LOGIC_VECTOR (3 downto 0)
	);
end INTERFACE_USUARIO;

-- Arquitetura
architecture Behavioral of INTERFACE_USUARIO is

-- Componente do contador
component CONTADOR
	port (
		load : in  STD_LOGIC;
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		data: in INTEGER RANGE 300000000 DOWNTO 0;
		output: out INTEGER RANGE 300000000 DOWNTO 0
	);
end component;

-- Componente da ULA
component ULA
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		Operation : in  STD_LOGIC_VECTOR (3 downto 0);
		Z : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

-- Implementando os estados
type stateType is (stateInput, stateOutput);

-- Signals
signal state : stateType;
signal inputsDone : STD_LOGIC_VECTOR (2 downto 0); -- 2 = LedA, 1 = LedB, 0 = LedOp
signal inputA, inputB, inputOp : STD_LOGIC_VECTOR (3 downto 0);
signal counterOutput : INTEGER RANGE 300000000 DOWNTO 0;
signal outputULA : STD_LOGIC_VECTOR (3 downto 0);

begin

	-- Chamando os componentes da ULA e do contador
	U0: ULA port map (inputA, inputB, inputOp, outputULA);
	U1: CONTADOR port map ('0', clock, reset, 0, counterOutput);
	
	-- Implementando a máquina de estados
	FSM: process (clock, reset)
	begin
	
		if (reset = '1') then
			inputA <= "0000";
			inputB <= "0000";
			output <= "0000";
			ledA <= '0';
			ledB <= '0';
			ledOp <= '0';
			state <= stateInput;
			inputsDone <= "000";
		
		elsif (clock'event and clock = '1') then
			case state is
			
				when stateInput =>
					output <= input;
					if (buttonA = '1') then
						inputA <= input;
						ledA <= '1';
						inputsDone (2) <= '1';
					elsif (buttonB = '1') then
						inputB <= input;
						ledB <= '1';
						inputsDone (1) <= '1';
					elsif (buttonOp = '1') then
						inputOp <= input;
						ledOp <= '1';
						inputsDone (0) <= '1';
					elsif (inputsDone = "111") then
						ledA <= '0';
						ledB <= '0';
						ledOp <= '0';
						state <= stateOutput;
					else
						state <= stateInput;
					end if;
				
				when stateOutput =>
					if (counterOutput < 100000000) then
						ledA <= '1';
						ledB <= '0';
						ledOp <= '0';
						output <= inputA;
					elsif ((counterOutput >= 100000000) and (counterOutput < 200000000)) then
						ledA <= '0';
						ledB <= '1';
						ledOp <= '0';
						output <= inputB;
					elsif (counterOutput >= 200000000) then
						ledA <= '0';
						ledB <= '0';
						ledOp <= '1';
						output <= outputULA;
					end if;
					state <= stateOutput;

			end case;
		end if;
	end process;

end Behavioral;


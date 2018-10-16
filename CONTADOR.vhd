----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:52 09/28/2018 
-- Design Name: 
-- Module Name:    CONTADOR - Behavioral 
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
entity CONTADOR is
	Port (
		load : in  STD_LOGIC;
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		data: in INTEGER RANGE 300000000 DOWNTO 0;
		output: out INTEGER RANGE 300000000 DOWNTO 0
	);
	-- Valores devido ao clock de 50MHz (6s = 300000000 clocks)
end CONTADOR;

architecture Behavioral of CONTADOR is

begin

	count: process (clock, reset)
	variable counting : INTEGER RANGE 300000000 DOWNTO 0;
	begin
		if (reset = '1') then
			counting := 0;
		elsif (clock'event and clock = '1') then
			if (load = '1') then
				counting := data;
			else
				if (counting >= 300000000) then
					counting := 0;
				else
					counting := counting + 1;
				end if;
			end if;
		end if;
		output <= counting;
	end process;

end Behavioral;


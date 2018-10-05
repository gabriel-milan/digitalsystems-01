--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:42 10/05/2018
-- Design Name:   
-- Module Name:   /home/gabriel-milan/GIT_REPOS/digitalsystems-01/MULTIPLICADOR_4BITS_v2/simulator.vhd
-- Project Name:  MULTIPLICADOR_4BITS_v2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MULTIPLICADOR_4BITS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simulator IS
END simulator;
 
ARCHITECTURE behavior OF simulator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MULTIPLICADOR_4BITS
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
	signal clock : std_logic;

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MULTIPLICADOR_4BITS PORT MAP (
          A => A,
          B => B,
          Z => Z
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 
		A <= "1101";
		B <= "0110";

      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:25 09/28/2018
-- Design Name:   
-- Module Name:   /home/gabriel-milan/COMPARADOR_4BITS/simu.vhd
-- Project Name:  COMPARADOR_4BITS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: COMPARADOR_4BITS
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
 
ENTITY simu IS
END simu;
 
ARCHITECTURE behavior OF simu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT COMPARADOR_4BITS
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Gout : OUT  std_logic;
         Eout : OUT  std_logic;
         Sout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

	signal clock : STD_LOGIC;

 	--Outputs
   signal Gout : std_logic;
   signal Eout : std_logic;
   signal Sout : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: COMPARADOR_4BITS PORT MAP (
          A => A,
          B => B,
          Gout => Gout,
          Eout => Eout,
          Sout => Sout
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
		A <= "1010";
		B <= "1010";
      wait;
   end process;

END;

----------------------------------------------------------------------------------
-- Company: DFEC ECE 281
-- Engineer: C3C Brian Yarbrough
--
-- Create Date:   10:08:09 02/15/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Brian.Yarbrough/Documents/Academics/3dg/CE_Projects/Lab02_Yarbrough/allCombos_testbench_BCY.vhd
-- Project Name:  Lab02_Yarbrough
-- Target Device:  Nexys 2
-- Tool versions:  
-- Description:   Goes through all 512 possible combinations of adding and subtracting, ensures that it works
-- 
-- VHDL Test Bench Created by ISE for module: FourBit_Adder_Subtractor_BCY
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
USE ieee.numeric_std.ALL;
 
ENTITY allCombos_testbench_BCY IS
END allCombos_testbench_BCY;
 
ARCHITECTURE behavior OF allCombos_testbench_BCY IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBit_Adder_Subtractor_BCY
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         Btn : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal Btn : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBit_Adder_Subtractor_BCY PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Btn => Btn,
          Sum => Sum
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--begin simulations
		--check adder first
		for z in 0 to 1 loop
			for y in 0 to 1 loop
				for x in 0 to 1 loop
					for w in 0 to 1 loop
						Ain(0) <= z;
						Ain(1) <= y;
						Ain(2) <= x;
						Ain(3) <= w;
							for
				assert Sum = first+second;
			end loop;
		end loop;
		

      wait;
   end process;

END;

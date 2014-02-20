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
-- Documentation: EI with Dr. Neeble for some ieee imports and workin through stuff. C3C Sabin Park helped with image syntax.
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
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
   signal Sum : std_logic_vector(3 downto 0):= (others => '0');
	
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
      wait for 10 ns;
		report " Start Test ";

		--begin simulations
		
	--check adder first, then subtractor
for k in 0 to 1	 loop		
		
		--first number
		La: for i in 0 to 15 loop
		--second number
				Lb: for j in 0 to 15 loop
				
					
					--convert Bin to two's compliment
					if k = 1 then
						Bin <= ((not Bin) + "0001");
					end if;
					
					--assert addition vs subtraction
					--assert statement
					if k = 0 then
						assert Sum=Ain+Bin report "incorrect sum! When Ain = "
						--reprot Ain and Bin with image
						& std_logic'image(Ain(3))& std_logic'image(Ain(2))& std_logic'image(Ain(1))& std_logic'image(Ain(0)) & " and Bin = " 
						& std_logic'image(Bin(3))& std_logic'image(Bin(2))& std_logic'image(Bin(1))& std_logic'image(Bin(0));
					else
						assert Sum=Ain-Bin report "incorrect difference when Ain= "
							& std_logic'image(Ain(3))& std_logic'image(Ain(2))& std_logic'image(Ain(1))& std_logic'image(Ain(0)) & " and Bin = " 
						& std_logic'image(Bin(3))& std_logic'image(Bin(2))& std_logic'image(Bin(1))& std_logic'image(Bin(0));
					end if;
					
					--convert Bin back
					if k = 1 then
						Bin <= ((not Bin) + "0001");
					end if;
					
					--increment Bin
					Bin <= Bin + "0001";

					wait for 1 ns;
					next;
				end loop Lb;
				wait for 2 ns;
			--increment Ain
			Ain <= Ain + "0001";
			next;
		end loop La;
		--increment the button read
		Btn <= '1';
		wait for 2 ns;
	end loop;
	report " Test Complete! ";
		wait;
	end process;
END;
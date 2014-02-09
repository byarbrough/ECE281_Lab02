----------------------------------------------------------------------------------
-- Company: DFEC ECE 281
-- Engineer: C3C Brian Yarbrough
-- 
-- Create Date:    14:59:58 02/09/2014 
-- Design Name: 	
-- Module Name:    FourBit_Adder_Subtractor_BCY - Behavioral 
-- Project Name: 	Lab 02
-- Target Devices:  Nexys 2
-- Tool versions: 
-- Description: 	Four bit adder and subtractor. The basis for an ALU
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

entity FourBit_Adder_Subtractor_BCY is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC;
			  Sum : out STD_LOGIC);
end FourBit_Adder_Subtractor_BCY;

architecture Behavioral of FourBit_Adder_Subtractor_BCY is

begin


end Behavioral;


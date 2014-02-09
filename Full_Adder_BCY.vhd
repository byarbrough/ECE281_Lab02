----------------------------------------------------------------------------------
-- Company: DFEC ECE 281
-- Engineer: C3C Brian Yarbrough
-- 
-- Create Date:    14:59:58 02/09/2014 
-- Design Name: 	
-- Module Name:    FourBit_Adder_Subtractor_BCY - Behavioral 
-- Project Name: 	Lab 02
-- Target Devices:  Nexys 2
-- Tool versions:  Structural
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

entity Full_Adder_BCY is
    Port ( Ain : in  STD_LOGIC;
           Bin : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Xout : out  STD_LOGIC);
end Full_Adder_BCY;

architecture Behavioral of Full_Adder_BCY is
	begin
		--equations from p 240 in text
		Xout <= Ain xor Bin xor Cin;
		Cout <= (Ain and Bin) or (Ain and Cin) or (Bin and Cin);

end Behavioral;


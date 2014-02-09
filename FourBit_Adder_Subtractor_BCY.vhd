----------------------------------------------------------------------------------
-- Company: DFEC ECE 281
-- Engineer: C3C Brian Yarbrough
-- 
-- Create Date:    14:59:58 02/09/2014 
-- Design Name: 	
-- Module Name:    FourBit_Adder_Subtractor_BCY - Behavioral 
-- Project Name: 	Lab 02
-- Target Devices:  Nexys 2
-- Tool versions: 	Structural
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
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Sum : out STD_LOGIC_VECTOR (3 downto 0));
end FourBit_Adder_Subtractor_BCY;

architecture Structural of FourBit_Adder_Subtractor_BCY is
	
	component Full_Adder_BCY is
		port (Ain : in STD_LOGIC;
				Bin : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Cout : out STD_LOGIC;
				Xout : out STD_LOGIC);
	end component Full_Adder_BCY;
	
signal C_last, C_next : STD_LOGIC_VECTOR (3 downto 0);

begin

	Bit0: component Full_Adder_BCY
		port map (Ain => Ain(0),
					 Bin => Bin(0),
					 Cin => C_last(0),
					 Cout => C_next(0),
					 Xout => Sum(0)
					 );
					 
	Bit1: component Full_Adder_BCY
		port map (Ain => Ain(1),
					 Bin => Bin(1),
					 Cin => C_last(1),
					 Cout => C_next(1),
					 Xout => Sum(1)
					 );
					 
	Bit2: component Full_Adder_BCY
		port map (Ain => Ain(2),
					 Bin => Bin(2),
					 Cin => C_last(2),
					 Cout => C_next(2),
					 Xout => Sum(2)
					 );
					 
	Bit3: component Full_Adder_BCY
		port map (Ain => Ain(3),
					 Bin => Bin(3),
					 Cin => C_last(3),
					 Cout => C_next(3),
					 Xout => Sum(3)
					 );					 


end Structural;


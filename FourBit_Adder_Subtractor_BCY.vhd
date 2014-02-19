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
use ieee.numeric_std.ALL;

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
			  Btn : in STD_LOGIC;
			  Sum : out STD_LOGIC_VECTOR (3 downto 0);
			  Ovf : out STD_LOGIC_VECTOR(3 downto 0));
end FourBit_Adder_Subtractor_BCY;

architecture Structural of FourBit_Adder_Subtractor_BCY is
	
	component Full_Adder_BCY is
		port (Ain : in STD_LOGIC;
				Bin : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Cout : out STD_LOGIC;
				Xout : out STD_LOGIC;
				Ovf : out STD_LOGIC);
	end component Full_Adder_BCY;
	
signal Carry : STD_LOGIC_VECTOR (4 downto 0) :=(others => '0');
signal Bin_Inv : STD_LOGIC_VECTOR (3 downto 0) :=(others => '0');

begin
		--if button is pushed, covert Bin to two's comliment for subtraction
		Bin_Inv <= std_logic_vector(UNSIGNED(not Bin) + 1) when Btn = '1' else Bin;

	-- this componenet by itself is a one bit adder
	Bit0: component Full_Adder_BCY
	--maps each port on the single adder to the logic vector
		port map (Ain => Ain(0),
					 Bin => Bin_Inv(0),
					 Cin => Carry(0),
					 Cout => Carry(1),
					 Xout => Sum(0),
					 Ovf => Ovf(0)
					 );
					 
	--each componensts adds a bit
	Bit1: component Full_Adder_BCY
		port map (Ain => Ain(1),
					 Bin => Bin_Inv(1),
					 Cin => Carry(1),
					 Cout => Carry(2),
					 Xout => Sum(1),
					 Ovf => Ovf(1)
					 );
					 
	Bit2: component Full_Adder_BCY
		port map (Ain => Ain(2),
					 Bin => Bin_Inv(2),
					 Cin => Carry(2),
					 Cout => Carry(3),
					 Xout => Sum(2),
					 Ovf => Ovf(2)
					 );
					 
	Bit3: component Full_Adder_BCY
		port map (Ain => Ain(3),
					 Bin => Bin_Inv(3),
					 Cin => Carry(3),
					 Cout => Carry(4),
					 Xout => Sum(3),
					 Ovf => Ovf(3)
					 );	
					 
			--would have been better to do
				--Ovf as signal
				-- Ovf <= Carry(3) xor Carry(4);

end Structural;


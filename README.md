ECE281_Lab02
============
##4-bit 2’s Complement Adder/Subtracter

####The Full Adder
The basic component of a multiple bit adder is a single full adder.
A Full Adder - or a 1 bit adder - takes a total of three inputs: Ain, Bin, and Cin. It then outputs Sum and Cout. The truth table for such a device looks like this:

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/TruthTable.PNG?raw=true "Full Adder Truth Table")

The following Boolean Expressions were extracted from this table.

_Sum = A xor B xor Cin_

_Cout = AB + ACin + BCin_

These equations explain the behavior of a full adder and could be simulated with a test bench to verify that they match the truth table (Xout is Sum):

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/FullAdder_SIM.PNG?raw=true "Full Adder Simulation")

Seeing that the simulation does match the table, I crafted a schematic from the equations. This could be made into a physical circuit.

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/Schematic_FullAdder.jpg?raw=true "Full Adder Schematic")

All of the above proved that a single bit full adder does exactly what it is supposed to do: take three inputs and produce a sum and a carry out (Cout). This Cout is particularly important when making a ripple carry adder because the Cout of the previous adder becomes the Cin of the next adder. This diagram shows what two full adders linked together would look like.
![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/RipplCarry.jpg?raw=true "Ripple Carry Adder")

By linking many adders together, an adder for any number of bits. Unfortunately, linking many adders together decreases speed linearly because each adder has to wait for the previous adder to pass the Cout before it can add. This can be combated with carry look ahead adders, but for the four bit adder in this lab, the ripple carry format will do just fine.

####Now With Four Bits!
Having made the full adder component, structural VHDL made it simple to link four of the components together. By using Standard logic vectors as arrays, each Ain, Bin, Cin, Cout, and Sum could be separately defined.

This four bit adder was implemented to the Nexys 2 with the eight switches being Ain and Bin and the LEDs being the Sum. This also had an overflow indication.

####Enabling Subtraction
Due to the glory of Two's Compliment, subtraction with full adders simply means that Bin had to be converted to Two's Compliment. This was done with an internal signal "NOT Bin + 1"; this converted it to a negative binary number, which, when added, was the same as subtraction.

Bin was only converted to Two's Compliment if a push button was pressed. This meant that the four bit adder could work on the same board and program as the subtracter.

####The Final Test

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/loopedSim.PNG?raw=true "Full Testbench")

The above diagram runs through every possible combination of inputs for both addition and subtraction using for loops. It would be extremely tedious to attempt and compare every values one by one to a truth table. Instead, an "assert" command was used. This would have outputted a message to the bottom console if a value was incorrect, as well as what values threw the error. Because this never occurred, I know that the design works!

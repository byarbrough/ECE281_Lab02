ECE281_Lab02
============
##4-bit 2’s Complement Adder/Subtracter

The basic componene of a multiple bit adder is a single full adder.
A Full Adder (or a 1 bit adder) takes a total of three inputs: Ain, Bin, and Cin. It then outputs Sum and Cout. The truth table for such a device looks like this:

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/TruthTable.PNG?raw=true "Full Adder Truth Table")

The following Boolean Expressions were extracted from this table.

_Sum = A xor B xor Cin_

_Cout = AB + ACin + BCin_

These equations could be simulated with a testbench to verify that they match the truth table (Xout is Sum):

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/FullAdder_SIM.PNG?raw=true "Full Adder Simulation")

Seeing that the simulation does match the table, I crafted a schematic for what the circuit would look like.

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/Schematic_FullAdder.jpg?raw=true "Full Adder Schematic")

All of the above proved that a single bit full adder does exactly what it is supposed to do: take three inputs and produce a sum and a carry out (Cout). This Cout is particularly important when making a ripple carry adder because the Cout of the previous adder becomes the Cin of the next adder. This diagram shows what two full adders linked together would look like.
![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/RipplCarry.jpg?raw=true "Ripple Carry Adder")

By linking many adders together, an adder of any size can be made. Unfortunately, linking many adders toegether decreases speed linearly because each adder has to wait for the previous adder to pass the Cout before it can add. This can be combated with carry look ahead adders, but for the four bit adder in this lab, the ripple carry format will do just fine.


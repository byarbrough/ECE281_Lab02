ECE281_Lab02
============
##4-bit 2’s Complement Adder/Subtracter

A Full Adder (or a 1 bit adder) takes a total of three inputs: Ain, Bin, and Cin. It then outputs Sum and Cout. The truth table for such a device looks like this:

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/TruthTable.PNG?raw=true "Full Adder Truth Table")

The following Boolean Expressions were extracted from this table.

_Sum = A xor B xor Cin_

_Cout = AB + ACin + BCin_

These equations could be simulated with a testbench to verify that they match the truth table (Xout is Sum):

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/FullAdder_SIM.PNG?raw=true "Full Adder Simulation")

Seeing that the simulation does match the table, I crafted a schematic for what the circuit would look like.

![alt text](https://github.com/byarbrough/ECE281_Lab02/blob/master/Schematic_FullAdder.jpg?raw=true "Full Adder Schematic")

# Conversion-Binary-Real
 Computer Architecture Class
## Overview:

We can represent any real number in any base using sharp notation. Consider the following examples, which all represent the decimal number: `198.5`,

```bash
10#  198.5
8#   306.4
16#  C6.8
2#   1100 0110 . 1000
```
In this project, I have written a MIPS program, binaryReal, that takes a real number, provided via sharp notation, and presents it as a binary real number -- also using sharp notation.

The program is provided with five command-line arguments that represent the five components of a real number written in sharp notation.  Consider the real number, `10#  198.5`.  The five components of the number are:

  |  Name        |  Value   | Description                  |
  |:-------------| --------:|------------------------------|
  |  base        |  10      | The base of the number       |
  |  sharp       |  #       | The sharp (hash) symbol      |
  |  whole       |  198     | The whole number component   |
  |  point       |  .       | The radix point              |
  |  fractional  |  5       | The fractional component     |

Each of these values are provided to the program as strings. The following demonstrates the use of my program. (Note that program also returns the value of the radix of the input number.)

### Java subroutine
   ```bash
   $ java_subroutine -L '*.j' -S binaryReal 10 "#" 198 . 5 
   2# 11000110.1
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         10; 0x00 00 00 0A; 0b0000 0000 0000 0000 0000 0000 0000 1010;
   ```

### Mips subroutine
   ```bash
   $ mips_subroutine -L '*.s' -S binaryReal 10 "#" 198 . 5 
   2# 11000110.1
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         10; 0x00 00 00 0A; 0b0000 0000 0000 0000 0000 0000 0000 1010;
   ```

The program is structured with the following files:

  * `strtol.{j,s}`: a refactored version of your nextInt method provided by Cameron 
  * `whole2bin.{j,s}`: a method that converts a base10 integer to binary provided by Cameron 
  * `fractional2bin.{j,s}`: a method that converts base10 fractional value to binary provided by Cameron 
  * `binaryReal.{j,s}`: a driver method provided by the Professor
  * `strtofrac.{j,s}`: a conversion method provide by the Professor

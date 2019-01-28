# -*- coding: utf-8 -*-
"""
Created on Wed Nov  7 15:27:55 2018

@author: Daniel
"""
"""
Write a program that calculates and prints the value according to the given formula:
Q = Square root of [(2 * C * D)/H]
Following are the fixed values of C and H:
C is 50. H is 30.
D is the variable whose values should be input to your program in a comma-separated sequence.
Example
Let us assume the following comma separated input sequence is given to the program:
100,150,180
The output of the program should be:
18,22,24
"""
import math

C = 50
H = 30
D = [100,150,180]

def program(numbers):
  calc = []
  for number in numbers:
    new = round(math.sqrt((2*C*number)/H))
    calc.append(new)
  return(calc)  
print(program(D))
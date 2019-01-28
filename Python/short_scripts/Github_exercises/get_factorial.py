#!/usr/bin/env python3
# write a program which can compute the factorial
# of a given number. The results should be printed in a 
# comma separated sequence on a singe line-
# Suppose the following input is supplied to the program
# 8

var = int(input("Please put in a number: "))

def factorial(number):
    full = 1
    for i in range(1,number+1):
        full = i*full
    return(int(full))



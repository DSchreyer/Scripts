#!/usr/bin/perl
use strict;
use warnings;

print "Give me a number: ";
my $var1 = <STDIN>;
print "Give me another number: ";
my $var2 = <STDIN>;
print "The first number is $var1";
print "The second number is $var2";
my $result = $var1*$var2;
print "The sum is $result";
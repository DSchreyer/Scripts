#!/usr/bin/perl
use strict;
use warnings;

print "Give me a number: ";
my $var1 = <STDIN>;
print "Give me another number: ";
my $var2 = <STDIN>;
my $result = $var1+$var2;
print "The sum of the first and the second number is $result\n";
$result = $var1-$var2;
print "The difference of the first and the second number is $result\n";
$result = $var1*$var2;
print "The product of the first and the second number is $result\n";
$result = $var1/$var2;
print "The quotient of the first and the second number is $result\n";
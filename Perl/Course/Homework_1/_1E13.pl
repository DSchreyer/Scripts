#!/usr/bin/perl
use strict;
use warnings;
print "My first number is: ";
my $var1 = <STDIN>;
print "My second number is: ";
my $var2 = <STDIN>;
my $result = $var1*$var2;
print "The result is $result\n";
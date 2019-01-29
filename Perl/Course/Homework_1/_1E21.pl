#!/usr/bin/perl
use strict;
use warnings;
print "give me a hexadecimal number: ";
my $hex = <STDIN>;
chomp ($hex); #mit chomp kommt kein Error
print "The decimal number is: ",hex("$hex"),"\n"; #Error: illegal hexadecimal digit
print "give me a octal number: ";
my $oct = <STDIN>;
print "The decimal number is: ",oct("$oct"),"\n"; 
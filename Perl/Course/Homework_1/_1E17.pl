#!/usr/bin/perl
use strict;
use warnings;
print "Give me a number: ";
my $var1 = <STDIN>;
print "Give me another number: ";
my $var2 = <STDIN>;
my $result = $var1+$var2;
print "The result is $result\n";
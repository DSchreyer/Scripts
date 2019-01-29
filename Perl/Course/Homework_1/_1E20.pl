#!/usr/bin/perl
use strict;
use warnings;

print "How many Euros do you want to change: ";
my $var1 = <STDIN>;
print "The exchange rate to Dollar is: ";
my $var2 = <STDIN>;

my $result = $var1*$var2;
print "You get $result Dollar";
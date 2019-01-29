#!/usr/bin/perl
use strict;
use warnings;

my $float = " 4000/7 "; #4000/7 is a Text now
print " $float \n";
print $float , "\n";
print $float x 2, "\n"; #Text wird 2 mal wiedergegeben
print $float *2 , "\n"; #Error, berechnet 4000+2
$float = '4000/7';
print " $float \n";
$float = 4000/7; #wird berechnet
print " $float \n";
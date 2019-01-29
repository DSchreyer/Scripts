#!/usr/bin/perl
use strict;
use warnings;

print "Give me a number:";
my $num = <STDIN>;
print "Give me a Word:";
my $word = <STDIN>;

print $word x $num,"\n";

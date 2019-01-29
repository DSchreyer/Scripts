#! / usr / bin / perl
use warnings ;
use strict ;

open (READ, "sequence.txt") || die "Cannot open file!\n";
my @file = <READ>;

foreach (@file){
print "$_\n";
}

my @rfile = reverse (@file);
print @rfile;
close (READ);
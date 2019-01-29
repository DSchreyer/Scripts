#! / usr / bin / perl
use warnings ;
use strict ;

my @lines;

@lines = <STDIN>;
chomp @lines;
foreach (@lines){
print "$_\n";
}

foreach (@lines){
print "$_\t";
}
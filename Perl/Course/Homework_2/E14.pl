#! / usr / bin / perl
use warnings ;
use strict ;

open (READ, "Geneticists.txt") || die "Cannot open file!\n";
my @file = <READ>;

my @numbers = <STDIN>;
chomp @numbers;
foreach (@numbers){ 
$_ = $_-1;
}

foreach (@file[@numbers]){
print "$_,";
}


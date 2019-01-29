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
# https://perldoc.perl.org/functions/index.html
# https://perldoc.perl.org/functions/substr.html
my $substring = substr($_, 0, index($_, ','));
print "$substring,";
}
#! / usr / bin / perl
use warnings ;
use strict ;

my @array =(1..100);
my @array2;


foreach (@array) {
push (@array2,int rand (100) + 1);
 }
print "\n";
#print "@array2 ";
my @numbers =sort (@array2);
@numbers = sort {$a <=> $b} @numbers;

foreach (@numbers[0..9]) {
print "$_\t";
}

#! / usr / bin / perl
use warnings ;
use strict ;

my $F0 = 0;
my $F1= 1;
my $F2 =0 ;
my $count = 0;
print $F0;
print $F2;

while ($count < 10000){
	$F2 = $F0 + $F1;
	print $F2;
	$F0 = $F1;
	$F1 = $F2;
	
	$count ++;
}
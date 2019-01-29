use strict;
use warnings;
use Statistics::ChiSquare;

my @random = qw(10 100 1000 10000);

my @array_of_numbers;
foreach (@random){
	for (my $i=0; $i lt $_; $i++){
		push (@array_of_numbers,int(rand(6))+1);
	}

	print chisquare(@array_of_numbers),"\n";
	@array_of_numbers = "";
}
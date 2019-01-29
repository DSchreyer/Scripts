#! / usr / bin / perl
use warnings ;
use strict ;

open (READ, "transcript.txt") || die "Cannot open file!\n";
my @file = <READ>;
close READ;
chomp @file;

my $counter=0;
foreach (@file){
	if ($_ eq "protein_coding"){
		$counter=$counter+1;
	}

}
print $counter;

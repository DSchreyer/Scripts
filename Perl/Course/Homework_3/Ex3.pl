#! / usr / bin / perl
use warnings ;
use strict ;

open (READ, "transcript.txt") || die "Cannot open file!\n";
my @file = <READ>;
close READ;
chomp @file;
print "Which transcript type should i count?" ;
my $type = <STDIN>;
chomp $type;
my $counter=0;
foreach (@file){
	if ("$type" eq "$_"){
		$counter=$counter+1;
	}

}

print $counter;

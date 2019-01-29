#! / usr / bin / perl
use warnings ;
use strict ;

sub mutation{
	my @mutate = @_;
	my $base = int (rand($#mutate));
	my $AGCT = int (rand(3));
	
	if ($AGCT eq 0){
		$mutate[$base] = "A";
	}
	if ($AGCT eq 1){
		$mutate[$base] = "G";
	}	
	if ($AGCT eq 2){
		$mutate[$base] = "C";
	}
	if ($AGCT eq 3){
		$mutate[$base] = "T";
	}
	my $mutated = join ("",@mutate);
	return ($mutated);
}

my $codon = "AGTCTGATCTGATC";
print "The sequence is 		$codon.\n";
my @array = split ("",$codon);
my $mutated2 = mutation (@array);

print "The mutated Sequence is:	$mutated2.\n";

#works

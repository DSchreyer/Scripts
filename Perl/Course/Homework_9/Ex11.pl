#! \usr\bin\perl
use strict;
use warnings;

my $DNA = "ATGGATAGATGATAGATGATAGATAGATGAGGAGATATGAAGAGGATAGAGGAGATGCGCGCATCGATCG";


my %codon;


while ($DNA=~ /(...)/g){ #extract the codons
	if (exists $codon{$&}){
		$codon{$&} = $codon{$&}+1;
		next;
	}
	$codon{$&} = 1;
	next;
}

print %codon,"\n";
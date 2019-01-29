#! \usr\bin\perl
use strict;
use warnings;

my $file = "6SNRXDKJ01R-Alignment.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my $id="";
my $header="";
my %hash;
my $score="";
my $strand="";

foreach (@data){
	if (/^>/){
		$header = $_;
		next;
	}
		
		
	if (/Score = [0-9]+ bits \([0-9]+\)/){
		$score = $&;
		#print $score;
		next;
	}
	if (/Identities = [0-9]+\/[0-9]+ \([0-9]+%\)/){
		$id = $&;
		next;
	}
	if (/Strand=\w+\/\w+/){
		$strand = $&;
		next;
		
	}
		
	$hash{$header} = $score,"\t",$id,"\t",$strand,"\n";
}

print %hash,"\n";

#works

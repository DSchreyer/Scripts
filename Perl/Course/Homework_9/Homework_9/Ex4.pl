#! \usr\bin\perl
use strict;
use warnings;

my $file = "genes_and_seq.txt";

open (READ, "$file") || die "Cannot open $file: $!\n";

my @data = <READ>;
chomp @data;
close READ;
my $header = "";
my $n = 0;
my %hash;
my $length;
my $seq;

foreach (@data){
	if (/^(.+)\t([ACGT]+)/){
		$header = $1;
		$seq = $2;
		$hash{$header} = "$seq";
		$length = length ($seq);
		#print "$header: $hash{$header} length: $length\n";
	}
}
my @hash = %hash;
print "@hash\n";
		
		
		
		

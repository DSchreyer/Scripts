#! \usr\bin\perl
use strict;
use warnings;

my $file = "PerlLab9.fasta";

open (READ, "$file") || die "Cannot open $file: $!\n";

my @data = <READ>;
chomp @data;
close READ;

my %hash;
my $n=0;
my $header;
my $seq = "";

foreach (@data){
	if (/^>(.)+/){
		print "$seq\n";
		$header = $_;
		$hash{$header} = "";
		print "$header\n";
		next;
	}
	if (/^[ACGT](.)+/i){
		my $header = "";
		$seq .= $_;
	}
}
print "$seq\n";



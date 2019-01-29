#! \usr\bin\perl
use strict;
use warnings;

my $file = "mart3.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my %hash;

foreach (@data){
	if (/(ENSG[0-9]+)\t(ENST[0-9]+)/){
		$hash{$1} .= "$2;";
	}
}

my @sort_keys = sort {$a cmp $b} keys %hash;

foreach (@sort_keys){
	print "$_\t $hash{$_}\n";
}
		
#works

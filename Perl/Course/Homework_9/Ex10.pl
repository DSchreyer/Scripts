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
	if (/(ENSG[0-9]+)\t(ENST[0-9]+)\t(.)+\t((.)+)/){
		$hash{$4} .= "$2\t";
	}
}


my @sort_keys = sort {$a cmp $b} keys %hash;

my @array;
my $i = 0;

foreach (@sort_keys){
	
	while($hash{$_}=~ /ENST[0-9]+/g){
		$i++;
	}
	print "$_: length: $i\n";
	
	$i=0;
}

#works
		

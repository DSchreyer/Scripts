#! \usr\bin\perl
use strict;
use warnings;


sub sorter{
	
	my $txstarta;
	my $txenda;
	my $txstartb;
	my $txendb;
	
	if ( $a =~ /\t[+-]\t([0-9]+)\t([0-9]+)/ ){
		$txstarta = $1;
		$txenda = $2;
	}
	if ( $b =~ /\t[+-]\t([0-9]+)\t([0-9]+)/ ){
		$txstartb = $1;
		$txendb = $2;
	}
	
	return ( $txstarta <=> $txstartb and $txenda <=> $txendb);
	
}



my $file1 = "refGene1.txt";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	my @sorted = sort sorter <READ>;
	print @sorted,"\n";
}
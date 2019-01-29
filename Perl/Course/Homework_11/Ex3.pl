#! \usr\bin\perl
use strict;
use warnings;

sub sorter{
	my $second1;
	my $third1;
	if ( $a =~ /[a-zA-Z]+[0-9]+\t([MF]+)\t([0-9]+)/ ){
		$second1 = $1;
		$third1 = $2;
	}
	my $second2;
	my $third2;
	
	if ( $b =~ /[a-zA-Z]+[0-9]+\t([MF]+)\t([0-9]+)/ ){
		$second2 = $1;
		$third2 = $2;
	}
	
	return ( $second1 cmp $second2 or $third1 <=> $third2) ;
	
}



my $file1 = "expressionvalues.txt";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	my @sorted = sort sorter <READ>;
	
	foreach (@sorted){
		print "$_";
	}	
}
close READ;
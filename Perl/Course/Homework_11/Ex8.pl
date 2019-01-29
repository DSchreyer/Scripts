#! \usr\bin\perl
use strict;
use warnings;


sub sorter{
	
	my $posa;
	my $posb;
	my $nexta;
	my $nextb;
	
	if ( $a =~ /^[^@].+[0-9]+\t([0-9]+)\t([0-9]+)/ ){
	 $posa = $1;
	 $nexta = $2;
	 
	}
	else {$a = "";}
	
	
	if ( $b =~ /([a-zA-Z]+)[0-9]+\t([0-9]+)\t([0-9]+)/ ){
		$posb = $1;
		$nextb = $2;
	}
	else{$b = ""};
	
	my $distancea = $nexta - $posa;
	my $distanceb = $nextb - $posb;
	
	print "$distancea\t"
	
	
	return ($distancea <=> $distanceb);
}


my $file1 = "HG00155.sam";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	shift;
	my @sorted = sort sorter <READ>;
}
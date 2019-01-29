#! \usr\bin\perl
use strict;
use warnings;
my %hash;
sub sortermean{
	my @array = @{$hash{$a}};
	my @brray = @{$hash{$b}};
	
	my $meana = 0;
	my $meanb = 0;
	foreach (@array){
		$meana += $_;
	}
	$meana = $meana / scalar(@array);
	
	foreach (@brray){
		$meanb += $_;
	}
	$meanb = $meanb / scalar(@brray);

	return ( $meana	<=> $meanb) ;
	
}




my $file1 = "sample.txt";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	
	if (/^([a-zA-Z]+[0-9]+)\t([0-9]+.[0-9]+)\t([0-9]+.[0-9]+)\t*([0-9]*.*[0-9]*)/){
		$hash{$1} = [$2,$3,$4];
	}
}
close READ;


my @sortedmean = sort sortermean (keys %hash);


#my @sortedmes = sort sortermes (keys %hash);	
package Manipulate;

use strict;
use warnings;
use Exporter;

our @Export = qw(revcomp readFASTA);

sub revcomp{
	my $sequence = $_[0];
	my @reverse = reverse (split("",$sequence));
	my $reverse = join ("",@reverse);
	$reverse =~ tr/ACGT/TGCA/;
	print "$reverse\n";
	
}


sub readFASTA{
	my $file=$_[0];
	
	my %hash;
	my $sequence;
	my $header;
	open (READ, $file)||die "Failed to open $file \n";
	while (<READ>){
		chomp;
		if (/^>/){
			$header = $_;
			$sequence = "";
		}	
		if (/^[ACGT]/){
			$sequence .= $_;
			$hash{$header} = $sequence;
		}
	}
	close READ;
	foreach (keys %hash){
		print "$_\t $hash{$_}\n";
	}
}





1;



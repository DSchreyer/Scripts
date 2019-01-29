#! \usr\bin\perl
use strict;
use warnings;

my $file1 = "ProteinLengths1.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;

my $file2 = "ProteinLengths2.txt";

open (READ,$file2) or die "Cannot open $file2!";
my @data2 = <READ>;
chomp @data2;
close READ;


my %proteins;
my $length;

foreach (@data1){
	if (/(AP_[0-9]+)\s+([0-9]+)/){
		$proteins{$1} = $2;
	}
}

foreach (@data2){
	if (/(AP_[0-9]+)\s+([0-9]+)/){
		if (exists $proteins{$1}){
			if ("$proteins{$1}" == "$2"){
				print "$_\n";
			}
		}
	}
}
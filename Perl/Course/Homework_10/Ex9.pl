#! \usr\bin\perl
use strict;
use warnings;

my $file ="data2.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my @array;
my $aref;

foreach (@data){
	if (/([0-9]+)\t([AGCT])\t([AGCT])\t([AGCT])\t([AGCT])/){
		$aref = [$1,$2,$3,$4,$5];
		push (@array,$aref);
	}
}


my @deref;
my $ref;

foreach (@array){
	$ref = $_;
	@deref = @$ref;
	
	print $deref[0],"\t",$deref[1],"\n";
	
}
	
#works	
	

#! \usr\bin\perl
use strict;
use warnings;

my $file ="data1.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;



my %hash;
my $ref;
my @a;



foreach (@data){
	if (/(WD[0-9]+)\t([ACGT]+)\t([0-9]+)\t([0-9]+.[0-9])\t([0-9])/){

		$ref = [$2,$3,$4,$5];
	}



	$hash{$1} = $ref;
}

my $deref;
my $key;

foreach (keys %hash){
	$key = $_;
	$ref = $hash{$_};
	
	@a = @$ref;
	foreach (@a){			#oder mit join ("\t",@a)
		$deref .= "$_\t"
	}
	print $key,":","\t",$deref,"\n";
	$deref = "";

}

#works 
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
my %a;



foreach (@data){
	if (/(WD[0-9]+)\t([ACGT]+)\t([0-9]+)\t([0-9]+.[0-9])\t([0-9])/){

		$ref = {"sequence" => $2,"length" =>$3,"GC_content" =>$4,"CAI" =>$5};
	}



	$hash{$1} = $ref;
}

my $deref;
my $name;
my $key;


foreach (keys %hash){
	$name = $_;
	$ref = $hash{$_};
	
	%a = %$ref;
	
	foreach (keys %a){
		$key = $_;
		$deref .= "$key: $a{$_}\t";
	}
	print $name,":","\t",$deref,"\n";
	$deref = "";

}

#works

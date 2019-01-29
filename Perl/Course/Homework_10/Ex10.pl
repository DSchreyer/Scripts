#! \usr\bin\perl
use strict;
use warnings;


sub modify{
	my $subref1 = $_[0];
	my $subref2 = $_[1];
	my @array;
	
	my %subhash1 = %$subref1;
	my %subhash2 = %$subref2;
	my $name;
	my $name2;
	my $ref;
	
	foreach (keys %subhash1){
		$name = $_;
		$ref = $subhash1{$_};
		@array = @$ref;
		foreach (keys %subhash2){
			$name2 = $_;
			if ($name eq $name2){
				push (@array,$subhash2{$_});
			}
		}
		$subhash1{$_} = [@array];
	}
	my $subreturn = \%subhash1;
	return	($subreturn);
	
	
}


my $file1 ="data1.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;

my %data1;
my $ref;

foreach (@data1){
	if (/(WD[0-9]+)\t([ACGT]+)\t([0-9]+)\t([0-9]+.[0-9])\t([0-9])/){

		$ref = [$2,$3,$4,$5];
	}



	$data1{$1} = $ref;
}


my $file2 ="data3.txt";

open (READ,$file2) or die "Cannot open $file2!";
my @data2 = <READ>;
chomp @data2;
close READ;

my %data3;

foreach (@data2){
	if (/(WD[0-9]+)\t(.+)$/){
		$data3{$1} = $2;
	}
}


my $ref1 = \%data1;
my $ref2 = \%data3;

my $return = modify($ref1,$ref2);
my %return = %$return;

my $key;
my @a;
my $deref;


foreach (keys %return){
	$key = $_;
	$ref = $return{$_};
	
	@a = @$ref;
	foreach (@a){			#oder mit join ("\t",@a)
		$deref .= "$_\t"
	}
	print $key,":","\t",$deref,"\n";
	$deref = "";

}

#works

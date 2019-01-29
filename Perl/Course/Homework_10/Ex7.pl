#! \usr\bin\perl
use strict;
use warnings;



sub laenge{

	my $hashname = $_[0];
	my %subhash = %$hashname;
	
	
	my $name;
	my $length;
	my %length;
	
	foreach (keys %subhash){
		$name = $_;
		my $deref = $subhash{$_};
		my %length = %$deref;
		
		if (exists $length{sequence}){
			print "$name contains a sequence!\n";
			print "Length of the sequence is $length{length}.\n";
		}
			
		
	}
	
	
		
			
		
	
	
}

my $file ="data1.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my %hash;
my $ref;


foreach (@data){
	if (/(WD[0-9]+)\t([ACGT]+)\t([0-9]+)\t([0-9]+.[0-9])\t([0-9])/){

		$ref = {"sequence" => $2,"length" =>$3,"GC_content" =>$4,"CAI" =>$5};
	}



	$hash{$1} = $ref;
}

my $href = \%hash;

my $return = laenge($href);

#works


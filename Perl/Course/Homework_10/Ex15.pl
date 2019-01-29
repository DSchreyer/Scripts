#! \usr\bin\perl
use strict;
use warnings;

my $file1 ="tissues.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;



my %hash;
my $term;
my $goid;
my $definition;
my $reference;

foreach (@data1){
	if (/^!/){
		next;
	}
	if (/^term: /){
		$term = $';
		$goid = "";
		$reference = "";
		$definition ="";
	}
	if (/^goid:\s(.+)$/){
		$goid .= "$1 ";
	}
	if (/^definition_reference:\s(.+)$/){
		$reference .= "$1 ";
	}
	if (/^definition:\s(.+)$/){
		$definition .= "$1 ";
	}
	$hash{$term} = {"definition" => $definition,"goid" => $goid,"reference" => $reference};

}

print "Enter a tissue name: ";
my $name = <STDIN>;
chomp $name;

my %hderef;
my $ref;


foreach (keys %hash){
	$term = $_;
	
	
	if (/^$name/i){
		$ref = $hash{$_};
		%hderef = %$ref;
		print "$term\t";
		foreach (keys %hderef){
			print "$_: $hderef{$_}\n";
		}
	}

}
		
#works		
	
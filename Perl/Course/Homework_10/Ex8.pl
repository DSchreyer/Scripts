#! \usr\bin\perl
use strict;
use warnings;

my $file ="data.fasta";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my $seqname;

my %sequence;
my %ACGT;
my $href;

my $A=0;
my $G=0;
my $C=0;
my $T=0;




foreach (@data){
	if (/^>/){
		$seqname = $_;
		$A = 0;
		$G = 0;
		$C = 0;
		$T = 0;
		next;
	}
	while (/A/g){
		$A++;
		
	}
	while (/C/g){
		$C++;
	}	
	while (/G/g){
		$G++;
	}
	while (/T/g){
		$T++;
	}
	
	$href = {"A" => $A,"C" => $C,"G" => $G,"T" => $T};
	
	$sequence{$seqname} = $href;
}

my $deref;
my $key;
my %a;
my $ref;

foreach (keys %sequence){
	$seqname = $_;
	$ref = $sequence{$_};
	
	%a = %$ref;
	
	foreach (keys %a){
		$key = $_;
		$deref .= "$key: $a{$_}\t";
	}
	print $seqname,":","\t",$deref,"\n";
	$deref = "";

}

#works
	
	
	
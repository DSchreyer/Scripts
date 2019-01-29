#! \usr\bin\perl
use strict;
use warnings;

my $file1 ="BLOSUM62.txt";

open (READ,$file1) or die "Cannot open $file1!";
my @data1 = <READ>;
chomp @data1;
close READ;
my $key;
my %blossum;


foreach (@data1){
	if (/^([A-Z\*])[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]+)[\s\t]*([\-0-9]*)\s$/){
		$key = $1;
		$blossum{$key} = {"A" => $2,"R" => $3,"N" => $4,"D" => $5,"C" => $6,"Q" => $7,"E" => $8,
						"G" => $9,"H" => $10,"I" => $11,"L" => $12,"K" => $13,"M" => $14,"F" => $15,"P" => $16,
						"S" => $17,"T" => $18,"W" => $19,"Y" => $20,"V" => $21,"B" => $22,
						"Z" => $23,"X" => $24,"*" => $25};
	}
}
#   A  R  N  D  C  Q  E  G  H  I  L  K  M  F  P  S  T  W  Y  V  B  Z  X  *

my $deref;
my %hderef;


foreach (keys %blossum){
	$key = $_;
	$deref = $blossum{$key};
	%hderef = %$deref;
	
	print "$key:\t";
	
	foreach (keys %hderef){
		print "$_ $hderef{$_} ";
	}
}
		
	

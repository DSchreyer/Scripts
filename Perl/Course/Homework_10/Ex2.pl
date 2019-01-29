#! \usr\bin\perl
use strict;
use warnings;

my %seqdata = (
" WD0010 " => {
" sequence " => " ACCCGTAGTCGTA ",
" function " => " transposase ",
"GC content " => 54.2 ,
" CAI " => 5.2 ,
" max_expr " => 4.1 },

" WD0234 " => {
" sequence " => " CCTACT ",
" function " => " reverse transcriptase ",
"GC content " => 50.9 ,
" CAI " => 6.0 ,
" max_expr " => 1.3 } ); 

 
 my %hash;
 my %newhash;
 my $value;
 my $ref;
 my $key;
 my @array;
 
 
 foreach (%seqdata){
	$ref = ref($_);
	if ($ref =~ /HASH/){
		%hash = %$_;
		foreach (keys %hash){
			%newhash = ("$_"=> $hash{$_});
			push (@array,%newhash);
		}
	}
	elsif ($_ =~ /WD/){
		$key = $_;
		push (@array, $key);
	}
}


foreach (@array){
	print "$_\n";
}
#! \usr\bin\perl
use strict;
use warnings;

my %hash;
$hash{key1} = "AAA";
$hash{key2} = "G";
$hash{key3} = "C";
$hash{key4} = "TTTTTTTTT";

my $n = 0;


foreach (%hash){
		if ($n == 1){
		print "$_\n";
		$n = 0;
		next;
	}
	if ($n==0){
		print "$_:";
		$n=1;
		next;
	}
}

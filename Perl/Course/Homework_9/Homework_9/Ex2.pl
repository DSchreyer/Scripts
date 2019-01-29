#! \usr\bin\perl
use strict;
use warnings;

my %hash; 
$hash{key1} = "AAA";
$hash{key2} = "G";
$hash{key3} = "C";
$hash{key4} = "TTTTTTTTT";



my $n = 0;
my $counter = 0;

while ($n == 0){
	
	print "Enter a gene name: ";
	my $key = <STDIN>;
	chomp $key;
	
	foreach (%hash){
		if ($n==0){
			if (/^$key$/){
				$counter = 10;
				$n = 1;
				next;
			}
		}
		if ($counter == 10){
			print "sequence: $_\n";
			$counter = 0;
			next;
		}
	}	 
}
	


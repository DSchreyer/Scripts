#! / usr / bin / perl
use warnings ;
use strict ;
print "Enter a number: ";
my $number = <STDIN>;
chomp $number;
my @binary;	
my $remainder;




while ((int ($number)) > 0){
	$remainder = $number % 2;
	$number = $number /2;
	unshift (@binary, $remainder);
}
print @binary;


#! / usr / bin / perl
use warnings ;
use strict ;
print "Enter a list of strings: ";
my @array = <STDIN>;
chomp @array;


print ("12345678901234567890\n");
foreach (@array){
	
	printf ("%20s\n","$_");
	
}

#works

#! / usr / bin / perl
use warnings ;
use strict ;

my $word = <STDIN>;
my $length = length ($word)-1;
#print $length;

if ($length < 3){
	print "The child is younger than 5 years.\n"
}
if ($length >3 && $length <6){
	print "The child is 5 years or older.\n"
}
if ($length == 5){
	print "The child is 6 years or older.\n"
}
if ($length < 10 && $length >5){
	print "The child is 8 years or older.\n"
}
if ($length >= 10){
	print "The child is 10 years or older.\n"
}

#! / usr / bin / perl
use warnings ;
use strict ;

my @numbers = (1,5,9,3.1459,2);
foreach (@numbers) {
print "$_\n";}


my $counter = 0; 
foreach (@numbers) {
print "index $counter contains $_ \n";
$counter++;
}
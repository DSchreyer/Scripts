#! / usr / bin / perl
use warnings ;
use strict ;

my @values = qw (3 10 50 9);
my @values2;

foreach (@values){
push (@values2 ,10+$_); 


}
print "@values2\n";
@values2 = sort @values2;
print "@values2 \n"; 
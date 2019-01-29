#! / usr / bin / perl
use warnings ;
use strict ;


print "Enter some numbers: ";

my @number = <STDIN>;
chomp @number;
my $sum = 0;

foreach (@number){
if ($_ eq "999"){

last;

}
$sum += $_;

}
print "$sum\n";
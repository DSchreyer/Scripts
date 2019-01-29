#! / usr / bin / perl
use warnings ;
use strict ;

print "Give me a number: "; 
my $N = <STDIN>;
chomp $N;
print "your number is $N.\n";
my @M;
@M = (1..$N);
#print "@M/n";
my $sum = 0;
foreach (@M) {
	$sum +=$_;
}
print "The triangular number to your number is $sum.\n";
	
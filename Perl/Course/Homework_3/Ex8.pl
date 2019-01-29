#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter a number: ";
my $num = <STDIN>;
chomp $num;

my $random = int(rand(100))+1;
print "A random number is: $random\n";
my $sum = $num + $random;

print "Whats the sum of these 2 Numbers? ";
my $sumuser = <STDIN>;
chomp $sumuser;

while ($sum eq $sumuser){
	$random = int (rand(100))+1;
	print "The next random number is $random.\n";
	print "Please add this number to your sum and give me the answer: ";
	$sumuser = <STDIN>;
	chomp $sumuser;
	$sum = $sum + $random;
		
}
print "wrong answer!";

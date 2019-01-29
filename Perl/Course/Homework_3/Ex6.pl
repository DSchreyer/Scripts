#! / usr / bin / perl
use warnings ;
use strict ;

my @array = (17..59);

foreach (@array){
	print "$_";
}
print "\n";

#while (@array){
#	print $_;
#}

for (@array){
	print "$_";
}
print "\n";
my $number=16;
while ($number < 59 && $number > 15){
	$number++;
	print $number;
}
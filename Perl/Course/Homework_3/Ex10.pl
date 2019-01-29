#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter your Primer Sequence:";
my @DNA = <STDIN>;
chomp @DNA;
my $base;
my $Temp = 0;
foreach $base (@DNA){
	if ( $base eq "G" ){
		$Temp = $Temp + 4;
	}
	if ( $base eq "C" ){
		$Temp = $Temp + 4;
	}
	if ( $base eq "A" ){
		$Temp = $Temp + 2;
	}
	if ( $base eq "T" ){
		$Temp = $Temp + 2;
	}
}
print "The melt temperature of your Primer is $Temp °C\n";
	
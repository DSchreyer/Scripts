#! / usr / bin / perl
use warnings ;
use strict ;

sub words{
	my @words = @_;
	foreach (@words){
	
		if ($_ eq 1){
			$_ = "one";
		}
		if ($_ eq 2){
			$_ = "two";
		}
		if ($_ eq 3){
			$_ = "three";
			
		}
		if ($_ eq 4){
			$_ = "four";
		}
		if ($_ eq 5){
			$_ = "five";
		}
		if ($_ eq 6){
			$_ = "six";
		}
		if ($_ eq 7){
			$_ = "seven";
		}
		if ($_ eq 8){
			$_ = "eight";
		}
		if ($_ eq 9){
			$_ = "nine";
		}
		if ($_ eq 10){
			$_ = "ten";
		}
	}
	return (@words);
}
print "Enter a number between 1 and 5: ";
my $first= <STDIN>;
chomp $first;
print "Enter another number between 1 and 5: ";
my $second= <STDIN>;
chomp $second;
my $result= $first+$second;

my @return = words($first,$second,$result);

my $exit = "$return[0] plus $return[1] equals $return[2]";
$exit = ucfirst($exit);
print "$exit.\n";


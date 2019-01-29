#! / usr / bin / perl
use warnings ;
use strict ;

sub mean{
	my $count = 0;
	my @array = @_;
	foreach (@_){
		$count = ($count + $_);
	}
	my $a = $count/10;
	return ($a);
}

sub variance{
	
}

sub sd{
	
}

my @i10 = (1..10);

my @i20 = (1..20);
my @i100 = (1..100); 

my $mean = mean (@i10);
print "The mean of a list of 1 to 10 = $mean.\n";
my $variance = variance(@i10);
my $sd = sd (@i10);

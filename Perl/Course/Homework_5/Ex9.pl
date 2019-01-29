#! / usr / bin / perl
use warnings ;
use strict ;

sub rand_array{
	my $N = $_[0];
	my $rand;
	my @sub_array;
	my @array;
	my $i;
	for ($i=0; $i<=$N; $i++){
		$rand = int(rand(100))+1;
		push (@array, "$rand");
	}
	return (@array);
}

my $N = 50;
my @array = rand_array($N);
print "@array\n";

#works

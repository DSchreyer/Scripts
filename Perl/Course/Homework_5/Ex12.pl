#! / usr / bin / perl
use warnings ;
use strict ;

sub codon{
	my @array = @_;
	my $one = $array[int(rand(3))];
	my $two = $array[int(rand(3))];
	my $three = $array[int(rand(3))];
	@array = ($one,$two,$three);
	return (@array);
 }

my $a = "AAAAA";
my $b = "CCCCC";
my $c = "GGGGG";

my @d = ($a,$b,$c);

my @result = codon (@d);
print @result;

use strict;
use warnings;
use lib "C:/Users/Daniel/OneDrive/Perl_Programming/Homework_12/My modules";
use Math::Combinatorics;


my @array = qw(a b c d e);
my $i=5;
my @combinations;

@combinations = combine($i,@array);


print @combinations;

my $length = scalar (@combinations);
foreach (@combinations){
	my @deref = @$_;
	print @deref;
}
#! \usr\bin\perl
use strict;
use warnings;

my @ref_array = (['A',10,33],['B',96,25],['C',40,83],['D',72,101]);

my @array;

foreach (@ref_array){
	@array = @$_;
	push (@array,$array[0].$array[1]);
	print "@array\t";
}
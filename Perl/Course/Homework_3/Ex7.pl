#! / usr / bin / perl
use warnings ;
use strict ;

my @array = (20..40);
my @sorted;

@sorted = sort {$b <=> $a} @array;

print @sorted;

if (@sorted % 2==0){
	print $_;
}
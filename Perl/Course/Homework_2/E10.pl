#! / usr / bin / perl
use warnings ;
use strict ;

my @array = qw/99players b_squad a-team 1_Boy A-team B-Squad 2_Boy/;
@array = sort {$a <=> $b} @array; #b_squad a-team A-team B-Squad 1_Boy 2_Boy 99players // letters count as zero
print "@array\n";
@array = sort {$b <=> $a} @array; #99players 2_Boy 1_Boy b_squad a-team A-team B-Squad //letters count as zero // lower letters in front of capital letters
print "@array\n";
@array = sort {$a cmp $b} @array;#1_Boy 2_Boy 99players A-team B-Squad a-team b_squad 
print "@array\n";
@array = sort {lc $a cmp lc $b} @array; #1_Boy 2_Boy 99players A-team a-team B-Squad b_squad // captial letters in front of lower letter
print "@array\n";
@array = sort @array; #1_Boy 2_Boy 99players A-team B-Squad a-team b_squad //numbers first // capital letters // lower letters
print "@array\n";
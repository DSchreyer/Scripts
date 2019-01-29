#! / usr / bin / perl
use warnings ;
use strict ;
my $one;
my $two;

while (<>){
 $one= $ARGV;
# $two= $ARGV[2];
 }
 my $file="text.txt";
 
open (READ1, "$one") || die "Cannot read $one!\n";
#open (READ2, "$two") || die "Cannot read $two!\n";
open (WRITE, ">$file") || die "Cannot write in $file!\n";

my @one= <READ1>;
#my @two= <READ2>;
my $one3= $one[2];
#my $two3= $two[2];
print WRITE "$one Line 3: $one3 \n";
#print WRITE "$two Line 3: $two3 \n";
close WRITE;

open (INPUT, "$file") || die "Cannot write in $file!\n";
print <INPUT>;


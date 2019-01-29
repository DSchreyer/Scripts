#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "data.txt";

open (READ,$file) or die "Cannot open $file!";
my $string = join ("",<READ>);
close READ;


if ($string =~ s/(WD)([0-9])+\t([ACGT])/>WD\n$3/g){
	print "$string\n";
}


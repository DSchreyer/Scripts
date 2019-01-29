#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "accession_names.txt";
open(READ,"$file") or die "Cannot open $file!";
my $string = join ("",<READ>);

		
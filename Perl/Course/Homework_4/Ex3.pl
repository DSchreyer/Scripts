#! / usr / bin / perl
use warnings ;
use strict ;
my $file=$0;
open (READ, "$file") || die "Cant open $file!\n";
my @program = <READ>;
close READ;
print "@program\n";
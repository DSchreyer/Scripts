#! / usr / bin / perl
use warnings ;
use strict ;

my @participants;
@participants = (1..1000);
my $count = join (" ",@participants);
$count = 0 + @participants;
print "There are $count participants. \n";

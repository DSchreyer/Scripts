#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter a DNA Sequence: ";
my $seq = <STDIN>;
chomp $seq;
my @seq = split('',$seq);

my @reverse = reverse (@seq);
print @reverse;

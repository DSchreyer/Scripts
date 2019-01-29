#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter a file name: ";
my $file =<STDIN>;
chomp $file;
open (READ, "$file") || die "The file does not exist!\n";
my @reverse= <READ>;
close READ;
print reverse (@reverse);


#! / usr / bin / perl
use warnings ;
use strict ;
print "Enter a file name: ";
my $file =<STDIN>;
open (READ, "$file") || die "Cannot read $file!\n";
my @file = <READ>;
close READ;
chomp @file;
my $length = scalar (@file);
print "Your file has $length lines\n";
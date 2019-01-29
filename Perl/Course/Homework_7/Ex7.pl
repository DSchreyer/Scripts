#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "dna.txt";
open(READ,"$file") or die "Cannot open $file!";
my @handle = <READ>;
chomp @handle;
$file = join ("",@handle);
$_ = $file;
while (/[actg]+/g){
	print "$& on position:",pos($_),"\n";
}
#works

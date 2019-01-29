#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "DAVID_example.txt";
open (READ, "$file") or die "Cannot open $file\n";
my @David = <READ>;
chomp @David;
close READ;
my $string = join ("","@David");
$_ = $string;
foreach (@David){
	if (/FAT/){
		print "$&\t";
	}
}
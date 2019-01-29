#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "data.txt";

open (READ,$file) or die "Cannot open $file!";
my $string = join ("",<READ>);
close READ;

my @seq;
while ($string =~ /(WD)([0-9])+\t([ACGT]+)/g){
	push (@seq,"$3\n");
}
my $seq = join ("",@seq);

$seq =~ tr/CTGA/YYRR/;
print "$seq\n";

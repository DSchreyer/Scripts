#! / usr / bin / perl
use warnings ;
use strict ;

$/ = "\n";
my $fasta="DNA.fasta";
my $string;
open (READ, "$fasta") || die "Cannot read $fasta!\n";
my @array=<READ>;
close READ;
chomp @array;
my $line = $array[0];
$/= "$line";
chomp @array;
#print @array;
$string = join ('',@array);

my $file = "text.txt";
open (WRITE, ">$file") || die "Cannot write in $file!\n";
print WRITE "$string";
close WRITE;
open (WRITE, "$file") || die "Cannot read $file!\n";
print <WRITE>;
close WRITE;

#works

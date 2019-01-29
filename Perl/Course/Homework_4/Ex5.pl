#! / usr / bin / perl
use warnings ;
use strict ;
#print "Enter a file name: ";
#my $output1= <STDIN>;
#print "Enter another file name: ";
#my $output2= <STDIN>;

my $output1="DNA.fasta";
my $output2="Phage.fasta";
my $file = "text.txt";
open (READ1, "$output1") || die "Cannot read $output1!\n";
open (READ2, "$output2") || die "Cannot read $output2!\n";
open (WRITE, ">$file") || die "Cannot write in $file!\n";

my @out1= <READ1>;
my @out2= <READ2>;
chomp @out1;
chomp @out2;
close READ1;
close READ2;
my $i1=0;
my $i2=0;
#foreach (<@out1,@out2>
#	print WRITE $out2[$i2];
#	$i1++;
#	$i2++;
#	}

while ("$out1[$i1]" ne "$out1[$#out1]" ||"$out2[$i2]" ne "$out2[$#out2]"){
	print WRITE $out1[$i1];
	if ("$out1[$i1]" eq undef){
		$i1=0;
	}
	print WRITE $out2[$i2];
	if ("$out2[$i2]" eq undef){
		$i2=0;
	}
	$i1++;
	$i2++;
	}
		
close WRITE;
open (WRITE2, "$file") || die "cannot open $file!\n";
my @out3 = <WRITE2>;
print @out3;


 



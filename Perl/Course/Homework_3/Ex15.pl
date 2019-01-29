#! / usr / bin / perl
use warnings ;
use strict ;

open (READ, "DNA.fasta") || die "Cannot open file!\n";
my @file = <READ>;
close READ;
chomp @file;
my $GC=0;
my $all=1;
my $base;
shift @file;


my $file = join("",@file);
my @DNA = split('',$file);

foreach $base (@DNA){
if ($base eq "G"){
	$GC++;
	$all++;
}	
if ($base eq "C"){
	$GC++;
	$all++;	
}
if ($base eq "T"){
	$all++;	
}
if ($base eq "A"){
	$all++;
}

}
my $GCcontent = ($GC/$all)*100;
#print "$GCcontent\n";
print "Your GC content is $GCcontent%\n";	
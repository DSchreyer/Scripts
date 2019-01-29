#! \usr\bin\perl
use strict;
use warnings;

my $file = "data.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my %all;
my %seq;
my %length;
my %GC;
my %cai;



foreach (@data){
	if (/^(WD[0-9]+)\t([AGCT]+)\t([0-9]+)\t([0-9]+.*[0-9]*)\t([0-9]+)/){
		$seq{$1} = "$2";
		$length{$1} = "$3";
		$GC{$1} = "$4";
		$cai{$1} = "$5";
	}
}


my @sorted_seq = sort {$length{$b} <=> $length{$a}} keys %length;

foreach (@sorted_seq){
	print "$_:\t",$seq{$_},"\t",$length{$_},"\t",$GC{$_},"\t",$cai{$_},"\n";	
}
#works

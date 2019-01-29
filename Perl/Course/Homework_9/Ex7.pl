#! \usr\bin\perl
use strict;
use warnings;

my $file = "genomes.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;


my $bacterium;
my %genome;
my $size;

foreach (@data){
	if (/^[a-zA-z]+/){
		$bacterium = $_;
		next;
	}
	if (/^[0-9]+.[0-9]+$/){
		$size = $&;
	}
	
	$genome{$bacterium} = "$size";
}

my @sort_keys = sort {$a cmp $b} keys %genome;

foreach (@sort_keys){
	print "$_:\t",$genome{$_},"bp","\n";
}

my @sort_values = sort {$genome{$b} <=> $genome{$a}} keys %genome;

foreach (@sort_values){
	print "$_:\t",$genome{$_},"bp","\n";
}

#works






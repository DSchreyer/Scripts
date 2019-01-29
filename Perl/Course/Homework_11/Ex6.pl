#! \usr\bin\perl
use strict;
use warnings;

print "Enter a column line: ";
my $line = <STDIN>;
chomp $line;


sub sorter{
	
	my $v1_l;
	my $v1_2;
	my $v1_3;
	if ( $a =~ /([a-zA-Z]+)[0-9]+\t([0-9]+)\t([0-9]+)/ ){
		$v1_l = $1;
		$v1_2 = $2;
		$v1_3 = $3;
	}
	my $v2_l;
	my $v2_2;
	my $v2_3;
	if ( $b =~ /([a-zA-Z]+)[0-9]+\t([0-9]+)\t([0-9]+)/ ){
		$v2_l = $1;
		$v2_2 = $2;
		$v2_3 = $3;
	}
	
	if ($line == 1){
		return ( lc($v1_l) cmp lc($v2_l));
	}
	elsif ($line == 2){
		return ( $v1_2 <=> $v2_2);
	}
	elsif ($line == 3){
		return ( $v1_3 <=> $v2_3);
	}
	else{ die "This is not a column line!\n"}
	
}

	

my $file1 = "names.txt";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	my @sorted = sort sorter <READ>;
	
	foreach (@sorted){
		if (/([a-zA-Z]+)[0-9]+\t([0-9]+)\t([0-9]+)/ ){
			if ($2 < 100 or $3 < 100){
				my $100sort = $_;
			}
		}
	}
	
	my $file2 = "Ex6test.txt";
	open (WRITE, ">$file2") or die "Cannot write in $file2!\n";
	print WRITE "@sorted";
	close WRITE;
}
close READ;

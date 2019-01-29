#! \usr\bin\perl
use strict;
use warnings;

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
	
	return ( lc($v1_l) cmp lc($v2_l) or $v1_2 <=> $v2_2 or $v1_3 <=> $v2_3) ;
	
}



my $file1 = "names.txt";

open (READ,$file1) or die "Cannot open $file1!";
while (<READ>){
	chomp;
	my @sorted = sort sorter <READ>;
	
	
	my $file2 = "Ex2test.txt";
	open (WRITE, ">$file2") or die "Cannot write in $file2!\n";
	print WRITE "@sorted";
	close WRITE;

}
close READ;

#works
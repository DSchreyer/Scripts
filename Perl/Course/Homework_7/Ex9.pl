#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "multiplelines.fasta";
open(READ,"$file") or die "Cannot open $file!";
my @handle = <READ>;
chomp @handle;
my $seq = join ("",@handle);
$_ = $seq;


if (/^<(+)$/){
	my $header = $_;
	my $seq = $';
}
while (/(....){2,}/g){
	print "$&\n";
}

	

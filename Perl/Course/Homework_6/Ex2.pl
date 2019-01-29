#! / usr / bin / perl
use warnings ;
use strict ;

sub conc1{
	my $s1 = $_[0];
	my $s2 = $_[1];
	my $longer = "$s1"."$s2";
	#print "$longer\n";
	my $length = length ($longer);
	return ($length);
	
	
}
sub conc2{
	my $s1 = $_[0];
	my $s2 = $_[1];
	my @seq = ("$s1"."$s2");
	my $longer = join ("","@seq");
	my $length = length($longer);

	return ($length);
}

my $seq1 = "AAAAGGGGGCCCCC";
my $seq2 = "GGGGAAAACCCCAGAGAGAGA";

my $long1 = conc1($seq1,$seq2);
print "$long1\n";
my $long2 = conc2($seq1,$seq2);
print "$long2\n";
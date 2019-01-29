#! / usr / bin / perl
use warnings ;
use strict ;

sub four{
	my $four = $_[0];
	my @sentence = split("",$four);
	print $sentence[0];
	
	#$four = $sentence[3];
	return ($four);
}
sub replace{

	
}

my $string = "The quick brown fox jumps over the lazy dog";
my $length = length ($string);
#print "$length\n";
my $uc = uc($string);
#print "$uc\n";
my $word = four($string);
#print "$word\n";


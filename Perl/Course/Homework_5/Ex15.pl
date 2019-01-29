#! / usr / bin / perl
use warnings ;
use strict ;

sub reverse_complement{
	my $DNA = $_[0];
	
	my @DNA = split ('', $DNA);
	#@DNA = uc(@DNA);
	my @complement;
	
	#foreach (@DNA){
	#	if ($_ ne "A" || $_ ne "G" || $_ ne "T" || $_ ne "C" ){
	#		die "Error!\n";
	#	}
	#}

	foreach (@DNA){
		if ($_ eq "A"){
			$_ = "T";
		}
		if ($_ eq "T"){
			$_ = "A";
		}
		if ($_ eq "G"){
			$_ = "C";
		}
		if ($_ eq "C"){
			$_ = "G";
		}
		
	}
	my @reverse_comp = reverse(@DNA);
	print "@reverse_comp\n";
	my $reverse_comp = join ("", @reverse_comp);
	return ($reverse_comp);														
}

print "Enter a DNA sequence: ";
my $seq = <STDIN>;
chomp $seq;

my $complement_DNA = reverse_complement ($seq);

print "The reverse complement to your seuence is: $complement_DNA.\n";




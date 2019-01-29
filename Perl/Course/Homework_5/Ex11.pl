#! / usr / bin / perl
use warnings ;
use strict ;

sub check{
	my $subDNA = $_[0];
	my @subDNA = split ("", $subDNA);
	my $counter = $#subDNA;
	my $i;
	my $anothercounter=-1;
	for ($i=0; $i <=$counter; $i++){
		foreach (@subDNA){
			if ($_ eq "A" || $_ eq "G" || $_ eq "T" || $_ eq "C"){
				$anothercounter++;
			}
			else {
			}							
		}
		if ($anothercounter eq $counter){
			return (1);
		}
		else {
			return (0);
		}
	}
	
}

my $DNA = "GAATGATAGGCGCGCGCGG";
chomp $DNA;

my $result = check($DNA);
print "$result\n";

#works

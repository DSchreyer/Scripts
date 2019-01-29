package Anagrams;

use strict;
use warnings;
use Exporter;
use Math::Combinatorics;

our @Export = qw(read_file get_anagrams_for_word);


sub read_file{
	my $file = $_[0];
	my @memory;
	open (READ, $file)||die "Failed to open $file \n";
	while (<READ>){
		chomp;
		push (@memory,$_);
	}
	close READ;
	get_anagrams_for_word(@memory);	
	
}

sub get_anagrams_for_word{
	my @memory = $_[0];
	foreach (@memory){
		my @word = split ("",$_);
		
		my @word_permutations;
		my $length = scalar(@word)+1;
		my $combinat = Math::Combinatorics->new(count => $length,data => [@word],);
		while(my @permu = $combinat->next_permutation){
			my $word = join("", @permu);
			$word .= "$word ";
		}
		opendir (DH, "/usr/share/dict/words") or die "Cannot open /usr/share/dict/words!\n";
		
		
			
			
			if ($word =~ //) #hier kommt diese Liste rein. Nur in Linux
		}
	}
}

	#Math::Combinatorics verwenden um alle permutations von einem wort zu erhalten. abggleichen mit 
	#abgleichen mit den wörtern aus der datei, bei übereinstimmung ausgeben
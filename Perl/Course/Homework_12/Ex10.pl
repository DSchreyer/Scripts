#! / usr / bin / perl
use strict ;
use warnings ;
use lib "C:/Users/Daniel/OneDrive/Perl_Programming/Homework_12/My modules";
use Math::Combinatorics;


for (my $i=1;$i lt 6; $i++){
	my @n = qw(a b c d e);
	my $combinat = Math::Combinatorics->new(count => $i,
											  data => [@n],
											 );

	print "combinations of 2 from: ".join(" ",@n)."\n";
	print "------------------------".("--" x scalar(@n))."\n";
	  while(my @combo = $combinat->next_combination){
		print join(' ', @combo)."\n";
	  }
	print "permutations of 3 from: ".join(" ",@n)."\n";
	print "------------------------".("--" x scalar(@n))."\n";
	while(my @permu = $combinat->next_permutation){
		print join(' ', @permu)."\n";
	}

  
}
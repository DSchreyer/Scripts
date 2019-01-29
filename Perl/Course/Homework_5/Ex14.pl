#! / usr / bin / perl
use warnings ;
use strict ;

sub complement{
	my $codons = "$_[0]";
	print "$codons\n";
	my $seq = "$_[1]";
	my @codons = split ('', $codons);
	my @seq = split ('', $seq);
	my $i=0;
	my $N = $#seq;
	my $c= $#codons;

	my $q=0;
	my @array_seq=();
	my @position = ();
	my $counter=0;
	my $position;

	foreach (@seq){
		if ("$_" eq "$codons[$i]"){
			push (@array_seq,$codons[$i]);
			$i= $i+1;
			$counter++;
			
			if ($c eq $#array_seq){
				$position = ($counter-$i+1);
				push (@position, $position);
				#print "@position\t";
			}
		}
		else{
			$i=0;
			$counter++;
			@array_seq=();
		}
	}
	return (@position);
}


my $file ="DNA.fasta";
open (READ, "$file") || die "Cannot read $file!\n";
my @data = <READ>;
close READ;
shift @data;
$file = join ('', @data);




my $codon;
while (){
	print "Enter a codon(exit with newline character): ";
	$codon = <STDIN>;
	chomp $codon;
	if ($codon eq ""){
		last
	}
	my @return = complement ($codon, $file);
	print "Your codon is in position: @return\n";
}

#
#THIS WORKS

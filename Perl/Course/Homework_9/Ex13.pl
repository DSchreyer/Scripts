#! \usr\bin\perl
use strict;
use warnings;

my $file = "code.txt";

open (READ,$file) or die "Cannot open $file!";
my @data = <READ>;
chomp @data;
close READ;

my %AS;
my $Amino;
my $codon;


foreach (@data){
	if (/([A-Z]+)/){ #AA 
		$Amino = $1;
		while (/([AUGC]{3})/g){
			$codon .= "$1 ";
		}		
	}
	$AS{$Amino} = $codon; # key = AA value = codon
	#print "$AS{$Amino}\n";
	$codon = "";
}
	

my $RNA = "AUGUGAUGUAGUAUAUCGAUCAGUACCGGGGGGGAUAUUAUUUAUUAUAUAUAAUAUAUGAGA";

if ($RNA =~ /^((...)+)UAA|^((...)+)UAG|^((...)+)UGA/){
	$RNA = $&; #Reading frame
}

my @DNA;

while ($RNA =~ /^(...)/g){ #in 3er codons
	$RNA = $';
	push (@DNA,$&);
	#print "$&\t";
}

my $three;

my @AS;

foreach (@DNA){
	while (my ($key,$value) = each %AS){
	
		$three = $_;
		if ($value =~ /$three/){
			push (@AS,$key);
		}
	}
			
}
print "@AS\n";

#works, but doesnt know Stop




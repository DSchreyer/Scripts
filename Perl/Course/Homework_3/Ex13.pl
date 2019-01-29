#! / usr / bin / perl
use warnings ;
use strict ;

my $prime;
my $counter=1;
my @prime;
my @array=(1);
my @another=();
while (scalar @array<50){
	foreach (@array){
		@prime = $counter%$_;
		
	
	if (@prime eq "0"){ 
		push (@another, @prime);
	}
	if (scalar @another eq 1){
		push (@array, $counter);
	}
$counter++;
}
@another= ();
print "@array\t";
	
#print $counter;
	
}

print "@array\t";

#prints out 1 1 1 1 1 1 ...	



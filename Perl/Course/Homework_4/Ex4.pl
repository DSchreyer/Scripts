#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter your file name: ";
my $file = <STDIN>;
chomp $file;
my $comp = "nucleotide_composition.txt";
open (WRITE, ">$comp") or die "cannot open $comp";
open (READ, "$file") || die "Cant  open $file!\n";
my @Fasta = <READ>;
shift @Fasta;
my $string = join("",@Fasta);
@Fasta=split ('',$string);


my $A=0;
my $C=0;
my $G=0;
my $T=0;
my $counter=1;


foreach (@Fasta){
	
	if ($_ eq "A"){
		$A++;
		$counter++;
		}	
	if ($_ eq "C"){
		$C++;
		$counter++;
		}
	if ($_ eq "G"){
		$G++;
		$counter++;
		}
	if ($_ eq "T"){
		$T++;
		$counter++;
		}
	
}
print @Fasta;
$A= ($A/$counter)*100;
$G= ($G/$counter)*100;
$C= ($C/$counter)*100;
$T= ($T/$counter)*100;


close (READ);

printf WRITE "A\t"."%.3f%\n",$A; #stimmt was nicht
printf WRITE "G\t"."%.3f%\n",$G;
printf WRITE "C\t"."%.3f%\n",$C;
printf WRITE "T\t"."%.3f%\n",$T;




close (WRITE);

open (READ,"$comp") || die "cannot open $comp";
my @new = <READ>;
close READ;

print @new;

#invalid conversion in printf 


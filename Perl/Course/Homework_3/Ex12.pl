#! / usr / bin / perl
use warnings ;
use strict ;
print "Enter a DNA-Sequence: ";
my $string = <STDIN>;
chomp $string;
$string = lc ($string);
my @pal = split ('',$string);
#print "$string\n";
print "@pal\n";
my @palindrom;

foreach (@pal){
	unshift(@palindrom,$_); 
}
print "@palindrom\n";

if ("@pal" eq "@palindrom"){
	print "This is a palindrom.\n";
	}
	else{
		print "This is not a palindrom.\n";
	}
#works



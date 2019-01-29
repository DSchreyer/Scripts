#! / usr / bin / perl
use warnings ;
use strict ;

my $file = "accession_names.txt";
open(READ,"$file") or die "Cannot open $file!";
while (<READ>){
	foreach (<READ>){
		if (/5/){
			print "$_\n";
		}
		if (/[de]/){
			print "$_\n";
		}
		if (/d(.)e/){
			print "$_\n";
		}
		if (/d/){
			print "$_\n";
		}
		if (/^[xy]/){
			print "$_\n";
		}
		if (/^[xy]+e$/){
			print "$_\n";
		}
		if (/[0-9]{3,}/){
			print "$_\n";
		}
		if (/[arp]d$/){
			print "$_\n";
		}
	}
}

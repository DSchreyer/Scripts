#! / usr / bin / perl
use warnings ;
use strict ;

my $as = "MALEKRRKAMYMLKAELMAKPMKPAMLEMAKEPLAMP";

$_ = $as;
if (/[MALEK]+[^P]{10,}/){
	print "it matched!\n";
}
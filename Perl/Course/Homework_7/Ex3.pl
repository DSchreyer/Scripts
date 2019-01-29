#! / usr / bin / perl
use warnings ;
use strict ;

my $name = "fred wilma&fred";

if ($name =~ /(?<Name>[a-zA-Z0-9\_]+a)\b(?<Name2>(.){0,5})/){
	print "It matched!\n";
	print "$+{Name} contains $+{Name2} \n";
}

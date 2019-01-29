#! / usr / bin / perl
use warnings ;
use strict ;

print "Enter a sentence: ";
my $text = <STDIN>;
$_ = $text;
while (/[a-zA-Z0-9]+\b/g){
	print "$&\n";
}

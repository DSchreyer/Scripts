#! / usr / bin / perl
use warnings ;
use strict ;
my @words;
@words= qw( The quick brown fox jumps over the lazy dog and runs away);
#my $word;
#foreach $word (@words){print "$word ";} #the quick brown fox jumps over the lazy dog and runs away
my @one = @words[0,1,3,4,5,6,8];
my $eins = join(" ",@one);
print $eins; #the quick fox jumps over the dog
print "\n";

my @two = @words[0,2,3,10,11]; #the brown fox runs away
my $zwei = join(" ",@two);
print $zwei;
print "\n";

my @three = @words[0,7,8,10]; #The lazy dog runs
my $drei = join(" ",@three);
print $drei;
print "\n";

my @four = @words[0,8,10,11,1]; 
my $vier = join(" ",@four);
print $vier;
print "\n";

my @five = @words[0..2,8,10,5..7,3]; 
my $fuenf = join(" ",@five);
print $fuenf;
print "\n";
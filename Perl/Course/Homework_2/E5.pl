#! / usr / bin / perl
use warnings ;
use strict ;
my @people = qw(Clark Kent Lois Lane Bruce Wayne);
unshift (@people, "Superman");
print "@people\n";
pop (@people);
pop (@people);
print "@people\n";
splice @people, 2,0, qw(Reporter);
print "@people \n";
push @people, qw(Jimmy Olsen Photographer);
print "@people \n";

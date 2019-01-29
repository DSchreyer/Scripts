#! / usr / bin / perl
use warnings ;
use strict ;
my $firstname;
print "Tell me your first name: ";
$firstname = <STDIN>;
chomp $firstname;
my $secondname;
print "Tell me your second name: ";
$secondname = <STDIN>;
chomp $secondname;
my @Name = ($firstname,$secondname);

print "Your name is @Name.\n";
print "Your name is $Name[0] $Name[1].\n";
print "Your name is $firstname $secondname.\n";
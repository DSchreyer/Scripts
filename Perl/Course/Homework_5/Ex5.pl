#! / usr / bin / perl
use warnings ;
use strict ;

sub random{
	my $rand = int(rand(50));
	my @data = @_;
	my $line = ($data[$rand]);
	return ($line);	
}

print "Enter a file name: ";
my $file = <STDIN>;
chomp $file;
open (READ,$file) || die "Couldnt open $file!\n";
my @data = <READ>;
my $rand = random (@data);
close READ;


print "$rand\n";

#works


#! / usr / bin / perl
use warnings ;
use strict ;

sub remove_header{
	my @seq = @_;
	shift (@seq);
	my $seq = join ("", @seq);
	return ($seq);
}
	
#print "Enter a fasta file: ";
my $file ="DNA.fasta"; #or <STDIN>;
chomp $file;
open (READ, "$file") || die "Cannot read $file!\n";
my @file = <READ>;
close READ;

my $return = remove_header (@file);

print "$return\n";

#works

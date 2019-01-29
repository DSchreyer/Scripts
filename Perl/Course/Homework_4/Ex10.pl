#! / usr / bin / perl
use warnings ;
use strict ;


my @head;
my @seq;
my $header;
my $seq;
while (){
	print "Enter a header(exit with newline character): ";
	$header = <STDIN>;
	chomp $header;
	if ($header eq ""){
		last
	}
	print "Enter a sequence: ";
	$seq = <STDIN>;
	chomp $seq;
	push (@seq, "$seq");
	push (@head, "$header");
}
$seq = join ('',@seq);
@seq = split ('',$seq);

#print @seq;
open (WRITE, ">Seq.fasta") || die "Cannot write in Seq.fasta!\n";
foreach (@seq){
	if ($_ eq "A" || $_ eq "T" || $_ eq "C" || $_ eq "G" ){
		print WRITE "$_";
	}
	else {
		warn "The sequence contains unvalid characters!\n";
	}
}
close WRITE;
open (READ, "Seq.fasta") || die "Cannot read in Seq.fasta!\n";
my $read = <READ>;
print "$read\n";

#works	


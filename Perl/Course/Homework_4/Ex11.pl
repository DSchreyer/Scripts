#! / usr / bin / perl
use warnings ;
use strict ;


my @head;
my @seq;
my $header;
my $seq;
my $i;
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
open (WRITE, ">$header.fa") || die "Cannot write in $header.fa!\n";
$seq = join ('',@seq);
@seq = split ('',$seq);


foreach (@seq){
	if ($_ eq "A" || $_ eq "T" || $_ eq "C" || $_ eq "G" ){
	print WRITE "$_";
	}
	else {
		warn "The sequence contains unvalid characters!\n";
	}
	


}
@seq =();
close WRITE;
open (READ, "$header.fa") || die "Cannot read in Seq.fasta!\n";
my $read = <READ>;
print "$read\n";

}




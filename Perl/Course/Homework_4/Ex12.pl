#! / usr / bin / perl
use warnings ;
use strict ;


my @file;
my @seq;
my $header;
my $seq;
my $read;
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
$seq = join ('',@seq);
@seq = split ('',$seq);
foreach (@seq){
	if ($_ eq "A" || $_ eq "T" || $_ eq "C" || $_ eq "G" ){
	}
	else {
		warn "The sequence contains unvalid characters!\n";
	}
foreach (@seq){
	if ($_ eq "a" || $_ eq "t" || $_ eq "c" || $_ eq "g" ){
	}
	else {
		warn "The sequence contains unvalid characters!\n";
	}
}	
push (@file, "@seq\t");
push (@file, "$header\n");
}

open (WRITE, ">Seq.fasta") || die "Cannot write in Seq.fasta!\n";
print WRITE "@file";
close WRITE;
}


open (READ, "Seq.fasta") || die "Cannot read in Seq.fasta!\n";
$read = <READ>;
close READ;
print "$read\n";

#works	
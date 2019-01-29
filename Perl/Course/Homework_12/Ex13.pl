use strict;
use warnings;
use lib "C:/Users/Daniel/OneDrive/Perl_Programming/Homework_12/My modules";
use Manipulate;


my $sequence = "AGCTAGCTA";
Manipulate::revcomp($sequence);

Manipulate::readFASTA("PerlLab9.fasta");
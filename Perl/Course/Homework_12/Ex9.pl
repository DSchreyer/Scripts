#! / usr / bin / perl
use strict ;
use warnings ;
use lib "C:/Users/Daniel/OneDrive/Perl_Programming/Homework_12/My modules";
use Business::ISBN;


my $isbn10 = Business::ISBN->new('0596102062');

$isbn10->is_valid;

print $isbn10->as_string([]),"\n";

print $isbn10->group_code,"\n";

print $isbn10->publisher_code,"\n";
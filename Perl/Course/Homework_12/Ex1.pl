#! \usr\bin\perl
use strict;
use warnings;
use Carp;
use CGI;
use sigtrap;


foreach (keys %INC){
	print "$_: $INC{$_}\n";
}


#! / usr / bin / perl
use warnings ;
use strict ;
my @READ1;
my @one;
my @two;
while (<>){
 @one= $ARGV[0];
 @two= $ARGV;
}
print @two;

open (READ,"$ARGV") || die "Cannot read !\n";
@READ1 =<READ>;
close READ;
#open (READ2, $ARGV[1]) || die "Cannot read !\n";


#print @READ1;
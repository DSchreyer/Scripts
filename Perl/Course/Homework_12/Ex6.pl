#! / usr / bin / perl
use strict ;
use warnings ;
use GD;


# Create a new image
my $im = new GD::Image (100 ,100) ;


# Allocate some colors
my $white = $im -> colorAllocate (255 ,255 ,255) ;
my $black = $im -> colorAllocate (0 ,0 ,0);
my $red = $im -> colorAllocate (255 ,0 ,0) ;
my $blue = $im -> colorAllocate (0 ,0 ,255) ;


# Make the background transparent and interlaced
$im -> transparent ( $white );
$im -> interlaced ("true ");


# Put a black frame around the picture
$im -> rectangle (0 ,0 ,99 ,99 , $black );


# Draw a blue oval
$im -> arc (50 ,50 ,95 ,75 ,0 ,360 , $blue );


# And fill it with red
$im -> fill (50 ,50 , $red );


# Open a file for writing
open ( PICTURE , ">PerlLab12 . png") or die (" Cannot open file for writing ");


# Make sure we are writing to a binary stream
binmode PICTURE ;


# Convert the image to PNG and print it to the file PICTURE
print PICTURE $im -> png ;
close PICTURE ;
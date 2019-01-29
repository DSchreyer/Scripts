#!/usr/bin/perl
use strict;
use warnings;
my @list;
@list = (1,2,3);
my $scalar1;
my $scalar2;
$scalar1 = "hello";
$scalar2 = "there";
my @newlist;
@newlist =@list; #1 2 3
@newlist = reverse(@list[1,2]); # 3 2
@newlist = ($scalar1, @list[1,1]); #hello 2 2
my $dummy;
($dummy,@newlist) = @list; #$dummy = 1, @newlist = 2 3 ;

@newlist [2,1,3] =@list [1,2,1]; #@newlist = 2 3 2 2
@newlist = <STDIN>; #Liste wird durch Keyboard erstellt, mit Enter wird ein Element bestätigt

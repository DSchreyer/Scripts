#! \usr\bin\perl
use strict;
use warnings;

my @list = qw ( ZNF679 EPDR1 ZNF679 EPDR1 MXD1 MXD1 AC093668 .1 MXD1 PRR27 PRR27 PRR27 PRR27 MTND5P30 RP11 -268 P4 .5 TCHH TCHH SREK1IP1 SREK1IP1 COX6B1P2 MXD1 MXD1 EPDR1 MXD1 MXD1 ) ;

@list = sort @list;

my %hash = @list;
@list = keys %hash;
%hash = @list;

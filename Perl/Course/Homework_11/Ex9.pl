#! \usr\bin\perl
use strict;
use warnings;

my %aas = (
’serine ’ => [’TCA ’,’TCC ’,’TCG ’,’TCT ’],
’proline ’ => [’CCA ’,’CCC ’,’CCG ’,’CCT ’] );

my %codes ;
$codes {’earth ’} = \ %aas ;
$codes {’mars ’} = {’serine ’ => [’QWZ ’,’QWX ’,’QWQ ’,’QWW ’],
’proline ’ => [’ZXZ ’,’ZXX ’,’ZXQ ’,’ZXW ’] };


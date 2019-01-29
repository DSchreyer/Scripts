package PrintSupport ;
use Exporter ;
BEGIN {
@ISA = qw( Exporter );
@EXPORT = qw( print_HP print_fax );
}



sub print_HP{
	print "HP!\n";
}

sub print_Apple{
	print "Apple!\n";
}

sub print_Xerox{
	print "Xerox!\n";
}

sub print_fax{
	print "fax!\n";
}

1;
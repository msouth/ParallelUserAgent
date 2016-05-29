# This -*- perl -*- script writes the Makefile for LWP::Parallel
# $Id: Makefile.PL,v 1.14 2004/02/10 15:19:10 langhein Exp $
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'LWP::Parallel',
    'ABSTRACT' => 'Extension for LWP to allow parallel HTTP and FTP access',
    'DISTNAME'  => 'ParallelUserAgent',
    'VERSION_FROM' => 'lib/LWP/Parallel.pm', # finds $VERSION
    'LICENSE'      => 'perl',
    'AUTHOR'       => 'Marc Langheinrich <marclang@cpan.org>, Mike South (maintainer) <msouth@cpan.org>',
    #
    # automated testing on 5.16.2 gave errors at make test; not able to find
    # LWP::Protocol::http10.  Repeated a reduced version of the
    # test with https and it needed IO::Socket::SSL and LWP::Protocol::https10.  
    # 
    # I don't know any of the actual
    # required version numbers here.  This is a start on 
    # getting the problem fixed, though.
    #
    'PREREQ_PM' => {
        'LWP'                    => 5.64,
        'LWP::Protocol::http10'  => 0,
        'IO::Socket::SSL'        => 0,
        'LWP::Protocol::https10' => 0,
    },
);

package MY;

sub test
{
    q(
test: all
	$(FULLPERL) t/TEST 

);
}



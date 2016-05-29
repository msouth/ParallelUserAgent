print "1..2\n";

use strict;
use LWP::Parallel::UserAgent;

my $ua = LWP::Parallel::UserAgent->new(keep_alive => 1);

my $http_req = HTTP::Request->new(GET => "http://www.w3.org/");
my $https_req = HTTP::Request->new(GET => "https://www.w3.org/");

my $result_http;
my $result_https;
$ua->register($http_req, sub { $result_http = $_[2]->{scheme} eq 'http' and $_[1]->is_success; });
$ua->register($https_req, sub {	$result_https = $_[2]->{scheme} eq 'https' and $_[1]->is_success; });

$ua->wait(30);

print ''.($result_http ? '' : 'not ')."ok 1 HTTP\n";
print ''.($result_https ? '' : 'not ')."ok 2 HTTPS\n";

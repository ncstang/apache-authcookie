use strict;
use constant MODPERL2 => ($mod_perl::VERSION >= 1.99);

if (MODPERL2) {
    require Apache2::Access;
}

my $r = MODPERL2 ? Apache2::RequestUtil->request
                 : Apache->request;

$r->content_type("text/html");
$r->status(200);
$r->send_http_header unless MODPERL2;

my $user = MODPERL2 ? $r->user : $r->connection->user;

print "$user";

package Crypt::OpenSSL::VerifyX509file;
require XSLoader;

BEGIN { our $VERSION = 0.01 }

XSLoader::load();
1;

=encoding utf8

=head1 Crypt::OpenSSL::VerifyX509file

use Crypt::OpenSSL::VerifyX509file;

if (Crypt::OpenSSL::VerifyX509file("/path/to/cabundle.pem", "/path/to/somecert.crt") ne "OK") {
   die "somecert.crt not signed by cabundle.pem";
}

=cut

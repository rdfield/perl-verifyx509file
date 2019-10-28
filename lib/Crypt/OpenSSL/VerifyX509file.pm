package Crypt::OpenSSL::VerifyX509file;
require XSLoader;

BEGIN { our $VERSION = 0.01 }

XSLoader::load();
1;

=encoding utf8

=head1 Crypt::OpenSSL::VerifyX509file

Crypt::OpenSSL::VerifyX509file - verifies that a public cert has been signed by a specific CA

=head1 usage

use Crypt::OpenSSL::VerifyX509file;

if (Crypt::OpenSSL::VerifyX509file::verify_cert("/path/to/cabundle.pem", "/path/to/somecert.crt") ne "OK") {
   die "somecert.crt not signed by cabundle.pem";
}

=cut

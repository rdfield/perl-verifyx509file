# perl-verifyx509file

Verifies that a public cerificate has been signed by a particular CA.  Replacement for the unmaintained Crypt::OpenSSL::VerifyX509.  

## Getting Started



### Prerequisites

OpenSSL development headers, e.g. apt install libssl-dev on Debian.

### Installing

perl Makefile.PL

make

make test

make install


### Using

perl -MCrypt::OpenSSL::VerifyX509file -e 'my $ok = Crypt::OpenSSL::VerifyX509file::verify_cert("/path/to/cacert.pem", "/path/to/public.crt");print "$ok\n"'

where cacert.pem is the public certificate of the signing CA and public.crt is the public cert you want to verify.

## Authors

Mvine Ltd (https://www.mvine.com)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Stitched together from various stackoverflow.com posts :-)


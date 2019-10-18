#!/usr/bin/perl
use Test::More;

BEGIN { use_ok 'Crypt::OpenSSL::VerifyX509file' }

cmp_ok( Crypt::OpenSSL::VerifyX509file::verify_cert("t/cacert.pem","t/ok.crt") , "eq", "OK", "cacert verified");
cmp_ok( Crypt::OpenSSL::VerifyX509file::verify_cert("t/cacert.pem","t/nok.crt") , "ne", "OK", "cacert verified");

done_testing;

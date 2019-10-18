use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  NAME           => 'Crypt::OpenSSL::VerifyX509file',
  VERSION_FROM   => 'lib/Crypt/OpenSSL/VerifyX509file.pm',
  PREREQ_PM      => { 'Test::More' => 0, 'ExtUtils::MakeMaker' => '7.12' },
  ABSTRACT_FROM  => 'lib/Crypt/OpenSSL/VerifyX509file.pm',
  AUTHOR         => 'Mvine Ltd',
  CCFLAGS        => '-Wall -std=c99',
  OPTIMIZE       => '-O3',
  LICENSE        => 'freebsd',
  XSMULTI        => 1,
  LIBS           => [ '-lssl' ]
);

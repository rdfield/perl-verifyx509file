#define PERL_NO_GET_CONTEXT 
#include "EXTERN.h"        
#include "perl.h"          
#include "XSUB.h"         

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include <openssl/bio.h>
#include <openssl/err.h>
#include <openssl/pem.h>
#include <openssl/x509.h>
#include <openssl/x509_vfy.h>

MODULE = Crypt::OpenSSL::VerifyX509file  PACKAGE = Crypt::OpenSSL::VerifyX509file
PROTOTYPES: ENABLE


char  *
verify_cert(char *ca_bundlestr, char *cert_filestr)
  CODE:
     BIO              *certbio = NULL;
     BIO               *outbio = NULL;
     X509          *error_cert = NULL;
     X509                *cert = NULL;
     X509_NAME    *certsubject = NULL;
     X509_STORE         *store = NULL;
     X509_STORE_CTX  *vrfy_ctx = NULL;

     int ret;
     char *retmsg;

     OpenSSL_add_all_algorithms();
     ERR_load_BIO_strings();
     ERR_load_crypto_strings();

     certbio = BIO_new(BIO_s_file());

     if (!(store=X509_STORE_new())) {
        size_t needed = snprintf(NULL, 0, "Error creating X509_STORE_CTX object") + 1;
        retmsg = malloc(needed);
        snprintf(retmsg, needed, "Error creating X509_STORE_CTX object");
        goto done;
     }

     vrfy_ctx = X509_STORE_CTX_new();

     ret = BIO_read_filename(certbio, cert_filestr);
     if (! (cert = PEM_read_bio_X509(certbio, NULL, 0, NULL))) {
        size_t needed = snprintf(NULL, 0, "Error loading cert into memory") + 1;
        retmsg = malloc(needed);
        snprintf(retmsg, needed, "Error loading cert into memory");
        goto done;
     }

     ret = X509_STORE_load_locations(store, ca_bundlestr, NULL);
     if (ret != 1) {
        size_t needed = snprintf(NULL, 0, "Error loading CA cert or chain file") + 1;
        retmsg = malloc(needed);
        snprintf(retmsg, needed, "Error loading CA cert or chain file");
        goto done;
     }
     X509_STORE_CTX_init(vrfy_ctx, store, cert, NULL);

     ret = X509_verify_cert(vrfy_ctx);

     if( ret == 0 ) {
        size_t needed = snprintf(NULL, 0, "Error %s", X509_verify_cert_error_string(X509_STORE_CTX_get_error (vrfy_ctx))) + 1;
        retmsg = malloc(needed);
        snprintf(retmsg, needed, "Error %s", X509_verify_cert_error_string(X509_STORE_CTX_get_error (vrfy_ctx)));
     } else {
        size_t needed = snprintf(NULL, 0, "OK") + 1;
        retmsg = malloc(needed);
        snprintf(retmsg, needed, "OK");
     }
   done:
     X509_STORE_CTX_free(vrfy_ctx);
     X509_STORE_free(store);
     X509_free(cert);
     BIO_free_all(certbio);
     RETVAL = retmsg;
  OUTPUT:
     RETVAL

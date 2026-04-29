#!/bin/bash


apt install -y apache2 php libapache2-mod-php

a2enmod ssl
a2enmod rewrite
a2enmod headers

output_dir=certs
mkdir -p $output_dir
cd $output_dir
openssl genrsa -out weak.key 1024
openssl req -new -key weak.key -out weak.csr -subj "/C=XX/ST=Lab/L=Vulnbox/O=Insecure/OU=Testing/CN=localhost"
openssl x509 -req -days 3650 -in weak.csr -signkey weak.key -out weak.crt -sha1
# openssl x509 -req -days 3650 -in weak.csr -signkey weak.key -out weak_md5.crt -md5

mkdir -p /etc/apache2/ssl
cp weak.* /etc/apache2/ssl/

tee /etc/apache2/sites-available/vulnbox.conf  << EOF
<VirtualHost *:80>
    ServerName localhost

    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/

    # No security headers
</VirtualHost>

<VirtualHost *:443>
    ServerName localhost

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/weak.crt
    SSLCertificateKeyFile /etc/apache2/ssl/weak.key

    # INTENTIONALLY WEAK SETTINGS
    SSLProtocol all -SSLv3 -TLSv1.3 -TLSv1.2 -TLSv1.1
    # leaves TLS 1.0 enabled

    SSLCipherSuite ALL:NULL:EXPORT:LOW:MEDIUM:DES:RC4:MD5
    #SSLCipherSuite aNULL:EXPORT:LOW:ALL
    #SSLInsecureRenegotiation on
    SSLHonorCipherOrder off

    # Disable protections
    SSLCompression on
    SSLSessionTickets On

    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/

    # Remove security headers if present
    Header always unset Strict-Transport-Security
    Header always unset X-Frame-Options
    Header always unset X-Content-Type-Options
</VirtualHost>
EOF

a2ensite vulnbox.conf
systemctl reload apache2

tee /etc/php/7.4/apache2/php.ini << EOF
display_errors = On
display_startup_errors = On
allow_url_fopen = On
allow_url_include = On
disable_functions =
open_basedir =
expose_php = On
EOF

systemctl restart apache2
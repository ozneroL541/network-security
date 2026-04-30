#!/bin/bash


apt install -y apache2 php libapache2-mod-php

a2enmod ssl
a2enmod rewrite
a2enmod headers
a2enmod proxy
a2enmod proxy_http
a2dissite 000-default.conf
echo "ServerName 127.0.0.1" | sudo tee /etc/apache2/conf-available/servername.conf
sudo a2enconf servername

output_dir=certs
mkdir -p $output_dir
cd $output_dir
openssl genrsa -out weak.key 1024
openssl req -new -key weak.key -out weak.csr -subj "/C=XX/ST=Lab/L=Vulnbox/O=Insecure/OU=Testing/CN=localhost"
openssl x509 -req -days 3650 -in weak.csr -signkey weak.key -out weak.crt -sha1
#openssl x509 -req -days 3650 -in weak.csr -signkey weak.key -out weak_md5.crt -md5

mkdir -p /etc/apache2/ssl
cp weak.* /etc/apache2/ssl/

tee /etc/apache2/sites-available/vulnbox.conf  << EOF
<VirtualHost *:80>
    ServerName localhost

    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:8000/
    ProxyPassReverse / http://127.0.0.1:8000/

    # No security headers
</VirtualHost>

<VirtualHost *:443>
    ServerName localhost

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/weak.crt
    SSLCertificateKeyFile /etc/apache2/ssl/weak.key

    # Allow TLS 1.0 only if OpenSSL supports it
    SSLProtocol all -SSLv3 -TLSv1.3 -TLSv1.2 -TLSv1.1
    #SSLProtocol all -SSLv3

    SSLCipherSuite ALL:NULL:EXPORT:LOW:MEDIUM:DES:RC4:MD5:@SECLEVEL=0
    #SSLCipherSuite aNULL:EXPORT:LOW:ALL:@SECLEVEL=0
    #SSLCipherSuite HIGH:!aNULL:@SECLEVEL=0
    #SSLCipherSuite ALL:NULL:EXPORT:LOW:@SECLEVEL=0

    SSLHonorCipherOrder off

    #SSLCompression on
    SSLSessionTickets On

    SSLOpenSSLConfCmd MinProtocol SSLv3
    SSLOpenSSLConfCmd CipherString DEFAULT:@SECLEVEL=0

    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:8000/
    ProxyPassReverse / http://127.0.0.1:8000/

    Header always unset Strict-Transport-Security
    Header always unset X-Frame-Options
    Header always unset X-Content-Type-Options
</VirtualHost>
EOF

a2ensite vulnbox.conf

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
server {
  listen 80;
  server_name geokunis2.nl www.geokunis2.nl;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  server_name geokunis2.nl;
  location / {
    proxy_pass http://192.168.30.2;
  }


  location /socket {
        proxy_pass http://192.168.30.2;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
        proxy_set_header Origin '';
   }

  location /.well-known {
        root /var/www/acme-challenge;
  }

  ssl_certificate /etc/letsencrypt/live/geokunis2.nl/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/geokunis2.nl/privkey.pem;
  ssl_session_timeout 1d;
  ssl_session_cache shared:MozSSL:10m;  # about 40000 sessions
  ssl_session_tickets off;

  ssl_protocols TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384';

    # OCSP stapling
  ssl_stapling on;
  ssl_stapling_verify on;
  ssl_dhparam /etc/letsencrypt/live/geokunis2.nl/dhparam.pem;
    # verify chain of trust of OCSP response using Root CA and Intermediate certs
    ssl_trusted_certificate /etc/letsencrypt/live/geokunis2.nl/fullchain.pem;

    # replace with the IP address of your resolver
  resolver 1.1.1.1;
}

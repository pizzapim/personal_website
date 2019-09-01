server {
  listen 80;
  server_name pizzapim.nl www.pizzapim.nl;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http2;
  server_name pizzapim.nl www.pizzapim.nl;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  location / {
    proxy_pass http://localhost:81;
  }

  ssl_certificate /etc/letsencrypt/live/pizzapim.nl-0003/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/pizzapim.nl-0003/privkey.pem;
  ssl_session_timeout 1d;
  ssl_session_cache shared:MozSSL:10m;  # about 40000 sessions
  ssl_session_tickets off;

  ssl_protocols TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384';

    # OCSP stapling
  ssl_stapling on;
  ssl_stapling_verify on;
  ssl_dhparam /etc/letsencrypt/live/pizzapim.nl-0003/dhparam.pem;
    # verify chain of trust of OCSP response using Root CA and Intermediate certs
    ssl_trusted_certificate /etc/letsencrypt/live/pizzapim.nl-0003/fullchain.pem;

    # replace with the IP address of your resolver
  resolver 1.1.1.1;
}

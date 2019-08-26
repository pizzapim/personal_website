server {
  listen 80;
  server_name pizzapim.nl www.pizzapim.nl;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  return 301 https://pizzapim.nl;
}

server {
  listen 443;
  server_name pizzapim.nl www.pizzapim.nl;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  location / {
    proxy_pass http://localhost:81;
  }

  ssl_certificate /etc/letsencrypt/live/pizzapim.nl-0001/cert.pem;
  ssl_certificate_key /etc/letsencrypt/live/pizzapim.nl-0001/privkey.pem;
}

server {
  listen 80;
  server_name pizzapim.nl www.pizzapim.nl;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  return 301 https://pizzapim.nl;
}

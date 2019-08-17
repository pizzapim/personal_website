server {
  listen 80;
  server_name www.geokunis2.nl geokunis2.nl;
  location / {
    proxy_pass http://192.168.30.2;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
  }
}

server {
	listen 80;
	server_name <%= node.rails_book_cookbook.server_name %>;
	access_log /var/log/nginx/<%= node.rails_book_cookbook.server_name %>.access_log;
  root /var/www/events/current/public;

  location / {
  	proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header HOost $http_host;
    proxy_redirect off;

    if(!-f $request_filename) {
    	proxy_pass http://127.0.0.1:3000;
    }
  }
}

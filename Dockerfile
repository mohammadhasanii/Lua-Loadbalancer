FROM openresty/openresty:alpine-fat

# Install Lua
RUN apk add --no-cache lua5.1

# Copy balancer script to container
COPY balancer.lua /usr/local/openresty/nginx/conf/

# Configure Nginx to use the balancer script
RUN echo "http {" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "  upstream backend {" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "    server 127.0.0.1:80;" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "    balancer_by_lua_file /usr/local/openresty/nginx/conf/main.lua;" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "  }" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "  server {" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "    listen 80;" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "    location / {" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "      proxy_pass http://backend;" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "    }" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "  }" >> /usr/local/openresty/nginx/conf/nginx.conf \
 && echo "}" >> /usr/local/openresty/nginx/conf/nginx.conf

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]

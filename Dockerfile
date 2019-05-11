FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

HEALTHCHECK CMD curl -sSk https://swadeshness-nginx:8080/dev/v1/groups || exit 1

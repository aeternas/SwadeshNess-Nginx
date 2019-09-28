FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN touch /home/health
COPY nginx.conf /etc/nginx/nginx.conf
COPY modules /etc/nginx/modules
HEALTHCHECK CMD curl --fail http://localhost:8091/health && stat /etc/nginx/nginx.conf || exit 1

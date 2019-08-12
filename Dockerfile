FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN touch /home/health
COPY nginx.conf /etc/nginx/nginx.conf
COPY modules /etc/nginx/modules
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost:8090/health && stat /etc/nginx/nginx.conf || exit 1

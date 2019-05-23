FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN touch /home/health
COPY nginx.conf /etc/nginx/nginx.conf
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:81/health && stat /etc/nginx/nginx.conf || exit 1

FROM nginx:latest
RUN apt-get update && apt-get install -y curl && apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*
RUN touch /home/health
COPY nginx.conf /etc/nginx/nginx.conf
COPY modules /etc/nginx/modules
HEALTHCHECK CMD curl --fail http://localhost:8090/health && stat /etc/nginx/nginx.conf || exit 1

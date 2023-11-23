FROM ubuntu:latest

WORKDIR /app

RUN mkdir -p /etc/website
COPY arsha /etc/website

RUN apt-get update -y && \
    apt-get install nginx -y && \
    rm -rf /etc/nginx/sites-available/default && \
    rm -rf /etc/nginx/sites-enabled/default 

COPY file1 /etc/nginx/sites-available/file1
RUN ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

 

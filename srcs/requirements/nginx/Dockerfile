FROM debian:buster

EXPOSE 443

RUN apt-get update

RUN apt-get install -y vim

RUN apt-get install -y nginx && apt-get install openssl

RUN rm -rf /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/certificate

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/certificate/nginx-certificate.crt -keyout /etc/nginx/certificate/nginx.key -subj "/C=FR/ST=Charente/L=Angouleme/O=42/CN=luserbu.42.fr";

CMD ["nginx","-g","daemon off;"]
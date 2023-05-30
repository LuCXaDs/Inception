FROM debian:buster

RUN apt-get update

# RUN apt-get install -y vim

RUN apt-get install -y nginx

RUN apt-get install openssl

RUN mkdir /etc/nginx/certificate

RUN rm -rf /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/certificate/cert.pem -keyout /etc/nginx/certificate/key.pem -subj "/C=FR/ST=Charente/L=Angouleme/O=42/CN=luserbu.42.fr";

EXPOSE 443

CMD ["/usr/sbin/nginx","-g","daemon off;"]
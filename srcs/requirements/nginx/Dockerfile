# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 443

RUN apt-get update

# Installation de NGINX
RUN apt-get install -y nginx

# Installation de OPENSSL : permet de gerer de sécurisé les communications sur Internet
RUN apt-get install openssl

RUN mkdir /etc/nginx/certificate

# Suppresion de l'ancien "nginx.conf"
RUN rm -rf /etc/nginx/nginx.conf

# Ajout du nouveau "nginx.conf"
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Génère un certificat auto-signé à l'aide d'OpenSSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/certificate/cert.pem -keyout /etc/nginx/certificate/key.pem -subj "/C=FR/ST=Charente/L=Angouleme/O=42/CN=luserbu.42.fr";


# Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
RUN rm -rf /var/lib/apt/lists/*

# Exécute la commande nginx en arrière plan
CMD ["/usr/sbin/nginx","-g","daemon off;"]

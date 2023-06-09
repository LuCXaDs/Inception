build:
	mkdir -p /home/luserbu/data/mariadb
	mkdir -p /home/luserbu/data/wordpress
	docker compose -f srcs/docker-compose.yml build 

stop:
	docker compose -f srcs/docker-compose.yml down

start:
	docker compose -f srcs/docker-compose.yml up -d --build

clean:
	docker system prune -af \
	&& docker volume rm db wp \
	&& docker network prune -f
	
database:
	sudo rm -rf /home/luserbu/data/mariadb/*
	sudo rm -rf /home/luserbu/data/wordpress/*

fclean: stop clean

re: stop clean build
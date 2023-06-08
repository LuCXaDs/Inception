build:
	docker compose -f srcs/docker-compose.yml build 

stop:
	docker compose -f srcs/docker-compose.yml down

start:
	docker compose -f srcs/docker-compose.yml up -d

clean:
	docker system prune -af && docker volume rm db wp && docker network prune -f && \
	sudo rm -rf /home/luserbu/data/mariadb/* && \
	sudo rm -rf /home/luserbu/data/wordpress/*

fclean: stop clean

re: stop clean start
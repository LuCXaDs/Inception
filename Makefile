build:
	mkdir -p /home/luserbu/data/wordpress /home/luserbu/data/mariadb
	docker compose -f srcs/docker-compose.yml build

start:
	docker compose -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml down

restart: stop volume start

volume: 
	docker volume prune -af
	docker volume rm wp
	docker volume rm db_data

clean: stop volume
	docker system prune -af
	rm -rf home/luserbu/data/mariadb/*
	rm -rf home/luserbu/data/wordpress/*

re: stop clean start
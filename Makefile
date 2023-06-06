build:
	mkdir -p /home/luserbu/data/wordpress /home/luserbu/data/mariadb
	docker compose -f srcs/docker-compose.yml build

start:
	docker compose -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml down -v

restart: stop start

clean: stop
	docker system prune -af
	rm -rf home/luserbu/data/mariadb/*
	rm -rf home/luserbu/data/wordpress/*
	docker volume prune -af
	# docker volume rm srcs_wp
	# docker volume rm srcs_db_data

re: stop clean start
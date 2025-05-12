NAME = inception
COMPOSE = docker compose -f srcs/docker-compose.yml

all: run
setup-volumes:
	sudo mkdir -p /home/flmuller/data/mariadb /home/flmuller/data/wordpress
	sudo chown -R 101:101 /home/flmuller/data/wordpress
	sudo chmod -R 755 /home/flmuller/data/wordpress
	sudo find /home/flmuller/data/wordpress -type f -exec chmod 644 {} \;
	sudo chmod 700 /home/flmuller/data/mariadb

run: setup-volumes
	$(COMPOSE) up -d --build

clean:
	$(COMPOSE) down -v --rmi all
	sudo rm -rf /home/flmuller/data/mariadb /home/flmuller/data/wordpress

re: clean run

update:
	@$(COMPOSE) up -d --build --force-recreate --remove-orphans
start:
	@$(COMPOSE) start
status:
	@$(COMPOSE) ps
stop:
	@$(COMPOSE) stop
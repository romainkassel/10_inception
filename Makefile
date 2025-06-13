include srcs/.env

all:
	mkdir -p /home/${LOGIN}/data/mariadb
	mkdir -p /home/${LOGIN}/data/wordpress
	mkdir -p /home/${LOGIN}/data/adminer
	mkdir -p /home/${LOGIN}/data/grafana
	cd srcs/ && docker compose up --build -d

stop:
	cd srcs/ && docker compose stop

clean:	stop
	docker system prune -af --volumes
	docker volume rm $$(docker volume ls -qf dangling=true)

fclean: clean
	sudo rm -rf /home/${LOGIN}/data/mariadb
	sudo rm -rf /home/${LOGIN}/data/wordpress
	sudo rm -rf /home/${LOGIN}/data/adminer
	sudo rm -rf /home/${LOGIN}/data/grafana
	ls /home/${LOGIN}/data

re: fclean all
	
.PHONY: all stop clean fclean re

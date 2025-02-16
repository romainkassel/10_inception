include srcs/.env

all:
	mkdir -p /home/${LOGIN}/data/mariadb
	mkdir -p /home/${LOGIN}/data/wordpress
	cd srcs/ && docker-compose up --build -d

clean:
	cd srcs/ && docker-compose stop
	docker system prune -af
	docker volume rm srcs_mariadb -f
	docker volume rm srcs_wordpress -f
	docker ps
	docker image ls
	docker volume ls

fclean: clean
	sudo rm -rf /home/${LOGIN}/data/mariadb  
	sudo rm -rf /home/${LOGIN}/data/wordpress
	ls /home/${LOGIN}/data

re: fclean all

bonus:
	mkdir -p /home/${LOGIN}/data/mariadb
	mkdir -p /home/${LOGIN}/data/wordpress
	mkdir -p /home/${LOGIN}/data/nginx_sites_available_website
	mkdir -p /home/${LOGIN}/data/nginx_sites_available_adminer
	mkdir -p /home/${LOGIN}/data/nginx_sites_available_grafana
	mkdir -p /home/${LOGIN}/data/website
	cd srcs/ && docker-compose --file docker-compose-bonus.yml up --build -d

bclean:
	cd srcs/ && docker-compose --file docker-compose-bonus.yml stop
	docker system prune -af
	docker volume rm srcs_mariadb -f
	docker volume rm srcs_wordpress -f
	docker volume rm srcs_nginx_sites_available_website -f
	docker volume rm srcs_nginx_sites_available_adminer -f
	docker volume rm srcs_nginx_sites_available_grafana -f
	docker volume rm srcs_website -f
	docker ps
	docker image ls
	docker volume ls

bfclean: bclean
	sudo rm -rf /home/${LOGIN}/data/mariadb  
	sudo rm -rf /home/${LOGIN}/data/wordpress
	sudo rm -rf /home/${LOGIN}/data/nginx_sites_available_website
	sudo rm -rf /home/${LOGIN}/data/nginx_sites_available_adminer
	sudo rm -rf /home/${LOGIN}/data/nginx_sites_available_grafana
	sudo rm -rf /home/${LOGIN}/data/website
	ls /home/${LOGIN}/data
	
.PHONY: all clean fclean re bonus bclean bfclean
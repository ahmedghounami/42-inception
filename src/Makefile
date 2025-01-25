all : 
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/adminer
	mkdir -p /home/${USER}/data/portainer
	@docker compose up --build

d : 
	@docker compose up --build -d
clean :
	docker rm -f $(shell docker ps -qa)
	docker rmi -f $(shell docker images -q)
	docker volume rm  $(shell docker volume ls -q)
	rm -rf /home/${USER}/datals
	

re : clean all
red : clean d
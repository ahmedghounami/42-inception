all : 
	mkdir -p /home/aghounam/data/mariadb
	mkdir -p /home/aghounam/data/wordpress
	mkdir -p /home/aghounam/data/adminer
	mkdir -p /home/aghounam/data/portainer
	@cd src && docker compose up --build

d : 
	@cd src && docker compose up --build -d
clean :
	cd src && docker compose down
	docker rm -f $(shell docker ps -a -q)
	docker rmi -f $(shell docker images -q)
	docker volume rm  $(shell docker volume ls -q)
	rm -rf /home/aghounam/data
	

re : clean all
red : clean d
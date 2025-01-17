all : 
	@cd src && docker compose up --build
d : 
	@cd src && docker compose up --build -d
clean :
	@cd src && docker compose down
	@docker system prune -f
	@docker rmi -f $(shell docker images -q)
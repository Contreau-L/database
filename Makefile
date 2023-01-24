up :
	docker compose up -d
down :
	docker compose down
setup-docker :
	./docker-installation
reset-db:
	sudo docker compose stop postgres
	sudo docker compose rm -v postgres
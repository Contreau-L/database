up :
	docker compose up -d
down :
	docker compose down
setup-docker :
	./docker-installation
reset-db:
	sudo docker compose stop postgres
	sudo docker compose rm -v postgres
	sudo docker volume rm database_postgres-db
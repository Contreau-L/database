# Contreau'L - Database

Database setup contreaul.


This repository contain the script to setup docker on a server
and the docker compose to deploy postgresql database and database client for Contreau'L.

In the repository db, you can find the database init script which is executed on db container mount ,
it allows to create all tables that will need the contreaul-api to work.

## Commands
1. Install and setup docker:
```bash
make setup-docker
```

2. Start database container
```bash
make up
```

3. Stop containers
```bash
make down
```

4. Reset database
```bash
make reset-db
```


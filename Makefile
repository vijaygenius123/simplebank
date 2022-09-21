postgres:
	docker run --name=simplebank-pg -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it simplebank-pg createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it simplebank-pg dropdb simple_bank

migrateup:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb

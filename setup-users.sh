#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER mary WITH PASSWORD 'mary';
	alter default privileges in schema public grant all on tables to mary;
    alter default privileges in schema public grant all on sequences to mary;
  	GRANT ALL PRIVILEGES ON DATABASE postgres TO mary;
    GRANT ALL PRIVILEGES ON SCHEMA public to mary;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER bob WITH PASSWORD 'bob';
	alter default privileges in schema public grant all on tables to bob;
    alter default privileges in schema public grant all on sequences to bob;
	GRANT ALL PRIVILEGES ON DATABASE postgres TO bob;
	GRANT ALL PRIVILEGES ON SCHEMA public to mary;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    ALTER USER postgres WITH SUPERUSER
EOSQL

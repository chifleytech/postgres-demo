#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER bob WITH PASSWORD 'password';
    ALTER USER bob WITH SUPERUSER;

    CREATE USER mary WITH PASSWORD 'password';
    ALTER USER mary WITH SUPERUSER;

    CREATE USER rjenkins WITH PASSWORD 'password';
    ALTER USER rjenkins WITH SUPERUSER;

    CREATE USER mkim WITH PASSWORD 'password';
    ALTER USER mkim WITH SUPERUSER;

    CREATE USER jsmith WITH PASSWORD 'password';
    ALTER USER jsmith WITH SUPERUSER;

    CREATE USER sfox WITH PASSWORD 'password';
    ALTER USER sfox WITH SUPERUSER;
EOSQL

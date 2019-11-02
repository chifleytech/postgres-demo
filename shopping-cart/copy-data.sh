#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.amazon FROM '/data-init/shopping/Amazon.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.google FROM '/data-init/shopping/Google.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.expected FROM '/data-init/shopping/Amazon_Google_perfectMapping.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.amazon_prod FROM '/data-init/shopping/Amazon.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.google_prod FROM '/data-init/shopping/Google.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.expected_prod FROM '/data-init/shopping/Amazon_Google_perfectMapping.csv' WITH(FORMAT csv,HEADER false, ENCODING 'UTF-8')"
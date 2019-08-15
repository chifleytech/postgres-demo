#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.ncvr_2014 FROM '/data/ncvr/VR_Snapshot_20141104.txt' WITH( FORMAT text,DELIMITER E'\t',ENCODING 'UTF-8')"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  -c "\copy public.ncvr_2017 FROM '/data/ncvr/VR_Snapshot_20171107.txt' WITH( FORMAT text,DELIMITER E'\t',ENCODING 'UTF-8')"
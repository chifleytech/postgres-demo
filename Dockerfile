FROM chifleytech/postgres:latest

COPY setup-users.sh /docker-entrypoint-initdb.d/01-setup-users.sh

#SHOPPING data
COPY shopping-cart/create-tables.sql /docker-entrypoint-initdb.d/02-shopping-create-tables.sql
COPY shopping-cart/copy-data.sh /docker-entrypoint-initdb.d/03-shopping-copy-data.sh
COPY data/shopping/ /data-init/shopping/

#NCVR data
COPY ncvr/create-tables.sql /root/ncvr/04-ncvr-create-tables.sql
COPY ncvr/copy-data.sh /root/ncvr/05-ncvr-copy-data.sh

FROM chifleytech/postgres:latest

RUN apt-get update \
 && apt-get install -y curl unzip

COPY setup-users.sh /docker-entrypoint-initdb.d/01-setup-users.sh

#SHOPPING data
COPY shopping-cart/create-tables.sql /docker-entrypoint-initdb.d/02-shopping-create-tables.sql
COPY shopping-cart/copy-data.sh /docker-entrypoint-initdb.d/03-shopping-copy-data.sh
COPY data/shopping/ /data-init/shopping/

#NCVR data
# https://chifleytech-public-data-seoul.s3.ap-northeast-2.amazonaws.com/ncvr.zip
# https://chifleytech-public.s3-us-west-1.amazonaws.com/ncvr.zip
WORKDIR /data-init
RUN curl --retry 3 "https://chifleytech-public.s3-us-west-1.amazonaws.com/ncvr.zip" --output ncvr.zip
RUN unzip ncvr.zip
COPY ncvr/create-tables.sql /docker-entrypoint-initdb.d/04-ncvr-create-tables.sql
COPY ncvr/copy-data.sh /docker-entrypoint-initdb.d/05-ncvr-copy-data.sh

CREATE TABLE amazon(
   id           VARCHAR(100) NOT NULL PRIMARY KEY
  ,title        VARCHAR(1044)
  ,description  VARCHAR(19263)
  ,manufacturer VARCHAR(45)
  ,price        VARCHAR(45)
);

CREATE TABLE google(
   id           VARCHAR(100) NOT NULL PRIMARY KEY
  ,title        VARCHAR(1044)
  ,description  VARCHAR(19263)
  ,manufacturer VARCHAR(45)
  ,price        VARCHAR(45)
);

CREATE TABLE expected(
   amazon     VARCHAR(100)
  ,google VARCHAR(100)
);
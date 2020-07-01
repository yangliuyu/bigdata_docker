CREATE TABLE PROD_REGION (
  R_REGIONKEY     INTEGER        NOT NULL,
  R_NAME          CHAR(25)       NOT NULL,
  R_COMMENT       VARCHAR(152)   NOT NULL
);

CREATE TABLE PROD_NATION (
  N_NATIONKEY     INTEGER        NOT NULL,
  N_NAME          CHAR(25)       NOT NULL,
  N_REGIONKEY     INTEGER        NOT NULL,
  N_COMMENT       VARCHAR(152)   NOT NULL
);

CREATE TABLE PROD_CUSTOMER (
  C_CUSTKEY       INTEGER        NOT NULL,
  C_NAME          VARCHAR(25)    NOT NULL,
  C_ADDRESS       VARCHAR(40)    NOT NULL,
  C_NATIONKEY     INTEGER        NOT NULL,
  C_PHONE         CHAR(15)       NOT NULL,
  C_ACCTBAL       DOUBLE         NOT NULL,
  C_MKTSEGMENT    CHAR(10)       NOT NULL,
  C_COMMENT       VARCHAR(117)   NOT NULL
);

CREATE TABLE PROD_RATES (
  RS_TIMESTAMP    TIMESTAMP(3)   NOT NULL,
  RS_SYMBOL       CHAR(3)        NOT NULL,
  RS_RATE         DOUBLE         NOT NULL
);

CREATE TABLE REGION_STATS (
  region VARCHAR(20) NOT NULL,
  hour_of_day BIGINT NOT NULL,
  number_of_customers BIGINT NOT NULL,
  number_of_orders BIGINT NOT NULL,
  PRIMARY KEY (region, hour_of_day)
);

INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'EUR', 1.0000);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'CHF', 1.0588);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'HKD', 8.3201);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'JPY', 114.9208);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'GBP', 0.9213);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'USD', 1.1060);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'CAD', 1.5628);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'NOK', 10.9257);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'RUB', 81.2930);
INSERT INTO PROD_RATES VALUES (TIMESTAMP '2020-04-01 00:00:00.000', 'CNY', 8.0166);

LOAD DATA INFILE "/var/lib/mysql-files/region.tbl" INTO TABLE PROD_REGION COLUMNS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA INFILE "/var/lib/mysql-files/nation.tbl" INTO TABLE PROD_NATION COLUMNS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA INFILE "/var/lib/mysql-files/customer.tbl" INTO TABLE PROD_CUSTOMER COLUMNS TERMINATED BY '|' LINES TERMINATED BY '\n';

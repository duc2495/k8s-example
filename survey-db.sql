DROP TABLE IF EXISTS "customer";

CREATE TABLE "customer" (
  customer_id SERIAL PRIMARY KEY,
  name varchar(50) default NULL NOT NULL,
  birthday date NOT NULL,
  address varchar(100) default NULL NOT NULL,
  gender varchar(10) default NULL NOT NULL,
  school varchar(100) NOT NULL,
  school_year integer NOT NULL,
  languages varchar(100) default NULL
);

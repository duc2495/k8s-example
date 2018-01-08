DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
  customer_id SERIAL,
  name character varying(100) NOT NULL,
  birthday date NOT NULL,
  address character varying(100) NOT NULL,
  gender character varying(10) NOT NULL,
  school character varying(100) NOT NULL,
  school_year integer NOT NULL,
  CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS language;
CREATE TABLE language
(
  language_id SERIAL,
  language character varying(20) NOT NULL,
  CONSTRAINT languages_pkey PRIMARY KEY (language_id)
);


DROP TABLE IF EXISTS customer_language;
CREATE TABLE customer_language
(
  customer_id integer,
  language_id integer,
  CONSTRAINT customer_language_customer_id_fkey FOREIGN KEY (customer_id)
      REFERENCES public.customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT customer_language_language_id_fkey FOREIGN KEY (language_id)
      REFERENCES public.language (language_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

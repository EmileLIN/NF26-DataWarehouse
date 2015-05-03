--Step 1 disable constraints 

ALTER TABLE f_bdt_vente DISABLE CONSTRAINT fk_clerk;
ALTER TABLE f_bdt_vente DISABLE CONSTRAINT fk_customer;
ALTER TABLE f_bdt_vente DISABLE CONSTRAINT fk_factory;
ALTER TABLE f_bdt_vente DISABLE CONSTRAINT fk_product;
ALTER TABLE f_bdt_vente DISABLE CONSTRAINT fk_trade_date;


ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT check_dateofopening;
ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT check_gender;
ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT check_hiredate;
ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT check_yearofopening;
ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT pk_clerk_id;

ALTER TABLE f_bdt_customer DISABLE CONSTRAINT check_age;
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT check_customergender;
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT check_dateofbirth;
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT check_income;
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT check_level;
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT pk_customer_num;


ALTER TABLE f_bdt_date DISABLE CONSTRAINT check_date;
ALTER TABLE f_bdt_date DISABLE CONSTRAINT pk_trade_date;

ALTER TABLE f_bdt_factory DISABLE CONSTRAINT check_ageoffactory;
ALTER TABLE f_bdt_factory DISABLE CONSTRAINT check_capacity;
ALTER TABLE f_bdt_factory DISABLE CONSTRAINT check_yearofcreation;
ALTER TABLE f_bdt_factory DISABLE CONSTRAINT pk_factory_num;

ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_ageofdesign;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_color;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_dateofdesign;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_price;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_productsize;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT check_weight;
ALTER TABLE f_bdt_product DISABLE CONSTRAINT pk_product_id;

--Step 2 insertion datas
TRUNCATE TABLE f_bdt_clerk;
TRUNCATE TABLE f_bdt_customer;
TRUNCATE TABLE f_bdt_date;
TRUNCATE TABLE f_bdt_factory;
TRUNCATE TABLE f_bdt_product;
TRUNCATE TABLE f_bdt_vente;


INSERT INTO f_bdt_factory SELECT * FROM f_bde_factory;
COMMIT;


INSERT INTO f_bdt_product SELECT * FROM f_bde_product;
COMMIT;


INSERT INTO f_bdt_date SELECT DISTINCT TRADE_DATE FROM f_bde_vente;
COMMIT;


INSERT INTO f_bdt_clerk
SELECT c.CLERK_ID, c.NAME,c.HIREDATE,c.GENDER,c.STORE,s.DATEOFOPENING,s.YEAROFOPENING
FROM f_bde_clerk c, f_bde_store s
WHERE c.store = s.store_id;
COMMIT;


INSERT INTO f_bdt_customer
SELECT c.CUSTOMER_NUM,c.FIRSTNAME,c.DATEOFBIRTH,c.AGE,c.INCOME,c.GENDER,c.COSTOMER_LEVEL,c.SPECIESCODE,s.SPECIES
FROM f_bde_customer c, f_bde_species s
WHERE c.SPECIESCODE = s.SPECIESCODE;
COMMIT;


INSERT INTO f_bdt_vente 
SELECT * FROM f_bde_vente;
COMMIT;

--STEP 3 ADD EXCEPTION

CREATE TABLE Exception_records(
  row_id          rowid,
  owner           varchar2(30),
  table_name      varchar2(30),
  constraint_name varchar2(30)
);

--STEP 4 Enable the Constraints

ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT check_dateofopening EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT check_gender EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT check_hiredate EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT check_yearofopening EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT pk_clerk_id EXCEPTIONS INTO EXCEPTION_RECORDS;

ALTER TABLE f_bdt_customer ENABLE CONSTRAINT check_age EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT check_customergender EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT check_dateofbirth EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT check_income EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT check_level EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT pk_customer_num EXCEPTIONS INTO EXCEPTION_RECORDS;


--ALTER TABLE f_bdt_date ENABLE CONSTRAINT check_date EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_date ENABLE CONSTRAINT pk_trade_date EXCEPTIONS INTO EXCEPTION_RECORDS;

ALTER TABLE f_bdt_factory ENABLE CONSTRAINT check_ageoffactory EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_factory ENABLE CONSTRAINT check_capacity EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_factory ENABLE CONSTRAINT check_yearofcreation EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_factory ENABLE CONSTRAINT pk_factory_num EXCEPTIONS INTO EXCEPTION_RECORDS;

ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_ageofdesign EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_color EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_dateofdesign EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_price EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_productsize EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT check_weight EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_product ENABLE CONSTRAINT pk_product_id EXCEPTIONS INTO EXCEPTION_RECORDS;

--ALTER TABLE f_bdt_vente ENABLE CONSTRAINT fk_clerk EXCEPTIONS INTO EXCEPTION_RECORDS;
--ALTER TABLE f_bdt_vente ENABLE CONSTRAINT fk_customer EXCEPTIONS INTO EXCEPTION_RECORDS;
--ALTER TABLE f_bdt_vente ENABLE CONSTRAINT fk_factory EXCEPTIONS INTO EXCEPTION_RECORDS;
--ALTER TABLE f_bdt_vente ENABLE CONSTRAINT fk_product EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_bdt_vente ENABLE CONSTRAINT fk_trade_date EXCEPTIONS INTO EXCEPTION_RECORDS;


--STEP 5 Analyse

--DATA NOT GOOD
--check_date in  f_bdt_date
--fk_clerk in f_bdt_vente
--fk_customer in f_bdt_vente
--fk_factory in f_bdt_vente
--fk_product in f_bdt_vente;

























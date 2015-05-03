--STEP 1 Disable all the constraints

ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_dw_clerk;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_dw_customer;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_dw_factory;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_dw_tradedate;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_dw_product;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT pk_f_dw_vente;

ALTER TABLE f_dw_clerk DISABLE CONSTRAINT pk_f_dw_clerk;
ALTER TABLE f_dw_customer DISABLE CONSTRAINT pk_f_dw_customer;
ALTER TABLE f_dw_date DISABLE CONSTRAINT pk_f_dw_date;
ALTER TABLE f_dw_factory DISABLE CONSTRAINT pk_f_dw_factory;
ALTER TABLE f_dw_product DISABLE CONSTRAINT pk_f_dw_product;


--STEP 2 Delete Indexes
DROP INDEX f_dw_clerk_index;
DROP INDEX f_dw_customer_index;
DROP INDEX f_dw_date_index;
DROP INDEX f_dw_factory_index;
DROP INDEX f_dw_product_index;
DROP INDEX f_dw_vente_index;


--STEP 3 Insert datas
TRUNCATE TABLE f_dw_vente;
TRUNCATE TABLE f_dw_clerk;
TRUNCATE TABLE f_dw_customer;
TRUNCATE TABLE f_dw_product;
TRUNCATE TABLE f_dw_factory;
TRUNCATE TABLE f_dw_date;



INSERT INTO f_dw_clerk SELECT t.getClerk_Id(),t.getName(),t.getHireDate(),t.getGender(),t.getStore(),t.getDateOfOpening(),t.getYearOfOpening()
FROM f_bdt_clerk t;
COMMIT;

INSERT INTO f_dw_customer SELECT t.getCustomer_Num(),t.getFirstname(),t.getDateOfBirth(),t.getAge(),t.getIncome(),t.getGender(),t.getCustomer_level(),t.getSpeciesCode(),t.getSpecies()
FROM f_bdt_customer t;
COMMIT;

INSERT INTO f_dw_date SELECT t.getTradedate(),t.getJDS(),t.getMois(),t.getTrimestre(),t.getSemaine(),t.getAnnee()
FROM f_bdt_date t
WHERE t.getTradedate() IS NOT NULL;
COMMIT;

INSERT INTO f_dw_factory SELECT t.getFactory_num(),t.getYearOfCreation(),t.getAgeOfFactory(),t.getCapacity()
FROM f_bdt_factory t;
COMMIT;

INSERT INTO f_dw_product SELECT t.getProduct_Id(),t.getColor(),t.getPrice(),t.getProduct_size(),t.getWeight(),t.getDateOfDesign(),t.getAgeOfDesign(),t.getProducts_type(),t.getDesigner()
FROM f_bdt_product t;
COMMIT;

INSERT INTO f_dw_vente SELECT t.getPK(),t.getClerk_Id(),t.getProduct(),t.getCustomer_Num(),t.getFactory(),t.getTrade_Date()
FROM f_bdt_vente t;
COMMIT;

--STEP 4 Treat incorrect datas
UPDATE f_dw_vente
SET Clerk_Id = NULL
WHERE Clerk_Id NOT IN 
(SELECT Clerk_Id FROM f_dw_clerk);
COMMIT;

UPDATE f_dw_vente
SET Product = NULL
WHERE Product NOT IN 
(SELECT Product_Id FROM f_dw_product);
COMMIT;

UPDATE f_dw_vente
SET Customer_Num = NULL
WHERE Customer_Num NOT IN 
(SELECT Customer_Num FROM f_dw_customer);
COMMIT;

UPDATE f_dw_vente
SET Factory = NULL
WHERE Factory NOT IN 
(SELECT Factory_Num FROM f_dw_factory);
COMMIT;

DELETE FROM f_dw_vente
WHERE Clerk_Id IS NULL AND Product IS NULL AND Customer_Num IS NULL AND Factory IS NULL AND Trade_Date IS NULL;
COMMIT;


--STEP 5 Enable constraints
CREATE INDEX f_dw_clerk_index ON f_dw_clerk(Clerk_Id);
CREATE INDEX f_dw_product_index ON f_dw_product(Product_Id);
CREATE INDEX f_dw_customer_index ON f_dw_customer(Customer_Num);
CREATE INDEX f_dw_factory_index ON f_dw_factory(Factory_Num);
CREATE INDEX f_dw_date_index ON f_dw_date(Trade_Date);

CREATE INDEX f_dw_vente_index ON f_dw_vente(Trade_Id);

TRUNCATE TABLE EXCEPTION_RECORDS;

ALTER TABLE f_dw_clerk ENABLE CONSTRAINT pk_f_dw_clerk EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_customer ENABLE CONSTRAINT pk_f_dw_customer EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_product ENABLE CONSTRAINT pk_f_dw_product EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_factory ENABLE CONSTRAINT pk_f_dw_factory EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_date ENABLE CONSTRAINT pk_f_dw_date EXCEPTIONS INTO EXCEPTION_RECORDS;

ALTER TABLE f_dw_vente ENABLE CONSTRAINT pk_f_dw_vente EXCEPTIONS INTO EXCEPTION_RECORDS;

ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_dw_clerk EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_dw_customer EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_dw_product EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_dw_factory EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_dw_tradedate EXCEPTIONS INTO EXCEPTION_RECORDS;

--STEP 6 Examine the results
SELECT COUNT(*) FROM EXCEPTION_RECORDS;

SELECT COUNT(*) FROM f_dw_clerk;

SELECT COUNT(*) FROM f_dw_customer;

SELECT COUNT(*) FROM f_dw_factory;

SELECT COUNT(*) FROM f_dw_product;

SELECT COUNT(*) FROM f_dw_date;

SELECT COUNT(*) FROM f_dw_vente;

















--This script is for the process of BDE to BDT

--First Step: deactive the constraints and index

--F_BDT_VENTE，this one should be at first place because of its foreign keys
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_TicketDate;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_Product;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_Shop;


--F_BDT_CATALOGUE
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_AUTEUR;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_LANGUE;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_PARUTION;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT pk_ISBN; 


--F_BDT_DATE
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT CHECK_DATE;
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT pk_Trade_Date;

--F_BDT_MAGASIN
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_POPULATION;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONBS;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONNAGE;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONRECENT;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT pk_MAGASIN_ID ;     -- Contraint for the primary key Magasin_Id






--Step2: Copy the data from Zone E to Zone T

--Insertion for catalogue
INSERT INTO F_BDT_CATALOGUE SELECT * FROM F_BDE_CATALOGUE_VIEW;

--Insertion for magasin
--Create a view f_bdt_dpt to read data from Departement

CREATE OR REPLACE VIEW f_bdt_dpt (Dpt_id,Dpt_name,Dpt_population)
AS
  SELECT DEPART_ID, DEPARTEMENT_NAME,POPULATION
  FROM F_BDE_DEPARTEMENT;

  
--Create a view f_bdt_marketing to read data from Marketing
CREATE OR REPLACE VIEW f_bdt_marketing (Depart_Id, Magasin_Id,Rayonnage,Bestseller,Rayon_Recent)
AS
  SELECT DEPART_ID,MAGASIN,RAYONNAGE,BESTSELLER,RAYON_RECENT
  FROM F_BDE_MARKETING;


CREATE OR REPLACE VIEW JOC_Market_dpt(DEPART_ID,MAGASIN_ID,RAYONNAGE,BESTSELLER,RAYON_RENCENT,DPT_NAME,DPT_POPULATION)
AS
  SELECT m.DEPART_ID,m.MAGASIN_ID,m.RAYONNAGE,m.BESTSELLER,m.RAYON_RECENT,d.DPT_NAME,d.DPT_POPULATION 
  FROM F_BDT_MARKETING m JOIN F_BDT_DPT d ON m.DEPART_ID = d.DPT_ID;


INSERT INTO F_BDT_MAGASIN SELECT * FROM JOC_MARKET_DPT;

--Insertion for date
INSERT INTO F_BDT_DATE SELECT DISTINCT TICKET_DATE FROM F_BDE_VENTE;

INSERT INTO F_BDT_VENTE SELECT * FROM F_BDE_VENTE;



--Step 3 Add a exception table for all the abnormal data before reactive the constraints

--Create Exception table to save the abnormal record
CREATE TABLE Exception_records(
  row_id          rowid,
  owner           varchar2(30),
  table_name      varchar2(30),
  constraint_name varchar2(30)

);


--Step4: Reactive the constraints

--F_BDT_CATALOGUE
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT CHECK_AUTEUR EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT CHECK_LANGUE EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT CHECK_PARUTION EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT PK_ISBN EXCEPTIONS INTO EXCEPTION_RECORDS;

--F_BDT_DATE
ALTER TABLE F_BDT_DATE ENABLE CONSTRAINT CHECK_DATE EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_DATE ENABLE CONSTRAINT pk_Trade_Date EXCEPTIONS INTO EXCEPTION_RECORDS;

--F_BDT_MAGASIN
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_POPULATION EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONBS EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONNAGE EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONRECENT EXCEPTIONS INTO EXCEPTION_RECORDS;
-- Contraint for the primary key Magasin_Id
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT pk_MAGASIN_ID EXCEPTIONS INTO EXCEPTION_RECORDS;     

--F_BDT_VENTE，this one should be at last place because of its foreign keys
ALTER TABLE F_BDT_VENTE ENABLE CONSTRAINT fk_TicketDate EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_VENTE ENABLE CONSTRAINT fk_Product EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_VENTE ENABLE CONSTRAINT fk_Shop EXCEPTIONS INTO EXCEPTION_RECORDS;



--Step 5  Constraint Analysis 

--After the reactivation of constraints, we found that the constraints violated are:
--CHECK_AUTEUR
--CHECK_PARUTION
--CHECK_DATE
--CHECK_POPULATION
--fk_Product  The foreign key Product In table F_BDT_VENTE
--fk_Shop The foreign key Shop In table F_BDT_VENTE


--Step 6 In order to let pass all data from BDR to BDT, we disable the contraints which generate exceptions,so we do the same thing 
--again(disable and enable the constraints)

--Firstly, disable all the constraints
--F_BDT_VENTE，this one should be at first place because of its foreign keys
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_TicketDate;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_Product;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT fk_Shop;



--F_BDT_CATALOGUE
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_AUTEUR;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_LANGUE;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_PARUTION;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT pk_ISBN; 


--F_BDT_DATE
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT CHECK_DATE;
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT pk_Trade_Date;

--F_BDT_MAGASIN
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_POPULATION;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONBS;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONNAGE;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONRECENT;
-- Contraint for the primary key Magasin_Id
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT pk_MAGASIN_ID ;     


--Then, delete all the record in Exception_Records
TRUNCATE TABLE EXCEPTION_RECORDS;

--Enable the constraints which will not cause exception

--F_BDT_CATALOGUE
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT CHECK_LANGUE EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_CATALOGUE ENABLE CONSTRAINT pk_ISBN EXCEPTIONS INTO EXCEPTION_RECORDS;

--F_BDT_DATE
ALTER TABLE F_BDT_DATE ENABLE CONSTRAINT pk_Trade_Date EXCEPTIONS INTO EXCEPTION_RECORDS;

--F_BDT_MAGASIN
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONBS EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONNAGE EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT CHECK_RAYONRECENT EXCEPTIONS INTO EXCEPTION_RECORDS;
-- Contraint for the primary key Magasin_Id
ALTER TABLE F_BDT_MAGASIN ENABLE CONSTRAINT pk_MAGASIN_ID EXCEPTIONS INTO EXCEPTION_RECORDS;     

--F_BDT_VENTE，this one should be at last place because of its foreign keys
ALTER TABLE F_BDT_VENTE ENABLE CONSTRAINT fk_TicketDate EXCEPTIONS INTO EXCEPTION_RECORDS;






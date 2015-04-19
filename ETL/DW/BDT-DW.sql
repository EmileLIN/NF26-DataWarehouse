--Step 1 Deactvie all the constraints

ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_f_dw_vente_date;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_f_dw_vente_product;
ALTER TABLE f_dw_vente DISABLE CONSTRAINT fk_f_dw_vente_shop;
ALTER TABLE f_dw_date  DISABLE  CONSTRAINT pk_f_dw_date;
ALTER TABLE f_dw_catalogue  DISABLE  CONSTRAINT pk_f_dw_catalogue;
ALTER TABLE f_dw_magasin  DISABLE  CONSTRAINT pk_f_dw_magasin;

--Step 2 Delete Index

DROP INDEX f_dw_catalogue_index;
DROP INDEX f_dw_date_index;
DROP INDEX f_dw_magasin_index;

--Step 3 Loading data from BDT 

--Delete all data in dw tables if there are already some data
TRUNCATE TABLE f_dw_vente;
TRUNCATE TABLE f_dw_catalogue;
TRUNCATE TABLE f_dw_date;
TRUNCATE TABLE f_dw_magasin;


--Dimension catalogue
INSERT INTO f_dw_catalogue(ISBN,TITRE,AUTEUR,LANGUE,PUBLICATION,EDITEUR)
SELECT t.getISBN(),t.getTitre(),t.getAuteur(),t.getLangue(),t.getPublication(),t.getEditeur()
FROM f_bdt_catalogue t;

COMMIT;

--Dimension magasin

INSERT INTO f_dw_magasin(MAGASIN_ID,RAYONNAGE,BESTSELLER,RAYON_RECENT,DPT_NAME,DPT_POPULATION)
SELECT t.getMagasinId(),t.getRayonage(),t.getBS(),t.getRecent(),t.getDepartement(),t.getPopulation()
FROM f_bdt_magasin t;

COMMIT;

--Dimension date
INSERT INTO f_dw_date(Trade_Date,JDS,Semaine,Mois,Trimestre)
SELECT t.getTradedate(),t.getJDS(),t.getSemaine(),t.getMois(),t.getTrimestre()
FROM f_bdt_date t
WHERE t.getTradedate() is not NULL;

COMMIT;

--Table de fait f_dw_vente
INSERT INTO f_dw_vente(Ticket_Date,Product,Shop)
SELECT t.getTicketDate(),t.getProduct(),t.getShop()
FROM f_bdt_vente t;

COMMIT;

--Step 4 treat the problem of no corresponding foreign keys 

--who don not have corresponding value to null
UPDATE f_dw_vente
SET PRODUCT = NULL
WHERE PRODUCT NOT IN
(SELECT ISBN FROM f_dw_catalogue);

COMMIT;

--Same thing for shop
UPDATE f_dw_vente
SET SHOP = NULL
WHERE SHOP NOT IN
(SELECT magasin_id FROM f_dw_magasin);

COMMIT;

--For a record in fact table, if all the three are null, so we delete it
DELETE FROM f_dw_vente
WHERE TICKET_DATE IS NULL AND PRODUCT IS NULL AND SHOP IS NULL;
COMMIT;


--Step 5 reactive the constraints

CREATE INDEX f_dw_catalogue_index ON f_dw_catalogue(ISBN);
CREATE INDEX f_dw_date_index ON f_dw_date(trade_date);
CREATE INDEX f_dw_magasin_index ON f_dw_magasin(magasin_id);



ALTER TABLE f_dw_date  ENABLE  CONSTRAINT pk_f_dw_date EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_catalogue  ENABLE  CONSTRAINT pk_f_dw_catalogue EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_magasin  ENABLE  CONSTRAINT pk_f_dw_magasin EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_f_dw_vente_date EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_f_dw_vente_product EXCEPTIONS INTO EXCEPTION_RECORDS;
ALTER TABLE f_dw_vente ENABLE CONSTRAINT fk_f_dw_vente_shop EXCEPTIONS INTO EXCEPTION_RECORDS;



--Step 6 Check the exception table 

PROMPT ---Check the excpeiton table to see if there are still some bad data;
SELECT COUNT(*) FROM EXCEPTION_RECORDS; 


--Step 6 verification of the final data read in data warehouse

--Table de fait vente
PROMPT -- CHECK NUMBER OF RECORDS In Fact table;
SELECT COUNT(*) FROM f_dw_vente;
--SELECT * FROM f_dw_vente WHERE ROWNUM <= 100;


--Dimension date
PROMPT -- CHECK NUMBER OF RECORDS In Dimension Date;
SELECT COUNT(*) FROM f_dw_date;
--SELECT * FROM f_dw_date;

--Dimension magasin
PROMPT -- CHECK NUMBER OF RECORDS In Dimension Magasin;
SELECT COUNT(*) FROM f_dw_magasin;
--SELECT * FROM f_dw_magasin;


--Dimension catalogue
PROMPT -- CHECK NUMBER OF RECORDS In Dimension Product;
SELECT COUNT(*) FROM f_dw_catalogue;






















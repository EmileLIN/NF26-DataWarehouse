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
INSERT INTO f_dw_catalogue(ISBN,AUTEUR,LANGUE,PUBLICATION,EDITEUR)
SELECT t.getISBN(),t.getAuteur(),t.getLangue(),t.getPublication(),t.getEditeur()
FROM f_bdt_catalogue t;


--Dimension magasin

INSERT INTO f_dw_magasin(MAGASIN_ID,RAYONNAGE,BESTSELLER,RAYON_RECENT,DPT_NAME,DPT_POPULATION)
SELECT t.getMagasinId(),t.getRayonage(),t.getBS(),t.getRecent(),t.getDepartement(),t.getPopulation()
FROM f_bdt_magasin t;



--Dimension date
INSERT INTO f_dw_date(Trade_Date,JDS,Semaine,Mois,Trimestre)
SELECT t.getTradedate(),t.getJDS(),t.getMois(),t.getTrimestre(),t.getSemaine()
FROM f_bdt_date t;




/*
--Table de fait f_dw_vente
INSERT INTO f_dw_vente(Ticket_Date,Product,Shop)
SELECT t.getTicketDate(),t.getProduct(),t.getShop()
FROM f_bdt_vente t;
*/






















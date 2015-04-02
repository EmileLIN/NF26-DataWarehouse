--*********************
--CREATE THE RELATIONNAL OBJECT TABLES FOR ALL THE DIMENSIONS
--********************


--Create the object type catalogue_type 
/*
CREATE OR REPLACE TYPE Catalogue_Type AS OBJECT(
  ISBN          CHAR(13),
  TITRE         VARCHAR(255),
  AUTEUR        VARCHAR(255),
  LANGUE        CHAR(3),
  PUBLICATION   VARCHAR(50),
  EDITEUR       VARCHAR(255),
  GENRE         VARCHAR(255),
  MEMBER FUNCTION getISBN RETURN CHAR,
  MEMBER FUNCTION getLangue RETURN CHAR,
  MEMBER FUNCTION getAuteur RETURN VARCHAR,
  MEMBER FUNCTION getEditeur RETURN VARCHAR,
  MEMBER FUNCTION getPulication RETURN VARCHAR
);*/

--Create the catalogue
--Add constraints

/*CREATE TABLE f_bdt_catalogue OF Catalogue_Type(
  PRIMARY KEY(ISBN),
  CONSTRAINT check_langue CHECK(REGEXP_LIKE(LANGUE,'\w{3}')),           --Langue should have just 3 characters
  CONSTRAINT check_auteur CHECK(REGEXP_LIKE(AUTEUR,'^[^&]+$')),         --Auteur should be one person, we should take just the main author
  --For editeur, I am not quit sur what to do
  CONSTRAINT check_parution CHECK(REGEXP_LIKE(publication,'^\d{4}$'))  --parution should be just the year
);*/




--Create the RO f_bdt_magasin

--Create a view f_bdt_dpt to read data from Departement
/*
CREATE OR REPLACE VIEW f_bdt_dpt (Dpt_id,Dpt_name,Dpt_population)
AS
  SELECT DEPART_ID, DEPARTEMENT_NAME,POPULATION
  FROM F_BDE_DEPARTEMENT;
*/
  
--Create a view f_bdt_marketing to read data from Marketing
/*CREATE OR REPLACE VIEW f_bdt_marketing (Depart_Id, Magasin_Id,Rayonnage,Bestseller,Rayon_Recent)
AS
  SELECT DEPART_ID,MAGASIN,RAYONNAGE,BESTSELLER,RAYON_RECENT
  FROM F_BDE_MARKETING;*/
  
--Create type magasin
/*
CREATE OR REPLACE TYPE MAGASIN_TYPE AS OBJECT(
  DEPART_ID CHAR(2),
  MAGASIN_ID VARCHAR(4),
  RAYONNAGE VARCHAR(10),
  BESTSELLER CHAR(1),
  RAYON_RECENT CHAR(1),
  DPT_NAME VARCHAR(50),
  DPT_POPULATION NUMBER(10),
  MEMBER FUNCTION getMagsinId RETURN VARCHAR,
  MEMBER FUNCTION getRayonage RETURN VARCHAR,
  MEMBER FUNCTION getBS RETURN NUMBER,
  MEMBER FUNCTION getRecent RETURN NUMBER,
  MEMBER FUNCTION getDepartement RETURN VARCHAR
);
*/
/*
CREATE TABLE f_bdt_magasin OF MAGASIN_TYPE(
  PRIMARY KEY(MAGASIN_ID),
  CONSTRAINT check_rayonBS  CHECK(BESTSELLER IN ('0','1')),
  CONSTRAINT check_rayonRECENT  CHECK(RAYON_RECENT IN ('0','1')),
  CONSTRAINT check_population CHECK(REGEXP_LIKE(DPT_POPULATION,'(000)$')),
  CONSTRAINT check_rayonnage CHECK(RAYONNAGE IN ('A','Y','E'))
);
*/

--CREATE the RO f_bdt_date 
/*
CREATE OR REPLACE TYPE Date_Type AS OBJECT(
  Trade_Date Varchar(15),
  MEMBER FUNCTION getJDS RETURN CHAR,
  MEMBER FUNCTION getJDA RETURN VARCHAR,
  MEMBER FUNCTION getMois RETURN VARCHAR,
  MEMBER FUNCTION getTrimestre RETURN CHAR,
  MEMBER FUNCTION getSemaine RETURN VARCHAR
);*/

/*
CREATE TABLE f_bdt_date OF Date_Type(
  PRIMARY KEY (Trade_Date),
  CONSTRAINT check_Date CHECK(REGEXP_LIKE(Trade_Date,'^\d{4}-\d{2}-\d{2}$'))
)*/




--Create f_bdt_vente 
/*
CREATE OR REPLACE TYPE VENTE_TYPE AS OBJECT( 
  Ticket_Num  VARCHAR(15),
  Ticket_Date Varchar(15),
  Product     Char(13),
  Shop        Varchar(15)
);*/

/*
CREATE TABLE f_bdt_vente OF VENTE_TYPE(
  FOREIGN KEY (Ticket_Date) REFERENCES f_bdt_date(Trade_Date),
  FOREIGN KEY (Product) REFERENCES f_bdt_catalogue(ISBN),
  FOREIGN KEY (Shop) REFERENCES f_bdt_magasin(Magasin_Id)
);*/

--Create the Index

--CREATE UNIQUE INDEX Catalogue_index ON F_BDT_CATALOGUE(ISBN);
--CREATE UNIQUE INDEX Magasin_index ON F_BDT_MAGASIN(MAGASIN_ID);













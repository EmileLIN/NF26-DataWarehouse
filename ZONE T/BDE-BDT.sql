--This script is for the process of BDE to BDT

--First Step: deactive the constraints and index
/*
--F_BDT_VENTE，this one should be at first place because of its foreign keys
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT SYS_C00281595;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT SYS_C00281596;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT SYS_C00281597;
ALTER TABLE F_BDT_VENTE DISABLE CONSTRAINT SYS_C00281598;


--F_BDT_CATALOGUE
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_AUTEUR;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_LANGUE;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT CHECK_PARUTION;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT SYS_C00281329;
ALTER TABLE F_BDT_CATALOGUE DISABLE CONSTRAINT SYS_C00281330;

--F_BDT_DATE
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT CHECK_DATE;
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT SYS_C00281467;
ALTER TABLE F_BDT_DATE DISABLE CONSTRAINT SYS_C00281468;

--F_BDT_MAGASIN
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_POPULATION;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONBS;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONNAGE;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT CHECK_RAYONRECENT;
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT SYS_C00281395;     -- Contraint for the primary key Magasin_Id
ALTER TABLE F_BDT_MAGASIN DISABLE CONSTRAINT SYS_C00281396;
*/




--Step2: Copy the data from Zone E to Zone T
/*
--Insertion for catalogue
INSERT INTO F_BDT_CATALOGUE SELECT * FROM CATALOGUE_VIEW;

--Insertion for magasin

CREATE OR REPLACE VIEW JOC_Market_dpt(DEPART_ID,MAGASIN_ID,RAYONNAGE,BESTSELLER,RAYON_RENCENT,DPT_NAME,DPT_POPULATION)
AS
  SELECT m.DEPART_ID,m.MAGASIN_ID,m.RAYONNAGE,m.BESTSELLER,m.RAYON_RECENT,d.DPT_NAME,d.DPT_POPULATION 
  FROM F_BDT_MARKETING m JOIN F_BDT_DPT d ON m.DEPART_ID = d.DPT_ID;

INSERT INTO F_BDT_MAGASIN SELECT * FROM JOC_MARKET_DPT;

--Insertion for date
INSERT INTO F_BDT_DATE SELECT DISTINCT TICKET_DATE FROM F_BDE_VENTE;

INSERT INTO F_BDT_VENTE SELECT * FROM F_BDE_VENTE;*/



--Step 3 Add a exception table for all the abnormal data before reactive the constraints








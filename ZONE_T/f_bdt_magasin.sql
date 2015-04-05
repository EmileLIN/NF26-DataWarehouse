--Create type magasin

CREATE OR REPLACE TYPE MAGASIN_TYPE AS OBJECT(
  DEPART_ID CHAR(2),
  MAGASIN_ID VARCHAR(4),
  RAYONNAGE VARCHAR(10),
  BESTSELLER CHAR(1),
  RAYON_RECENT CHAR(1),
  DPT_NAME VARCHAR(50),
  DPT_POPULATION NUMBER(10),
  MEMBER FUNCTION getMagasinId RETURN VARCHAR,
  MEMBER FUNCTION getRayonage RETURN VARCHAR,
  MEMBER FUNCTION getBS RETURN NUMBER,
  MEMBER FUNCTION getRecent RETURN NUMBER,
  MEMBER FUNCTION getDepartement RETURN VARCHAR,
  MEMBER FUNCTION getPopulation RETURN NUMBER
);
/

CREATE TYPE BODY MAGASIN_TYPE
IS
MEMBER FUNCTION getMagasinId RETURN VARCHAR
  IS
  BEGIN
    RETURN SELF.MAGASIN_ID;
  END;
  MEMBER FUNCTION getRayonage RETURN VARCHAR
  IS
  BEGIN
    RETURN SELF.RAYONNAGE;
  END;
MEMBER FUNCTION getBS RETURN NUMBER
  IS
  BEGIN
    RETURN SELF.BESTSELLER;
  END;
MEMBER FUNCTION getRecent RETURN NUMBER
  IS
  BEGIN
    RETURN SELF.RAYON_RECENT;
  END;
MEMBER FUNCTION getDepartement RETURN VARCHAR
  IS
  BEGIN
    RETURN SELF.DPT_NAME;
  END;
MEMBER FUNCTION getPopulation RETURN NUMBER
  IS
  BEGIN 
    RETURN SELF.DPT_POPULATION;
  END;
END;
/

--Create an object of type MAGASIN_Type, it is f_bdt_magasin
CREATE TABLE f_bdt_magasin OF MAGASIN_TYPE(
  CONSTRAINT pk_MAGASIN_ID PRIMARY KEY(MAGASIN_ID)
);

--Bestseller should be 0 or 1, 1 means the shop has bestseller rayon, 0 means don not have  
ALTER TABLE f_bdt_magasin ADD CONSTRAINT check_rayonBS  CHECK(BESTSELLER IN ('0','1'));
--Rayon_Recent should be 0 or 1,1 means the shop has recent rayon, 0 means don not have
ALTER TABLE f_bdt_magasin ADD CONSTRAINT check_rayonRECENT  CHECK(RAYON_RECENT IN ('0','1'));
--Population should be calculed by thousand,we don not interested of the last three numbers
ALTER TABLE f_bdt_magasin ADD CONSTRAINT check_population CHECK(REGEXP_LIKE(DPT_POPULATION,'(000)$'));
--Rayonnage should be in {"A","Y","E"}, A means books ranged by authors, Y means by year,E means by Editors
ALTER TABLE f_bdt_magasin ADD CONSTRAINT check_rayonnage CHECK(RAYONNAGE IN ('A','Y','E'));



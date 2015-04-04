--Create the object type catalogue_type 

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
  MEMBER FUNCTION getPublication RETURN VARCHAR
);
/
CREATE OR REPLACE TYPE BODY Catalogue_Type IS
MEMBER FUNCTION getISBN RETURN CHAR
  IS
  BEGIN
    RETURN SELF.ISBN;
  END;
MEMBER FUNCTION getLangue RETURN CHAR
  IS 
  BEGIN
    RETURN SELF.LANGUE;
  END;
MEMBER FUNCTION getAuteur RETURN VARCHAR
  IS 
  BEGIN
    RETURN SELF.Auteur;
  END;
MEMBER FUNCTION getEditeur RETURN VARCHAR
  IS 
  BEGIN
    RETURN SELF.EDITEUR;
  END;
MEMBER FUNCTION getPublication RETURN VARCHAR
  IS 
  BEGIN
    RETURN SELF.PUBLICATION;
  END;
END;
/


--Create an object f_bdt_catalogue
CREATE TABLE f_bdt_catalogue OF Catalogue_Type(
  CONSTRAINT pk_ISBN PRIMARY KEY(ISBN)
);

--Add Other Constraints

--Langue should have just 3 characters
ALTER TABLE f_bdt_catalogue ADD CONSTRAINT check_langue CHECK(REGEXP_LIKE(LANGUE,'\w{3}'));    
--Auteur should be one person, we should take just the main author
ALTER TABLE f_bdt_catalogue ADD CONSTRAINT check_auteur CHECK(REGEXP_LIKE(AUTEUR,'^[^&]+$'));    
--parution should be just the year
ALTER TABLE f_bdt_catalogue ADD CONSTRAINT check_parution CHECK(REGEXP_LIKE(publication,'^\d{4}$'));  





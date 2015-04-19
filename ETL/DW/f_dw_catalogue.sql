--Create the object f_dw_catalogue of catalogue_type 

CREATE TABLE f_dw_catalogue(
  ISBN          CHAR(13),
  TITRE			VARCHAR(300),
  AUTEUR        VARCHAR(255),
  LANGUE        CHAR(3),
  PUBLICATION   VARCHAR(50),
  EDITEUR       VARCHAR(255)
);

CREATE UNIQUE INDEX f_dw_catalogue_index ON f_dw_catalogue(ISBN);

ALTER TABLE f_dw_catalogue
  ADD CONSTRAINT pk_f_dw_catalogue PRIMARY KEY (ISBN); 

  
--Create Directories

--CREATE OR REPLACE DIRECTORY Fantastic_src_directory AS '/home/nf26/data/';
--CREATE OR REPLACE DIRECTORY Fantastic_log_directory AS '/volsme/users/nf26p018/test/';

--Create Extern Table VENTE,we should have 512019 transactions

--CREATE TABLE vente(
--Ticket_Number VARCHAR(15),
--Ticket_Date Varchar(15),
--Product VARCHAR(15),
--Shop VARCHAR(10)
--)
--ORGANIZATION EXTERNAL
--(TYPE ORACLE_LOADER
--DEFAULT DIRECTORY FANTASTIC_SRC_DIRECTORY
--ACCESS PARAMETERS
--(
--RECORDS DELIMITED BY newline
--CHARACTERSET UTF8
--BADFILE FANTASTIC_LOGGER_DIRECTORY:'import_vente.bad'
--LOGFILE FANTASTIC_LOGGER_DIRECTORY:'import_vente.log'
--FIELDS TERMINATED BY ';'
--OPTIONALLY ENCLOSED BY '"'
--missing field VALUES are NULL
--)
--LOCATION ('Fantastic'))
--REJECT LIMIT UNLIMITED;

--Confirm it sucessed to import table vente

--DESCRIBE vente;
--SELECT TABLE_NAME, TYPE_NAME, DEFAULT_DIRECTORY_NAME FROM USER_EXTERNAL_TABLES;

--Create for department txt

--CREATE OR REPLACE DIRECTORY Fantastic_src_depart_dir AS '/volsme/users/nf26p018/data/';
--CREATE OR REPLACE DIRECTORY Fantastic_log_depart_dir AS '/volsme/users/nf26p018/tmp/';

--Create Extern table Departement

--CREATE TABLE departement(
--Depart_Id VARCHAR(3),
--Departement_Name VARCHAR(50),
--Population VARCHAR(10)
--)
--ORGANIZATION EXTERNAL
--(TYPE ORACLE_LOADER
--DEFAULT DIRECTORY FANTASTIC_SRC_DEPART_DIR
--ACCESS PARAMETERS
--(
--RECORDS DELIMITED BY newline
--CHARACTERSET UTF8
--BADFILE FANTASTIC_LOG_DEPART_DIR:'import_population.bad'
--LOGFILE FANTASTIC_LOG_DEPART_DIR:'import_population.log'
--FIELDS TERMINATED BY ';'
--OPTIONALLY ENCLOSED BY '"'
--missing field VALUES are NULL
--)
--LOCATION ('departementsInsee2003.txt'))
--REJECT LIMIT UNLIMITED;


--Create the marketing data

--CREATE TABLE Marketing(
--Depart_Id Char(2),
--Magasin Varchar(4),
--Rayonnage Varchar(10),
--Rayon Varchar(10),
--Bestseller int,
--Rayon_Recent int
--)
--ORGANIZATION EXTERNAL
--(TYPE ORACLE_LOADER
--DEFAULT DIRECTORY FANTASTIC_SRC_DEPART_DIR
--ACCESS PARAMETERS
--(
--RECORDS DELIMITED BY newline
--SKIP 1
--CHARACTERSET UTF8
--BADFILE FANTASTIC_LOG_DEPART_DIR:'import_marketing.bad'
--LOGFILE FANTASTIC_LOG_DEPART_DIR:'import_marketing.log'
--FIELDS TERMINATED BY ','
--OPTIONALLY ENCLOSED BY '"'
--missing field VALUES are NULL
--)
--LOCATION ('marketing.csv'))
--REJECT LIMIT UNLIMITED;







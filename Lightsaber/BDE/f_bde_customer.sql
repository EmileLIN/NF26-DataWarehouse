--Create Extern table customer

CREATE TABLE f_bde_customer(
	Customer_Num VARCHAR(20),
	Firstname VARCHAR(30),
	DateOfBirth VARCHAR(20),
	Age NUMBER,
	Income NUMBER,
	Gender CHAR(1),
	Costomer_level VARCHAR(15),
	SpeciesCode VARCHAR(20)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY LIGHTSABER_SRC_DIRECTORY
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE Lightsaber_log_directory:'import_customer.bad'
LOGFILE Lightsaber_log_directory:'import_customer.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('CustomerCard'))
REJECT LIMIT UNLIMITED;
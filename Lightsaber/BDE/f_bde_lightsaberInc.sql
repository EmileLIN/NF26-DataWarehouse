--Create Extern table lightsaberInc

CREATE TABLE f_bde_vente(
	Clerk_Id NUMBER,
	Product VARCHAR(20),
	Customer_Num VARCHAR(20),
	Factory NUMBER,
	Trade_Date VARCHAR(20)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY LIGHTSABER_SRC_DIRECTORY
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE Lightsaber_log_directory:'import_vente.bad'
LOGFILE Lightsaber_log_directory:'import_vente.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('LightSaberInc'))
REJECT LIMIT UNLIMITED;
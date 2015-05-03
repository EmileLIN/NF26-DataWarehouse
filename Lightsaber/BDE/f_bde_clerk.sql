--Create Extern table clerk

CREATE TABLE f_bde_clerk(
	Clerk_Id 		NUMBER,
	Name 			VARCHAR(20),
	HireDate 		VARCHAR(20),
	Gender			CHAR(1),
	Store 			VARCHAR(30)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY LIGHTSABER_SRC_DIRECTORY
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE Lightsaber_log_directory:'import_clerk.bad'
LOGFILE Lightsaber_log_directory:'import_clerk.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('Clerk.csv'))
REJECT LIMIT UNLIMITED;
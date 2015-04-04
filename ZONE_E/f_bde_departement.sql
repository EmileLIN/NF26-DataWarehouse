--Create Extern table Departement

CREATE TABLE f_bde_departement(
Depart_Id VARCHAR(3),
Departement_Name VARCHAR(50),
Population VARCHAR(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY FANTASTIC_SRC_DEPART_DIR
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE FANTASTIC_LOG_DEPART_DIR:'import_population_sql.bad'
LOGFILE FANTASTIC_LOG_DEPART_DIR:'import_population_sql.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('departementsInsee2003.txt'))
REJECT LIMIT UNLIMITED;
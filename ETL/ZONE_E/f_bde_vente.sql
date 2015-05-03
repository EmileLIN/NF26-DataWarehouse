--Create Extern Table VENTE,we should have 512019 transactions

CREATE TABLE f_bde_vente(
Ticket_Number VARCHAR(15),
Ticket_Date Varchar(15),
Product VARCHAR(15),
Shop VARCHAR(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY FANTASTIC_SRC_DIRECTORY
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE FANTASTIC_LOGGER_DIRECTORY:'import_vente_sql.bad'
LOGFILE FANTASTIC_LOGGER_DIRECTORY:'import_vente_sql.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('Fantastic'))
REJECT LIMIT UNLIMITED;
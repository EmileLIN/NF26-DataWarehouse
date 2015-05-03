--Create Extern table product

CREATE TABLE f_bde_product(
Product_Id VARCHAR(20),
Color VARCHAR(10),
Price NUMBER,
Product_size NUMBER,
Weight NUMBER,
DateOfDesign VARCHAR(20),
AgeOfDesign NUMBER,
Product_type VARCHAR(20),
Designer VARCHAR(50)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY LIGHTSABER_SRC_DIRECTORY
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
CHARACTERSET UTF8
BADFILE Lightsaber_log_directory:'import_product.bad'
LOGFILE Lightsaber_log_directory:'import_product.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
missing field VALUES are NULL
)
LOCATION ('Product'))
REJECT LIMIT UNLIMITED;
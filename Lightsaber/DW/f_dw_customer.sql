CREATE TABLE f_dw_customer(
	Customer_Num VARCHAR(20),
	Firstname VARCHAR(30),
	DateOfBirth DATE,
	Age NUMBER,
	Income NUMBER,
	Gender CHAR(1),
	Customer_level VARCHAR(15),
	SpeciesCode VARCHAR(20),
	Species VARCHAR(20)
);

CREATE UNIQUE INDEX f_dw_customer_index ON f_dw_customer(Customer_Num);

ALTER TABLE f_dw_customer ADD CONSTRAINT pk_f_dw_customer PRIMARY KEY (Customer_Num);


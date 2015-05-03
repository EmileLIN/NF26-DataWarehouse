--Create the object type customer_type

CREATE OR REPLACE TYPE Customer_type AS OBJECT(
	Customer_Num VARCHAR(20),
	Firstname VARCHAR(30),
	DateOfBirth VARCHAR(20),
	Age NUMBER,
	Income NUMBER,
	Gender CHAR(1),
	Customer_level VARCHAR(15),
	SpeciesCode VARCHAR(20),
	Species VARCHAR(20),

	MEMBER FUNCTION getCustomer_Num RETURN VARCHAR,
	MEMBER FUNCTION getFirstname RETURN VARCHAR,
	MEMBER FUNCTION getDateOfBirth RETURN DATE,
	MEMBER FUNCTION getAge RETURN NUMBER,
	MEMBER FUNCTION getIncome RETURN NUMBER,
	MEMBER FUNCTION getGender RETURN CHAR,
	MEMBER FUNCTION getCustomer_level RETURN VARCHAR,
	MEMBER FUNCTION getSpeciesCode RETURN VARCHAR,
	MEMBER FUNCTION getSpecies RETURN VARCHAR
);
/

CREATE OR REPLACE TYPE BODY Customer_type IS
MEMBER FUNCTION getCustomer_Num RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Customer_Num;
	END;
MEMBER FUNCTION getFirstname RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Firstname;
	END;
MEMBER FUNCTION getDateOfBirth RETURN DATE
	IS
	BEGIN 
		RETURN TO_DATE(SELF.DateOfBirth,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');	
	END;
MEMBER FUNCTION getAge RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Age;
	END;
MEMBER FUNCTION getIncome RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Income;
	END;
MEMBER FUNCTION getGender RETURN CHAR
	IS
	BEGIN 
		RETURN SELF.Gender;
	END;
MEMBER FUNCTION getCustomer_level RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Customer_level;
	END;
MEMBER FUNCTION getSpeciesCode RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.SpeciesCode;
	END;
MEMBER FUNCTION getSpecies RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Species;
	END;
END;
/

CREATE TABLE f_bdt_customer OF Customer_type(
	CONSTRAINT pk_Customer_Num PRIMARY KEY (Customer_Num)
);

--CREATE UNIQUE INDEX f_bdt_customer_index ON f_bdt_customer(Customer_Num);

ALTER TABLE f_bdt_customer ADD CONSTRAINT check_DateOfBirth CHECK(REGEXP_LIKE(DateOfBirth,'^\d{4}-\d{2}-\d{2}$'));
ALTER TABLE f_bdt_customer ADD CONSTRAINT check_Age CHECK(Age>0);
ALTER TABLE f_bdt_customer ADD CONSTRAINT check_Income CHECK(Income>0);
ALTER TABLE f_bdt_customer ADD CONSTRAINT check_CustomerGender CHECK(Gender in ('M','F','U'));
ALTER TABLE f_bdt_customer ADD CONSTRAINT check_Level CHECK(Customer_level in ('Apprentice','Padawan','Master'));




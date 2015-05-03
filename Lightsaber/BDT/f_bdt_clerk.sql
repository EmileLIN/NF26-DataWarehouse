--Create the object type clerk_type

CREATE OR REPLACE TYPE Clerk_type AS OBJECT(
	Clerk_Id 		NUMBER,
	Name 			VARCHAR(20),
	HireDate 		VARCHAR(20),
	Gender			CHAR(1),
	Store 			VARCHAR(30),
	DateOfOpening 	VARCHAR(20),
	YearOfOpening 	VARCHAR(4),

	MEMBER FUNCTION getClerk_Id RETURN NUMBER,
	MEMBER FUNCTION getName RETURN VARCHAR,
	MEMBER FUNCTION getHireDate RETURN DATE,
	MEMBER FUNCTION getGender RETURN CHAR,
	MEMBER FUNCTION getStore RETURN VARCHAR,
	MEMBER FUNCTION getDateOfOpening RETURN DATE,
	MEMBER FUNCTION getYearOfOpening RETURN VARCHAR
);
/

CREATE OR REPLACE TYPE BODY Clerk_type IS
MEMBER FUNCTION getClerk_Id RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Clerk_Id;
	END;
MEMBER FUNCTION getName RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Name;
	END;
MEMBER FUNCTION getHireDate RETURN DATE
	IS
	BEGIN 
      	RETURN TO_DATE(SELF.HireDate,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');
	END;
MEMBER FUNCTION getGender RETURN CHAR
	IS
	BEGIN 
		RETURN SELF.Gender;
	END;
MEMBER FUNCTION getStore RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Store;
	END;
MEMBER FUNCTION getDateOfOpening RETURN DATE
	IS
	BEGIN 
      	RETURN TO_DATE(SELF.DateOfOpening,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');	
	END;
MEMBER FUNCTION getYearOfOpening RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.YearOfOpening;
	END;
END;
/

CREATE TABLE f_bdt_clerk OF Clerk_type(	
	CONSTRAINT pk_Clerk_Id PRIMARY KEY (Clerk_Id)
);

--CREATE UNIQUE INDEX f_bdt_clerk_index ON f_bdt_clerk(Clerk_Id);

ALTER TABLE f_bdt_clerk ADD CONSTRAINT check_HireDate CHECK(REGEXP_LIKE(HireDate,'^\d{4}-\d{2}-\d{2}$'));
ALTER TABLE f_bdt_clerk ADD CONSTRAINT check_DateOfOpening CHECK(REGEXP_LIKE(DateOfOpening,'^\d{4}-\d{2}-\d{2}$'));
ALTER TABLE f_bdt_clerk ADD CONSTRAINT check_Gender CHECK(Gender in ('M','F','U'));
ALTER TABLE f_bdt_clerk ADD CONSTRAINT check_YearOfOpening CHECK(REGEXP_LIKE(YearOfOpening,'^\d{4}$'));












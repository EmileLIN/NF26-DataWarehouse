--Create the object type factory_type

CREATE OR REPLACE TYPE Factory_type AS OBJECT(
	Factory_num 		NUMBER,
	YearOfCreation 		VARCHAR(4),
	AgeOfFactory 		NUMBER,
	Capacity 			NUMBER,

	MEMBER FUNCTION getFactory_num RETURN NUMBER,
	MEMBER FUNCTION getYearOfCreation RETURN VARCHAR,
	MEMBER FUNCTION getAgeOfFactory RETURN NUMBER,
	MEMBER FUNCTION getCapacity RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY Factory_type IS
MEMBER FUNCTION getFactory_num RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Factory_num;
	END;
MEMBER FUNCTION getYearOfCreation RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.YearOfCreation;
	END;
MEMBER FUNCTION getAgeOfFactory RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.AgeOfFactory;
	END;
MEMBER FUNCTION getCapacity RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Capacity;
	END;
END;
/

CREATE TABLE f_bdt_factory OF Factory_type(
	CONSTRAINT pk_Factory_num PRIMARY KEY (Factory_num)
);

--CREATE UNIQUE INDEX f_bdt_factory_index ON f_bdt_factory(Factory_num);

ALTER TABLE f_bdt_factory ADD CONSTRAINT check_YearOfCreation CHECK(REGEXP_LIKE(YearOfCreation,'^\d{4}$'));
ALTER TABLE f_bdt_factory ADD CONSTRAINT check_AgeOfFactory CHECK(AgeOfFactory>0);
ALTER TABLE f_bdt_factory ADD CONSTRAINT check_Capacity CHECK(Capacity>0);


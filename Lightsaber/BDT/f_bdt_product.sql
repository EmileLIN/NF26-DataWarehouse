--Create the object type factory_type

CREATE OR REPLACE TYPE Product_type AS OBJECT
(
	Product_Id 		VARCHAR(20),
	Color 			VARCHAR(10),
	Price 			NUMBER,
	Product_size 	NUMBER,
	Weight 			NUMBER,
	DateOfDesign 	VARCHAR(20),
	AgeOfDesign 	NUMBER,
	Products_type 	VARCHAR(20),
	Designer 		VARCHAR(50),

	MEMBER FUNCTION getProduct_Id RETURN VARCHAR,
	MEMBER FUNCTION getColor RETURN VARCHAR,
	MEMBER FUNCTION getPrice RETURN NUMBER,
	MEMBER FUNCTION getProduct_size RETURN NUMBER,
	MEMBER FUNCTION getWeight RETURN NUMBER,
	MEMBER FUNCTION getDateOfDesign RETURN DATE,
	MEMBER FUNCTION getAgeOfDesign RETURN NUMBER,
	MEMBER FUNCTION getProducts_type RETURN VARCHAR,
	MEMBER FUNCTION getDesigner RETURN VARCHAR
);
/

CREATE OR REPLACE TYPE BODY Product_type IS
MEMBER FUNCTION getProduct_Id RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Product_Id;
	END;
MEMBER FUNCTION getColor RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Color;
	END;
MEMBER FUNCTION getPrice RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Price;
	END;
MEMBER FUNCTION getProduct_size RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Product_size;
	END;
MEMBER FUNCTION getWeight RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.Weight;
	END;
MEMBER FUNCTION getDateOfDesign RETURN DATE
	IS
	BEGIN 
		RETURN TO_DATE(SELF.DateOfDesign,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');	
	END;
MEMBER FUNCTION getAgeOfDesign RETURN NUMBER
	IS
	BEGIN 
		RETURN SELF.AgeOfDesign;
	END;
MEMBER FUNCTION getProducts_type RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Products_type;
	END;
MEMBER FUNCTION getDesigner RETURN VARCHAR
	IS
	BEGIN 
		RETURN SELF.Designer;
	END;
END;
/

CREATE TABLE f_bdt_product OF Product_type(
	CONSTRAINT pk_Product_Id PRIMARY KEY (Product_Id)
);

--CREATE UNIQUE INDEX f_bdt_product_index ON f_bdt_product(Product_Id);

ALTER TABLE f_bdt_product ADD CONSTRAINT check_Color CHECK(REGEXP_LIKE(Color,'^#.{6}$'));
ALTER TABLE f_bdt_product ADD CONSTRAINT check_Price CHECK(Price>0);
ALTER TABLE f_bdt_product ADD CONSTRAINT check_Productsize CHECK(Product_size>0);
ALTER TABLE f_bdt_product ADD CONSTRAINT check_Weight CHECK(Weight>0);
ALTER TABLE f_bdt_product ADD CONSTRAINT check_DateOfDesign CHECK(REGEXP_LIKE(DateOfDesign,'^\d{4}-\d{2}-\d{2}$'));
ALTER TABLE f_bdt_product ADD CONSTRAINT check_AgeOfDesign CHECK(AgeOfDesign>0);







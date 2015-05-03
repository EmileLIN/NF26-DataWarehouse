--Create f_bdt_vente

CREATE OR REPLACE TYPE Vente_type AS OBJECT(
	Clerk_Id 		NUMBER,
	Product 		VARCHAR(20),
	Customer_Num 	VARCHAR(20),
	Factory 		NUMBER,
	Trade_Date 		VARCHAR(20),

	MEMBER FUNCTION getPK RETURN NUMBER,
	MEMBER FUNCTION getClerk_Id RETURN NUMBER,
	MEMBER FUNCTION getProduct RETURN VARCHAR,
	MEMBER FUNCTION getCustomer_Num RETURN VARCHAR,
	MEMBER FUNCTION getFactory RETURN NUMBER,
	MEMBER FUNCTION getTrade_Date RETURN DATE
);
/

CREATE OR REPLACE TYPE BODY Vente_type IS
MEMBER FUNCTION getPK RETURN NUMBER
	IS
	BEGIN
		RETURN seq_table.nextval;
	END;
MEMBER FUNCTION getClerk_Id RETURN NUMBER
	IS
	BEGIN
		RETURN SELF.Clerk_Id;
	END;
MEMBER FUNCTION getProduct RETURN VARCHAR
	IS
	BEGIN
		RETURN SELF.Product;
	END;
MEMBER FUNCTION getCustomer_Num RETURN VARCHAR
	IS
	BEGIN
		RETURN SELF.Customer_Num;
	END;
MEMBER FUNCTION getFactory RETURN NUMBER
	IS
	BEGIN
		RETURN SELF.Factory;
	END;
MEMBER FUNCTION getTrade_Date RETURN DATE
	IS
	BEGIN
		IF REGEXP_LIKE(SELF.Trade_Date,'\d{4}-\d{2}-\d{2}')THEN
      		RETURN TO_DATE(SELF.Trade_Date,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');
    	ELSE
      		RETURN NULL;
    	END IF;	
	END;
END;
/

CREATE TABLE f_bdt_vente OF Vente_type(
	CONSTRAINT fk_Clerk		FOREIGN KEY (Clerk_Id) REFERENCES f_bdt_clerk(Clerk_Id),
	CONSTRAINT fk_Product  	FOREIGN KEY (Product) REFERENCES f_bdt_product(Product_Id),
	CONSTRAINT fk_Customer  FOREIGN KEY (Customer_Num) REFERENCES f_bdt_customer(Customer_Num),
	CONSTRAINT fk_Factory   FOREIGN KEY (Factory) REFERENCES f_bdt_factory(Factory_num),
	CONSTRAINT fk_Trade_Date   FOREIGN KEY (Trade_Date) REFERENCES f_bdt_date(Trade_date)
);




















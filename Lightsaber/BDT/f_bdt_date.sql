--Create the object type date_type

CREATE OR REPLACE TYPE Date_type AS OBJECT(
	  Trade_date  	VARCHAR(20),
	
  	MEMBER FUNCTION getTradedate RETURN DATE,
  	MEMBER FUNCTION getJDS RETURN VARCHAR,
  	MEMBER FUNCTION getMois RETURN NUMBER,
  	MEMBER FUNCTION getTrimestre RETURN NUMBER,
  	MEMBER FUNCTION getSemaine RETURN NUMBER,
  	MEMBER FUNCTION getAnnee  RETURN NUMBER
);
/

CREATE TYPE BODY Date_type
IS
MEMBER FUNCTION getTradedate RETURN DATE
  IS
  BEGIN
    IF REGEXP_LIKE(SELF.Trade_date,'\d{4}-\d{2}-\d{2}')THEN
      RETURN TO_DATE(SELF.Trade_date,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');
    ELSE
      RETURN NULL;
    END IF;
  END;
MEMBER FUNCTION getJDS RETURN VARCHAR
  IS
  BEGIN
    RETURN TO_CHAR(SELF.getTradedate(),'fmday');
  END;
MEMBER FUNCTION getMois RETURN NUMBER
  IS
  BEGIN
    RETURN TO_CHAR(SELF.getTradedate(),'mm');
  END;
MEMBER FUNCTION getTrimestre RETURN NUMBER
  IS
  BEGIN
    RETURN CEIL(TO_CHAR(self.getTradedate(),'mm') / 3);
  END;
MEMBER FUNCTION getSemaine RETURN NUMBER
  IS
  BEGIN
    RETURN TO_CHAR(SELF.getTradedate(),'ww');
  END;
MEMBER FUNCTION getAnnee RETURN NUMBER
  IS
  BEGIN
    RETURN TO_CHAR(SELF.getTradedate(),'YYYY');
  END;
END;
/

CREATE TABLE f_bdt_date OF Date_type(
  CONSTRAINT pk_Trade_Date PRIMARY KEY (Trade_date)
);

--CREATE UNIQUE INDEX f_bdt_date_index ON f_bdt_date(Trade_date);

ALTER TABLE f_bdt_date ADD CONSTRAINT check_Date CHECK(REGEXP_LIKE(Trade_date,'^\d{4}-\d{2}-\d{2}$'));













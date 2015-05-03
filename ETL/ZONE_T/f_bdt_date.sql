--CREATE the RO f_bdt_date 
ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';
CREATE OR REPLACE TYPE Date_Type AS OBJECT(
  --row_id    NUMBER(5) ,
  Trade_Date Varchar(15),
  --MEMBER FUNCTION getPK  RETURN NUMBER,
  MEMBER FUNCTION getTradedate RETURN DATE,
  MEMBER FUNCTION getJDS RETURN VARCHAR,
  MEMBER FUNCTION getMois RETURN NUMBER,
  MEMBER FUNCTION getTrimestre RETURN NUMBER,
  MEMBER FUNCTION getSemaine RETURN NUMBER
);
/

CREATE TYPE BODY Date_Type
IS
/*
MEMBER FUNCTION getPK RETURN NUMBER
  IS 
  BEGIN
    RETURN SELF.row_id;
  END;*/
MEMBER FUNCTION getTradedate RETURN DATE
  IS
  BEGIN
    IF REGEXP_LIKE(SELF.Trade_Date,'\d{4}-\d{2}-\d{2}')THEN
      RETURN TO_DATE(SELF.Trade_Date,'yyyy-mm-dd','NLS_DATE_LANGUAGE = American');
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
END;
/

CREATE TABLE f_bdt_date OF Date_Type(
  CONSTRAINT pk_Trade_Date PRIMARY KEY (Trade_Date)
);

ALTER TABLE f_bdt_date ADD CONSTRAINT check_Date CHECK(REGEXP_LIKE(Trade_Date,'^\d{4}-\d{2}-\d{2}$'));
/*
CREATE SEQUENCE pk_id_f_bdt_date  
  START WITH 1
  INCREMENT BY 1;
*/
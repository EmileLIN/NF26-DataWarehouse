--Create f_bdt_vente 

CREATE OR REPLACE TYPE VENTE_TYPE AS OBJECT( 
  Ticket_Num  VARCHAR(15),
  Ticket_Date Varchar(15),
  Product     Char(13),
  Shop        Varchar(15),
  MEMBER FUNCTION getTicketDate RETURN Date,
  MEMBER FUNCTION getProduct RETURN CHAR,
  MEMBER FUNCTION getShop RETURN VARCHAR
);
/
CREATE OR REPLACE TYPE BODY VENTE_TYPE
IS
  MEMBER FUNCTION getTicketDate RETURN DATE
  IS
  BEGIN
    RETURN to_date(SELF.Ticket_Date,'yyyy-mm-dd');
  END;
  MEMBER FUNCTION getProduct RETURN CHAR
  IS
  BEGIN
    RETURN SELF.Product;
  END;
  MEMBER FUNCTION getShop RETURN VARCHAR
  IS
  BEGIN
    RETURN SELF.Shop;
  END;
END;
/
CREATE TABLE f_bdt_vente OF VENTE_TYPE(
 CONSTRAINT fk_TicketDate FOREIGN KEY (Ticket_Date) REFERENCES f_bdt_date(Trade_Date),
 CONSTRAINT fk_Product FOREIGN KEY (Product) REFERENCES f_bdt_catalogue(ISBN),
 CONSTRAINT fk_Shop FOREIGN KEY (Shop) REFERENCES f_bdt_magasin(Magasin_Id)
);


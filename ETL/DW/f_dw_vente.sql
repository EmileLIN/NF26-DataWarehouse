CREATE TABLE f_dw_vente(
  Ticket_Date Date,
  Product     Char(13),
  Shop        Varchar(15)
);


ALTER TABLE f_dw_vente 
	ADD CONSTRAINT fk_f_dw_vente_Date FOREIGN KEY(Ticket_Date) REFERENCES f_dw_date(Trade_Date);

ALTER TABLE f_dw_vente 
	ADD CONSTRAINT fk_f_dw_vente_Product FOREIGN KEY(Product) REFERENCES f_dw_catalogue(ISBN);

ALTER TABLE f_dw_vente 
	ADD CONSTRAINT fk_f_dw_vente_Shop FOREIGN KEY(Shop) REFERENCES f_dw_magasin(MAGASIN_ID);

	
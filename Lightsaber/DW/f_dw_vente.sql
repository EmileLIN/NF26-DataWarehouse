CREATE TABLE f_dw_vente(
	Trade_Id		NUMBER,
	Clerk_Id 		NUMBER,
	Product 		VARCHAR(20),
	Customer_Num 	VARCHAR(20),
	Factory 		NUMBER,
	Trade_Date 		DATE
);

CREATE UNIQUE INDEX f_dw_vente_index ON f_dw_vente(Trade_Id);

ALTER TABLE f_dw_vente ADD CONSTRAINT pk_f_dw_vente PRIMARY KEY (Trade_Id);
ALTER TABLE f_dw_vente ADD CONSTRAINT fk_dw_clerk FOREIGN KEY (Clerk_Id) REFERENCES f_dw_clerk(Clerk_Id);
ALTER TABLE f_dw_vente ADD CONSTRAINT fk_dw_product FOREIGN KEY (Product) REFERENCES f_dw_product(Product_Id);
ALTER TABLE f_dw_vente ADD CONSTRAINT fk_dw_customer FOREIGN KEY (Customer_Num) REFERENCES f_dw_customer(Customer_Num);
ALTER TABLE f_dw_vente ADD CONSTRAINT fk_dw_factory FOREIGN KEY (Factory) REFERENCES f_dw_factory(Factory_Num);
ALTER TABLE f_dw_vente ADD CONSTRAINT fk_dw_tradedate FOREIGN KEY (Trade_Date) REFERENCES f_dw_date(Trade_date);


CREATE TABLE f_dw_product(
	Product_Id 		VARCHAR(20),
	Color 			VARCHAR(10),
	Price 			NUMBER,
	Product_size 	NUMBER,
	Weight 			NUMBER,
	DateOfDesign 	DATE,
	AgeOfDesign 	NUMBER,
	Products_type 	VARCHAR(20),
	Designer 		VARCHAR(50)
);

CREATE UNIQUE INDEX f_dw_product_index ON f_dw_product(Product_Id);

ALTER TABLE f_dw_product ADD CONSTRAINT pk_f_dw_product PRIMARY KEY (Product_Id);


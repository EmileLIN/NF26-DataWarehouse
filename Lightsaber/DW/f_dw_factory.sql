CREATE TABLE f_dw_factory(
	Factory_num 		NUMBER,
	YearOfCreation 		VARCHAR(4),
	AgeOfFactory 		NUMBER,
	Capacity 			NUMBER
);

CREATE UNIQUE INDEX f_dw_factory_index ON f_dw_factory(Factory_num);

ALTER TABLE f_dw_factory ADD CONSTRAINT pk_f_dw_factory PRIMARY KEY (Factory_num);


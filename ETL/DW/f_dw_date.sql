CREATE TABLE f_dw_date(
	 Trade_Date Date,
	 JDS Varchar(20),
	 Semaine  Number(2),
	 Mois    NUMBER(2),
	 Trimestre NUMBER(1)
);

CREATE UNIQUE INDEX f_dw_date_index ON f_dw_date(Trade_Date);

ALTER TABLE f_dw_date
	ADD CONSTRAINT pk_f_dw_date PRIMARY KEY (Trade_Date);


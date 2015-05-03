CREATE TABLE f_dw_date(
	 Trade_date  	DATE,
	 JDS			VARCHAR(20),
	 Month			NUMBER,
	 Trimester		NUMBER,
	 WeekNumber		NUMBER,
	 Year			NUMBER
);


CREATE UNIQUE INDEX f_dw_date_index ON f_dw_date(Trade_date);

ALTER TABLE f_dw_date ADD CONSTRAINT pk_f_dw_date PRIMARY KEY (Trade_date);


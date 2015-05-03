CREATE TABLE f_dw_clerk(
	Clerk_Id 		NUMBER,
	Name 			VARCHAR(20),
	HireDate 		DATE,
	Gender			CHAR(1),
	Store 			VARCHAR(30),
	DateOfOpening 	DATE,
	YearOfOpening 	VARCHAR(4)
);

CREATE UNIQUE INDEX f_dw_clerk_index ON f_dw_clerk(Clerk_Id);

ALTER TABLE f_dw_clerk ADD CONSTRAINT pk_f_dw_clerk PRIMARY KEY (Clerk_Id);

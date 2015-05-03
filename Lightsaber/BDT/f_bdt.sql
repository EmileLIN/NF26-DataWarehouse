DROP SEQUENCE seq_table;
CREATE SEQUENCE seq_table START WITH 1 INCREMENT BY 1;

@./BDT/f_bdt_clerk.sql
@./BDT/f_bdt_custom.sql
@./BDT/f_bdt_date.sql
@./BDT/f_bdt_factory.sql
@./BDT/f_bdt_product.sql
@./BDT/f_bdt_vente.sql

@./BDT/BDE-BDT.sql



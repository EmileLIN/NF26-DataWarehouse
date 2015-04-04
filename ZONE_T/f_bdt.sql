--*********************
--CREATE THE RELATIONNAL OBJECT TABLES FOR ALL THE DIMENSIONS
--********************



--Create Catalogue table 
@f_bdt_catalogue.sql;

--Create Magasin table
@f_bdt_magasin.sql;

--Create Date table
@f_bdt_date.sql;

--Create Vente table
@f_bdt_vente.sql;


--Lance the process BDE-BDT
@BDE-BDT.sql;

























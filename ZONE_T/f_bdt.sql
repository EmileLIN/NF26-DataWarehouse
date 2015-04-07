--*********************
--CREATE THE RELATIONNAL OBJECT TABLES FOR ALL THE DIMENSIONS
--******************** 

--Create Catalogue table 
@./ZONE_T/f_bdt_catalogue.sql;

--Create Magasin table
@./ZONE_T/f_bdt_magasin.sql;

--Create Date table
@./ZONE_T/f_bdt_date.sql;

--Create Vente table
@./ZONE_T/f_bdt_vente.sql;


--Lance the process BDE-BDT
@./ZONE_T/BDE-BDT.sql;

























--SELECT 
  --REGEXP_REPLACE(auteur,'&(.)*','')
  --FROM CATALOGUE_VIEW;
  
--SELECT REGEXP_REPLACE(PUBLICATION,'-(.)*','') FROM CATALOGUE_VIEW;

--SELECT AUTEUR FROM CATALOGUE_VIEW WHERE REGEXP_LIKE (AUTEUR,'^[^&]+$'); 
--SELECT PUBLICATION FROM CATALOGUE_VIEW WHERE REGEXP_LIKE (PUBLICATION,'^\d{4}$'); 

--drop table F_BDT_CATALOGUE;
--SELECT POPULATION FROM F_BDE_DEPARTEMENT WHERE REGEXP_LIKE(POPULATION,'(000)$');
--SELECT Ticket_Date FROM F_BDE_VENTE WHERE ROWNUM<=100 AND REGEXP_LIKE(TICKET_DATE,'^\d{4}-\d{2}-\d{2}$');

--drop type Date_Type;
--SELECT * FROM CATALOGUE_VIEW;

TRUNCATE TABLE F_BDT_DATE;

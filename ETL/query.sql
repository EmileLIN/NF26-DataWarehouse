--SELECT t.getMagasinId(),t.getRayonage(),t.getBS(),t.getRecent(),t.getDepartement(),t.getPopulation()
--FROM f_bdt_magasin t;

--SELECT t.getISBN(),t.getLangue(),t.getAuteur(),t.getEditeur(),t.getPublication()
--FROM f_bdt_catalogue t;

--SELECT t.getTradedate() 
--FROM f_bdt_date t
--WHERE t.getTradedate() is not null;

--SELECT t.getTicketDate(),t.getProduct(),t.getShop()
--FROM f_bdt_vente t;

--SELECT DISTINCT t.getTicketDate()
--FROM f_bdt_vente t;

--SELECT COUNT(v.product)  
--FROM f_bdt_vente v
--WHERE v.product NOT IN (SELECT ISBN FROM f_bdt_catalogue);
--SELECT COUNT(*) FROM f_dw_vente WHERE rowid IN (SELECT row_id FROM EXCEPTION_RECORDS);


/*
SELECT COUNT(*) 
FROM f_dw_vente 
WHERE rowid IN 
(SELECT row_id FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'FK_F_DW_VENTE_PRODUCT');
*/


--SELECT COUNT(row_id) FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'FK_F_DW_VENTE_PRODUCT';

--SELECT COUNT(row_id) FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'FK_F_DW_VENTE_SHOP';


--SELECT * FROM F_BDE_VENTE v LEFT JOIN F_BDE_CATALOGUE_VIEW c ON v.PRODUCT = c.ISBN WHERE v.TICKET_NUMBER = '216000001';
--SELECT COUNT(*) FROM F_BDE_VENTE v ,F_BDE_CATALOGUE_VIEW c 
--WHERE v.PRODUCT = c.ISBN AND length(v.PRODUCT) = 13;

--SELECT * FROM F_BDT_VENTE v LEFT JOIN F_BDT_CATALOGUE c ON v.PRODUCT = c.ISBN WHERE v.TICKET_NUM = '216000001';

--SELECT * FROM F_BDE_CATALOGUE_VIEW WHERE ISBN = '293';

--SELECT COUNT(*) FROM F_BDE_VENTE v JOIN F_BDE_CATALOGUE_VIEW c ON v.PRODUCT = c.ISBN;

--SELECT COUNT(*) FROM F_BDT_VENTE v JOIN F_BDT_CATALOGUE c ON v.PRODUCT = c.ISBN;

--SELECT COUNT(*) FROM F_DW_VENTE v JOIN F_DW_CATALOGUE c ON v.PRODUCT = c.ISBN;
/*
UPDATE f_dw_vente
SET PRODUCT = NULL
WHERE rowid IN 
(SELECT row_id FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'fk_f_dw_vente_product');
*/
/*
UPDATE f_dw_vente
SET SHOP = NULL
WHERE rowid IN 
(SELECT row_id FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'fk_f_dw_vente_shop');
*/
--UPDATE f_dw_vente
--SET SHOP = NULL
--WHERE rowid IN 
--(SELECT row_id FROM EXCEPTION_RECORDS WHERE CONSTRAINT_NAME = 'FK_F_DW_VENTE_SHOP');


--SELECT COUNT(*) FROM f_dw_vente WHERE shop IS NULL;

--SELECT COUNT(*) FROM F_DW_VENTE v JOIN F_DW_CATALOGUE c ON v.PRODUCT = c.ISBN;

--SELECT COUNT(*) FROM F_DW_VENTE v WHERE TICKET_DATE IS NULL AND PRODUCT IS NULL AND SHOP IS NULL;

prompt --be--


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
SELECT COUNT(*) FROM f_dw_vente WHERE rowid IN (SELECT row_id FROM EXCEPTION_RECORDS);




--Question01

SELECT p.num,p.designation,SUM(lf.qte) AS Nbvendu 
FROM PRODUIT p,LIGNE_FACT lf
WHERE p.num = lf.produit
GROUP BY p.num, p.designation
ORDER BY Nbvendu DESC;

--Question02

SELECT c.num,c.nom,sum(lf.qte*p.prix) AS chiffredaffaire
FROM CLIENT c,FACTURE f,LIGNE_FACT lf,PRODUIT p
WHERE c.num = f.client AND lf.facture = f.num AND lf.produit = p.num
GROUP BY c.num,c.nom
ORDER BY chiffredaffaire DESC;

--Question03

SELECT c.num as client,f.num,sum(lf.qte*p.prix) AS chiffredaffaire
FROM client c,facture f,LIGNE_FACT lf,PRODUIT p
WHERE c.num = f.client AND lf.facture = f.num AND lf.produit = p.num
GROUP BY c.NUM,f.NUM;

SELECT client,avg(chiffredaffaire) as Moyen
FROM (
    SELECT c.num as client,f.num,sum(lf.qte*p.prix) AS chiffredaffaire
    FROM client c,facture f,LIGNE_FACT lf,PRODUIT p
    WHERE c.num = f.client AND lf.facture = f.num AND lf.produit = p.num
    GROUP BY c.NUM,f.NUM
) 
GROUP BY client
ORDER BY Moyen;

--Qustion04

--Maximal
SELECT *
FROM PRODUIT p
WHERE p.PRIX IN( 
  SELECT max(p.PRIX)
  FROM PRODUIT p
);

--Minimal
SELECT *
FROM PRODUIT p
WHERE p.PRIX IN( 
  SELECT min(p.PRIX)
  FROM PRODUIT p
);

CREATE OR REPLACE VIEW f_bde_Catalogue_view (Isbn,Titre,Auteur,Langue,Publication,Editeur,Genre)
AS
  SELECT ISBN,TITRE,AUTEUR,LANGUE,PUBLICATION,EDITEUR,GENRE
  FROM nf26.CATALOGUE;
  
  
  
  
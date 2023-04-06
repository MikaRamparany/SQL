--1. nom des lieux qui finissent par 'um' : 

SELECT * 
FROM lieu 
WHERE nom_lieu 
LIKE '%um'

--2. le nombre de personnage par lieu (rajout ordre descendant: 

SELECT id_lieu, count(id_personnage)
FROM personnage
GROUP BY id_lieu
ORDER BY count(id_personnage) DESC;

--3. nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu puis par nom de personnage. 

SELECT personnage.nom_personnage, specialite.nom_specialite, personnage.adresse_personnage, lieu.nom_lieu 
FROM personnage 
INNER JOIN specialite ON personnage.id_specialite = specialite.id_specialite 
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu 
ORDER BY lieu.nom_lieu ASC, personnage.nom_personnage ASC;


--4. Nom des spécialités avec nombre de personnages par spécialité (trié par nombre de personnages décroissant).

SELECT nom_specialite AS 'Nom Spécialité', COUNT(*) AS 'Nombre de spécialiste(s)'
FROM specialite
INNER JOIN personnage ON specialite.id_specialite = personnage.id_specialite
GROUP BY personnage.id_specialite
ORDER BY COUNT(*) DESC

-- 5. Nom, date et lieu des batailles dans l'ordre de la plus récente à la plus ancienne (format jj/mm/aaaa)

SELECT nom_bataille AS 'Bataille', DATE_FORMAT(date_bataille, "%d %m %Y") AS 'Date', nom_lieu AS 'Lieu'
FROM bataille
INNER JOIN lieu ON bataille.id_lieu = lieu.id_lieu
GROUP BY nom_bataille, date_bataille, nom_lieu
ORDER BY date_bataille ASC

-- 6. NOM DES POTIONS + COÛT DE RÉALISATION DE LA POTION (trié par coût décroissant)


SELECT potion.nom_potion AS 'Potion', SUM(composer.qte * ingredient.cout_ingredient) AS 'Coût réalisation'
FROM potion
INNER JOIN composer ON potion.id_potion = composer.id_potion
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
GROUP BY potion.nom_potion
ORDER BY SUM(composer.qte * ingredient.cout_ingredient) DESC;



-- 7. NOM DES INGRÉDIENTS + COÛT + QUANTITÉ DE CHAQUE INGRÉDIENT QUI COMPOSENT LA POTION 'Santé'

-- 1ère Solution : 

SELECT nom_ingredient, cout_ingredient, composer.qte FROM potion 
INNER JOIN composer ON potion.id_potion = composer.id_potion 
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient 
WHERE potion.nom_potion = 'Santé';

-- 2ème solution - alternatif : 
SELECT nom_ingredient, SUM(cout_ingredient) AS 'Cout ingrédient', SUM(qte) AS 'Quantité' 
FROM composer 
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient 
INNER JOIN potion ON composer.id_potion = potion.id_potion WHERE nom_potion = 'Santé' GROUP BY nom_ingredient LIMIT 0, 25;



-- 8. NOM DU/DES PERSONNAGES QUI ONT PRIS LE PLUS DE CASQUES DANS LA BATAILLE 'Bataille du village gaulois'.
SELECT nom_personnage AS 'Personnage', nom_casque AS 'Nom du casque', nom_bataille AS 'Bataille', MAX(prendre_casque.qte) AS 'Nombre de casques'
FROM personnage
INNER JOIN prendre_casque ON personnage.id_personnage = prendre_casque.id_personnage
INNER JOIN casque ON prendre_casque.id_casque = casque.id_casque
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille
WHERE bataille.id_bataille = '1'
GROUP BY prendre_casque.qte, nom_personnage, nom_casque, nom_bataille
ORDER BY prendre_casque.qte DESC
LIMIT 1

-- 9. NOM DES PERSONNAGES ET LEUR QUANTITÉ DE POTION BUE (classé du plus grand buveur au plus petit)
SELECT nom_personnage AS 'Personnages', dose_boire AS 'Doses bues'
FROM personnage
INNER JOIN boire ON personnage.id_personnage = boire.id_personnage
GROUP BY dose_boire, personnage.id_personnage
ORDER BY dose_boire DESC

-- 10. NOM DE LA BATAILLE OU LE NOMBRE DE CASQUES PRIS A ÉTÉ LE PLUS IMPORTANT


SELECT nom_bataille AS 'Bataille', SUM(qte) AS 'Nombre de casques pris'
FROM bataille
INNER JOIN prendre_casque ON prendre_casque.id_bataille = bataille.id_bataille
GROUP BY nom_bataille
ORDER BY SUM(qte) DESC
LIMIT 1;


-- 11. COMBIEN DE CASQUES PAR TYPE ET QUEL COÛT TOTAL (classé par nombre décroissant)
SELECT nom_type_casque AS 'Type de casque', COUNT(id_casque) AS 'Nombre de casques', SUM(cout_casque) AS 'Coût total'
FROM type_casque
INNER JOIN casque ON type_casque.id_type_casque = casque.id_type_casque
GROUP BY nom_type_casque
ORDER BY SUM(cout_casque) DESC

-- 12. NOM DES POTIONS DONT UN DES INGRÉDIENTS EST LE POISSON FRAIS
SELECT nom_potion AS 'Potion'
FROM potion
INNER JOIN composer ON potion.id_potion = composer.id_potion
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Poisson frais'

-- 13. NOM DU/DES LIEU/X POSSÉDANT LE PLUS D'HABITANTS, EN DEHORS DU VILLAGE GAULOIS
SELECT nom_lieu AS 'Lieu', COUNT(lieu.id_lieu) AS "Nombre d'habitant(s)"
FROM lieu
INNER JOIN personnage ON lieu.id_lieu = personnage.id_lieu/phpMyAdmin5/index.php
WHERE NOT lieu.nom_lieu = 'Village gaulois'
GROUP BY nom_lieu
ORDER BY COUNT(lieu.id_lieu) DESC
LIMIT 1

-- 14. NOM DES PERSONNAGES QUI N'ONT JAMAIS BU DE POTION
SELECT nom_personnage 
FROM personnage 
WHERE id_personnage NOT IN (
  SELECT id_personnage 
  FROM boire
)


-- 15. NOM DES PERSONNAGES QUI NE SONT PAS AUTORISÉS À BOIRE LA POTION 'Magique'

SELECT nom_personnage
FROM personnage
WHERE id_personnage NOT IN (
  SELECT id_personnage 
  FROM autoriser_boire
  INNER JOIN potion ON autoriser_boire.id_potion = potion.id_potion
  WHERE potion.nom_potion = 'Magique'
);


----------------------------------------------------------------


--  Partie 2 : requêtes de création. 

-- A. Ajouter le personnage suivant : Champdeblix, agriculteur résidant à la ferme Hantassion de Rotogamus. 

INSERT INTO `personnage` (`nom`, `profession`, `residence`) 
VALUES ('Champdeblix', 'agriculteur', 'ferme HAntassion de Rotomagus');

-- B. Autorisez Bonemine )à boire de la potion magique, elle est jalouse d'Iélosubmarine... 

-- C. Supprimez les casques grecs qui n'ont jamais été pris lors d'une bataille. 

-- D. Modifiez l'adressse de Zérozérosix : il a été mis en prison à Condate. 

-- E. La potion 'Soupe' ne doit plus contenir de persil.

-- F. Obélix s'est trompé : ce sont 42 casques Weisnau, et non Ostrogth, qu'il a pris lors de la bataille 'Attaque de la banque postale'. Corrigez son erreur ! 


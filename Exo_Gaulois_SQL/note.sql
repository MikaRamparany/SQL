--1. nom des lieux qui finissent par 'um' : 

SELECT * 
FROM lieu 
WHERE nom_lieu 
LIKE '%lia'

--2. le nombre de personnage par lieu (rajout ordre descendant: 

SELECT id_lieu, count(id_personnage)
FROM personnage
GROUP BY id_lieu
ORDER BY count(id_personnage) DESC;

--3. nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu puis par nom de personnage. 

SELECT nom_personnage, adresse_personnage, nom_lieu, nom_specialite
FROM personnage, lieu, specialite
ORDER BY nom_lieu ASC, nom_personnage ASC


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

SELECT nom_potion AS ‘Potion’, (qte*cout_ingredient) AS 'Coût realisation' FROM potion INNER JOIN composer ON potion.id_potion = composer.id_potion INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient GROUP BY nom_potion, qte, cout_ingredient ORDER BY (qte*cout_ingredient) DESC;

--! verification de requête faite : 
--!Potion ID  12 : nom  -> Envol
--!INgrédit ID : 18 
 QTE ingredient : 3 
--!Cout : 15 
--!Cout real : 15* 3 = 45 --> sur le tableau de résultat ENVOL coute bien 45. 

-- 7. NOM DES INGRÉDIENTS + COÛT + QUANTITÉ DE CHAQUE INGRÉDIENT QUI COMPOSENT LA POTION 'Santé'

SELECT nom_potion, nom_ingredient, COUNT(qte) AS 'Qté ingrédient', cout_ingredient AS 'Coût ingrédient' FROM potion INNER JOIN composer ON potion.id_potion = composer.id_potion INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient WHERE nom_potion = 'Santé' GROUP BY nom_potion, nom_ingredient, cout_ingredient LIMIT 0, 25;


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
SELECT nom_bataille AS 'Bataille', qte AS 'Nombre de casques pris'
FROM bataille
INNER JOIN prendre_casque ON prendre_casque.id_bataille = bataille.id_bataille
GROUP BY qte, nom_bataille
ORDER BY qte DESC
LIMIT 1

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
WHERE ingredient.id_ingredient = '24'

-- 13. NOM DU/DES LIEU/X POSSÉDANT LE PLUS D'HABITANTS, EN DEHORS DU VILLAGE GAULOIS
SELECT nom_lieu AS 'Lieu', COUNT(lieu.id_lieu) AS "Nombre d'habitant(s)"
FROM lieu
INNER JOIN personnage ON lieu.id_lieu = personnage.id_lieu
WHERE NOT lieu.id_lieu = '1'
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

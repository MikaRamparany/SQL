-- nom des lieux qui finissent par 'um' : 

SELECT * 
FROM lieu 
WHERE nom_lieu 
LIKE '%lia'

-- le nombre de personnage par lieu (rajout ordre descendant: 

SELECT id_lieu, count(id_personnage)
FROM personnage
GROUP BY id_lieu
ORDER BY count(id_personnage) DESC;

-- nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu puis par nom de personnage. 

SELECT nom_personnage, adresse_personnage, nom_lieu, nom_specialite
FROM personnage, lieu, specialite
ORDER BY nom_lieu ASC, nom_personnage ASC


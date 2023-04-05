/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `gaulois` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `gaulois`;

CREATE TABLE IF NOT EXISTS `autoriser_boire` (
  `id_potion` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL,
  PRIMARY KEY (`id_potion`,`id_personnage`),
  KEY `FK_AUTO_PERSO` (`id_personnage`),
  CONSTRAINT `FK_AUTO_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`),
  CONSTRAINT `FK_AUTO_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `autoriser_boire` DISABLE KEYS */;
INSERT INTO `autoriser_boire` (`id_potion`, `id_personnage`) VALUES
	(1, 4),
	(9, 5),
	(1, 6),
	(12, 6),
	(1, 7),
	(3, 7),
	(7, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 12),
	(13, 12),
	(1, 13),
	(2, 13),
	(4, 13),
	(6, 13),
	(10, 13),
	(13, 14),
	(1, 15),
	(4, 17),
	(6, 19),
	(6, 20),
	(1, 22),
	(5, 23),
	(1, 24),
	(1, 25),
	(3, 25),
	(11, 26),
	(8, 30),
	(8, 32),
	(11, 32),
	(5, 33),
	(14, 33),
	(15, 33),
	(1, 34),
	(9, 35),
	(1, 36),
	(7, 39),
	(14, 42),
	(1, 44);
/*!40000 ALTER TABLE `autoriser_boire` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `bataille` (
  `id_bataille` int(11) NOT NULL AUTO_INCREMENT,
  `nom_bataille` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_bataille` date NOT NULL,
  `id_lieu` int(11) NOT NULL,
  PRIMARY KEY (`id_bataille`),
  KEY `FK_BATAILLE_LIEU` (`id_lieu`),
  CONSTRAINT `FK_BATAILLE_LIEU` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `bataille` DISABLE KEYS */;
INSERT INTO `bataille` (`id_bataille`, `nom_bataille`, `date_bataille`, `id_lieu`) VALUES
	(1, 'Bataille du village gaulois', '0050-11-30', 1),
	(2, 'Anniversaire d\'Obélix', '0050-07-08', 2),
	(3, 'Raid gaulois sur Petibonum', '0050-04-25', 5),
	(4, 'Siège d\'Alesia', '0052-05-01', 16),
	(5, 'Bataille de Gergovie', '0052-03-26', 17),
	(6, 'Rapt de druides', '0050-01-22', 7),
	(7, 'Raid gaulois sur Aquarium', '0050-08-06', 4),
	(8, 'Bagarre du siècle', '0050-02-25', 8),
	(9, 'Attaque de la banque postale', '0050-06-30', 12),
	(10, 'Raid gaulois sur Laudanum', '0050-09-20', 3),
	(11, 'Attaque du bateau pirate', '0050-03-10', 10),
	(12, 'Invasion de la Bretagne', '0050-04-04', 10),
	(13, 'Bataille des cinq armées', '0050-09-21', 18),
	(14, 'Percée de Divodurum', '0050-01-30', 11),
	(15, 'Embuscade de la rue Tabaga', '0050-04-02', 9);
/*!40000 ALTER TABLE `bataille` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `boire` (
  `id_potion` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL,
  `date_boire` date NOT NULL,
  `dose_boire` int(5) NOT NULL,
  PRIMARY KEY (`id_potion`,`id_personnage`),
  KEY `FK_BOIRE_PERSO` (`id_personnage`),
  CONSTRAINT `FK_BOIRE_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`),
  CONSTRAINT `FK_BOIRE_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `boire` DISABLE KEYS */;
INSERT INTO `boire` (`id_potion`, `id_personnage`, `date_boire`, `dose_boire`) VALUES
	(1, 4, '0050-06-05', 2),
	(1, 6, '0050-05-01', 2),
	(1, 8, '0050-02-24', 9),
	(1, 9, '0050-06-21', 1),
	(1, 10, '0050-05-31', 3),
	(1, 13, '0050-01-20', 2),
	(1, 15, '0050-07-12', 1),
	(1, 22, '0050-04-30', 3),
	(1, 36, '0050-04-30', 3),
	(2, 13, '0050-02-01', 12),
	(3, 7, '0050-10-10', 2),
	(4, 13, '0050-01-02', 5),
	(4, 17, '0050-04-10', 5),
	(5, 23, '0050-08-21', 2),
	(5, 33, '0050-10-12', 7),
	(6, 16, '0050-07-02', 1),
	(6, 19, '0050-09-01', 12),
	(6, 20, '0050-09-01', 12),
	(7, 39, '0050-09-09', 20),
	(8, 32, '0050-03-02', 8),
	(9, 5, '0050-01-01', 38),
	(9, 9, '0050-02-01', 7),
	(9, 35, '0050-03-06', 14),
	(10, 13, '0050-04-15', 20),
	(11, 32, '0050-10-02', 5),
	(12, 6, '0050-03-02', 6),
	(13, 14, '0050-10-04', 3),
	(14, 42, '0050-09-30', 3);
/*!40000 ALTER TABLE `boire` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `casque` (
  `id_casque` int(11) NOT NULL AUTO_INCREMENT,
  `nom_casque` varchar(50) COLLATE utf8_bin NOT NULL,
  `cout_casque` float NOT NULL,
  `id_type_casque` int(11) NOT NULL,
  PRIMARY KEY (`id_casque`),
  KEY `FK_CASQUE_TYPECASQUE` (`id_type_casque`),
  CONSTRAINT `FK_CASQUE_TYPECASQUE` FOREIGN KEY (`id_type_casque`) REFERENCES `type_casque` (`id_type_casque`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `casque` DISABLE KEYS */;
INSERT INTO `casque` (`id_casque`, `nom_casque`, `cout_casque`, `id_type_casque`) VALUES
	(1, 'Villanovien', 865, 1),
	(2, 'Negau', 498, 1),
	(3, 'Corinthien', 765, 2),
	(4, 'Spangenhelm', 1200, 4),
	(5, 'Italo-celtique', 660, 1),
	(10, 'Weisenau', 50, 1),
	(11, 'Impérial-gaulois', 200, 1),
	(12, 'Gallois', 540, 4),
	(13, 'Wisigoth', 631, 4),
	(14, 'Ostrogoth', 743, 4),
	(15, 'A cornes', 2900, 3),
	(16, 'Veksø', 7820, 3),
	(17, 'Enkomi', 3140, 3),
	(18, 'Haguenau', 140, 1),
	(19, 'Picte', 160, 3),
	(20, 'Athénien', 452, 2),
	(21, 'Spartiate', 901, 2),
	(22, 'Phrygien', 840, 2),
	(23, 'Hoplite', 600, 2);
/*!40000 ALTER TABLE `casque` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `composer` (
  `id_potion` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `qte` int(5) NOT NULL,
  PRIMARY KEY (`id_potion`,`id_ingredient`),
  KEY `FK_COMPOSER_INGREDIENT` (`id_ingredient`),
  CONSTRAINT `FK_COMPOSER_INGREDIENT` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_COMPOSER_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` (`id_potion`, `id_ingredient`, `qte`) VALUES
	(1, 4, 2),
	(1, 5, 20),
	(1, 23, 4),
	(1, 24, 6),
	(2, 10, 6),
	(2, 25, 1),
	(3, 9, 78),
	(3, 23, 3),
	(3, 25, 1),
	(4, 15, 1),
	(5, 3, 4),
	(6, 8, 2),
	(6, 17, 3),
	(7, 2, 41),
	(7, 24, 5),
	(8, 6, 7),
	(9, 1, 48),
	(9, 10, 3),
	(9, 19, 15),
	(10, 11, 40),
	(11, 21, 50),
	(12, 18, 3),
	(13, 10, 10),
	(13, 26, 2),
	(14, 16, 3);
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) COLLATE utf8_bin NOT NULL,
  `cout_ingredient` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `cout_ingredient`) VALUES
	(1, 'Petit pois', 0.5),
	(2, 'Haricot vert', 1),
	(3, 'Queue de crevette', 7),
	(4, 'Homard', 12),
	(5, 'Gui', 3),
	(6, 'Salsepareille', 6.5),
	(7, 'Miel', 4.5),
	(8, 'Grenouille', 10),
	(9, 'Bave de crapaud', 16.5),
	(10, 'Carotte', 1),
	(11, 'Prune', 3),
	(12, 'Ver de terre', 1),
	(13, 'Feuille de thé', 11),
	(14, 'Courgette', 2),
	(15, 'Poudre de perlimpimpin', 42),
	(16, 'Champignon', 3.5),
	(17, 'Aile de chauve-souris', 9),
	(18, 'Plume de paon', 15),
	(19, 'Persil', 0.5),
	(20, 'Romarin', 0.5),
	(21, 'Cervoise', 4),
	(22, 'Millepertuis', 2),
	(23, 'Huile de roche', 30),
	(24, 'Poisson frais', 6),
	(25, 'Edelweiss', 80),
	(26, 'Poisson pas frais', 1);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `lieu` (
  `id_lieu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_lieu` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `lieu` DISABLE KEYS */;
INSERT INTO `lieu` (`id_lieu`, `nom_lieu`) VALUES
	(1, 'Village gaulois'),
	(2, 'Babaorum'),
	(3, 'Laudanum'),
	(4, 'Aquarium'),
	(5, 'Petibonum'),
	(6, 'Rotomagus'),
	(7, 'Forêt des Carnutes'),
	(8, 'Lutèce'),
	(9, 'Condate'),
	(10, 'En mer'),
	(11, 'Divodurum'),
	(12, 'Lugdunum'),
	(13, 'Gesocribate'),
	(14, 'Massilia'),
	(15, 'Nicae'),
	(16, 'Alesia'),
	(17, 'Gergovie'),
	(18, 'Village belge');
/*!40000 ALTER TABLE `lieu` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `personnage` (
  `id_personnage` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personnage` varchar(80) COLLATE utf8_bin NOT NULL,
  `adresse_personnage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image_personnage` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'indisponible.jpg',
  `id_lieu` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  PRIMARY KEY (`id_personnage`),
  KEY `FK_VILLAGEOIS_LIEU` (`id_lieu`),
  KEY `FK_VILLAGEOIS_SPEC` (`id_specialite`),
  CONSTRAINT `FK_VILLAGEOIS_LIEU` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id_lieu`),
  CONSTRAINT `FK_VILLAGEOIS_SPEC` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `personnage` DISABLE KEYS */;
INSERT INTO `personnage` (`id_personnage`, `nom_personnage`, `adresse_personnage`, `image_personnage`, `id_lieu`, `id_specialite`) VALUES
	(4, 'Astérix', 'Au fond à droite', 'indisponible.jpg', 1, 1),
	(5, 'Obélix', 'Carrière de menhir', 'indisponible.jpg', 1, 5),
	(6, 'Assurancetourix', 'Hutte dans l\'arbre', 'indisponible.jpg', 1, 2),
	(7, 'Panoramix', 'Près de la cascade', 'indisponible.jpg', 1, 3),
	(8, 'Abraracourcix', 'Hutte du chef', 'indisponible.jpg', 1, 4),
	(9, 'Ordralfabétix', 'Poissonnerie', 'indisponible.jpg', 1, 7),
	(10, 'Cétautomatix', 'Forge', 'indisponible.jpg', 1, 6),
	(11, 'Plantaquatix', 'Tout près des fleurs', 'indisponible.jpg', 1, 15),
	(12, 'Bonemine', 'Hutte du chef', 'indisponible.jpg', 1, 16),
	(13, 'Agecanonix', 'Centre du village', 'indisponible.jpg', 1, 1),
	(14, 'Falbala', 'Rue Tabaga', 'indisponible.jpg', 9, 17),
	(15, 'Tragicomix', 'Rue Tabaga', 'indisponible.jpg', 9, 1),
	(16, 'Amérix', 'Avenue Avuhavaincu', 'indisponible.jpg', 9, 15),
	(17, 'Pneumatix', 'Route Elkrief', 'indisponible.jpg', 6, 8),
	(18, 'Plaintcontrix', 'Impasse Hémanque', 'indisponible.jpg', 8, 15),
	(19, 'Vanendfaillevesix', 'Hutte majeure', 'indisponible.jpg', 18, 1),
	(20, 'Gueuselambix', 'Hutte du chef', 'indisponible.jpg', 18, 4),
	(21, 'Antibiotix', 'Place du marché', 'indisponible.jpg', 9, 13),
	(22, 'Changélédix', 'Port', 'indisponible.jpg', 13, 11),
	(23, 'Zérozérosix', '', 'indisponible.jpg', 8, 14),
	(24, 'Analgésix', NULL, 'indisponible.jpg', 1, 9),
	(25, 'Arrièreboutix', NULL, 'indisponible.jpg', 1, 9),
	(26, 'Goudurix', 'Rue Tilante', 'indisponible.jpg', 8, 17),
	(27, 'Homéopatix', 'Boulevard Hicelle', 'indisponible.jpg', 8, 15),
	(28, 'Océanonix', 'Rue Tilante', 'indisponible.jpg', 8, 1),
	(29, 'Alambix', 'Magasin de vins et charbon', 'indisponible.jpg', 17, 17),
	(30, 'Bainpublix', 'Magasin de vins et charbon', 'indisponible.jpg', 17, 17),
	(31, 'Vercingétorix', 'Hutte du chef', 'indisponible.jpg', 17, 4),
	(32, 'Septantesix', 'Hutte de druide', 'indisponible.jpg', 7, 3),
	(33, 'Acidcloridrix', NULL, 'indisponible.jpg', 16, 14),
	(34, 'Iélosubmarine', 'Poissonnerie', 'indisponible.jpg', 1, 7),
	(35, 'Avoranfix', NULL, 'indisponible.jpg', 8, 15),
	(36, 'Choucroutgarnix', NULL, 'indisponible.jpg', 1, 10),
	(37, 'César Labeldecadix', 'Taverne du port', 'indisponible.jpg', 14, 17),
	(38, 'Doublepolémix', NULL, 'indisponible.jpg', 6, 8),
	(39, 'Maestria', NULL, 'indisponible.jpg', 8, 15),
	(40, 'Odalix', 'Ruelle Tay\'m Strahtedji', 'indisponible.jpg', 12, 17),
	(41, 'Soutienlogistix', 'Rue Stine', 'indisponible.jpg', 15, 2),
	(42, 'Moralélastix', NULL, 'indisponible.jpg', 9, 1),
	(43, 'Aplusbégalix', 'En dehors de la ville', 'indisponible.jpg', 9, 4),
	(44, 'Orthopédix', 'Quartier d\'Orange', 'indisponible.jpg', 9, 17),
	(45, 'Champdeblix', 'Ferme Hantassion', 'indisponible.jpg', 6, 12);
/*!40000 ALTER TABLE `personnage` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `potion` (
  `id_potion` int(11) NOT NULL AUTO_INCREMENT,
  `nom_potion` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_potion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `potion` DISABLE KEYS */;
INSERT INTO `potion` (`id_potion`, `nom_potion`) VALUES
	(1, 'Magique'),
	(2, 'Rajeunissement II'),
	(3, 'Santé'),
	(4, 'Vitesse'),
	(5, 'Invisibilité'),
	(6, 'Force'),
	(7, 'Intelligence'),
	(8, 'Assouplissement II'),
	(9, 'Soupe'),
	(10, 'Rajeunissement I'),
	(11, 'Assouplissement I'),
	(12, 'Envol'),
	(13, 'Coloration pour cheveux'),
	(14, 'Gigantisme'),
	(15, 'Miniaturisation');
/*!40000 ALTER TABLE `potion` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `prendre_casque` (
  `id_casque` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL,
  `id_bataille` int(11) NOT NULL,
  `qte` int(5) NOT NULL,
  PRIMARY KEY (`id_casque`,`id_personnage`,`id_bataille`),
  KEY `FK_PRCSQ_BATAILLE` (`id_bataille`),
  KEY `FK_PRCSQ_PERSO` (`id_personnage`),
  CONSTRAINT `FK_PRCSQ_BATAILLE` FOREIGN KEY (`id_bataille`) REFERENCES `bataille` (`id_bataille`),
  CONSTRAINT `FK_PRCSQ_CASQUE` FOREIGN KEY (`id_casque`) REFERENCES `casque` (`id_casque`),
  CONSTRAINT `FK_PRCSQ_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `prendre_casque` DISABLE KEYS */;
INSERT INTO `prendre_casque` (`id_casque`, `id_personnage`, `id_bataille`, `qte`) VALUES
	(2, 8, 1, 8),
	(2, 15, 15, 4),
	(3, 4, 11, 1),
	(3, 20, 13, 24),
	(4, 22, 15, 2),
	(5, 4, 3, 5),
	(5, 8, 5, 10),
	(5, 10, 7, 4),
	(10, 4, 1, 21),
	(10, 5, 2, 42),
	(11, 5, 2, 34),
	(11, 5, 10, 24),
	(14, 5, 9, 32),
	(14, 36, 12, 1),
	(16, 5, 11, 2),
	(17, 13, 13, 1),
	(18, 5, 1, 60),
	(18, 8, 1, 12);
/*!40000 ALTER TABLE `prendre_casque` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `specialite` (
  `id_specialite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_specialite` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` (`id_specialite`, `nom_specialite`) VALUES
	(1, 'Guerrier'),
	(2, 'Barde'),
	(3, 'Druide'),
	(4, 'Chef de village'),
	(5, 'Livreur de menhir'),
	(6, 'Forgeron'),
	(7, 'Poissonier'),
	(8, 'Facteur'),
	(9, 'Porteur de chef'),
	(10, 'Garde'),
	(11, 'Marin'),
	(12, 'Agriculteur'),
	(13, 'Chasseur'),
	(14, 'Espion'),
	(15, 'Artisan'),
	(16, 'Femme de chef'),
	(17, 'Autre');
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `type_casque` (
  `id_type_casque` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type_casque` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_type_casque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40000 ALTER TABLE `type_casque` DISABLE KEYS */;
INSERT INTO `type_casque` (`id_type_casque`, `nom_type_casque`) VALUES
	(1, 'Romain'),
	(2, 'Grec'),
	(3, 'Normand'),
	(4, 'Autre');
/*!40000 ALTER TABLE `type_casque` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 19 Avril 2017 à 08:25
-- Version du serveur: 10.1.21-MariaDB
-- Version de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `u548252978_frend`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`u548252978_admin`@`localhost` PROCEDURE `Update_Share_Pos`(IN `idUser` INT(255))
BEGIN    
	DECLARE Partage_Pos INT(10);
	SELECT a.partage_position INTO Partage_Pos
    FROM amis AS a
    INNER JOIN users AS u ON u.id = a.id_user
    WHERE a.id_user = idUser
    LIMIT 1;
    
    IF (Partage_Pos = 0) THEN
    	UPDATE amis
        SET partage_position = 1
        WHERE id_user = idUser;
    ELSE
    	UPDATE amis
        SET partage_position = 0
        WHERE id_user = idUser;
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `amis`
--

CREATE TABLE IF NOT EXISTS `amis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partage_position` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK01` (`id_user`),
  KEY `FK02` (`id_ami`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=229 ;

--
-- Contenu de la table `amis`
--

INSERT INTO `amis` (`id`, `partage_position`, `id_user`, `id_ami`) VALUES
(3, 1, 2, 1),
(4, 1, 2, 3),
(186, 0, 8, 130),
(6, 1, 3, 2),
(228, 1, 2, 4),
(153, 0, 1, 2),
(52, 1, 6, 1),
(226, 0, 7, 2),
(183, 0, 129, 1),
(227, 1, 4, 2),
(217, 1, 4, 3),
(225, 1, 2, 7),
(37, 1, 8, 5),
(218, 0, 3, 4),
(185, 0, 130, 8),
(184, 0, 1, 129);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE IF NOT EXISTS `appartient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lieu` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lieu` (`id_lieu`),
  KEY `fk_user` (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`id`, `id_lieu`, `id_user`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 106),
(6, 6, 2),
(90, 91, 2),
(89, 90, 2),
(88, 89, 2),
(87, 88, 2),
(86, 87, 5);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text NOT NULL,
  `adresse` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `longi` varchar(40) NOT NULL,
  `lat` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`id`, `libelle`, `adresse`, `photo`, `longi`, `lat`) VALUES
(1, 'Richard', '20274 Rieder Hill', 'Green', '112', '26'),
(2, 'Tina', '70 Granby Drive', 'Mauv', '125', '12'),
(3, 'John', '57 Debra Alley', 'Puce', '137', '37'),
(4, 'Peter', '383 Continental Way', 'Green', '121', '30'),
(5, 'Sara', '23182 Browning Park', 'Fuscia', '113', '34'),
(6, 'creperie', '7 rue bingbing 92310', NULL, '2.3699', '2.15'),
(62, 'testlibelle', 'Freiburg', NULL, '7.7166999999999994', '47.98329833333334'),
(72, 'rumba', 'Paris', NULL, '2.2717165068103413', '48.828828828828826'),
(55, 'testlibelle', 'Mantes-la-Jolie', NULL, '1.7166983333333334', '48.98329833333334'),
(50, 'testlibelle', 'Aubergenville', NULL, '1.85002142', '48.97272008'),
(74, 'testlibelle', '', NULL, '56.2', '2.56'),
(73, 'aybr', 'Aubergenville', NULL, '1.84330004', '48.95857073'),
(60, 'testlibelle', 'Moncaup', NULL, '0.7167', '42.98329833333334'),
(71, 'dalam', 'Boulogne-Billancourt', NULL, '2.244346428415036', '48.828828828828826'),
(75, 'testlibelle', '', NULL, '56.2', '2.56'),
(76, 'testlibelle', '', NULL, '56.2', '2.56'),
(77, 'CAMPUS', '10 rue Sextius Michel, Paris, 75015', NULL, '2.2885588', '48.8511759'),
(78, 'testlibelle', '', NULL, '56.2', '2.56'),
(79, 'maison', '6 villa picardie, 78410, aubergenville', NULL, '1.8428776', '48.9588935'),
(80, 'testlibelle', '', NULL, '56.2', '2.56'),
(81, 'testlibelle', '', NULL, '56.2', '2.56'),
(82, 'taer', 'Paris', NULL, '2.299913714218716', '48.846846846846844'),
(83, 'testtt', 'Paris', NULL, '2.2725337890494455', '48.846846846846844'),
(87, 'creperieIos', 'San Francisco', NULL, '-122.406417', '37.785834'),
(88, 'creperieios', 'Boulogne-Billancourt', NULL, '2.24911674857349', '48.8330688793667'),
(89, 'iosios', 'Boulogne-Billancourt', NULL, '2.24714927903848', '48.8328509619776'),
(90, 'testavantpushios', 'San Francisco', NULL, '-122.406417', '37.785834'),
(91, 'test', 'Paris', NULL, '2.2874271590284', '48.8521488989227');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `tel` varchar(10) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `longi` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `tel`, `pseudo`, `mdp`, `mail`, `longi`, `lat`) VALUES
(1, 'Pierce', 'Amy', '0657453648', 'Amy_Pierce', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'apierce0@simplemachines.org', 2.28759, 8.8627),
(2, 'Weaver', 'Earl', '0612131454', 'Earl-Weaver', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'lola@lol.coma', 2.309, 48.891),
(3, 'Jose', 'Austin', '0757453648', 'JoseA', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'jaustin2@usnews.com', 2.28693, 48.8523),
(4, 'Ro', 'Tina', '0102030405', 'tinaR', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'tina@test.fr', 2.28756, 48.8523),
(5, 'AdminNoma', 'AdminPrenoms', '0102030405', 'admin', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'testadmin@test.fra', 9.8187, 4.3275),
(6, 'Burton', 'Paul', '0512365989', 'paul', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'paul@laposte.fr', 0.7415, 2.2153),
(7, 'Toupe', 'Quentin', '0602677213', 'quentin45', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'QuentinT45@free.fr', 4.892, 11.5449),
(8, 'Zoro', 'Daniel', '0602677216', 'ZoroDaniel', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'zoro@test.fr', 1.474, 1.2304),
(9, 'Zokodo', 'Celine', '0602677259', 'zokodoC', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'zokodo@cel.fr', -4.0059, 0.7128),
(129, '', '', '0661250577', 'Sindy', '479e16b18f8153464de3b2b846199fd9', 'testSindy@gmail.com', NULL, NULL),
(126, '', '', '0696969696', 'zoro', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'ff@gh.j', NULL, NULL),
(127, 'testnom', 'testprenom', '0605050505', 'kheyou', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'tarace@gmal.a', NULL, NULL),
(128, '', '', '0033734268', 'SindyTest', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'sindyTest@test.fr', NULL, NULL),
(130, '', '', '0602677585', 'testzoro', '7f4ea55b64e1e524e6051afc1af63665', 'djsj@k.fr', NULL, NULL),
(131, 'testnom', 'testprenom', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', 2.28735, 48.8521),
(132, 'testnom', 'testprenom', '08565464', 'test', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'snsbs', 2.28732, 48.8521);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

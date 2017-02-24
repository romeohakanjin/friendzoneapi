-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 24 Février 2017 à 14:11
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `friendzone`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Share_Pos` (IN `idUser` INT(255))  BEGIN    
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

CREATE TABLE `amis` (
  `id` int(11) NOT NULL,
  `partage_position` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `amis`
--

INSERT INTO `amis` (`id`, `partage_position`, `id_user`, `id_ami`) VALUES
(3, 0, 2, 1),
(4, 0, 2, 3),
(5, 0, 3, 5),
(6, 1, 3, 2),
(10, 1, 5, 3),
(11, 1, 4, 1),
(12, 1, 1, 4),
(13, 1, 4, 5),
(14, 1, 5, 4),
(15, 0, 4, 2),
(16, 0, 2, 4),
(19, 0, 4, 1),
(20, 1, 1, 4),
(25, 1, 4, 2),
(26, 0, 2, 4),
(37, 0, 8, 5),
(38, 1, 5, 8),
(39, 0, 5, 2),
(40, 0, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id` int(11) NOT NULL,
  `id_lieu` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`id`, `id_lieu`, `id_user`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `pos_y` int(11) NOT NULL,
  `pos_x` int(11) NOT NULL,
  `pos_z` int(11) NOT NULL,
  `longi` int(11) NOT NULL,
  `lat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`id`, `libelle`, `adresse`, `photo`, `pos_y`, `pos_x`, `pos_z`, `longi`, `lat`) VALUES
(1, 'Richard', '20274 Rieder Hill', 'Green', 0, 0, 0, 112, 26),
(2, 'Tina', '70 Granby Drive', 'Mauv', 0, 0, 0, 125, 12),
(3, 'John', '57 Debra Alley', 'Puce', 0, 0, 0, 137, 37),
(4, 'Peter', '383 Continental Way', 'Green', 0, 0, 0, 121, 30),
(5, 'Sara', '23182 Browning Park', 'Fuscia', 0, 0, 0, 113, 34);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `tel` int(10) UNSIGNED ZEROFILL NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `longi` float DEFAULT NULL,
  `lat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `tel`, `pseudo`, `mdp`, `mail`, `longi`, `lat`) VALUES
(1, 'Pierce', 'Amy', 0657453648, 'Amy_Pierce', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'apierce0@simplemachines.org', 63, 61),
(2, 'Weaver', 'Earl', 0657453699, 'Earl-Weaver', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'eweaver1@theguardian.com', 116, 40),
(3, 'Jose', 'Austin', 0757453648, 'JoseA', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'jaustin2@usnews.com', 116, 24),
(4, 'Romero', 'Tina', 0657000648, 'tinaR', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'tromero3@mozilla.com', -0.127758, 51.5074),
(5, 'AdminNom', 'AdminPrenom', 0787453648, 'admin', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'admin@admin.fr', 5.36978, 43.2965),
(6, 'Burton', 'Paul', 0512365989, 'paul', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'paul@laposte.fr', 4.25, 40.235),
(7, 'Toupe', 'Quentin', 0602677213, 'quentin45', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'QuentinT45@free.fr', 2.69654, 65.32),
(8, 'Zoro', 'Daniel', 0602677216, 'ZoroDaniel', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'zoro@test.fr', 1.26874, 23.1564),
(9, 'Zokodo', 'Celine', 0602677259, 'zokodoC', 'b9ece18c950afbfa6b0fdbfa4ff731d3', 'zokodo@cel.fr', -4.65, 12.2541);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `amis`
--
ALTER TABLE `amis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK01` (`id_user`),
  ADD KEY `FK02` (`id_ami`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lieu` (`id_lieu`),
  ADD KEY `fk_user` (`id_user`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `amis`
--
ALTER TABLE `amis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT pour la table `appartient`
--
ALTER TABLE `appartient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `amis`
--
ALTER TABLE `amis`
  ADD CONSTRAINT `FK01` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK02` FOREIGN KEY (`id_ami`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 24 Février 2017 à 14:24
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `friendzone`
--

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
(37, 0, 31, 5),
(38, 1, 5, 31),
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
(1, 'Amy', 'Pierce', 0000000007, 'Amy Pierce', '3cc992572636f5216ac8eeb26ed536eb', 'apierce0@simplemachines.org', 63, 61),
(2, 'Earl', 'Weaver', 0000000086, 'Earl Weaver', '44a03e7f33dd14cb39368637d2e10992', 'eweaver1@theguardian.com', 116, 40),
(3, 'Jose', 'Austin', 0000000086, 'Jose Austin', 'ac89cc6a4ff4f90b99dcb58a882b338d', 'jaustin2@usnews.com', 116, 24),
(4, 'Tina', 'Romero', 0000000395, 'vertigo', '098f6bcd4621d373cade4e832627b4f6', 'tromero3@mozilla.com', -0.127758, 51.5074),
(5, 'Jason', 'HernandezEE', 0000000380, 'admina', '098f6bcd4621d373cade4e832627b4f6', 'admin@admin.fr', 5.36978, 43.2965),
(29, 'pasdechamp', 'pasdechamp', 0512365989, 'jkioj', '1a02c8481916a0bbce30eeaee362e7da', 'ijo@jj.fr', 4.25, 40.235),
(30, 'fds', 'fdsfsd', 0602677213, 'zalondaz', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'zgir@gfd.fr', 2.69654, 65.32),
(31, 'pasdechamp', 'pasdechamp', 0602677216, 'zolondo', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'hakaj@zgzeg.fr', 1.26874, 23.1564),
(32, 'pasdechamp', 'pasdechamp', 0602677259, 'zokodo', '2c9341ca4cf3d87b9e4eb905d6a3ec45', 'gfdg@fze.fr', -4.65, 12.2541);

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
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

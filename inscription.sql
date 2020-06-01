-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 29 mai 2020 à 15:09
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `inscription`
--

-- --------------------------------------------------------

--
-- Structure de la table `a_calculer_avec_ki`
--

DROP TABLE IF EXISTS `a_calculer_avec_ki`;
CREATE TABLE IF NOT EXISTS `a_calculer_avec_ki` (
  `quantité` int(11) NOT NULL,
  `fk_id_ki` int(11) NOT NULL,
  `fk_ki` varchar(45) NOT NULL,
  KEY `fk_ki` (`fk_ki`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `a_calculer_avec_nu`
--

DROP TABLE IF EXISTS `a_calculer_avec_nu`;
CREATE TABLE IF NOT EXISTS `a_calculer_avec_nu` (
  `fk_nu` double NOT NULL,
  `fk_id_nu` int(11) NOT NULL,
  `quantité` int(11) NOT NULL,
  KEY `fk_nu` (`fk_nu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `a_calculer_avec_re`
--

DROP TABLE IF EXISTS `a_calculer_avec_re`;
CREATE TABLE IF NOT EXISTS `a_calculer_avec_re` (
  `fk_re` double NOT NULL,
  `fk_id_re` int(11) NOT NULL,
  `quantité` int(11) NOT NULL,
  KEY `fk_re` (`fk_re`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `identifiant`
--

DROP TABLE IF EXISTS `identifiant`;
CREATE TABLE IF NOT EXISTS `identifiant` (
  `id_matricule` int(11) UNSIGNED NOT NULL,
  `id_nom` varchar(45) NOT NULL,
  `id_prenom` varchar(45) NOT NULL,
  `id_sexe` tinyint(1) NOT NULL,
  `id_naissance` date NOT NULL,
  `id_mail` varchar(45) NOT NULL,
  `id_tel` char(10) NOT NULL,
  `id_mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`id_matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `identifiant`
--

INSERT INTO `identifiant` (`id_matricule`, `id_nom`, `id_prenom`, `id_sexe`, `id_naissance`, `id_mail`, `id_tel`, `id_mdp`) VALUES
(1, 'carvalho', 'yohan', 0, '2001-01-15', 'yopirate01@gmail.com', '0782652322', '15012001');

-- --------------------------------------------------------

--
-- Structure de la table `remboursement_kilométrage`
--

DROP TABLE IF EXISTS `remboursement_kilométrage`;
CREATE TABLE IF NOT EXISTS `remboursement_kilométrage` (
  `ki_véhicule` varchar(45) NOT NULL,
  `ki_prix_km` double NOT NULL,
  PRIMARY KEY (`ki_véhicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `remboursement_nuitée`
--

DROP TABLE IF EXISTS `remboursement_nuitée`;
CREATE TABLE IF NOT EXISTS `remboursement_nuitée` (
  `nu_unité` double NOT NULL,
  PRIMARY KEY (`nu_unité`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `remboursement_repas`
--

DROP TABLE IF EXISTS `remboursement_repas`;
CREATE TABLE IF NOT EXISTS `remboursement_repas` (
  `re_unite` double NOT NULL,
  PRIMARY KEY (`re_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `a_calculer_avec_ki`
--
ALTER TABLE `a_calculer_avec_ki`
  ADD CONSTRAINT `fk_ki` FOREIGN KEY (`fk_ki`) REFERENCES `remboursement_kilométrage` (`ki_véhicule`);

--
-- Contraintes pour la table `a_calculer_avec_nu`
--
ALTER TABLE `a_calculer_avec_nu`
  ADD CONSTRAINT `fk_nu` FOREIGN KEY (`fk_nu`) REFERENCES `remboursement_nuitée` (`nu_unité`);

--
-- Contraintes pour la table `a_calculer_avec_re`
--
ALTER TABLE `a_calculer_avec_re`
  ADD CONSTRAINT `fk_re` FOREIGN KEY (`fk_re`) REFERENCES `remboursement_repas` (`re_unite`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

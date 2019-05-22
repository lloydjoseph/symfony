-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 22 mai 2019 à 22:40
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pokemon_battle`
--

-- --------------------------------------------------------

--
-- Structure de la table `attack`
--

CREATE TABLE `attack` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `power` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attack`
--

INSERT INTO `attack` (`id`, `created_at`, `updated_at`, `deleted_at`, `enabled`, `name`, `power`, `type`) VALUES
(33, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Flammèche', 20, 1),
(34, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Hydrocanon', 25, 2),
(35, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Charge', 10, 4),
(36, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'TranchHerbe', 20, 3);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190522103604', '2019-05-22 10:36:12'),
('20190522120832', '2019-05-22 12:08:42');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `created_at`, `updated_at`, `deleted_at`, `enabled`, `name`, `type`, `hp`) VALUES
(25, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Arcko', 3, 60),
(26, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Poussifeu', 1, 60),
(27, '2019-05-22 22:30:02', '2019-05-22 22:30:02', NULL, 1, 'Gobou', 2, 60);

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_attack`
--

CREATE TABLE `pokemon_attack` (
  `pokemon_id` int(11) NOT NULL,
  `attack_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon_attack`
--

INSERT INTO `pokemon_attack` (`pokemon_id`, `attack_id`) VALUES
(25, 35),
(25, 36),
(26, 33),
(26, 35),
(27, 34),
(27, 35);

-- --------------------------------------------------------

--
-- Structure de la table `potion`
--

CREATE TABLE `potion` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strength` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `potion`
--

INSERT INTO `potion` (`id`, `name`, `strength`) VALUES
(25, 'Potion', 20),
(26, 'Super Potion', 30),
(27, 'Hyper Potion', 50);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `role`, `pass`) VALUES
(11, 'Sacha', 'ROLE_USER', 'OndineLove'),
(12, 'Admin', 'ROLE_ADMIN', 'Admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `attack`
--
ALTER TABLE `attack`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pokemon_attack`
--
ALTER TABLE `pokemon_attack`
  ADD PRIMARY KEY (`pokemon_id`,`attack_id`),
  ADD KEY `IDX_2B29516F2FE71C3E` (`pokemon_id`),
  ADD KEY `IDX_2B29516FF5315759` (`attack_id`);

--
-- Index pour la table `potion`
--
ALTER TABLE `potion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attack`
--
ALTER TABLE `attack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `potion`
--
ALTER TABLE `potion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pokemon_attack`
--
ALTER TABLE `pokemon_attack`
  ADD CONSTRAINT `FK_2B29516F2FE71C3E` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2B29516FF5315759` FOREIGN KEY (`attack_id`) REFERENCES `attack` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 03 jan. 2023 à 16:10
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test2jnm`
--

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

CREATE TABLE `activites` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`id`, `titre`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Le Gala', 'Nous vous attendons nombreux le 7 juin 2018 au Casino la Siesta à partir de 19h, pour la plus grande soirée miagiste de l\'année ! Au programme : 19h : Cocktail de bienvenue + photo call - 20h15 : Dîner de Gala + spectacle de mentalisme - 23h : Soirée de Gala - Et pleins d\'autres surprises !', 'Le gala.png', '2023-01-02 14:28:33', '2023-01-03 09:25:31'),
(2, '1000 euros de prix, pour 3 minutes de présentation !', 'Vous devrez préparer un speech sur un service innovant mélangeant objets connectés et/ou exploitation des données et développement durable, et le présenter le jeudi 7 après-midi lors des JNM aux représentants du département des Alpes Maritimes. Attention, il faut s\'inscrire par mail !', '1000euro.webp', '2023-01-02 14:30:23', '2023-01-03 09:26:42'),
(3, 'new', 'new activite', 'miru.jpg', '2023-01-03 11:02:21', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `concours_video`
--

CREATE TABLE `concours_video` (
  `id` int(11) NOT NULL,
  `titre_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `miage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `concours_video`
--

INSERT INTO `concours_video` (`id`, `titre_video`, `miage`) VALUES
(1, 'mov_bbb.mp4', 'Dauphine');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230102134319', '2023-01-02 13:43:33', 200),
('DoctrineMigrations\\Version20230103101301', '2023-01-03 10:13:15', 229);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `miage`
--

CREATE TABLE `miage` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `miage`
--

INSERT INTO `miage` (`id`, `nom`) VALUES
(1, 'Nanterre'),
(2, 'Saclay'),
(3, 'Dauphine'),
(4, 'Sorbonne Pantheon'),
(5, 'Toulouse'),
(6, 'Nice');

-- --------------------------------------------------------

--
-- Structure de la table `transport`
--

CREATE TABLE `transport` (
  `id` int(11) NOT NULL,
  `nom_transport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transport`
--

INSERT INTO `transport` (`id`, `nom_transport`, `tarif`) VALUES
(1, 'Forfait Navigo Jour', 7),
(2, 'Forfait Navigo Jeunes', 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `miage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_logement` int(11) DEFAULT NULL,
  `id_transport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `miage`, `id_logement`, `id_transport`) VALUES
(1, 'test1@mail.com', 'ROLE_ADMIN', '$2y$13$P5NboYh6YgOsK8wHws0/oeriGGUWThzspUeS2vGG6xevdtF350o7y', 'test1', 'test1', 'Nanterre', NULL, NULL),
(2, 'test2@mail.com', 'ROLE_BDE', '$2y$13$RVKYUD1TGCIFTNifrw8QwOmRiWDHGihICMthp7vzmLcqEoiwzG6sW', 'test2', 'test2', 'nanterre', NULL, NULL),
(3, 'test3@mail.com', 'ROLE_BDE', '$2y$13$RVKYUD1TGCIFTNifrw8QwOmRiWDHGihICMthp7vzmLcqEoiwzG6sW', 'test3', 'test3', 'nanterre', NULL, NULL),
(4, 'test4@mail.com', 'ROLE_USER', '$2y$13$1b/oIYbGP2qSIE6621ShruXuXMggl2qfbHsTITnTJn7L.dbbB3y/K', 'test4', 'test4', 'Dauphine', NULL, NULL),
(5, 'test5@mail.com', 'ROLE_USER', '$2y$13$fxyK92G5z8cGyJWmt1nO3.4IB28iKhk2d49utdjvdZzNHYVfSSp2G', 'test5', 'test5', 'Dauphine', NULL, NULL),
(6, 'non.enim@icloud.ca', 'ROLE_USER', '$2y$13$VN/ey0AKT3/jLRFX1sqwpOczvqV5Es2J9TSVlqM0s2O2DNpFyZmXG', 'Avila', 'Reuben', 'Dauphine', NULL, NULL),
(7, 'id.blandit.at@aol.ca', 'ROLE_USER', '$2y$13$syhNT5Gr9zZ.1/k1fo74QOMgAOAxUVJkc0ZV.6nL23UUdrADMbvSO', 'Page', 'Eric', 'Nanterre', NULL, NULL),
(8, 'commodo.ipsum.suspendisse@hotmail.couk', 'ROLE_USER', '$2y$13$MSS.7JIUAdMvDNozI4APAOT3GRdknjSUisZT8s7oBH.4cktZks/oC', 'Sweeney', 'Caryn', 'Sorbonne Pantheon', NULL, NULL),
(9, 'a.scelerisque@hotmail.couk', 'ROLE_USER', '$2y$13$ZWjzZYu4PvWiLHEHZkrWfOu62WUY8vyBZQUiI.ovDqDHctD.RWNwi', 'Copeland', 'Mannix', 'Dauphine', NULL, NULL),
(10, 'eleifend.nec@aol.edu', 'ROLE_BDE', '$2y$13$6G5xCxbvGvzyaV3ufDrJfOZih425ezszQqyL97/hBzglot/hQ3TSS', 'Wright', 'Merritt', 'Nanterre', NULL, NULL),
(11, 'sit.amet@icloud.net', 'ROLE_USER', '$2y$13$RlI71MxtYTtM/H/Gn1OW7eW1P5YJLPv1SDpbXWJ3M5ebE7tTNziAy', 'Edwards', 'Clayton', 'Nice', NULL, NULL),
(12, 'tincidunt.donec@aol.ca', 'ROLE_USER', '$2y$13$Ru3yND04FmlAN1ilnoqK3OF1RqD32kTH8GxDPXthnDP.nhiPDVPO2', 'Calhoun', 'Jael', 'Universite de Paris', NULL, NULL),
(13, 'libero.at@google.org', 'ROLE_ADMIN', '$2y$13$z8CFxDvfWJimkzy1ubOHz.N0yB5s8d4IBPpSV.JIRGBTsxlYD8c1q', 'Lawson', 'Price', 'Nanterre', NULL, NULL),
(14, 'semper.et.lacinia@google.net', 'ROLE_USER', '$2y$13$TPqQLgsUPxXiJZ1nGjFO2udTPNwj1RezQHyN5Dm/FC03AKFw0Nscm', 'Hopkins', 'Hammett', 'Saclay', NULL, NULL),
(15, 'ut.semper@outlook.edu', 'ROLE_USER', '$2y$13$9hLZtQ9HTVXMEJNwxhE7vO9hKnPvaPhif7k6mW35vDfyA2sRivI/S', 'Barrera', 'Bethany', 'Dauphine', NULL, NULL),
(16, 'sit@protonmail.edu', 'ROLE_USER', '$2y$13$I7cfNNDZQZsjKXwPEpfb0uyHpato6k5E3JEyCtXNQuQvXkfqrOM2G', 'Franco', 'Raya', 'Sorbonne Pantheon', NULL, NULL),
(17, 'lobortis@google.net', 'ROLE_USER', '$2y$13$Fg1tOs0PWAogChH6sAXu1.VujtbcDdpr2UJoNMZIhM7SyPir8hkFu', 'Ratliff', 'Colton', 'Nanterre', NULL, NULL),
(18, 'mus.donec@aol.edu', 'ROLE_ADMIN', '$2y$13$SZ9kXn1.LpFIxvram7aWzuRCv0mP7iCpzrY6oAr.2CxW/baPtAsH6', 'Singleton', 'Kim', 'Nanterre', NULL, NULL),
(19, 'tristique.pharetra@aol.org', 'ROLE_ADMIN', '$2y$13$av4SBrV5zQ4Fa7gDhKuj3uDrqd.FltXox76s/GaL9n/KKwFgmcI0C', 'Burks', 'Olivia', 'Nanterre', NULL, NULL),
(20, 'ligula.aenean@yahoo.net', 'ROLE_USER', '$2y$13$m9IBUctcv7UyCPfy8pXFOOEBtfluI81/HoXYjr1CFhxDdjeJWRzEq', 'Chan', 'Rana', 'Dauphine', NULL, NULL),
(21, 'arcu.aliquam.ultrices@aol.ca', 'ROLE_BDE', '$2y$13$tN.qEU0hLFGKojmiuTs9pe2HDBW/19zVU8DH1KiCk.bdsDCPvIJKO', 'Lang', 'Zeph', 'Nanterre', NULL, NULL),
(22, 'eu.turpis@aol.couk', 'ROLE_USER', '$2y$13$4fmlRhKF6Bm3VEvKB8/dfe7z.ip365R/ZjTKYHVoHp85i8pKy49YK', 'Guy', 'Macon', 'Toulouse', NULL, NULL),
(23, 'sollicitudin.orci.sem@protonmail.org', 'ROLE_USER', '$2y$13$wtknCOowkcM90PbS58TTC.gRub1ltODR455HphsJnkpNVSdZD9H4y', 'Padilla', 'Carol', 'Saclay', NULL, NULL),
(24, 'phasellus.in@aol.ca', 'ROLE_USER', '$2y$13$Ybx/c3gWQhJphA1yOaTTtuzbwY/5sNqDgObvzdMket.zqPNekpoxm', 'Leach', 'Abel', 'Nanterre', NULL, NULL),
(25, 'test@gmail.com', 'ROLE_USER', '$2y$13$UKujcMt3uu/JEtR09xCA5.GtHohvHM17LFXymH3ggQ7sjYpAyf2Nu', 'toto', 'titit', 'Nanterre', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activites`
--
ALTER TABLE `activites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `concours_video`
--
ALTER TABLE `concours_video`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `miage`
--
ALTER TABLE `miage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activites`
--
ALTER TABLE `activites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `concours_video`
--
ALTER TABLE `concours_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `miage`
--
ALTER TABLE `miage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 05 août 2022 à 13:12
-- Version du serveur :  5.7.24
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `movies_data_base`
--

-- --------------------------------------------------------

--
-- Structure de la table `castings`
--

CREATE TABLE `castings` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `about` text NOT NULL,
  `birthdate` date NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `castings`
--

INSERT INTO `castings` (`id`, `firstname`, `lastname`, `sex`, `about`, `birthdate`, `type`) VALUES
(1, 'Patrick', 'Sueyze', 0, 'Fiche descriptif de Patrick Sueyze', '2021-08-17', 1),
(2, 'jared', 'leto', 0, 'Fiche descript Jared Leto', '2022-08-01', 1),
(3, 'charlize', 'theron', 1, 'Fiche technique charlize theron', '2022-08-09', 1),
(4, 'ellen', 'pompeo', 1, 'fiche tech ellen pompeo', '2022-08-06', 1),
(5, 'steven', 'spielberg', 0, 'fiche tech steven spielberg', '2022-03-06', 2),
(6, 'Patty', 'jenkins', 1, 'fiche tech patty jenkins', '2022-05-10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `casting_types`
--

CREATE TABLE `casting_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `casting_types`
--

INSERT INTO `casting_types` (`id`, `name`) VALUES
(1, 'ACTEUR'),
(2, 'REALISATEUR');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'FANTASTIQUE'),
(2, 'SCIENCE-FICTION'),
(3, 'COMEDIE'),
(4, 'COMEDIE ROMANTIQUE'),
(5, 'HORREUR'),
(6, 'ACTION'),
(7, 'AVENTURE');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `runtime` int(11) NOT NULL,
  `description` text NOT NULL,
  `release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `title`, `image_url`, `runtime`, `description`, `release_date`) VALUES
(1, 'THOR: LOVE AND THUNDER\r\n', 'image.jpg', 2000, 'Alors que Thor est en pleine introspection et en quête de sérénité, sa retraite est interrompue par un tueur galactique connu sous le nom de Gorr, qui s’est donné pour mission d’exterminer tous les dieux. Pour affronter cette menace, Thor demande l’aide de Valkyrie, de Korg et de son ex-petite amie Jane Foster, qui, à sa grande surprise, manie inexplicablement son puissant marteau, le Mjolnir. Ensemble, ils se lancent dans une dangereuse aventure cosmique pour comprendre les motivations qui poussent Gorr à la vengeance et l’arrêter avant qu’il ne soit trop tard.\r\n', '2022-08-04'),
(2, 'MENTEUR', 'image1.jpg', 1300, 'Jérôme est un menteur compulsif. Sa famille et ses amis ne supportent plus ses mensonges quotidiens. Ils font tout pour qu’il change d’attitude. N’écoutant pas ce qu’on lui reproche, Jérôme s’enfonce de plus en plus dans le mensonge jusqu’au jour où une malédiction divine le frappe : tous ses mensonges prennent vie. Commence alors pour lui un véritable cauchemar.\r\n', '2022-07-13'),
(3, 'MORBIUS\r\n', 'image1.jpg', 1450, 'Découvrez pour la première fois au cinéma, le Docteur Michael Morbius (incarné par l’acteur oscarisé Jared Leto), anti héros énigmatique et l’un des personnages les plus captivants et torturés des personnages de Marvel dans l’univers Sony Pictures.\r\n\r\nGravement atteint d’une rare maladie sanguine, et déterminé à sauver toutes les victimes de cette pathologie, le Dr Morbius tente un pari désespéré. Alors que son expérience semble être un succès, le remède déclenche un effet sinistre. Le bien vaincra-t-il le mal – ou Morbius succombera-t-il à ses nouvelles pulsions ?', '2022-03-30');

-- --------------------------------------------------------

--
-- Structure de la table `movies_genres`
--

CREATE TABLE `movies_genres` (
  `movies_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `movies_genres`
--

INSERT INTO `movies_genres` (`movies_id`, `genres_id`) VALUES
(1, 6),
(1, 7),
(1, 2),
(1, 1),
(2, 3),
(3, 6),
(3, 5),
(3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `castings`
--
ALTER TABLE `castings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Index pour la table `casting_types`
--
ALTER TABLE `casting_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD KEY `movies_id` (`movies_id`),
  ADD KEY `genres_id` (`genres_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `castings`
--
ALTER TABLE `castings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `casting_types`
--
ALTER TABLE `casting_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `castings`
--
ALTER TABLE `castings`
  ADD CONSTRAINT `castings_ibfk_1` FOREIGN KEY (`type`) REFERENCES `casting_types` (`id`);

--
-- Contraintes pour la table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD CONSTRAINT `movies_genres_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movies_genres_ibfk_2` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

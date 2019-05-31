-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 27 mai 2019 à 08:49
-- Version du serveur :  8.0.15
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `all_performance_seats`
--

DROP TABLE IF EXISTS `all_performance_seats`;
CREATE TABLE IF NOT EXISTS `all_performance_seats` (
  `all_performance_seats_id` int(11) NOT NULL AUTO_INCREMENT,
  `all_performance_seats_date` datetime DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`all_performance_seats_id`),
  KEY `cinema_id2_idx` (`cinema_id`),
  KEY `room_id2_idx` (`room_id`),
  KEY `booking_id_idx` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `booked_performance_seats`
--

DROP TABLE IF EXISTS `booked_performance_seats`;
CREATE TABLE IF NOT EXISTS `booked_performance_seats` (
  `booked_performance_id` int(11) NOT NULL AUTO_INCREMENT,
  `booked_performance_number` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booked_performance_id`),
  KEY `cinema_id_idx` (`cinema_id`),
  KEY `room_id3_idx` (`room_id`),
  KEY `booking_id3_idx` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_for_date` varchar(45) DEFAULT NULL,
  `booking_made_date` varchar(45) DEFAULT NULL,
  `booking_seat_count` varchar(45) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `customer_id2_idx` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
CREATE TABLE IF NOT EXISTS `cinemas` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(45) DEFAULT NULL,
  `cinema_manager` varchar(45) DEFAULT NULL,
  `cinema_adress` varchar(45) DEFAULT NULL,
  `cinema_phone` varchar(45) DEFAULT NULL,
  `cinema_seat_capacity` varchar(45) DEFAULT NULL,
  `customers_other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cinemas`
--

INSERT INTO `cinemas` (`cinema_id`, `cinema_name`, `cinema_manager`, `cinema_adress`, `cinema_phone`, `cinema_seat_capacity`, `customers_other_details`) VALUES
(1, 'MichMuch Cinema', 'Melanie', '4 rue Grand Palais 7833A FR', '0938144213', '400', NULL),
(2, 'MichMuch 2 Cinema', 'Ronan ', '51 Street Kenghston NZA344 UK', '04281814225', '600', NULL),
(3, 'MichMuch 3', 'Alexander', '87 Some Where UK', '066272582', '500', NULL),
(4, 'MichMuch 4', 'Solansh', '11 Rond point Bosredon 04982 Toulouse', '049827582', '650', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_phone_number` varchar(45) DEFAULT NULL,
  `customer_card_details` varchar(45) DEFAULT NULL,
  `customer_other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone_number`, `customer_card_details`, `customer_other_details`) VALUES
(1, 'Charles Seventh', '0119424828', '', 'Autre'),
(3, 'Charles Seventh', '0749825272', '09111 3418', NULL),
(5, 'Alex Dicaprio', '0294921242', NULL, 'Me contacter par sms'),
(6, 'Wilfried Johanson', '0198381131', NULL, 'Ok'),
(7, 'Jason Statam', '0249288124', NULL, 'OK'),
(8, 'Elisabeth Statam', '039911881', NULL, 'Ok femme');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(45) DEFAULT NULL,
  `movie_synopsis` varchar(600) DEFAULT NULL,
  `movie_trailer` varchar(45) DEFAULT NULL,
  `movie_actor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`movie_id`, `movie_name`, `movie_synopsis`, `movie_trailer`, `movie_actor`) VALUES
(1, 'Avengers', 'Alors que les Avengers et leurs alliés ont continué de protéger le monde face à des menaces bien trop grandes pour être combattues par un héros seul, un nouveau danger est venu de l\'espace : Thanos. Despote craint dans tout l\'univers, Thanos a pour objectif de recueillir les six Pierres d\'Infinité, des artefacts parmi les plus puissants de l\'univers, et de les utiliser afin d\'imposer sa volonté sur toute la réalité. Tous les combats que les Avengers ont menés culminent dans cette bataille.', 'Nouveau film', 'jason statam.'),
(2, 'Captain Marvel', 'Captain Marvel raconte l\'histoire de Carol Danvers qui va devenir l\'une des super-héroïnes les plus puissantes de l\'univers lorsque la Terre se révèle l\'enjeu d\'une guerre galactique entre deux races extraterrestres.', 'Super', 'Brie Larson, Samuel L.Jackson'),
(3, 'Glass', 'Peu de temps après les événements relatés dans Split, David Dunn, l\'homme incassable, poursuit sa traque de La Bête, surnom donné à Kevin Crumb depuis qu\'on le sait capable d\'endosser 23 personnalités différentes. De son côté, le mystérieux homme souffrant du syndrome des os de verre Elijah Price suscite à nouveau l\'intérêt des forces de l\'ordre en affirmant détenir des informations capitales sur les deux hommes.', 'OK', 'James MacAvoy'),
(4, 'Toy Story 4', 'Woody a toujours privilégié la joie de ses jeunes propriétaires - Andy puis Bonnie - et de ses compagnons, n\'hésitant pas à prendre tous les risques pour eux, aussi inconsidérés soient-ils. L\'arrivée de Forky un nouveau jouet qui ne veut pas en être un met toute la petite bande en émoi.', 'OK ok', 'Tom Hanks'),
(5, 'John Wichk 3', '*John Wick* contre le reste du monde. Un troisième volet qui force sur une violence inouïe, un déluge de douilles et de coups de poing. *Keanu Reeves* se glisse une nouvelle fois dans la peau du tueur à gage. De laction sanglante et dégoulinante.', 'Well', 'Keanu Reeves'),
(6, 'Stars Wars7', 'Plus de 30 ans après la bataille d\'Endor, qui a vu la chute de l\'Empire galactique, la paix et la nouvelle république sont encore fragiles. Les nostalgiques de l\'ancien régime, rassemblés sous la bannière du Premier Ordre, tentent de reprendre la main sur la force. A leur tête, le sinistre Kylo Ren lance des attaques pirates aux confins de la galaxie.', 'Good', 'Annakim Annwalker'),
(7, 'Le roi lion', 'Au fond de la savane africaine, tous les animaux célèbrent la naissance de Simba, leur futur roi. Les mois passent. Simba idolâtre son père, le roi Mufasa, qui prend à coeur de lui faire comprendre les enjeux de sa royale destinée. Mais tout le monde ne semble pas de cet avis. Scar, le frère de Mufasa, l\'ancien héritier du trône, a ses propres plans. La bataille pour la prise de contrôle de la Terre des Lions est ravagée par la trahison, la tragédie et le drame, ce qui finit par entraîner l\'exil de Simba. ', '2019', 'Donald Glover'),
(8, 'Godzilla 2', 'L\'agence crypto-zoologique Monarch doit faire face à une vague de monstres titanesques, comme Godzilla, Mothra, Rodan et surtout le redoutable roi Ghidorah à trois têtes. Un combat sans précédent entre ces créatures considérées jusque-là comme chimériques menace d\'éclater.', '019', 'Millie Bobby Brown'),
(9, 'The Tomorrow Man', 'The Tomorrow Man. The Tomorrow Man is a 2019 American drama film, written and directed by Noble Jones, in his directorial debut. It stars John Lithgow, Blythe Danner, Derek Cecil, Katie Aselton, Sophie Thatcher, and Eve Harlow.', NULL, 'Sophie Thatcher'),
(10, 'The Perfect Date', 'To save up for college, Brooks Rattigan creates an app where anyone can pay him to play the perfect stand-in boyfriend for any occasion. Brooks Rattigan (Noah Centineo) has the academic chops to get into his dream Ivy League school, but what he\'s missing is an outstanding extracurricular - and the money.', NULL, 'Noah Centinero'),
(11, 'Mon Inconnu', 'Du jour au lendemain, Raphaël se retrouve plongé dans un monde où il n\'a jamais rencontré Olivia, la femme de sa vie.', 'French', 'Joséphine Japy'),
(12, 'Aladin', 'Quand un charmant garçon des rues du nom d\'Aladdin cherche à conquérir le c?ur de la belle, énigmatique et fougueuse princesse Jasmine, il fait appel au tout puissant Génie, le seul qui puisse lui permettre de réaliser trois v?ux, dont celui de devenir le prince Ali pour mieux accéder au palais..', NULL, 'Naomi Scott');

-- --------------------------------------------------------

--
-- Structure de la table `movies_comments`
--

DROP TABLE IF EXISTS `movies_comments`;
CREATE TABLE IF NOT EXISTS `movies_comments` (
  `movie_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_comment_description` varchar(300) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_comment_id`),
  KEY `movie_id_idx` (`movie_id`),
  KEY `customer_id1_idx` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movies_comments`
--

INSERT INTO `movies_comments` (`movie_comment_id`, `movie_comment_description`, `movie_id`, `customer_id`) VALUES
(1, 'Superbe film a aller voir en famille', 4, 1),
(2, 'Film assez bien réaliser, toujours le même suspense de la fin! \r\nOn adore!\r\nLa salle est très grande chez michmuch ronan', 2, 6),
(3, 'nice movie, must watch but it\'s a bit rude at the end.', 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `movie_category`
--

DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE IF NOT EXISTS `movie_category` (
  `movie_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_category_type` varchar(45) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_category_id`),
  KEY `movie_id5_idx` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie_category`
--

INSERT INTO `movie_category` (`movie_category_id`, `movie_category_type`, `movie_id`) VALUES
(1, 'Action', 3),
(2, 'Action', 5),
(3, 'Science-fiction', 1),
(4, 'Science-fiction', 2),
(5, 'Science-fiction', 6),
(6, 'Science-fiction', 8),
(7, 'Romantique', 10),
(8, 'Romantique', 11),
(9, 'Animation', 7),
(10, 'Animation', 12),
(11, 'Animation', 4),
(12, 'Dramatique', 9);

-- --------------------------------------------------------

--
-- Structure de la table `movie_showing`
--

DROP TABLE IF EXISTS `movie_showing`;
CREATE TABLE IF NOT EXISTS `movie_showing` (
  `movie_showing_id` int(11) NOT NULL AUTO_INCREMENT,
  `showing_from_date` datetime DEFAULT NULL,
  `showing_to_date` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_showing_id`),
  KEY `room_id1_idx` (`room_id`),
  KEY `movie_id3_idx` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `performances_numbers`
--

DROP TABLE IF EXISTS `performances_numbers`;
CREATE TABLE IF NOT EXISTS `performances_numbers` (
  `performances_number_id` int(11) NOT NULL,
  `performances_start_time` varchar(45) DEFAULT NULL,
  `performances_end_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`performances_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ref_movie_rating`
--

DROP TABLE IF EXISTS `ref_movie_rating`;
CREATE TABLE IF NOT EXISTS `ref_movie_rating` (
  `movie_rating` int(11) NOT NULL AUTO_INCREMENT,
  `movie_rating_description` varchar(300) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_rating`),
  KEY `movie_id_idx` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) DEFAULT NULL,
  `room_seat_capacity` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `cinema_id_idx` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `all_performance_seats`
--
ALTER TABLE `all_performance_seats`
  ADD CONSTRAINT `booking_id` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  ADD CONSTRAINT `cinema_id2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`cinema_id`),
  ADD CONSTRAINT `room_id2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Contraintes pour la table `booked_performance_seats`
--
ALTER TABLE `booked_performance_seats`
  ADD CONSTRAINT `booking_id3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  ADD CONSTRAINT `cinema_id4` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`cinema_id`),
  ADD CONSTRAINT `room_id3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `customer_id2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Contraintes pour la table `movies_comments`
--
ALTER TABLE `movies_comments`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `movie_id1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Contraintes pour la table `movie_category`
--
ALTER TABLE `movie_category`
  ADD CONSTRAINT `movie_id5` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Contraintes pour la table `movie_showing`
--
ALTER TABLE `movie_showing`
  ADD CONSTRAINT `movie_id3` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `room_id1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Contraintes pour la table `ref_movie_rating`
--
ALTER TABLE `ref_movie_rating`
  ADD CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Contraintes pour la table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`cinema_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

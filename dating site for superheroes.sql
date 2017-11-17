-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 17. 11 2017 kl. 21:46:04
-- Serverversion: 5.5.8
-- PHP-version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dating site for superheroes`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `senderid` int(20) NOT NULL,
  `recelverid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `senderid` (`senderid`),
  KEY `recelverid` (`recelverid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Data dump for tabellen `comments`
--

INSERT INTO `comments` (`id`, `content`, `senderid`, `recelverid`) VALUES
(1, 'hey babe', 1, 2),
(2, 'cool fatty', 1, 3);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `gifts`
--

CREATE TABLE IF NOT EXISTS `gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pictures` varchar(100) NOT NULL,
  `Title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Data dump for tabellen `gifts`
--

INSERT INTO `gifts` (`id`, `pictures`, `Title`) VALUES
(1, 'cake.jpg', 'Have some cake'),
(2, 'water.jpg', 'Take some water and cool down'),
(3, 'food.jpg', 'You are angry when you are hungry.');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL,
  `senderid` int(20) NOT NULL,
  `recelverid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recelverid` (`recelverid`),
  KEY `senderid` (`senderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `like`
--


-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `senderid` int(20) NOT NULL,
  `reciverid` int(11) NOT NULL,
  `sentby` varchar(100) NOT NULL,
  `sentto` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `senderid` (`senderid`),
  KEY `reciverid` (`reciverid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Data dump for tabellen `message`
--

INSERT INTO `message` (`id`, `message`, `senderid`, `reciverid`, `sentby`, `sentto`) VALUES
(1, 'Hey Pussycat do you want to meet me the sexyfire to night?', 1, 2, 'Fatty', 'Sexyfire'),
(2, 'I think Superman is more awesome than Batman. He can fly and get red eyes when mad and Batman notning.', 1, 3, 'Fatty', 'Wolverine');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL DEFAULT '',
  `Age` int(10) NOT NULL,
  `Superpowers` varchar(100) NOT NULL,
  `Pictures` text NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Number of likes` int(10) NOT NULL,
  `mailbox` text NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `user`
--

INSERT INTO `user` (`id`, `Username`, `Age`, `Superpowers`, `Pictures`, `Gender`, `Number of likes`, `mailbox`, `message_id`) VALUES
(1, 'Fatty', 20, 'I can scratch everything', 'catwoman.jpg', 'Female', 123, 'Out', 1),
(2, 'Sexyfire', 91, 'Fly, make fire', 'fire.jpg', 'Male', 10, 'In', 1),
(3, 'Wolverine', 300, 'Never die', 'wolverine.jpg', 'Male', 2147483647, 'Out', 2);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`recelverid`) REFERENCES `user` (`id`);

--
-- Begrænsninger for tabel `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`recelverid`) REFERENCES `user` (`id`);

--
-- Begrænsninger for tabel `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`reciverid`) REFERENCES `user` (`id`);

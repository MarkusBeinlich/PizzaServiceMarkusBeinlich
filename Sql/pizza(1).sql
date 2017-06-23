-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Jun 2017 um 14:42
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pizza`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL,
  `lastname` text NOT NULL,
  `firstname` text NOT NULL,
  `postcode` text,
  `town` text,
  `street` text,
  `phone` text,
  `email` text NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customerid`, `lastname`, `firstname`, `postcode`, `town`, `street`, `phone`, `email`, `creationdate`) VALUES
(1, 'B1', 'M1', NULL, NULL, NULL, NULL, 'b1', '2017-06-21 12:58:02'),
(2, 'b', 'b', NULL, NULL, NULL, NULL, 'b', '2017-06-22 06:19:54'),
(3, 'c', 'c', NULL, NULL, NULL, NULL, 'c', '2017-06-22 06:33:23'),
(4, 'd', 'd', NULL, NULL, NULL, NULL, 'd', '2017-06-22 06:52:22'),
(5, 'm', 'Markus', NULL, NULL, NULL, NULL, 'markus.beinlich@gmx.de', '2017-06-22 08:14:59'),
(6, 'x', 'x', NULL, NULL, NULL, NULL, 'x', '2017-06-22 08:20:36'),
(7, 'Beinlich', 'Markus', NULL, NULL, NULL, NULL, 'markus.beinlich@gmx.de', '2017-06-22 08:24:28'),
(8, 'p', 'p', NULL, NULL, NULL, NULL, 'p', '2017-06-22 11:01:17'),
(9, 'f', 'f', NULL, NULL, NULL, NULL, 'f', '2017-06-23 06:10:15'),
(10, 'x', 'x', NULL, NULL, NULL, NULL, 'x', '2017-06-23 11:41:55'),
(11, 'y', 'x', NULL, NULL, NULL, NULL, 'x', '2017-06-23 11:43:27'),
(12, 'x', 'x', NULL, NULL, NULL, NULL, 'x', '2017-06-23 12:00:29'),
(13, 'k', 'k', NULL, NULL, NULL, NULL, 'k', '2017-06-23 12:00:50');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menuitem`
--

CREATE TABLE `menuitem` (
  `menuitemid` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `changedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `menuitem`
--

INSERT INTO `menuitem` (`menuitemid`, `name`, `description`, `price`, `changedate`) VALUES
(1, 'Pizza Napoli', 'Tomate, Mozarella', '7.50', '2017-06-21 06:26:57'),
(2, 'Pizza Fungi', 'Tomate, Mozarella, Pilze', '7.50', '2017-06-21 06:26:57'),
(3, 'Pizza Salami', 'Tomate, Mozarella, Salami', '8.50', '2017-06-21 06:26:57'),
(4, 'Pizza Hawaii', 'Tomate, Mozarella, Ananas', '7.50', '2017-06-21 06:26:57'),
(5, 'Pizza Regina', 'Tomate, Mozarella', '7.50', '2017-06-21 06:26:57'),
(6, 'Pizza Frutti di Mare', 'Tomate, Mozarella, Meeresfrüchte', '10.50', '2017-06-21 06:26:57'),
(7, 'Eisbecher', 'alles drauf', '22.00', '2017-06-21 11:44:13');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orderentry`
--

CREATE TABLE `orderentry` (
  `orderid` int(11) NOT NULL,
  `menuitemid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `orderentry`
--

INSERT INTO `orderentry` (`orderid`, `menuitemid`, `quantity`, `amount`) VALUES
(1, 2, 1, '0.00'),
(2, 2, 1, '0.00'),
(2, 1, 1, '0.00'),
(2, 3, 1, '0.00'),
(3, 2, 1, '7.50'),
(3, 6, 2, '21.00'),
(3, 3, 1, '8.50'),
(4, 3, 2, '17.00'),
(4, 2, 1, '7.50'),
(5, 3, 2, '17.00'),
(5, 4, 1, '7.50'),
(5, 6, 1, '10.50'),
(6, 3, 2, '17.00'),
(6, 6, 1, '10.50'),
(6, 1, 1, '7.50'),
(7, 4, 1, '7.50'),
(7, 5, 2, '15.00'),
(8, 2, 1, '7.50'),
(8, 5, 2, '15.00'),
(8, 4, 1, '7.50'),
(9, 5, 1, '7.50'),
(10, 6, 2, '21.00'),
(10, 3, 1, '8.50'),
(10, 5, 1, '7.50'),
(11, 3, 2, '17.00'),
(12, 4, 1, '7.50'),
(12, 3, 1, '8.50');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orderheader`
--

CREATE TABLE `orderheader` (
  `orderid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `orderdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ipaddress` text NOT NULL,
  `sessionid` text NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `orderheader`
--

INSERT INTO `orderheader` (`orderid`, `customerid`, `orderdate`, `ipaddress`, `sessionid`, `amount`) VALUES
(1, 2, '2017-06-22 06:19:54', '0:0:0:0:0:0:0:1', 'e74614faf73f9fe6392c9c6dccb6', NULL),
(2, 3, '2017-06-22 06:56:02', '0:0:0:0:0:0:0:1', 'e74614faf73f9fe6392c9c6dccb6', '0.00'),
(3, 4, '2017-06-22 06:52:22', '0:0:0:0:0:0:0:1', 'e74614faf73f9fe6392c9c6dccb6', '37.00'),
(4, 5, '2017-06-22 08:14:59', '0:0:0:0:0:0:0:1', 'eddf2bf53acd818f1c37aca1979f', '24.50'),
(5, 6, '2017-06-22 08:20:36', '0:0:0:0:0:0:0:1', 'eddf2bf53acd818f1c37aca1979f', '35.00'),
(6, 7, '2017-06-22 08:24:28', '0:0:0:0:0:0:0:1', 'eddf2bf53acd818f1c37aca1979f', '35.00'),
(7, 8, '2017-06-22 11:01:17', '0:0:0:0:0:0:0:1', 'f765a528215ec6d4d7923ed724cf', '22.50'),
(8, 9, '2017-06-23 06:10:15', '0:0:0:0:0:0:0:1', '39206db75731434bb0bc3e7ed563', '30.00'),
(9, 10, '2017-06-23 11:41:55', '0:0:0:0:0:0:0:1', '4a54e0ba0bebf623e8292c1eaf7d', '7.50'),
(10, 11, '2017-06-23 11:43:27', '0:0:0:0:0:0:0:1', '4c2d064d8771c7d52a771e9678a7', '37.00'),
(11, 12, '2017-06-23 12:00:29', '0:0:0:0:0:0:0:1', '4d2b6136b9d5ed450043b5b48a5a', '17.00'),
(12, 13, '2017-06-23 12:00:50', '0:0:0:0:0:0:0:1', '4a54e0ba0bebf623e8292c1eaf7d', '16.00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`);

--
-- Indizes für die Tabelle `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`menuitemid`);

--
-- Indizes für die Tabelle `orderheader`
--
ALTER TABLE `orderheader`
  ADD PRIMARY KEY (`orderid`),
  ADD UNIQUE KEY `customerid` (`customerid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT für Tabelle `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `menuitemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `orderheader`
--
ALTER TABLE `orderheader`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `orderheader`
--
ALTER TABLE `orderheader`
  ADD CONSTRAINT `orderheader_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

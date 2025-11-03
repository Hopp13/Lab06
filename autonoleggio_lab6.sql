-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dump della struttura del database autonoleggio
CREATE DATABASE IF NOT EXISTS `autonoleggio_lab6` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `autonoleggio_lab6`;

-- Dump della struttura di tabella autonoleggio.automobile
CREATE TABLE IF NOT EXISTS `automobile` (
    `codice` varchar(50) NOT NULL,
    `marca` varchar(50) NOT NULL,
    `modello` varchar(50) NOT NULL,
    `anno` year NOT NULL,
    `posti` int NOT NULL,
    `disponibile` bool NOT NULL,
    PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella autonoleggio.automobile: ~35 rows (circa)
DELETE FROM `automobile`;
/*!40000 ALTER TABLE `automobile` DISABLE KEYS */;
INSERT INTO `automobile` (`codice`, `marca`, `modello`, `anno`, `posti`, `disponibile`) VALUES
	('A001', 'Toyota', 'Yaris', 2019, 5, true),
	('A002', 'Ford', 'Focus', 2020, 5, true),
	('A003', 'Fiat', '500', 2018, 4, true),
	('A004', 'Volkswagen', 'Golf', 2021, 5, true),
	('A005', 'Renault', 'Clio', 2017, 5, true),
	('A006', 'Opel', 'Corsa', 2012, 5, true),
	('A007', 'Peugeot', '208', 2019, 5, true),
	('A008', 'Seat', 'Ibiza', 2020, 5, true),
	('A009', 'Hyundai', 'i20', 2018, 5, true),
	('A010', 'Skoda', 'Fabia', 2021, 5, true),
	('A011', 'Fiat', 'Panda', 2024, 4, true),
	('A012', 'Ford', 'Focus', 2019, 5, true),
    ('A0013', 'Opel', 'Corsa', 2018, 5, true),
    ('A0014', 'Toyota', 'Rav4', 2020, 5, true),
    ('A015', 'Ford', 'Focus', 2011, 5, true),
    ('A016', 'Toyota', 'Yaris', 2021, 5, true),
    ('A017', 'Kia', 'Rio', 2020, 5, true),
    ('A018', 'Fiat', '500', 2020, 4, true),
    ('A019', 'Hyundai', 'i10', 2021, 4, true),
    ('A020', 'Ford', 'Focus', 2018, 5, true),
    ('A021', 'Mazda', 'CX-3', 2019, 5, true),
    ('A022', 'Volkswagen', 'Golf', 2019, 5, true),
    ('A023', 'Honda', 'Civic', 2022, 5, true),
    ('A024', 'Opel', 'Corsa', 2021, 5, true),
    ('A025', 'Nissan', 'Juke', 2021, 5, true),
    ('A026', 'Peugeot', '208', 2018, 5, true),
    ('A027', 'Seat', 'Ibiza', 2019, 5, true),
    ('A028', 'Skoda', 'Fabia', 2019, 5, true),
    ('A029', 'Fiat', 'Panda', 2023, 4, true),
    ('A030', 'Ford', 'Focus', 2022, 5, true),
    ('A031', 'Opel', 'Corsa', 2019, 5, true),
    ('A032', 'Toyota', 'Rav4', 2018, 5, true),
    ('A033', 'Renault', 'Clio', 2021, 5, true),
    ('A034', 'Hyundai', 'i20', 2020, 5, true),
    ('A035', 'BMW', 'Serie 1', 2020, 5, true);
/*!40000 ALTER TABLE `automobile` ENABLE KEYS */;

-- Dump della struttura di tabella autonoleggio.noleggio
CREATE TABLE IF NOT EXISTS `noleggio` (
    `codice` varchar(50) NOT NULL,
    `data` date NOT NULL,
    `id_automobile` varchar(50) NOT NULL,
    `cliente` varchar(50) NOT NULL,
    PRIMARY KEY (`codice`),
  KEY `FK_automobile` (`id_automobile`),
  CONSTRAINT `FK_automobile` FOREIGN KEY (`id_automobile`) REFERENCES `automobile` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella autonoleggio.noleggio: ~5 rows (circa)
DELETE FROM `noleggio`;
/*!40000 ALTER TABLE `noleggio` DISABLE KEYS */;
INSERT INTO `noleggio` (`codice`, `data`, `id_automobile`, `cliente`) VALUES
    ('N001', '2025-01-01', 'A001', 'Lorenzo Ferrari'),
    ('N002', '2025-01-01', 'A016', 'Mario Rossi'),
    ('N003', '2025-05-12', 'A023', 'Luisa Bianchi'),
    ('N004', '2025-08-03', 'A020', 'Giovanni Verdi'),
    ('N005', '2025-09-04', 'A034', 'Francesca Neri'),
    ('N006', '2025-10-22', 'A030', 'Maria Costa');
/*!40000 ALTER TABLE `noleggio` ENABLE KEYS */;

-- Aggiorna la disponibilità delle auto noleggiate
UPDATE automobile
SET disponibile = false
WHERE codice IN (SELECT id_automobile FROM noleggio);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

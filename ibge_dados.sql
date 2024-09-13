-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para ibge
CREATE DATABASE IF NOT EXISTS `ibge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ibge`;

-- Copiando estrutura para tabela ibge.cidades
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `cep` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.cidades: ~7 rows (aproximadamente)
INSERT INTO `cidades` (`id`, `nome`, `estado`, `pais`, `cep`) VALUES
	(1, 'Guararapes', 'SP', 'BRA', '16700000'),
	(2, 'Araçatuba', 'SP', 'BRA', '16700000'),
	(3, 'São Paulo', 'SP', 'Brasil', '01001000'),
	(4, 'Rio de Janeiro', 'RJ', 'Brasil', '20040000'),
	(5, 'Salvador', 'BA', 'Brasil', '40020000'),
	(6, 'Curitiba', 'PR', 'Brasil', '80040000'),
	(7, 'Porto Alegre', 'RS', 'Brasil', '90010000');

-- Copiando estrutura para tabela ibge.etnias
CREATE TABLE IF NOT EXISTS `etnias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.etnias: ~5 rows (aproximadamente)
INSERT INTO `etnias` (`id`, `titulo`) VALUES
	(1, 'Branco'),
	(2, 'Negro'),
	(3, 'Pardo'),
	(4, 'Amarelo'),
	(5, 'Indígena');

-- Copiando estrutura para tabela ibge.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.generos: ~4 rows (aproximadamente)
INSERT INTO `generos` (`id`, `titulo`) VALUES
	(1, 'Masculino'),
	(2, 'Feminino'),
	(3, 'Não-Binário'),
	(4, 'Outro');

-- Copiando estrutura para tabela ibge.pesquisas
CREATE TABLE IF NOT EXISTS `pesquisas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade_id` int NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_id` (`cidade_id`),
  CONSTRAINT `pesquisas_ibfk_1` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.pesquisas: ~101 rows (aproximadamente)
INSERT INTO `pesquisas` (`id`, `cidade_id`, `data`) VALUES
	(1, 5, '2022-03-10'),
	(2, 5, '2022-10-24'),
	(3, 1, '2022-06-25'),
	(4, 2, '2023-02-15'),
	(5, 4, '2024-08-25'),
	(6, 1, '2021-05-07'),
	(7, 4, '2023-07-03'),
	(8, 2, '2020-08-24'),
	(9, 3, '2022-09-01'),
	(10, 2, '2020-08-04'),
	(11, 2, '2022-05-21'),
	(12, 3, '2020-09-10'),
	(13, 2, '2024-06-04'),
	(14, 4, '2020-03-05'),
	(15, 4, '2021-12-16'),
	(16, 3, '2021-08-02'),
	(17, 3, '2020-10-05'),
	(18, 4, '2020-07-24'),
	(19, 1, '2020-03-11'),
	(20, 3, '2024-04-17'),
	(21, 1, '2024-04-18'),
	(22, 5, '2023-11-21'),
	(23, 4, '2023-08-04'),
	(24, 5, '2022-12-13'),
	(25, 2, '2024-10-09'),
	(26, 3, '2022-07-06'),
	(27, 5, '2020-07-27'),
	(28, 3, '2021-11-13'),
	(29, 2, '2024-05-08'),
	(30, 3, '2021-04-21'),
	(31, 2, '2022-03-11'),
	(32, 5, '2022-07-24'),
	(33, 4, '2020-01-08'),
	(34, 5, '2023-04-16'),
	(35, 4, '2024-06-26'),
	(36, 2, '2024-10-20'),
	(37, 5, '2022-03-24'),
	(38, 1, '2023-05-05'),
	(39, 1, '2022-10-30'),
	(40, 4, '2021-06-19'),
	(41, 5, '2023-10-12'),
	(42, 2, '2021-09-29'),
	(43, 5, '2023-07-25'),
	(44, 3, '2022-05-20'),
	(45, 3, '2021-11-25'),
	(46, 5, '2021-08-04'),
	(47, 2, '2023-04-12'),
	(48, 1, '2020-12-15'),
	(49, 2, '2024-04-27'),
	(50, 1, '2020-03-28'),
	(51, 5, '2023-10-30'),
	(52, 1, '2022-04-12'),
	(53, 2, '2024-09-13'),
	(54, 3, '2023-12-27'),
	(55, 3, '2022-08-17'),
	(56, 1, '2023-05-08'),
	(57, 5, '2024-05-26'),
	(58, 4, '2024-12-01'),
	(59, 3, '2023-09-16'),
	(60, 1, '2022-10-20'),
	(61, 1, '2024-05-03'),
	(62, 5, '2024-08-14'),
	(63, 4, '2020-01-07'),
	(64, 5, '2023-03-29'),
	(65, 3, '2020-07-10'),
	(66, 4, '2022-02-11'),
	(67, 2, '2024-10-12'),
	(68, 5, '2023-07-12'),
	(69, 5, '2022-09-28'),
	(70, 3, '2021-09-03'),
	(71, 1, '2023-01-24'),
	(72, 4, '2023-08-22'),
	(73, 3, '2024-01-28'),
	(74, 4, '2021-06-20'),
	(75, 5, '2020-11-20'),
	(76, 3, '2024-11-30'),
	(77, 2, '2023-04-24'),
	(78, 1, '2021-07-16'),
	(79, 3, '2022-04-23'),
	(80, 1, '2022-04-06'),
	(81, 4, '2024-06-06'),
	(82, 3, '2024-05-11'),
	(83, 4, '2023-06-14'),
	(84, 2, '2022-01-16'),
	(85, 2, '2022-08-20'),
	(86, 2, '2024-01-10'),
	(87, 5, '2024-08-17'),
	(88, 2, '2020-08-08'),
	(89, 5, '2022-04-18'),
	(90, 5, '2021-10-17'),
	(91, 3, '2024-06-08'),
	(92, 1, '2023-03-18'),
	(93, 4, '2021-08-18'),
	(94, 3, '2022-05-08'),
	(95, 4, '2023-02-03'),
	(96, 4, '2022-09-10'),
	(97, 2, '2021-11-15'),
	(98, 5, '2021-05-05'),
	(99, 5, '2021-10-22'),
	(100, 1, '2023-09-28'),
	(101, 3, '2024-08-23');

-- Copiando estrutura para tabela ibge.pessoas
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.pessoas: ~100 rows (aproximadamente)
INSERT INTO `pessoas` (`id`, `nome`, `data_nascimento`, `cpf`, `rg`) VALUES
	(1, 'Isabela Almeida', '1992-03-17', '39639755406', '758815637'),
	(2, 'Thiago Oliveira', '1969-09-22', '91759895182', '277295880'),
	(3, 'Isabela Souza', '1971-03-14', '78471723607', '386300676'),
	(4, 'Thiago Souza', '1967-01-20', '06968155633', '333383878'),
	(5, 'Mariana Silva', '1961-04-23', '25975178815', '962219350'),
	(6, 'Fernanda Silva', '1984-08-20', '11098439094', '688014300'),
	(7, 'Rafael Gomes', '1998-11-08', '24247548046', '550467821'),
	(8, 'Gustavo Silva', '1962-02-17', '64756214980', '861738637'),
	(9, 'Lucas Oliveira', '1988-06-07', '90181624579', '534941349'),
	(10, 'Lucas Carvalho', '1956-03-20', '50400999575', '371604865'),
	(11, 'Pedro Oliveira', '1996-05-15', '29544509197', '651291105'),
	(12, 'Rafael Silva', '1970-05-23', '47040262099', '622216225'),
	(13, 'Rafael Carvalho', '1970-11-01', '22405030413', '499382535'),
	(14, 'Pedro Martins', '1960-11-18', '32448671279', '081215184'),
	(15, 'Camila Lima', '1996-08-03', '55651329026', '910459144'),
	(16, 'Juliana Almeida', '1958-02-12', '41884200959', '602074179'),
	(17, 'Juliana Oliveira', '1951-03-06', '01633742646', '208207298'),
	(18, 'Gustavo Gomes', '1978-06-10', '66676885120', '695886788'),
	(19, 'Rafael Santos', '2003-01-03', '31372155852', '550512422'),
	(20, 'Camila Silva', '1996-05-31', '64462194175', '765203332'),
	(21, 'Camila Almeida', '1965-09-04', '51018493152', '888133691'),
	(22, 'Juliana Silva', '2002-12-26', '57708157909', '976397223'),
	(23, 'Gustavo Almeida', '1975-06-27', '87917672468', '154129844'),
	(24, 'Gustavo Almeida', '1997-05-13', '01224693400', '482959556'),
	(25, 'Gustavo Santos', '1978-12-06', '23343032603', '485871019'),
	(26, 'Isabela Carvalho', '1959-04-15', '34113606883', '717761471'),
	(27, 'Rafael Lima', '1970-02-23', '18681597952', '183302036'),
	(28, 'Gustavo Almeida', '1998-01-21', '40241908593', '473273831'),
	(29, 'Lucas Carvalho', '1995-11-04', '56288284988', '798882100'),
	(30, 'Pedro Almeida', '1972-03-10', '10384269230', '718424691'),
	(31, 'Thiago Silva', '1993-10-27', '83409927615', '920862974'),
	(32, 'Pedro Pereira', '1987-12-11', '94117187519', '147010836'),
	(33, 'Mariana Lima', '1973-11-02', '77748151884', '548919077'),
	(34, 'Juliana Almeida', '1964-12-16', '94738385215', '177089183'),
	(35, 'Mariana Santos', '1998-09-08', '47243626989', '358119036'),
	(36, 'Thiago Lima', '1951-03-30', '29931015621', '321265772'),
	(37, 'Pedro Martins', '1992-06-30', '83077390273', '644908134'),
	(38, 'Camila Martins', '1982-07-24', '35461889706', '659754178'),
	(39, 'Pedro Almeida', '1976-05-14', '90028116117', '629595301'),
	(40, 'Juliana Gomes', '1988-08-09', '32341902089', '604989679'),
	(41, 'Isabela Carvalho', '1977-11-19', '74674990451', '104799430'),
	(42, 'Fernanda Pereira', '1978-10-15', '46411566120', '776129251'),
	(43, 'Mariana Gomes', '1986-05-26', '30448686547', '815230884'),
	(44, 'Thiago Silva', '1977-11-24', '57617611016', '279365123'),
	(45, 'Rafael Almeida', '1979-01-24', '53790987859', '516405933'),
	(46, 'Rafael Carvalho', '1961-05-15', '20600079208', '335621586'),
	(47, 'Thiago Gomes', '1994-08-15', '17049790707', '220614733'),
	(48, 'Juliana Santos', '1961-01-02', '29378713963', '846697407'),
	(49, 'Pedro Carvalho', '1987-03-24', '23010331556', '674446696'),
	(50, 'Thiago Silva', '1982-02-02', '43265331308', '802683756'),
	(51, 'Isabela Souza', '1998-08-31', '83506028778', '274264645'),
	(52, 'Rafael Lima', '1961-12-24', '98696324754', '578031249'),
	(53, 'Juliana Almeida', '1966-10-27', '31695608447', '129263324'),
	(54, 'Fernanda Pereira', '1977-07-21', '51062800188', '386679570'),
	(55, 'Pedro Almeida', '1995-02-27', '02502256561', '683644936'),
	(56, 'Lucas Martins', '1977-12-15', '20265625428', '777295881'),
	(57, 'Gustavo Santos', '1962-01-24', '29281019900', '810682139'),
	(58, 'Juliana Martins', '1985-10-28', '08184503040', '415410781'),
	(59, 'Lucas Almeida', '1992-09-20', '32542315105', '505843396'),
	(60, 'Juliana Martins', '1965-02-06', '93562888683', '368250608'),
	(61, 'Gustavo Souza', '1973-03-14', '38824331011', '952368850'),
	(62, 'Rafael Souza', '1975-10-02', '82455134295', '597212059'),
	(63, 'Thiago Carvalho', '1979-03-12', '44713027428', '435330006'),
	(64, 'Camila Souza', '1970-11-15', '72248641815', '811019989'),
	(65, 'Fernanda Gomes', '2003-02-02', '08621906551', '186115607'),
	(66, 'Thiago Santos', '1966-11-09', '41401698595', '912608875'),
	(67, 'Lucas Silva', '1954-04-08', '91665606780', '858208604'),
	(68, 'Thiago Lima', '1968-03-03', '29770604241', '982584956'),
	(69, 'Pedro Almeida', '1989-05-06', '21623747890', '121701728'),
	(70, 'Isabela Carvalho', '1964-12-14', '96844085288', '921509252'),
	(71, 'Fernanda Almeida', '1968-11-16', '56896840715', '646411243'),
	(72, 'Juliana Souza', '1960-07-31', '62429681973', '061872296'),
	(73, 'Mariana Oliveira', '1952-11-05', '20568105343', '377092393'),
	(74, 'Camila Lima', '1979-04-18', '05797458261', '309782332'),
	(75, 'Isabela Silva', '1954-04-23', '80063498725', '625876146'),
	(76, 'Juliana Martins', '1963-04-20', '52578632074', '571147638'),
	(77, 'Pedro Silva', '1960-01-07', '94394284546', '980656750'),
	(78, 'Camila Oliveira', '1966-12-10', '27857359606', '370327940'),
	(79, 'Lucas Martins', '1978-03-03', '24651922999', '113906450'),
	(80, 'Mariana Martins', '1989-04-20', '67939902926', '523511530'),
	(81, 'Isabela Almeida', '1976-06-21', '68688378201', '012300394'),
	(82, 'Rafael Martins', '1957-03-15', '28066957210', '171919298'),
	(83, 'Rafael Martins', '1973-11-02', '59039098582', '275790802'),
	(84, 'Gustavo Lima', '2003-09-25', '15034046375', '188587784'),
	(85, 'Gustavo Martins', '1981-07-14', '63617119800', '732669364'),
	(86, 'Thiago Souza', '1992-08-19', '94155241484', '904880549'),
	(87, 'Thiago Carvalho', '1957-10-07', '74247525873', '647689230'),
	(88, 'Fernanda Silva', '1995-11-08', '32352755686', '823270405'),
	(89, 'Pedro Carvalho', '1981-04-20', '97736849317', '384545380'),
	(90, 'Camila Souza', '1962-04-25', '16143798271', '231806288'),
	(91, 'Thiago Santos', '1964-10-29', '29050790746', '742949858'),
	(92, 'Lucas Almeida', '1959-06-19', '87469644948', '675785842'),
	(93, 'Lucas Oliveira', '1976-02-25', '64548218075', '564369761'),
	(94, 'Gustavo Carvalho', '1985-08-19', '52963824245', '150030017'),
	(95, 'Pedro Lima', '1967-02-03', '60793594690', '069600593'),
	(96, 'Pedro Souza', '1978-05-23', '53981659225', '692712797'),
	(97, 'Lucas Santos', '1999-01-24', '45400408597', '109077348'),
	(98, 'Thiago Pereira', '1999-10-13', '15987654847', '072856457'),
	(99, 'Camila Lima', '1958-08-01', '20218611782', '440219180'),
	(100, 'Mariana Almeida', '1983-04-07', '27372944449', '556102739');

-- Copiando estrutura para tabela ibge.profissoes
CREATE TABLE IF NOT EXISTS `profissoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.profissoes: ~5 rows (aproximadamente)
INSERT INTO `profissoes` (`id`, `titulo`) VALUES
	(1, 'Professor'),
	(2, 'Engenheiro'),
	(3, 'Médico'),
	(4, 'Advogado'),
	(5, 'Desenvolvedor');

-- Copiando estrutura para tabela ibge.religioes
CREATE TABLE IF NOT EXISTS `religioes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.religioes: ~5 rows (aproximadamente)
INSERT INTO `religioes` (`id`, `titulo`) VALUES
	(1, 'Católica'),
	(2, 'Protestante'),
	(3, 'Espírita'),
	(4, 'Ateu'),
	(5, 'Outro');

-- Copiando estrutura para tabela ibge.respostaspesquisas
CREATE TABLE IF NOT EXISTS `respostaspesquisas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pesquisa_id` int NOT NULL,
  `pessoa_id` int NOT NULL,
  `genero_id` int NOT NULL,
  `religiao_id` int NOT NULL,
  `sexualidade_id` int NOT NULL,
  `profissao_id` int NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `etnia_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pesquisa_id` (`pesquisa_id`),
  KEY `pessoa_id` (`pessoa_id`),
  KEY `genero_id` (`genero_id`),
  KEY `religiao_id` (`religiao_id`),
  KEY `sexualidade_id` (`sexualidade_id`),
  KEY `profissao_id` (`profissao_id`),
  KEY `etnia_id` (`etnia_id`),
  CONSTRAINT `respostaspesquisas_ibfk_1` FOREIGN KEY (`pesquisa_id`) REFERENCES `pesquisas` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_2` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_3` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_4` FOREIGN KEY (`religiao_id`) REFERENCES `religioes` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_5` FOREIGN KEY (`sexualidade_id`) REFERENCES `sexualidades` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_6` FOREIGN KEY (`profissao_id`) REFERENCES `profissoes` (`id`),
  CONSTRAINT `respostaspesquisas_ibfk_7` FOREIGN KEY (`etnia_id`) REFERENCES `etnias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.respostaspesquisas: ~101 rows (aproximadamente)
INSERT INTO `respostaspesquisas` (`id`, `pesquisa_id`, `pessoa_id`, `genero_id`, `religiao_id`, `sexualidade_id`, `profissao_id`, `salario`, `etnia_id`) VALUES
	(1, 78, 82, 2, 1, 2, 4, 1865.13, 5),
	(2, 76, 35, 4, 3, 4, 3, 7628.61, 5),
	(3, 49, 81, 1, 1, 1, 3, 9013.60, 1),
	(4, 85, 30, 3, 1, 2, 1, 4528.56, 3),
	(5, 85, 98, 3, 3, 4, 3, 6359.07, 2),
	(6, 59, 40, 4, 3, 2, 5, 7487.62, 4),
	(7, 56, 64, 1, 5, 1, 2, 5203.56, 1),
	(8, 98, 81, 4, 4, 4, 1, 9062.19, 4),
	(9, 74, 54, 3, 5, 2, 1, 3587.67, 1),
	(10, 23, 11, 2, 2, 1, 3, 8792.25, 4),
	(11, 12, 22, 1, 4, 1, 4, 2347.05, 1),
	(12, 56, 47, 1, 5, 4, 5, 5822.08, 2),
	(13, 11, 73, 1, 2, 2, 3, 6364.26, 2),
	(14, 31, 32, 4, 2, 2, 5, 8759.96, 4),
	(15, 44, 11, 3, 4, 4, 1, 7125.23, 5),
	(16, 10, 22, 1, 1, 1, 1, 8116.77, 4),
	(17, 52, 4, 2, 3, 4, 1, 8174.94, 2),
	(18, 7, 47, 1, 4, 2, 3, 2246.31, 4),
	(19, 59, 90, 1, 1, 1, 1, 8169.41, 4),
	(20, 92, 89, 1, 5, 3, 5, 7500.38, 4),
	(21, 42, 66, 1, 5, 2, 2, 9504.56, 5),
	(22, 97, 40, 4, 2, 1, 3, 2310.88, 4),
	(23, 19, 3, 1, 2, 3, 2, 7800.85, 4),
	(24, 46, 50, 3, 1, 4, 2, 5104.55, 4),
	(25, 76, 63, 4, 2, 3, 4, 5142.21, 1),
	(26, 84, 96, 4, 3, 1, 1, 1653.77, 1),
	(27, 69, 52, 3, 3, 4, 3, 8719.64, 1),
	(28, 32, 44, 1, 3, 4, 2, 7783.90, 4),
	(29, 3, 70, 4, 4, 4, 5, 3736.14, 2),
	(30, 59, 86, 3, 4, 1, 1, 6075.59, 3),
	(31, 17, 86, 2, 4, 2, 3, 2608.42, 2),
	(32, 81, 68, 3, 2, 3, 5, 6749.27, 2),
	(33, 71, 89, 3, 5, 4, 5, 3209.66, 4),
	(34, 49, 7, 1, 4, 4, 5, 4022.64, 1),
	(35, 19, 74, 1, 1, 3, 4, 2474.56, 3),
	(36, 41, 41, 3, 5, 2, 5, 3806.06, 5),
	(37, 39, 45, 1, 1, 4, 4, 3072.66, 3),
	(38, 59, 6, 4, 4, 1, 4, 4426.96, 2),
	(39, 4, 18, 4, 1, 4, 3, 4925.02, 3),
	(40, 46, 37, 3, 1, 2, 4, 1907.53, 5),
	(41, 16, 49, 1, 3, 1, 5, 6348.96, 4),
	(42, 22, 14, 3, 5, 1, 4, 3591.90, 1),
	(43, 26, 35, 3, 3, 4, 5, 4265.77, 2),
	(44, 28, 90, 2, 4, 1, 5, 8803.96, 4),
	(45, 69, 53, 3, 2, 3, 4, 6535.29, 1),
	(46, 99, 59, 2, 4, 1, 4, 8907.18, 5),
	(47, 2, 76, 2, 4, 2, 5, 4581.59, 5),
	(48, 87, 20, 3, 1, 3, 4, 8803.67, 4),
	(49, 83, 95, 2, 3, 3, 1, 2832.02, 3),
	(50, 21, 78, 2, 4, 1, 4, 8816.56, 5),
	(51, 94, 37, 1, 3, 1, 2, 9212.61, 5),
	(52, 11, 67, 3, 4, 1, 1, 1762.81, 1),
	(53, 57, 60, 3, 1, 4, 4, 5271.31, 2),
	(54, 95, 81, 4, 4, 3, 2, 2561.32, 1),
	(55, 9, 88, 1, 4, 3, 5, 7920.25, 5),
	(56, 57, 60, 2, 3, 3, 2, 5568.47, 5),
	(57, 26, 81, 3, 2, 3, 4, 3343.67, 5),
	(58, 39, 31, 4, 2, 4, 3, 5648.84, 4),
	(59, 69, 55, 1, 2, 3, 3, 7154.33, 4),
	(60, 89, 78, 3, 3, 3, 2, 9592.75, 2),
	(61, 80, 84, 1, 2, 4, 5, 4499.95, 3),
	(62, 34, 32, 1, 1, 4, 5, 4440.77, 1),
	(63, 2, 29, 4, 5, 1, 1, 5128.73, 1),
	(64, 36, 23, 3, 3, 4, 4, 6388.34, 3),
	(65, 26, 74, 1, 1, 4, 3, 2906.19, 1),
	(66, 15, 45, 2, 1, 2, 4, 5999.62, 1),
	(67, 32, 1, 4, 5, 2, 1, 7839.90, 2),
	(68, 5, 17, 3, 5, 2, 5, 3207.89, 4),
	(69, 70, 5, 1, 5, 3, 1, 8453.96, 4),
	(70, 54, 13, 4, 3, 1, 4, 7138.35, 1),
	(71, 10, 38, 4, 5, 4, 5, 1813.51, 1),
	(72, 86, 25, 4, 3, 4, 3, 2180.33, 2),
	(73, 60, 51, 4, 2, 1, 4, 5838.60, 5),
	(74, 12, 95, 1, 3, 3, 2, 7356.02, 4),
	(75, 84, 60, 1, 5, 4, 1, 6981.12, 4),
	(76, 33, 76, 3, 4, 1, 5, 4777.61, 3),
	(77, 99, 98, 3, 2, 4, 4, 5867.38, 4),
	(78, 29, 53, 4, 1, 4, 4, 9702.49, 2),
	(79, 29, 97, 2, 5, 4, 3, 2574.06, 4),
	(80, 98, 67, 2, 5, 3, 2, 8709.46, 2),
	(81, 22, 33, 2, 3, 1, 5, 6179.44, 1),
	(82, 79, 66, 3, 1, 2, 2, 2435.30, 1),
	(83, 31, 67, 2, 4, 3, 5, 7234.94, 1),
	(84, 86, 3, 1, 3, 3, 3, 6361.86, 5),
	(85, 63, 34, 3, 4, 1, 2, 9010.84, 4),
	(86, 64, 12, 4, 1, 4, 1, 2204.29, 4),
	(87, 33, 92, 2, 5, 3, 3, 8690.23, 3),
	(88, 12, 72, 3, 1, 3, 4, 8515.05, 3),
	(89, 72, 60, 3, 4, 1, 4, 9667.23, 2),
	(90, 3, 9, 4, 4, 1, 3, 2237.73, 3),
	(91, 43, 6, 3, 1, 4, 4, 1973.98, 2),
	(92, 81, 11, 1, 3, 3, 2, 2085.42, 1),
	(93, 50, 4, 1, 4, 3, 1, 6554.96, 2),
	(94, 91, 78, 2, 5, 1, 4, 6691.85, 4),
	(95, 83, 13, 4, 1, 4, 1, 5966.63, 1),
	(96, 65, 11, 1, 5, 2, 4, 1678.33, 3),
	(97, 66, 23, 1, 5, 3, 1, 4396.98, 1),
	(98, 26, 15, 2, 5, 3, 5, 5181.23, 3),
	(99, 44, 55, 2, 2, 3, 4, 1901.94, 1),
	(100, 100, 59, 2, 2, 3, 2, 6413.42, 1),
	(101, 94, 18, 2, 1, 1, 4, 12000.00, 2);

-- Copiando estrutura para tabela ibge.sexualidades
CREATE TABLE IF NOT EXISTS `sexualidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela ibge.sexualidades: ~4 rows (aproximadamente)
INSERT INTO `sexualidades` (`id`, `titulo`) VALUES
	(1, 'Heterossexual'),
	(2, 'Homossexual'),
	(3, 'Bissexual'),
	(4, 'Outro');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

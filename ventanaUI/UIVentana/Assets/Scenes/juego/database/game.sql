/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.28-MariaDB : Database - ventanachile
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ventanachile` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ventanachile`;

/*Table structure for table `texturas` */

DROP TABLE IF EXISTS `texturas`;

CREATE TABLE `texturas` (
  `idTexturas` int(11) NOT NULL AUTO_INCREMENT,
  `NTextura` varchar(30) DEFAULT NULL,
  `fechaText` date DEFAULT NULL,
  PRIMARY KEY (`idTexturas`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `texturas` */

insert  into `texturas`(`idTexturas`,`NTextura`,`fechaText`) values 
(1,'ventanaCorre_Material_BaseColo','2023-09-18'),
(3,'ventanaCorre_Material_Height.p','2023-09-18'),
(4,'ventanaCorre_Material_Metallic','2023-09-18'),
(5,'ventanaCorre_Material_Normal.p','2023-09-18'),
(6,'ventanaCorre_Material_Height.p','2023-09-18');

/*Table structure for table `tipocierre` */

DROP TABLE IF EXISTS `tipocierre`;

CREATE TABLE `tipocierre` (
  `idCierre` int(11) NOT NULL AUTO_INCREMENT,
  `NCierre` varchar(30) DEFAULT NULL,
  `fechaCi` date DEFAULT NULL,
  PRIMARY KEY (`idCierre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipocierre` */

insert  into `tipocierre`(`idCierre`,`NCierre`,`fechaCi`) values 
(1,'cierreManilla','2023-09-27');

/*Table structure for table `tipomarco` */

DROP TABLE IF EXISTS `tipomarco`;

CREATE TABLE `tipomarco` (
  `idMarco` int(11) NOT NULL AUTO_INCREMENT,
  `NMarco` varchar(30) DEFAULT NULL,
  `fechaM` date DEFAULT NULL,
  PRIMARY KEY (`idMarco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipomarco` */

insert  into `tipomarco`(`idMarco`,`NMarco`,`fechaM`) values 
(1,'marcoDeslizar','2023-09-13');

/*Table structure for table `tipoventana` */

DROP TABLE IF EXISTS `tipoventana`;

CREATE TABLE `tipoventana` (
  `idTVentana` int(11) NOT NULL AUTO_INCREMENT,
  `idMarco` int(11) DEFAULT NULL,
  `idTexturas` int(11) DEFAULT NULL,
  `idVidrio` int(11) DEFAULT NULL,
  `idCierre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTVentana`),
  KEY `idM` (`idMarco`),
  KEY `idT` (`idTexturas`),
  KEY `idV` (`idVidrio`),
  KEY `idC` (`idCierre`),
  CONSTRAINT `idC` FOREIGN KEY (`idCierre`) REFERENCES `tipocierre` (`idCierre`),
  CONSTRAINT `idM` FOREIGN KEY (`idMarco`) REFERENCES `tipomarco` (`idMarco`),
  CONSTRAINT `idT` FOREIGN KEY (`idTexturas`) REFERENCES `texturas` (`idTexturas`),
  CONSTRAINT `idV` FOREIGN KEY (`idVidrio`) REFERENCES `tipovidrio` (`idVidrio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipoventana` */

insert  into `tipoventana`(`idTVentana`,`idMarco`,`idTexturas`,`idVidrio`,`idCierre`) values 
(1,1,3,1,1);

/*Table structure for table `tipovidrio` */

DROP TABLE IF EXISTS `tipovidrio`;

CREATE TABLE `tipovidrio` (
  `idVidrio` int(11) NOT NULL AUTO_INCREMENT,
  `NVidrio` varchar(30) DEFAULT NULL,
  `fechaVi` date DEFAULT NULL,
  PRIMARY KEY (`idVidrio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipovidrio` */

insert  into `tipovidrio`(`idVidrio`,`NVidrio`,`fechaVi`) values 
(1,'vidriosDoble','2023-09-21');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUser`,`UserName`,`email`,`password`) values 
(1,'unity','unity','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(3,'brandon','brandon@gmail.com','fdb34f1ae1a9f4dc70de44c2f72f8f81f7cbc6a5cd7e87ceeb7da1b0e6605f9b'),
(4,'barlino','barlino','8d23cf6c86e834a7aa6eded54c26ce2bb2e74903538c61bdd5d2197997ab2f72'),
(5,'other','other','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(6,'','','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(7,'jj','jj','b51e45a12fbae3d0ee2bf77f1a4f80cbf642e2b4d1c237d2c0f7053a54f6b388');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

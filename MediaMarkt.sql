-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mediamarkt
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `Numero` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES (1,'Alfa'),(2,'Beta'),(3,'Gamma'),(4,'Delta'),(5,'Epsilon');
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `cifProveedor` char(9) NOT NULL,
  `codigoEstante` int NOT NULL,
  `numeroAlmacen` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `codigoEstante` (`codigoEstante`),
  KEY `numeroAlmacen` (`numeroAlmacen`),
  KEY `cifProveedor` (`cifProveedor`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`codigoEstante`) REFERENCES `estantes` (`Codigo`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`numeroAlmacen`) REFERENCES `almacenes` (`Numero`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`cifProveedor`) REFERENCES `proveedores` (`Cif`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'iMac','B12345678',1,2),(2,'Rog Zephyrus G15','A01234567',9,2),(3,'Horno 3HB4331X0','C23456789',3,2),(4,'MacBook Air Apple','B12345678',1,2),(5,'PlayStation5','E45678901',5,5),(6,'Lavadora QuickDrive','D34567890',7,4),(7,'Frigorifico RB38T600DSA/EF','D34567890',7,4),(8,'Lavavajillas 3VS305BP','C23456789',4,1),(9,'VivoBook F515JA-BR137T','A01234567',8,3),(10,'PlayStation 4','E45678901',6,5),(11,'Nevera J15X67','E45678901',7,4),(12,'Encimera 3EB715LR','C23456789',2,4),(13,'MacBook Pro','B12345678',4,1),(14,'Rog Zephyrus G14','A01234567',9,2),(15,'PSN Plus','E45678901',2,4),(16,'Odyssey LC27G55TQWUXEN','D34567890',7,4),(17,'TUF Gaming VG27WQ1B','A01234567',9,2);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `MayorEdad` tinyint(1) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idx_cliente_mayor_edad` (`MayorEdad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Miguel Angel','Sanchez Montero',1),(2,'Cristian','Mata Prieto',1),(3,'Iago','Fernandez Pereira',1),(4,'Roberto','Angulo Gomez',0),(5,'Carlos','Santos Muñoz',0),(6,'Pedro','Escobar Cruz',1),(7,'Alejandro','Gonzalez Gonzalez',0),(8,'Manuel','Fernandez Caballero',1),(9,'Pablo','Sanchez Guerrero',0),(10,'Mario','Hernandez Lopez',0);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electrodomesticos`
--

DROP TABLE IF EXISTS `electrodomesticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electrodomesticos` (
  `CodigoArticulo` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`CodigoArticulo`),
  CONSTRAINT `electrodomesticos_ibfk_1` FOREIGN KEY (`CodigoArticulo`) REFERENCES `articulos` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electrodomesticos`
--

LOCK TABLES `electrodomesticos` WRITE;
/*!40000 ALTER TABLE `electrodomesticos` DISABLE KEYS */;
INSERT INTO `electrodomesticos` VALUES (3,70),(6,120),(7,65),(9,32),(11,134),(12,245);
/*!40000 ALTER TABLE `electrodomesticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `NumSS` char(12) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `FechaNac` date DEFAULT NULL,
  PRIMARY KEY (`NumSS`),
  KEY `idx_inicial_nombre` ((substr(`Nombre`,1,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('A01234567890','Pepito','Rodríguez','1982-02-06'),('B12345678901','Manuel','Melón','1990-11-26'),('C23456789012','Charly','Cruz','1971-05-12'),('D34567890123','Policarpio','Castro','1965-07-19'),('E45678901234','Esteban','Palacios','1974-10-05'),('F56789012345','Roberto','Luz','1986-03-21'),('G67890123456','Alma','Mar','1993-09-03'),('H78901234567','Lucía','Ballesteros','1991-12-15'),('I89012345678','Alvaro','Jiménez','1995-04-13'),('J90123456789','Coral','Calvo','1974-01-02');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estantes`
--

DROP TABLE IF EXISTS `estantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estantes` (
  `Codigo` int NOT NULL,
  `NumeroAlmacen` int NOT NULL,
  PRIMARY KEY (`Codigo`,`NumeroAlmacen`),
  KEY `NumeroAlmacen` (`NumeroAlmacen`),
  CONSTRAINT `estantes_ibfk_1` FOREIGN KEY (`NumeroAlmacen`) REFERENCES `almacenes` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estantes`
--

LOCK TABLES `estantes` WRITE;
/*!40000 ALTER TABLE `estantes` DISABLE KEYS */;
INSERT INTO `estantes` VALUES (4,1),(1,2),(3,2),(9,2),(8,3),(2,4),(7,4),(5,5),(6,5);
/*!40000 ALTER TABLE `estantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informaticos`
--

DROP TABLE IF EXISTS `informaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informaticos` (
  `CodigoArticulo` int NOT NULL,
  `Tipo` enum('Monitor','Ordenador','Tablet') NOT NULL,
  PRIMARY KEY (`CodigoArticulo`),
  CONSTRAINT `informaticos_ibfk_1` FOREIGN KEY (`CodigoArticulo`) REFERENCES `articulos` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informaticos`
--

LOCK TABLES `informaticos` WRITE;
/*!40000 ALTER TABLE `informaticos` DISABLE KEYS */;
INSERT INTO `informaticos` VALUES (1,'Ordenador'),(2,'Ordenador'),(4,'Ordenador'),(9,'Ordenador'),(13,'Ordenador'),(14,'Ordenador'),(16,'Monitor'),(17,'Monitor');
/*!40000 ALTER TABLE `informaticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_articulos`
--

DROP TABLE IF EXISTS `pedido_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_articulos` (
  `cod_articulo` int NOT NULL,
  `nombre_articulo` varchar(50) DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `cif_proveedor` char(9) DEFAULT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_articulos`
--

LOCK TABLES `pedido_articulos` WRITE;
/*!40000 ALTER TABLE `pedido_articulos` DISABLE KEYS */;
INSERT INTO `pedido_articulos` VALUES (2,'Rog Zephyrus G15','2021-03-05','A01234567','Asus'),(5,'PlayStation5','2021-03-05','E45678901','Sony'),(9,'VivoBook F515JA-BR137T','2021-03-05','A01234567','Asus'),(10,'PlayStation 4','2021-03-05','E45678901','Sony'),(11,'Nevera J15X67','2021-03-05','E45678901','Sony'),(14,'Rog Zephyrus G14','2021-03-05','A01234567','Asus'),(15,'PSN Plus','2021-03-05','E45678901','Sony'),(17,'TUF Gaming VG27WQ1B','2021-03-05','A01234567','Asus');
/*!40000 ALTER TABLE `pedido_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Cif` char(9) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Cif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('A01234567','Asus','2021-03-05','Calle Uno','asus@asus.com'),('B12345678','Apple','2020-09-14','Calle Dos','apple@apple.com'),('C23456789','Balay','2020-11-12','Calle Tres','balay@balay.com'),('D34567890','Samsung','2021-01-09','Calle Cuatro','samsung@samsung.com'),('E45678901','Sony','2021-03-05','Calle Cinco','sony@sony.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos` (
  `Telefono` char(9) NOT NULL,
  `CodigoCliente` int DEFAULT NULL,
  PRIMARY KEY (`Telefono`),
  KEY `CodigoCliente` (`CodigoCliente`),
  CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`CodigoCliente`) REFERENCES `clientes` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES ('656789012',1),('612345678',2),('623456789',3),('678901234',4),('634567890',5),('645678901',6),('690123456',7),('601234567',8),('667890123',9),('689012345',10);
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuegos`
--

DROP TABLE IF EXISTS `videojuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuegos` (
  `CodigoArticulo` int NOT NULL,
  `Precio` float(5,2) NOT NULL,
  PRIMARY KEY (`CodigoArticulo`),
  CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`CodigoArticulo`) REFERENCES `articulos` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuegos`
--

LOCK TABLES `videojuegos` WRITE;
/*!40000 ALTER TABLE `videojuegos` DISABLE KEYS */;
INSERT INTO `videojuegos` VALUES (5,499.90),(10,249.90),(15,59.99);
/*!40000 ALTER TABLE `videojuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mediamarkt'
--
/*!50003 DROP FUNCTION IF EXISTS `Info_Empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Info_Empleados`(NumSegSoc VARCHAR(100)) RETURNS varchar(250) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	-- Declaraciones variables
    Declare fin int default 0;
    declare numSS_aux varchar (30);
    declare nombre_aux varchar (30);
    declare apellido_aux varchar (30);
	declare resultado varchar (250);
    declare fechaNac_aux date;
    
    -- Declaraciones cursor
    declare registro_cursor cursor for select NumSS, Nombre, Apellido, FechaNac from Empleados;
    declare continue handler for not found set fin =1;
    
    -- Control de error para NumSS con formáto no válido
	if not regexp_like(NumSegSoc, '[A-Z][0-9]{11}') then
		SIGNAL SQLSTATE '45000' set message_text = 'El formato del Numero de la SS debe empezar por una letra en mayúscula seguido de 8 números';
	else
    -- Control de error para NumSS inexistente en la tabla
		if NumSegSoc not in (select NumSS from empleados) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Por favor, ingrese el NumSS correcto';
		end if;
	end if;
    
    -- Abrir cursor
    open registro_cursor;
    
    -- Bucle
	bucle: loop
		fetch registro_cursor into numSS_aux, nombre_aux, apellido_aux, fechaNac_aux;
		if fin = 1 then
			leave bucle;
	    end if;
        
		if NumSegSoc = NumSS_aux then
			set Resultado =  concat ("Número de SS:", "  ", numSS_aux, " ; ", "Nombre:", "  ", nombre_aux,  " ; ","Apellidos:", "  ", apellido_aux , " ; ", "Fecha de Nacimiento:", "  ", fechaNac_aux);
		end if;
	
	end loop bucle;
    
    -- Cerrar cursor
	close registro_cursor;

	RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fecha_pedido_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fecha_pedido_articulos`(in pedidos_fecha date)
BEGIN
	-- Declaraciones
	declare fin int default 0;
    declare aux_codigo_articulo int;
    declare aux_nombre_articulo varchar(50);
    declare aux_cif_proveedor char(9);
    declare aux_nombre_proveedor varchar(50);
    
    -- Declaracion de cursores
    declare cursor_pedido_articulos cursor for select A.Codigo, A.Nombre, P.Cif, P.Nombre from Articulos A, Proveedores P where A.cifProveedor=P.Cif and P.Fecha=pedidos_fecha;
    declare continue handler for not found set fin = 1;
    
    -- Control de errores
    if pedidos_fecha not in (select Fecha from Proveedores) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Por favor, ingresa una fecha válida';
	end if;

    -- Abrir cursor
    open cursor_pedido_articulos;
    
    -- Creación de la nueva tabla
    drop table if exists Pedido_articulos;
    create table Pedido_articulos(
    cod_articulo int primary key,
    nombre_articulo varchar(50),
    fecha_pedido date,
    cif_proveedor char(9),
    nombre_proveedor varchar(50)
    );
    
    -- Bucle
    loop_pedido_articulos: LOOP
		fetch cursor_pedido_articulos into aux_codigo_articulo, aux_nombre_articulo, aux_cif_proveedor, aux_nombre_proveedor;
        
        if fin = 1 then
			leave loop_pedido_articulos;
		end if;
        
        insert into Pedido_articulos values (aux_codigo_articulo, aux_nombre_articulo, pedidos_fecha, aux_cif_proveedor, aux_nombre_proveedor);
    
    end loop loop_pedido_articulos;
    
    -- Cerrar cursor
    close cursor_pedido_articulos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 21:17:04

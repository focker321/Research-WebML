-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-07-2012 a las 22:44:52
-- Versión del servidor: 5.1.44
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `WRTA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

DROP TABLE IF EXISTS `destino`;
CREATE TABLE IF NOT EXISTS `destino` (
  `oid` int(11) NOT NULL,
  `promocion` varchar(255) DEFAULT NULL,
  `distancia` double DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `destino`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_group_module` (`module_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `group`
--

INSERT INTO `group` (`oid`, `groupname`, `module_oid`) VALUES
(1, 'manager', 1),
(2, 'Individuo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_module`
--

DROP TABLE IF EXISTS `group_module`;
CREATE TABLE IF NOT EXISTS `group_module` (
  `group_oid` int(11) NOT NULL,
  `module_oid` int(11) NOT NULL,
  PRIMARY KEY (`group_oid`,`module_oid`),
  KEY `fk_group_module_group` (`group_oid`),
  KEY `fk_group_module_module` (`module_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `group_module`
--

INSERT INTO `group_module` (`group_oid`, `module_oid`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `individuo`
--

DROP TABLE IF EXISTS `individuo`;
CREATE TABLE IF NOT EXISTS `individuo` (
  `user_oid` int(11) NOT NULL,
  `oidglobal` int(11) NOT NULL,
  PRIMARY KEY (`user_oid`),
  KEY `fk_individuo_user` (`user_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `individuo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `oid` int(11) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `module`
--

INSERT INTO `module` (`oid`, `moduleid`, `modulename`) VALUES
(1, 'sv2', 'Administrador'),
(2, 'sv3', 'Aplicacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `oid` int(11) NOT NULL,
  `contenido` varchar(255) DEFAULT NULL,
  `individuo_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_post_individuo` (`individuo_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `post`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `oid` int(11) NOT NULL,
  `nombre_tag` varchar(255) DEFAULT NULL,
  `representatividad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tag`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag_post`
--

DROP TABLE IF EXISTS `tag_post`;
CREATE TABLE IF NOT EXISTS `tag_post` (
  `tag_oid` int(11) NOT NULL,
  `post_oid` int(11) NOT NULL,
  PRIMARY KEY (`tag_oid`,`post_oid`),
  KEY `fk_tag_post_tag` (`tag_oid`),
  KEY `fk_tag_post_post` (`post_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tag_post`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `oid` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_viaje` date DEFAULT NULL,
  `destino_oid` int(11) DEFAULT NULL,
  `tipo_viaje_oid` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_ticket_destino` (`destino_oid`),
  KEY `fk_ticket_tipo_viaje` (`tipo_viaje_oid`),
  KEY `fk_ticket_user` (`user_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `ticket`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_viaje`
--

DROP TABLE IF EXISTS `tipo_viaje`;
CREATE TABLE IF NOT EXISTS `tipo_viaje` (
  `oid` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tipo_viaje`
--

INSERT INTO `tipo_viaje` (`oid`, `tipo`) VALUES
(1, NULL),
(2, NULL),
(3, 'Hello World!!'),
(4, 'Hello World!!'),
(5, 'Santiago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `oid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `group_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_user_group` (`group_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `user`
--

INSERT INTO `user` (`oid`, `username`, `password`, `email`, `group_oid`) VALUES
(1, 'manager', 'manager', 'manager@wrta.com', 1),
(2, 'individual', 'individual', 'individual@wrta.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `user_oid` int(11) NOT NULL,
  `group_oid` int(11) NOT NULL,
  PRIMARY KEY (`user_oid`,`group_oid`),
  KEY `fk_user_group_user` (`user_oid`),
  KEY `fk_user_group_group` (`group_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `user_group`
--

INSERT INTO `user_group` (`user_oid`, `group_oid`) VALUES
(1, 1),
(2, 2);

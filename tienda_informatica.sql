-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2020 a las 20:31:48
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tienda_informatica`
--
CREATE DATABASE IF NOT EXISTS `tienda_informatica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda_informatica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cestatus`
--

DROP TABLE IF EXISTS `cestatus`;
CREATE TABLE IF NOT EXISTS `cestatus` (
`id_estatus` int(11) NOT NULL,
  `estatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cmarca`
--

DROP TABLE IF EXISTS `cmarca`;
CREATE TABLE IF NOT EXISTS `cmarca` (
`id_marca` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
`id_compra` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_compra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cproveedor`
--

DROP TABLE IF EXISTS `cproveedor`;
CREATE TABLE IF NOT EXISTS `cproveedor` (
`id_proveedor` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctamano`
--

DROP TABLE IF EXISTS `ctamano`;
CREATE TABLE IF NOT EXISTS `ctamano` (
`id_tamano` int(11) NOT NULL,
  `tamano` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctipousuario`
--

DROP TABLE IF EXISTS `ctipousuario`;
CREATE TABLE IF NOT EXISTS `ctipousuario` (
`id_tipo` int(11) NOT NULL,
  `tipo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
CREATE TABLE IF NOT EXISTS `direcciones` (
`id_direccion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `calle` text NOT NULL,
  `numero_in` text NOT NULL,
  `numero_ext` text NOT NULL,
  `colonia` text NOT NULL,
  `delegacion` text NOT NULL,
  `estado` text NOT NULL,
  `cp` text NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementos_compra`
--

DROP TABLE IF EXISTS `elementos_compra`;
CREATE TABLE IF NOT EXISTS `elementos_compra` (
`id_elementoc` int(11) NOT NULL,
  `compra` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `costounitario` float NOT NULL,
  `cantidad_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementos_ticket`
--

DROP TABLE IF EXISTS `elementos_ticket`;
CREATE TABLE IF NOT EXISTS `elementos_ticket` (
`id_elemento` int(11) NOT NULL,
  `ticket` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
`id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `marca` int(11) NOT NULL,
  `tamaño` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `descripcion_gen` int(11) NOT NULL,
  `costo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
`id_ticket` int(11) NOT NULL,
  `importe` float NOT NULL,
  `fecha_ticket` date NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
`id_usuario` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido_p` text NOT NULL,
  `apellido_m` text NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fecha_alta` date NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cestatus`
--
ALTER TABLE `cestatus`
 ADD PRIMARY KEY (`id_estatus`), ADD KEY `id_estatus` (`id_estatus`);

--
-- Indices de la tabla `cmarca`
--
ALTER TABLE `cmarca`
 ADD PRIMARY KEY (`id_marca`), ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
 ADD PRIMARY KEY (`id_compra`), ADD KEY `id_compra` (`id_compra`), ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `cproveedor`
--
ALTER TABLE `cproveedor`
 ADD PRIMARY KEY (`id_proveedor`), ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `ctamano`
--
ALTER TABLE `ctamano`
 ADD PRIMARY KEY (`id_tamano`), ADD KEY `id_tamano` (`id_tamano`);

--
-- Indices de la tabla `ctipousuario`
--
ALTER TABLE `ctipousuario`
 ADD PRIMARY KEY (`id_tipo`), ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
 ADD PRIMARY KEY (`id_direccion`), ADD KEY `id_direccion` (`id_direccion`), ADD KEY `usuario` (`usuario`), ADD KEY `estatus` (`estatus`);

--
-- Indices de la tabla `elementos_compra`
--
ALTER TABLE `elementos_compra`
 ADD PRIMARY KEY (`id_elementoc`), ADD KEY `id_elementoc` (`id_elementoc`), ADD KEY `producto` (`producto`), ADD KEY `compra` (`compra`);

--
-- Indices de la tabla `elementos_ticket`
--
ALTER TABLE `elementos_ticket`
 ADD PRIMARY KEY (`id_elemento`), ADD KEY `id_elemento` (`id_elemento`), ADD KEY `ticket` (`ticket`), ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`id_producto`), ADD KEY `id_producto` (`id_producto`), ADD KEY `marca` (`marca`), ADD KEY `tamaño` (`tamaño`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
 ADD PRIMARY KEY (`id_ticket`), ADD KEY `id_ticket` (`id_ticket`), ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id_usuario`), ADD KEY `id_usuario` (`id_usuario`), ADD KEY `id_estatus` (`id_estatus`), ADD KEY `id_tipo` (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cestatus`
--
ALTER TABLE `cestatus`
MODIFY `id_estatus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cmarca`
--
ALTER TABLE `cmarca`
MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cproveedor`
--
ALTER TABLE `cproveedor`
MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ctamano`
--
ALTER TABLE `ctamano`
MODIFY `id_tamano` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ctipousuario`
--
ALTER TABLE `ctipousuario`
MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `elementos_compra`
--
ALTER TABLE `elementos_compra`
MODIFY `id_elementoc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `elementos_ticket`
--
ALTER TABLE `elementos_ticket`
MODIFY `id_elemento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `cproveedor` (`id_proveedor`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`estatus`) REFERENCES `cestatus` (`id_estatus`),
ADD CONSTRAINT `direcciones_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `elementos_compra`
--
ALTER TABLE `elementos_compra`
ADD CONSTRAINT `elementos_compra_ibfk_1` FOREIGN KEY (`compra`) REFERENCES `compras` (`id_compra`),
ADD CONSTRAINT `elementos_compra_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `elementos_ticket`
--
ALTER TABLE `elementos_ticket`
ADD CONSTRAINT `elementos_ticket_ibfk_1` FOREIGN KEY (`ticket`) REFERENCES `ticket` (`id_ticket`),
ADD CONSTRAINT `elementos_ticket_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`tamaño`) REFERENCES `ctamano` (`id_tamano`),
ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`marca`) REFERENCES `cmarca` (`id_marca`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `ctipousuario` (`id_tipo`),
ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `cestatus` (`id_estatus`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

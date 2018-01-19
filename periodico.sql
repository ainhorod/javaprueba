-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2018 a las 14:46:54
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `periodico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descripcion`) VALUES
(1, 'deportes'),
(2, 'tecnologia'),
(3, 'politica'),
(4, 'cultura'),
(5, 'turismo'),
(6, 'antropologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `mail` varchar(90) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `titulo` varchar(120) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `contenido` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `mail`, `id_categoria`, `titulo`, `contenido`, `fecha_publicacion`) VALUES
(1, 'asdf@gmail.com', 1, 'Fútbol y sociedad', 'Lore ipsum blablablablabla', '2018-01-19 08:42:37'),
(2, 'qwert@mail.com', 3, 'en un lugar', 'Contenido de la mancha', '2018-01-19 08:43:36'),
(4, 'poe@mail.com', 4, 'Cultura e internet', 'contenido de noticia de cultura e internet', '2018-01-19 08:50:06'),
(5, 'pepe@mail.com', 3, 'politicarandom', 'contenido de noticia de politica random asdg', '2018-01-19 08:52:21'),
(6, 'prueba@mail.com', 3, 'prueba insertar', 'contenido de prueba de insertar', '2018-01-19 13:39:26'),
(7, 'asff@mail.com', 1, 'prueba2', 'contenido de prueba2', '2018-01-19 13:41:31'),
(8, 'prueba3@mail.com', 4, 'prueba3', 'contenido de prueba3', '2018-01-19 13:42:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

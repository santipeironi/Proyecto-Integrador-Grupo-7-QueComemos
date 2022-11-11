-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 00:42:39
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `backend_quecomemos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_dni` int(40) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_dni`, `nombre`, `apellido`, `domicilio`, `mail`, `telefono`) VALUES
(24289126, 'Omar', 'Barbosa', 'Nueva Córdoba 1200', 'barbossaomar@gmail.com', '351-1246938'),
(34265892, 'Angela', 'Sierra', 'Yapeyú 1300', 'tuangeesierra777@gmail.com', '351-4251292'),
(35748651, 'Maria', 'De Bonafini', 'Alto Alberdi 745', 'mariadb@gmail.com', '351-6742090'),
(39567221, 'Lara', 'Gómez', 'Barrio Centro 300', 'larag@gmail.com', '351-3214529'),
(40398751, 'Lucas', 'Latorre', 'Nuevo Alberdi 1500', 'lula428@gmail..com', '351-8756234'),
(87564219, 'Alberto', 'Mujica', 'Villa Allende 1300', 'albertmuj@gmail.com', '351-7582948'),
(96247821, 'Margaret', 'Thompson', 'Cerro de las Rosas 1200', 'margaretmoonlight@gmail.com', '351-8192687'),
(654654646, 'sdfsdf', 'sdfsdf', 'sdfsd', 'sdfsdf', '65466');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

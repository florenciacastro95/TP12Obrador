-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2024 a las 02:00:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `obrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IdEmpleado` int(11) NOT NULL,
  `Dni` bigint(20) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Acceso` int(11) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IdEmpleado`, `Dni`, `Apellido`, `Nombre`, `Acceso`, `Estado`) VALUES
(28, 55321555, 'Valdez', 'Ramón', 1, 0),
(29, 45874932, 'Meza', 'Florinda', 2, 1),
(30, 5553544, 'Fernández', 'Angelines', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `Id_Herramienta` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Descripcion` varchar(130) DEFAULT NULL,
  `Estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`Id_Herramienta`, `Nombre`, `Stock`, `Descripcion`, `Estado`) VALUES
(6, 'torno', 5, 'torno eléctrico de carpintería', 1),
(7, 'martillo', 120, 'una maza, grande y pesada', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `IdMovimiento` int(11) NOT NULL,
  `IdEmpleado` int(11) NOT NULL,
  `IdHerramienta` int(11) NOT NULL,
  `FechaSalida` date NOT NULL,
  `CantidadRetirada` int(11) NOT NULL,
  `FechaDevolucion` date DEFAULT NULL,
  `Estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IdEmpleado`),
  ADD UNIQUE KEY `Dni` (`Dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`Id_Herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`IdMovimiento`),
  ADD KEY `IdEmpleado` (`IdEmpleado`),
  ADD KEY `IdHerramienta` (`IdHerramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IdEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `Id_Herramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`IdHerramienta`) REFERENCES `herramienta` (`Id_Herramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

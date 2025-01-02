-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 23:53:22
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `builder`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `email_admin` text DEFAULT NULL,
  `password_admin` text DEFAULT NULL,
  `token_admin` text DEFAULT NULL,
  `token_exp_admin` text DEFAULT NULL,
  `date_created_admin` date DEFAULT NULL,
  `date_updated_admin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id_admin`, `email_admin`, `password_admin`, `token_admin`, `token_exp_admin`, `date_created_admin`, `date_updated_admin`) VALUES
(1, 'admin@builder.com', '$2a$07$azybxcags23425sdg23sdeanQZqjaf6Birm2NvcYTNtJw24CsO5uq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MTg5Nzc1MDAsImV4cCI6MTcxOTA2MzkwMCwiZGF0YSI6eyJpZCI6IjEiLCJlbWFpbCI6ImFkbWluQGJ1aWxkZXIuY29tIn19.FF4lxWZDHjF6z0rDEpcTTQ-2RvZIUtkG4up_F9Wjdt8', '1719063900', '2024-06-20', '2024-06-21 13:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landings`
--

CREATE TABLE `landings` (
  `id_landing` int(11) NOT NULL,
  `title_landing` text DEFAULT NULL,
  `url_landing` text DEFAULT NULL,
  `plugins_landing` text DEFAULT NULL,
  `icon_landing` text DEFAULT NULL,
  `cover_landing` text DEFAULT NULL,
  `description_landing` text DEFAULT NULL,
  `date_created_landing` date DEFAULT NULL,
  `date_updated_landing` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `landings`
--

INSERT INTO `landings` (`id_landing`, `title_landing`, `url_landing`, `plugins_landing`, `icon_landing`, `cover_landing`, `description_landing`, `date_created_landing`, `date_updated_landing`) VALUES
(1, 'Agencia de Viajes', 'agencia-de-viajes', '[\"%3Clink+rel%3D%22preconnect%22+href%3D%22https%3A%2F%2Ffonts.googleapis.com%22%3E\",\"%3Clink+rel%3D%22preconnect%22+href%3D%22https%3A%2F%2Ffonts.gstatic.com%22+crossorigin%3E\",\"%3Clink+href%3D%22https%3A%2F%2Ffonts.googleapis.com%2Fcss2%3Ffamily%3DRoboto%3Aital%2Cwght%400%2C100%3B0%2C300%3B0%2C400%3B0%2C500%3B0%2C700%3B0%2C900%3B1%2C100%3B1%2C300%3B1%2C400%3B1%2C500%3B1%2C700%3B1%2C900%26display%3Dswap%22+rel%3D%22stylesheet%22%3E\"]', 'https://cdn-icons-png.flaticon.com/128/11649/11649745.png', 'https://hd.wallpaperswide.com/thumbs/brooklyn_bridge_at_night-t2.jpg', 'Lorem Ipsum', '2024-06-21', '2024-06-21 20:31:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `landings`
--
ALTER TABLE `landings`
  ADD PRIMARY KEY (`id_landing`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `landings`
--
ALTER TABLE `landings`
  MODIFY `id_landing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

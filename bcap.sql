-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2024 a las 21:05:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bcap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actas`
--

CREATE TABLE `actas` (
  `id_actas` int(4) NOT NULL,
  `numero_acta` varchar(4) NOT NULL,
  `cuidad` varchar(20) NOT NULL,
  `nombre_completo_A` varchar(50) NOT NULL,
  `fecha_crea` datetime NOT NULL,
  `objetivo_reu` varchar(64) NOT NULL,
  `desarrollo_reu` varchar(1024) NOT NULL,
  `conclusiones` varchar(512) NOT NULL,
  `actividad_1` varchar(40) NOT NULL,
  `actividad_2` varchar(40) NOT NULL,
  `actividad_3` varchar(40) NOT NULL,
  `actividad_4` varchar(40) NOT NULL,
  `responsable_1` varchar(50) NOT NULL,
  `responsable_2` varchar(50) NOT NULL,
  `responsable_3` varchar(50) NOT NULL,
  `responsable_4` varchar(50) NOT NULL,
  `instructor_segui` varchar(50) NOT NULL,
  `nombre_comite` varchar(24) NOT NULL,
  `dependencia` varchar(24) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienestar`
--

CREATE TABLE `bienestar` (
  `id_bienestar` int(2) NOT NULL,
  `nombre` varchar(24) NOT NULL,
  `cedula` varchar(14) NOT NULL,
  `correo_electronico` varchar(125) NOT NULL,
  `contrasena` varchar(125) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `tipo_vinculacion` varchar(12) NOT NULL DEFAULT 'PLANTA',
  `fecha_fin_contrato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id_director` int(2) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `cedula` varchar(14) NOT NULL,
  `correo_electronico` varchar(125) NOT NULL,
  `contrasena` varchar(125) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `id_ficha` int(11) NOT NULL,
  `instructores_asignados` varchar(50) NOT NULL,
  `nombre_ficha` varchar(60) NOT NULL,
  `alias_ficha` varchar(20) NOT NULL,
  `gestor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_aprendiz`
--

CREATE TABLE `info_aprendiz` (
  `id_aprendiz` int(7) NOT NULL,
  `identificacion` varchar(14) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `edad` tinyint(2) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `lugar_nacimiento` varchar(180) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `direccion` varchar(14) NOT NULL,
  `tipo_sangre` varchar(3) NOT NULL,
  `eps` varchar(50) NOT NULL,
  `region` varchar(10) NOT NULL,
  `cuidad` varchar(14) NOT NULL,
  `corregimiento` varchar(30) NOT NULL,
  `correo_electronico` varchar(125) NOT NULL,
  `comites` varchar(20) NOT NULL,
  `n_ficha` int(11) NOT NULL,
  `alias_ficha` varchar(20) NOT NULL,
  `inicio_ficha` datetime NOT NULL,
  `fin_ficha` datetime NOT NULL,
  `inicio_practica` datetime NOT NULL,
  `fin_practica` datetime NOT NULL,
  `estado` varchar(8) NOT NULL DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `id_instructor` int(4) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `cedula` varchar(14) NOT NULL,
  `correo_electronico` varchar(125) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `tipo_vinculacion` varchar(12) NOT NULL DEFAULT 'PLANTA',
  `fecha_fin_contrato` date DEFAULT NULL,
  `token` varchar(520) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`id_instructor`, `nombre_completo`, `cedula`, `correo_electronico`, `contrasena`, `telefono`, `tipo_vinculacion`, `fecha_fin_contrato`, `token`) VALUES
(1, 'posada', '123456789', 'posada@hotmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '320000000', 'PLANTA', '2024-10-31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNzQyMTczNywianRpIjoiZmU2YjdhMjctNzE3My00NGRlLWI4NTItM2FlZGM4ZmQ4ZDIxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6InBvc2FkYUBob3RtYWlsLmNvbSIsIm5iZiI6MTcwNzQyMTczNywiY3NyZiI6Ijk2ZDcwYzMxLWZjOWYtNDkyMy1iNGUwLTUyMzhmYTgxNTlkNyIsImV4cCI6MTcwNzQyMjYzN30.39-3hYIkvn2PgZy2UUVwGEBobLOhFAQN37-6K7ZbR5Q'),
(2, 'nico', '100001', 'nico@123', '123', '', 'PLANTA', NULL, ''),
(3, 'bcap', '111111', 'bcabsena@hotmail.com', 'Bienestar2024', '', 'PLANTA', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNzQyMjMxMSwianRpIjoiNGVhZTU1YzUtYjNiYS00ODI1LWFlZGUtMWQwY2Y3MGM4MDIxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImJjYWJzZW5hQGhvdG1haWwuY29tIiwibmJmIjoxNzA3NDIyMzExLCJjc3JmIjoiM2MzMzBiMzktYmJlZi00YTgxLTk0ZmEtYjU1YTMyNGU4YWRiIiwiZXhwIjoxNzA3NDIzMjExfQ.LWfqT14hHyv2HSawzucIt4Q3cOPF3ru1mm3VBiwW5eE'),
(4, '', '', '', '', '', 'PLANTA', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNzM1MDY2MCwianRpIjoiNDhjYzI0NjMtOWFhZi00NzFjLWFmNWUtOWMwYzZkYTFiYmYzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImJjYWJzZW5hQGhvdG1haWwuY29tIiwibmJmIjoxNzA3MzUwNjYwLCJjc3JmIjoiZDhkMTQyMGUtODQ4M'),
(5, '', '', '', '', '', 'PLANTA', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNzM1MTMwNiwianRpIjoiMmYwMjVlMDgtNjFmYy00OTY0LThkYjEtZGZhNDFmZjNkYjgzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImJjYWJzZW5hQGhvdG1haWwuY29tIiwibmJmIjoxNzA3MzUxMzA2LCJjc3JmIjoiNGJhZjI5ODUtM2NlO'),
(6, '', '', '', '', '', 'PLANTA', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNzM1MTc3OCwianRpIjoiNTVlNzJjZWUtZWE4ZS00ZTc2LWJjODYtZGVhZmYxZDE1MTI1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImJjYWJzZW5hQGhvdG1haWwuY29tIiwibmJmIjoxNzA3MzUxNzc4LCJjc3JmIjoiNTNkZjEzYjItNTBkM');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actas`
--
ALTER TABLE `actas`
  ADD PRIMARY KEY (`id_actas`);

--
-- Indices de la tabla `bienestar`
--
ALTER TABLE `bienestar`
  ADD PRIMARY KEY (`id_bienestar`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id_director`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`id_ficha`);

--
-- Indices de la tabla `info_aprendiz`
--
ALTER TABLE `info_aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id_instructor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actas`
--
ALTER TABLE `actas`
  MODIFY `id_actas` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bienestar`
--
ALTER TABLE `bienestar`
  MODIFY `id_bienestar` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `id_director` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `info_aprendiz`
--
ALTER TABLE `info_aprendiz`
  MODIFY `id_aprendiz` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id_instructor` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

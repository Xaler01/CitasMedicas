-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 22, 2022 at 09:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinica`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultorios`
--

CREATE TABLE `consultorios` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultorios`
--

INSERT INTO `consultorios` (`id`, `nombre`) VALUES
(2, 'Odontologia'),
(3, 'Cardiologia'),
(5, 'Neonatologia'),
(6, 'Otorrinolaringologia'),
(7, 'Podologia'),
(8, 'UCI'),
(9, 'Dermatologia'),
(10, 'Nefrologia');

-- --------------------------------------------------------

--
-- Table structure for table `doctores`
--

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `apellido` text NOT NULL,
  `nombre` text NOT NULL,
  `foto` text NOT NULL,
  `usuario` text NOT NULL,
  `clave` text NOT NULL,
  `sexo` text NOT NULL,
  `horarioE` time DEFAULT NULL,
  `horarioS` time DEFAULT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctores`
--

INSERT INTO `doctores` (`id`, `id_consultorio`, `apellido`, `nombre`, `foto`, `usuario`, `clave`, `sexo`, `horarioE`, `horarioS`, `rol`) VALUES
(2, 4, 'Cervantes', 'Miguel', '', 'docmiguel', '1234', 'Masculino', NULL, NULL, 'Doctor'),
(3, 3, 'Piolin', 'Canario', '', 'piolin', '12345', 'Masculino', NULL, NULL, 'Medico');

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `apellido` text NOT NULL,
  `nombre` text NOT NULL,
  `documento` text NOT NULL,
  `foto` text NOT NULL,
  `usuario` text NOT NULL,
  `clave` text NOT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`id`, `apellido`, `nombre`, `documento`, `foto`, `usuario`, `clave`, `rol`) VALUES
(1, 'Jacome', 'Alexander', '12345678901', 'Vistas/img/Pacientes/Paciente496.png', 'pacalex', '123', 'Paciente');

-- --------------------------------------------------------

--
-- Table structure for table `secretarias`
--

CREATE TABLE `secretarias` (
  `id` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `clave` text NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `foto` text NOT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secretarias`
--

INSERT INTO `secretarias` (`id`, `usuario`, `clave`, `nombre`, `apellido`, `foto`, `rol`) VALUES
(1, 'secre', 'taria', 'Guadalupe', 'Jimenez', 'Vistas/img/Secretarias/S-46.png', 'Secretaria');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `secretarias`
--
ALTER TABLE `secretarias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultorios`
--
ALTER TABLE `consultorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `secretarias`
--
ALTER TABLE `secretarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

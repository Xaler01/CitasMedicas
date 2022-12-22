-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 22, 2022 at 09:19 PM
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
-- Database: `Clinica_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

CREATE TABLE `agendas` (
  `id_agenda` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `id_citas` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `recetas_id_recetas` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id_diagnosticos` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `id_historia` int(11) NOT NULL,
  `recetas_id_recetas` int(11) NOT NULL,
  `citas_id_citas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctores`
--

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `apellido` text NOT NULL,
  `nombre` text NOT NULL,
  `foto` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `clave` int(11) NOT NULL,
  `sexo` int(11) NOT NULL,
  `horario_e` int(11) NOT NULL,
  `horario_s` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `historias`
--

CREATE TABLE `historias` (
  `id_historia` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `descipcion` text NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `id_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `recetas_id_recetas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `clave` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `actualizado_el` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `posologia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `guard_name` text NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_el` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `secretarias`
--

CREATE TABLE `secretarias` (
  `id` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `clave` text NOT NULL,
  `apellido` text NOT NULL,
  `nombre` text NOT NULL,
  `foto` int(11) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id_agenda`),
  ADD UNIQUE KEY `id_medico` (`id_medico`);

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_citas`),
  ADD UNIQUE KEY `id_horario` (`id_horario`,`id_agenda`,`recetas_id_recetas`),
  ADD UNIQUE KEY `id_especialidad` (`id_especialidad`),
  ADD UNIQUE KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_agenda` (`id_agenda`),
  ADD KEY `recetas_id_recetas` (`recetas_id_recetas`);

--
-- Indexes for table `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id_diagnosticos`),
  ADD UNIQUE KEY `id_historia` (`id_historia`),
  ADD UNIQUE KEY `recetas_id_recetas` (`recetas_id_recetas`,`citas_id_citas`),
  ADD KEY `citas_id_citas` (`citas_id_citas`);

--
-- Indexes for table `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_especialidad_2` (`id_especialidad`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indexes for table `historias`
--
ALTER TABLE `historias`
  ADD PRIMARY KEY (`id_historia`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD UNIQUE KEY `id_medico` (`id_medico`),
  ADD KEY `id_medico_2` (`id_medico`);

--
-- Indexes for table `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD UNIQUE KEY `recetas_id_recetas` (`recetas_id_recetas`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indexes for table `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `id_rol` (`id_rol`),
  ADD UNIQUE KEY `id_rol_2` (`id_rol`);

--
-- Indexes for table `secretarias`
--
ALTER TABLE `secretarias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `id_citas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id_diagnosticos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historias`
--
ALTER TABLE `historias`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rol_permiso`
--
ALTER TABLE `rol_permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secretarias`
--
ALTER TABLE `secretarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_agenda`) REFERENCES `agendas` (`id_agenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`recetas_id_recetas`) REFERENCES `recetas` (`id_receta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_5` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`recetas_id_recetas`) REFERENCES `recetas` (`id_receta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnosticos_ibfk_2` FOREIGN KEY (`citas_id_citas`) REFERENCES `citas` (`id_citas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnosticos_ibfk_3` FOREIGN KEY (`id_historia`) REFERENCES `historias` (`id_historia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctores`
--
ALTER TABLE `doctores`
  ADD CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctores_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`recetas_id_recetas`) REFERENCES `recetas` (`id_receta`);

--
-- Constraints for table `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `rol_permiso_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rol_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `secretarias`
--
ALTER TABLE `secretarias`
  ADD CONSTRAINT `secretarias_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

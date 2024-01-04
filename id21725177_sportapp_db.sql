-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2024 at 09:34 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21725177_sportapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(2, 'admin', '$2y$10$pz..fGELyAULVqICMl4hLefktMyv/GSnrA7LIG0Ilrmt0/tNIaQBa');

-- --------------------------------------------------------

--
-- Table structure for table `mission`
--

CREATE TABLE `mission` (
  `missionid` int(11) NOT NULL,
  `mission_title` varchar(100) NOT NULL,
  `mission_desc` varchar(500) NOT NULL,
  `mission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mission`
--

INSERT INTO `mission` (`missionid`, `mission_title`, `mission_desc`, `mission_date`) VALUES
(1, 'Move On', 'Run 2 km', '2023-12-28 19:23:11'),
(2, 'Muscles Pump', 'Gooo for 10 push-ps', '2023-12-28 19:25:01'),
(3, 'Run', '', '2024-01-01 15:34:50'),
(4, 'Run', 'Go and run for 10 min', '2024-01-01 15:35:37'),
(5, 'Study Flutter', 'Learn at least one hour flutter per day', '2024-01-04 09:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mypassword` varchar(250) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `mypassword`, `created_date`) VALUES
(1, 'user1@user.com', 'user1', '$2y$10$RS1YheNRsQkRRNqva3Noh.QonrxdFaNajHBeS4nQ8metsnYRYkjHC', '2023-12-28 18:11:10'),
(2, 'user2@user.com', 'user2', '$2y$10$qk0dyP3goW/OG6fH/dcpVuir.wOVMKLIdPTRFY/7xU3XpoVI1ZyGC', '2023-12-28 18:15:56'),
(3, 'user3@user.com', 'user3', '$2y$10$RoGIoxLUclMfQTbYHm2tHOmmZQrXYSHt.XF19Vzw7DYit/lDVhMvG', '2023-12-29 21:16:07'),
(4, 'user5@user.com', 'user5', '$2y$10$WrEKrl43lYolUFIEhOBtiult5BJlukDkJK.r61KWw1lhpTHqkbiSe', '2024-01-01 16:36:56'),
(5, 'user6@user.com', 'user6', '$2y$10$xaGvK7lhSxFhXadOyASCMu.zgjn/w996q/wc0Bo9gJe4C0JFR9zW.', '2024-01-04 09:31:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`missionid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mission`
--
ALTER TABLE `mission`
  MODIFY `missionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

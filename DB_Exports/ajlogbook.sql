-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 09:24 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajlogbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('YSxDGYmJULZB_pXjnE3kvrC7tqBv118p', 1608927742, '{\"cookie\":{\"originalMaxAge\":86399993,\"expires\":\"2020-12-25T20:22:22.366Z\",\"httpOnly\":true,\"path\":\"/\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(50) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `status` int(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `status`, `created_date`) VALUES
(1, 'Test', 'Mail', '123', 1, '2020-12-19 09:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_google_admin`
--

CREATE TABLE `tbl_google_admin` (
  `id` int(50) NOT NULL,
  `google_id` varchar(150) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_google_admin`
--

INSERT INTO `tbl_google_admin` (`id`, `google_id`, `first_name`, `last_name`, `email`, `photo_path`, `created_date`) VALUES
(15, '106425852628549016504', 'Purple', 'Zero', 'shadowtitan77@gmail.com', 'https://lh3.googleusercontent.com/a-/AOh14GiDl297KpIs8Nq3tDIqGesBmJK-OaJHMdmPqNW6=s96-c', '2020-12-22 18:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jobworks`
--

CREATE TABLE `tbl_jobworks` (
  `job_id` int(50) NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `job_status` varchar(255) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parties_details`
--

CREATE TABLE `tbl_parties_details` (
  `party_id` int(50) NOT NULL,
  `partyName` varchar(255) NOT NULL,
  `partyStatus` int(50) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parties_details`
--

INSERT INTO `tbl_parties_details` (`party_id`, `partyName`, `partyStatus`, `created_date`) VALUES
(1, 'Party 1', 1, '0000-00-00 00:00:00.000000'),
(2, 'Party 2', 1, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_orders`
--

CREATE TABLE `tbl_work_orders` (
  `work_id` int(50) NOT NULL,
  `received_date` varchar(255) NOT NULL,
  `partyName` int(50) NOT NULL,
  `order_number` int(50) NOT NULL,
  `job_work` varchar(500) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_work_orders`
--

INSERT INTO `tbl_work_orders` (`work_id`, `received_date`, `partyName`, `order_number`, `job_work`, `created_date`) VALUES
(1, '2nd Jan,2020', 2, 123, 'Saree design', '0000-00-00 00:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_google_admin`
--
ALTER TABLE `tbl_google_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_jobworks`
--
ALTER TABLE `tbl_jobworks`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `tbl_parties_details`
--
ALTER TABLE `tbl_parties_details`
  ADD PRIMARY KEY (`party_id`);

--
-- Indexes for table `tbl_work_orders`
--
ALTER TABLE `tbl_work_orders`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `parties` (`partyName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `tbl_google_admin`
--
ALTER TABLE `tbl_google_admin`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_jobworks`
--
ALTER TABLE `tbl_jobworks`
  MODIFY `job_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_parties_details`
--
ALTER TABLE `tbl_parties_details`
  MODIFY `party_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_work_orders`
--
ALTER TABLE `tbl_work_orders`
  MODIFY `work_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_work_orders`
--
ALTER TABLE `tbl_work_orders`
  ADD CONSTRAINT `parties` FOREIGN KEY (`partyName`) REFERENCES `tbl_parties_details` (`party_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

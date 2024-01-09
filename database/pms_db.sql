-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 09:01 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lab_records`
--

CREATE TABLE `lab_records` (
  `id` int(11) NOT NULL,
  `reg` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `records` varchar(500) NOT NULL,
  `gender` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_records`
--

INSERT INTO `lab_records` (`id`, `reg`, `name`, `date`, `records`, `gender`) VALUES
(1, 'FCP/CSE/18/1006', 'Mahmoud Muhammad Sani', '2024-01-09 20:53:22', 'Vitamin Test: A+ data seen\r\nBio sta test: C Divaticlogoly', ''),
(2, 'FCP/CSE/18/1006', 'Mahmoud Muhammad Sani', '2024-01-09 21:00:29', 'Malaria: Found, \r\nTypiod: Found,\r\nCattarh: Found', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `medicine_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `medicine_name`) VALUES
(1, 'Amoxicillin'),
(4, 'Antibiotic'),
(5, 'Antihistamine'),
(6, 'Atorvastatin'),
(3, 'Losartan'),
(2, 'Mefenamic'),
(7, 'Oxymetazoline');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_details`
--

CREATE TABLE `medicine_details` (
  `id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `packing` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicine_details`
--

INSERT INTO `medicine_details` (`id`, `medicine_id`, `packing`) VALUES
(1, 1, '50'),
(2, 4, '50'),
(3, 5, '50'),
(4, 6, '25'),
(5, 3, '80'),
(6, 2, '100'),
(7, 7, '25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cnic` varchar(17) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_name`, `address`, `cnic`, `date_of_birth`, `phone_number`, `gender`) VALUES
(1, 'Mark Cooper', 'Sample Address 101 - Updated', '123654789', '1999-06-23', '091235649879', 'Male'),
(2, 'Umar', 'Takur', 'fud', '2023-12-11', '08033223567', 'Male'),
(3, 'Alhassan Abubakar Ajeo', 'Hotoro', 'fud', '2023-12-11', '08033223567', 'Other'),
(4, 'Alhassan Abubakar Ajeo', 'Hotoro', 'fud', '2023-12-11', '08033223567', 'Other'),
(5, 'Abubakar', 'Mmr', 'fud/csc/19/2026', '2023-10-02', '08033223567', 'Male'),
(6, 'Alhassan Abubakar Ajeo', 'Hotoro', 'fud/csc/19/2026', '2023-12-11', '08033223567', 'Male'),
(7, 'Muazu Muhammad Chamo', 'Dorayi Karama No 98', '126654789', '1998-10-22', '08147254221', 'Male'),
(8, 'Mal Hassan', 'Kano', 'fud/csc/19/2026', '2024-01-08', '012336778', 'Male'),
(9, 'Naseer Sunusi', 'Dorayi', 'FCP/CSC/19/2024', '2024-01-08', '0914724221', 'Male'),
(10, 'Mahmoud Muhammad Sani', 'Fud', 'FCP/CSE/18/1006', '2024-01-09', '08105003394', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `patient_medication_history`
--

CREATE TABLE `patient_medication_history` (
  `id` int(11) NOT NULL,
  `patient_visit_id` int(11) NOT NULL,
  `medicine_details_id` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `dosage` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_medication_history`
--

INSERT INTO `patient_medication_history` (`id`, `patient_visit_id`, `medicine_details_id`, `quantity`, `dosage`) VALUES
(1, 1, 1, 5, '250'),
(2, 1, 6, 2, '500'),
(3, 2, 2, 2, '250'),
(4, 2, 7, 2, '250'),
(5, 5, 2, 10, '3'),
(6, 11, 2, 11, '2'),
(7, 12, 5, 11, '2');

-- --------------------------------------------------------

--
-- Table structure for table `patient_visits`
--

CREATE TABLE `patient_visits` (
  `id` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `bp` varchar(23) NOT NULL,
  `weight` varchar(12) NOT NULL,
  `disease` varchar(30) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_visits`
--

INSERT INTO `patient_visits` (`id`, `visit_date`, `next_visit_date`, `bp`, `weight`, `disease`, `patient_id`) VALUES
(1, '2022-06-28', '2022-06-30', '120/80', '65 kg.', 'Wounded Arm', 1),
(2, '2022-06-30', '2022-07-02', '120/80', '65 kg.', 'Rhinovirus', 1),
(3, '2023-12-13', '2023-10-10', '22', '130', 'Maleria', 7),
(4, '2023-12-06', '2023-12-14', '22', '130', 'Maleria', 7),
(5, '2024-01-09', '2024-01-03', '23', '34', 'Maleria', 7),
(6, '2024-01-10', '2024-01-25', '102', '70', 'Maleria', 7),
(7, '2024-01-01', '2024-01-31', '22', '34', 'Typhoid', 2),
(8, '2024-01-02', '2024-01-17', '11', '2', 'Maleria', 9),
(9, '2024-01-30', '2024-02-09', '33', '22', 'Typhoid', 9),
(10, '2024-01-10', '2024-01-07', '33', '66', 'MALERIA', 10),
(11, '2024-01-09', '2024-01-12', '33', '66', 'Malaria', 10),
(12, '2024-01-09', '2024-01-25', '33', '66', 'Malaria', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_picture` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `display_name`, `user_name`, `password`, `profile_picture`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', '17024714051656551981avatar.png '),
(2, 'MUAZ MUHAMMAD', 'chamo', 'd3db4008a767bff02538f95820e887b8', '1702303994fb.jpg '),
(3, 'Mal Hassan Jalo', 'jalo', '81dc9bdb52d04dc20036dbd8313ed055', '1704714030282-2829738_convocation-png.pn'),
(4, 'hhkj', 'hasan', '202cb962ac59075b964b07152d234b70', '1704714180IMG_5051.PNG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lab_records`
--
ALTER TABLE `lab_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicine_name` (`medicine_name`);

--
-- Indexes for table `medicine_details`
--
ALTER TABLE `medicine_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medicine_details_medicine_id` (`medicine_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_medication_history_patients_visits_id` (`patient_visit_id`),
  ADD KEY `fk_patient_medication_history_medicine_details_id` (`medicine_details_id`);

--
-- Indexes for table `patient_visits`
--
ALTER TABLE `patient_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patients_visit_patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lab_records`
--
ALTER TABLE `lab_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicine_details`
--
ALTER TABLE `medicine_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patient_visits`
--
ALTER TABLE `patient_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicine_details`
--
ALTER TABLE `medicine_details`
  ADD CONSTRAINT `fk_medicine_details_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`);

--
-- Constraints for table `patient_medication_history`
--
ALTER TABLE `patient_medication_history`
  ADD CONSTRAINT `fk_patient_medication_history_medicine_details_id` FOREIGN KEY (`medicine_details_id`) REFERENCES `medicine_details` (`id`),
  ADD CONSTRAINT `fk_patient_medication_history_patients_visits_id` FOREIGN KEY (`patient_visit_id`) REFERENCES `patient_visits` (`id`);

--
-- Constraints for table `patient_visits`
--
ALTER TABLE `patient_visits`
  ADD CONSTRAINT `fk_patients_visit_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

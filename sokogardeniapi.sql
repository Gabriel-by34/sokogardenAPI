-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2026 at 09:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sokogardeniapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(50) NOT NULL,
  `emp_name` text NOT NULL,
  `hire_date` date NOT NULL,
  `salary` int(50) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_name`, `hire_date`, `salary`, `dept_id`) VALUES
(2, 'Mary', '2021-07-25', 65000, 1),
(3, 'James', '2021-07-22', 48000, 2),
(5, 'Brian Mwangi', '2021-03-15', 75000, 1),
(6, 'Faith Wanjiku', '2022-06-10', 68000, 2),
(7, 'Kevin Otieno', '2023-01-08', 92000, 3),
(8, 'Mercy Achieng', '2021-11-19', 54000, 1),
(9, 'Dennis Kiprotich', '2022-04-25', 88000, 2),
(10, 'Ann Njeri', '2023-09-12', 47000, 3),
(11, 'Peter Kamau', '2021-08-30', 110000, 1),
(12, 'Lucy Atieno', '2022-12-05', 63000, 2),
(13, 'Samuel Mutua', '2024-02-17', 99000, 3),
(14, 'Grace Nyambura', '2021-05-14', 72000, 1),
(15, 'Eric Ochieng', '2023-03-21', 58000, 2),
(16, 'Jane Wambui', '2022-07-09', 81000, 3),
(17, 'Daniel Kiplagat', '2024-06-11', 120000, 1),
(18, 'Mary Waithera', '2021-10-28', 53000, 2),
(19, 'Joseph Maina', '2023-05-16', 87000, 3),
(20, 'Esther Chebet', '2022-09-03', 69000, 1),
(21, 'John Kariuki', '2024-01-20', 105000, 2),
(22, 'Cynthia Akinyi', '2021-04-18', 46000, 3),
(23, 'Paul Musyoka', '2023-08-07', 97000, 1),
(24, 'Beatrice Muthoni', '2022-02-14', 62000, 2),
(25, 'George Odhiambo', '2024-03-29', 115000, 3),
(26, 'Irene Jepkosgei', '2021-12-01', 57000, 1),
(27, 'Patrick Mwenda', '2023-10-23', 89000, 2),
(28, 'Lilian Naliaka', '2022-05-27', 73000, 3),
(29, 'Victor Ombati', '2024-07-04', 108000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

CREATE TABLE `employes` (
  `emp_id` int(100) NOT NULL,
  `emp_name` int(11) NOT NULL,
  `hire_date` int(11) NOT NULL,
  `salary` int(50) NOT NULL,
  `dept_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`emp_id`, `emp_name`, `hire_date`, `salary`, `dept_id`) VALUES
(1, 2020, 95000, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(2000) NOT NULL,
  `product_description` varchar(2000) NOT NULL,
  `product_cost` int(100) NOT NULL,
  `product_photo` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_photo`) VALUES
(1, 'smartphonekenya', 'efficient smartphone', 5500, '<FileStorage: \'smartphonekenya.avif\' (\'image/avif\')>'),
(2, 'smartphonekenya', 'efficient smartphone', 5500, 'smartphonekenya.avif'),
(6, 'Sumsung Adroid phone', 'samsung Galaxy S10prism', 17800, 'samsung galaxys10.jpeg'),
(7, 'Sumsung Adroid ', 'samsung Galaxy S11prism', 23800, 'samsung galaxys11.jpeg'),
(9, 'Sumsung Smartphone', 'samsung Galaxy S12,108gb', 20999, 'sumsung galaxy13pxm.jpeg'),
(10, 'Sumsung Smartphone', 'samsung Galaxy S13,108gb', 20999, 'sumsung galaxy13pxm.jpeg'),
(11, 'Sumsung Smartphone', 'samsung Galaxy S21,164', 159000, 'samsung galaxy s21 flap.jpeg'),
(12, 'Sumsung Smartphone', 'samsung Galaxy S27,168gb', 199000, 'Samsung 61247601-1109479.avif'),
(13, 'Sumsung Smartphone', 'samsung Galaxy S27,168gb', 199000, 'Samsung 61247601-1109479.avif'),
(14, 'Sumsung Smartphone', 'samsung Galaxy S27,168gb', 199000, 'Samsung 61247601-1109479.avif'),
(15, 'Sumsung Smartphone', 'samsung Galaxy S27,168gb', 199000, 'Samsung 61247601-1109479.avif');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` varchar(10000) NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_photo`) VALUES
(1, 'smartphonekenya', 'efficient smartphone', 5500, '<FileStorage: \'smartphonekenya.avif\' (\'image/avif\')>'),
(5, 'smartphonekenya', 'efficient smartphone', 5500, 'smartphonekenya.avif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`) VALUES
(1, 'Gabriel', 'museradotcom04@gmail.com', '0712347514', '1234'),
(2, 'Gabriel', 'museradotcom04@gmail.com', '0712347514', '1234'),
(3, 'Carol', 'carol@gmail.com', '0712347517', 'test'),
(4, 'Gabriel', 'gabriel.musera@yahoo.com', '0712314568', '4321'),
(5, 'Gabriel', 'museradotcom04@gmail.com', '0712347514', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `employes`
--
ALTER TABLE `employes`
  MODIFY `emp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

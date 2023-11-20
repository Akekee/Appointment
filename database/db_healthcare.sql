-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 06:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appId` int(3) NOT NULL,
  `patientIc` bigint(13) NOT NULL,
  `scheduleId` int(10) NOT NULL,
  `appSymptom` varchar(50) NOT NULL,
  `appComment` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'รอยืนยัน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appId`, `patientIc`, `scheduleId`, `appSymptom`, `appComment`, `status`) VALUES
(103, 6273576328579, 31, 'ผ่าฟันคุด', 'ไม่มี', 'ยืนยันเเล้ว'),
(104, 1739901947547, 32, 'รักษารากฟัน', 'ไม่มี', 'รอยืนยัน');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `password` varchar(12) NOT NULL,
  `doctorId` int(3) NOT NULL,
  `doctorFirstName` varchar(50) NOT NULL,
  `doctorAddress` varchar(100) NOT NULL,
  `doctorPhone` varchar(10) NOT NULL,
  `doctorEmail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`password`, `doctorId`, `doctorFirstName`, `doctorAddress`, `doctorPhone`, `doctorEmail`) VALUES
('admin1', 123, 'ผู้ดูแลระบบ', 'ตำบลทับปุด อำเภอทับปุด จังหวัดพังงา 82180', '0636061970', 'dsehgal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `doctordata`
--

CREATE TABLE `doctordata` (
  `doctor_id` int(11) NOT NULL,
  `doctor_Fname` varchar(50) NOT NULL,
  `doctor_Lname` varchar(50) NOT NULL,
  `doctor_phone` varchar(15) NOT NULL,
  `doctor_address` varchar(100) NOT NULL,
  `doctor_passid` varchar(20) NOT NULL,
  `doctor_service` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctordata`
--

INSERT INTO `doctordata` (`doctor_id`, `doctor_Fname`, `doctor_Lname`, `doctor_phone`, `doctor_address`, `doctor_passid`, `doctor_service`) VALUES
(11, 'สมชาย', 'มากดี', '0636061970', '', '1820700073605', 'นทันตกรรมความงาม'),
(12, 'ทพญ.', 'วรา', '779968866', '', '466464647', 'ทันตกรรมทั่วไป');

-- --------------------------------------------------------

--
-- Table structure for table `doctorschedule`
--

CREATE TABLE `doctorschedule` (
  `scheduleId` int(11) NOT NULL,
  `service` varchar(50) NOT NULL,
  `scheduleDate` date NOT NULL,
  `scheduleDay` varchar(15) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `bookAvail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `icPatient` bigint(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `patientFirstName` varchar(20) NOT NULL,
  `patientLastName` varchar(20) NOT NULL,
  `patientMaritialStatus` varchar(10) NOT NULL,
  `patientDOB` date NOT NULL,
  `patient_pre` varchar(10) NOT NULL,
  `patientAddress` varchar(100) NOT NULL,
  `patientPhone` varchar(10) NOT NULL,
  `Homenumber` varchar(20) NOT NULL,
  `moo` varchar(10) NOT NULL,
  `zipcode` int(8) NOT NULL,
  `districts` varchar(30) NOT NULL,
  `amphures` varchar(30) NOT NULL,
  `provinces` varchar(50) NOT NULL,
  `patientEmail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`icPatient`, `password`, `patientFirstName`, `patientLastName`, `patientMaritialStatus`, `patientDOB`, `patient_pre`, `patientAddress`, `patientPhone`, `Homenumber`, `moo`, `zipcode`, `districts`, `amphures`, `provinces`, `patientEmail`) VALUES
(1739901947547, '123', 'วีริยาพร', 'อินสวน', '', '2001-06-21', 'นางสาว', '', '0808714013', '272/138', '9', 84100, 'ขุนทะเล', 'เมือง', 'สุราษฎร์ธานี', '6304306001012@student.sru.ac.th'),
(3648758635263, '123', 'สมบูรณ์', 'ประสพมิตร', '', '2014-02-11', 'นางสาว', '', '0636067654', '9', '8', 84100, 'ทับปุด', 'นาสาร', 'ภูเก็ต', 'toip7@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appId`),
  ADD UNIQUE KEY `scheduleId_2` (`scheduleId`),
  ADD KEY `patientIc` (`patientIc`),
  ADD KEY `scheduleId` (`scheduleId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorId`);

--
-- Indexes for table `doctordata`
--
ALTER TABLE `doctordata`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctorschedule`
--
ALTER TABLE `doctorschedule`
  ADD PRIMARY KEY (`scheduleId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`icPatient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `doctordata`
--
ALTER TABLE `doctordata`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doctorschedule`
--
ALTER TABLE `doctorschedule`
  MODIFY `scheduleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

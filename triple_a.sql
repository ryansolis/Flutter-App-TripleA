-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 02:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `triple_a`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `id_number` varchar(15) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `id_number`, `first_name`, `last_name`, `password`, `level`) VALUES
(1, '16-1025-964', 'Chezly', 'Lopez', 'code0615', 'student'),
(2, '12-3456-789', 'Karen', 'Jones', 'code1234', 'admin'),
(3, '98-7654-321', 'Becky', 'Styles', 'code9876', 'personnel');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `snippet` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `snippet`, `image`, `description`) VALUES
(1, 'What to do after an earthquake', 'Safety Measures after an earthquake', 'Stress-bro.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(2, 'What you should have in your first aid kit', 'Always be ready for emergencies', 'Medicine-bro.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

-- --------------------------------------------------------

--
-- Table structure for table `classlist`
--

CREATE TABLE `classlist` (
  `studentid` int(11) NOT NULL,
  `emergencystatus` varchar(255) DEFAULT NULL,
  `locationx` int(11) DEFAULT NULL,
  `locationy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classlist`
--

INSERT INTO `classlist` (`studentid`, `emergencystatus`, `locationx`, `locationy`) VALUES
(100, 'safe', 15, 189),
(101, 'missing', 4, 149),
(102, 'absent', 0, 0),
(103, 'help', 65, 314),
(104, 'help', 36, 207),
(105, 'missing', 35, 69);

-- --------------------------------------------------------

--
-- Table structure for table `evacuationtable`
--

CREATE TABLE `evacuationtable` (
  `id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `main_building` int(11) DEFAULT NULL,
  `hs_building` int(11) DEFAULT NULL,
  `st_building` int(11) DEFAULT NULL,
  `main_canteen` int(11) DEFAULT NULL,
  `archi_building` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evacuationtable`
--

INSERT INTO `evacuationtable` (`id`, `date`, `duration`, `main_building`, `hs_building`, `st_building`, `main_canteen`, `archi_building`, `total`) VALUES
(1, 'November 30, 2020', 522, 312, 560, 211, 120, 364, 1567),
(2, 'December 4, 2020', 652, 312, 650, 121, 75, 453, 1611);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentid` int(11) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `programyear` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentid`, `lname`, `fname`, `program`, `programyear`) VALUES
(100, 'Baritua', 'James Clyde', 'BSCS', 3),
(101, 'Lopez', 'Chezly', 'BSCS', 3),
(102, 'Albano', 'Robbie', 'BSIT', 3),
(103, 'Manigos', 'Joshua Carl', 'BSCS', 3),
(104, 'Solis', 'Ray Anthony', 'BSCS', 3),
(105, 'Barbaso', 'Leah', 'BSCS', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classlist`
--
ALTER TABLE `classlist`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `evacuationtable`
--
ALTER TABLE `evacuationtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `evacuationtable`
--
ALTER TABLE `evacuationtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classlist`
--
ALTER TABLE `classlist`
  ADD CONSTRAINT `classlist_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

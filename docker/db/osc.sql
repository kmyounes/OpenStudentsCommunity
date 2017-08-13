-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 12, 2017 at 10:40 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `osc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL,
  `comment_text_content` text NOT NULL,
  `comment_file_path` varchar(256) DEFAULT NULL,
  `comment_creation_time` datetime NOT NULL,
  `comment_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `domain_id` int(11) NOT NULL,
  `domain_name` varchar(150) NOT NULL,
  `domain_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domain`
--

INSERT INTO `domain` (`domain_id`, `domain_name`, `domain_description`) VALUES
(1, 'Informatics', NULL),
(2, 'Medecine', NULL),
(3, 'aéronautique', 'bla bla bla');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1500573257),
('m130524_201442_init', 1500573262);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `module_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `specialty_id`, `module_name`, `module_description`) VALUES
(1, 1, 'Algo', NULL),
(2, 1, 'structure machine', NULL),
(3, 2, 'securite', NULL),
(4, 3, 'anatomie', NULL),
(5, 3, 'botanique', NULL),
(6, 6, 'avionique', 'Bla bla bla lba');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_time` datetime NOT NULL,
  `notification_seen` enum('seen','unseen''') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `other`
--

CREATE TABLE `other` (
  `other_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `other_first_name` varchar(100) NOT NULL,
  `other_last_name` varchar(100) NOT NULL,
  `other_birth_date` date NOT NULL,
  `other_activity` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other`
--

INSERT INTO `other` (`other_id`, `user_id`, `other_first_name`, `other_last_name`, `other_birth_date`, `other_activity`) VALUES
(1, 12, 'Mr', 'Nobody', '1995-07-20', 'I do things...');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `publication_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `publication_name` varchar(255) NOT NULL,
  `publication_text_content` text,
  `publication_directory` varchar(256) DEFAULT NULL,
  `publication_creation_time` datetime NOT NULL,
  `publication_place` int(11) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `publication_rate` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_id`, `user_id`, `module_id`, `tag_id`, `publication_name`, `publication_text_content`, `publication_directory`, `publication_creation_time`, `publication_place`, `publication_date`, `publication_rate`) VALUES
(1, 4, 1, 1, 'fssf', 'gsg', 'uploads/testPath.pdf', '2017-07-26 11:07:11', 1, '2017-03-03', 2),
(2, 2, 1, 1, 'fskjfml', 'lhlhlkh', 'any string to test', '2017-07-31 06:07:10', NULL, NULL, 0),
(3, 2, 5, 2, 'fsqf', 'fsqfqsf', 'uploads///5/', '2017-08-06 02:08:34', 1, '2017-08-02', 0),
(4, 2, 3, 2, 'Introduction securité', 'this is a test', 'uploads///3/', '2017-08-06 03:08:24', 1, '2017-08-16', 0),
(5, 2, 5, 2, 'stuff ', 'stuff ', 'uploads///5/', '2017-08-06 03:08:40', 1, '2017-08-01', 0),
(6, 2, 1, 1, 'qsfsq', 'fqsf', 'uploads///1/', '2017-08-06 03:08:40', 1, '2017-07-30', 0),
(7, 2, 3, 2, 'Introduction securité', 'fqsfqsf', 'uploads/1/2/3/', '2017-08-06 03:08:07', 1, '2017-08-01', 0),
(8, 2, 4, 1, 'Introdction à l\'anatomie', 'some information here', 'uploads/2/3/4/', '2017-08-06 03:08:49', 1, '2017-08-08', 0),
(9, 2, 6, 1, 'Apprendre à voler', 'des maisons :D', 'uploads/3/6/6/', '2017-08-06 03:08:26', 1, '2017-08-02', 0),
(10, 2, 1, 1, 'Introduction à l\'algorithmique', 'Voici le tout premier cours d\'algorithmique', 'uploads/1/1/1/', '2017-08-06 04:08:45', 1, '2017-08-01', 0),
(11, 2, 6, 2, 'Examen 2010-2011', 'le contenu de l\'examen le voici donc', 'uploads/3/6/6/', '2017-08-06 04:08:29', 1, '2011-01-19', 0),
(12, 2, 5, 1, 'Reconnaitre les plantes ', 'encore une fois le contenu de la publication dans un fichier txt', 'uploads/2/3/5/', '2017-08-06 04:08:40', 1, NULL, 0),
(13, 2, 3, 1, 'dqsfqs', 'fqsfqs', 'uploads/1/2/3/', '2017-08-06 09:08:20', 1, '2017-08-09', 0),
(14, 2, 4, 3, 'fqsfsq', 'fsfqs', 'uploads/2/3/4/', '2017-08-06 09:08:03', 1, '2017-08-10', 0),
(15, 2, 5, 2, 'Examen botanique ', 'Ceci est le premier examen de botanique', 'uploads/2/3/5/15', '2017-08-06 09:08:20', 1, '2017-06-07', 0),
(16, 3, 1, 1, 'qdsfqs', 'fqsfqsfqs', 'uploads/1/1/1/16', '2017-08-07 13:48:34', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `publication_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `reportedUser_id` int(11) DEFAULT NULL,
  `report_content` text NOT NULL,
  `report_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `school_name` text NOT NULL,
  `school_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`school_id`, `school_name`, `school_address`) VALUES
(1, 'Blabla', 'blablabla'),
(2, 'USTHB (Université des sceicnes eet technologies Houari boumediene)', 'Bab Ezzouar');

-- --------------------------------------------------------

--
-- Table structure for table `specialty`
--

CREATE TABLE `specialty` (
  `specialty_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `specialty_name` varchar(150) NOT NULL,
  `specialty_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialty`
--

INSERT INTO `specialty` (`specialty_id`, `domain_id`, `specialty_name`, `specialty_description`) VALUES
(1, 1, 'Informatique generale', NULL),
(2, 1, 'securité', NULL),
(3, 2, 'Medecine generale', NULL),
(4, 2, 'Cardiologie', NULL),
(5, 3, 'Propultion', 'bla bla bla'),
(6, 3, 'Avionique', 'bla bla bla bla');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `student_fisrt_name` varchar(100) NOT NULL,
  `student_last_name` varchar(100) NOT NULL,
  `student_birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `user_id`, `school_id`, `student_fisrt_name`, `student_last_name`, `student_birth_date`) VALUES
(1, 8, 1, 'MEDJKOUNE', 'Sofiane', '1995-02-18'),
(2, 9, 1, 'MDJK', 'Sofiane', '1997-08-08'),
(3, 13, 2, 'MAZRI', 'Sonia', '1995-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(64) NOT NULL,
  `tag_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`, `tag_description`) VALUES
(1, 'Course', NULL),
(2, 'Exam', ''),
(3, 'new tag', '');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `teacher_first_name` varchar(100) NOT NULL,
  `teacher_last_name` varchar(100) NOT NULL,
  `teacher_birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `user_id`, `school_id`, `domain_id`, `teacher_first_name`, `teacher_last_name`, `teacher_birth_date`) VALUES
(2, 11, 1, 1, 'Zekiri', 'Abdelmoumen', '1960-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('student','teacher','other','') COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `user_type`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'sofiane', 'student', 'xPzkgmlo9SUa4UWihjQbCn2XnzEyHwyJ', '$2y$13$HT2ESPJxbyyu3uq3HUFhM.2oG53s1.rCsbqk5FCRVE98S2.Hn0nmS', NULL, 'sofiane.medjkoune@protonmail.com', 10, 1501075141, 1501075141),
(3, 'SofSof', 'student', 'hNOOdyL5iKYWsLArBLoidcy2Bdgt58IH', '$2y$13$p.zBB0r3EH3UADCKEx7YZOO6iAamW4i4ymqpbgZZE7/UedT3m8okS', NULL, 'mail@gmail.com', 10, 1501090443, 1501090443),
(4, 'sof2', 'teacher', 'In0KAkbBF3idcUiGAp0zOk1n0PTafPNv', '$2y$13$yEc7gBkDu3bnhb4K56c7XO3QBghI/fGXDIzsP6jWbyPsr.h5Pj2Ga', NULL, '123@m.com', 10, 1501090476, 1501090476),
(5, 'sofTheSof', 'student', 'uEFsadsrbplGditWAaHprodvtg4nTEgp', '$2y$13$tywGyHxTPiZWmF/4M6VPDOHqbpvdNAoW6AwHh6XD1MXsT5WL.IzTO', NULL, 'sofiane.mdjk@gmail.fr', 10, 1501094936, 1501094936),
(6, 'SofSofSof', 'teacher', 'Gg9gjVe4R3eUiMImxxBr70k6wEY9v5u6', '$2y$13$9hDC5AriwXmXXGG0ehBqUeuXe1dR4YgHXyl9MT/TYdN.17oNTtUFW', NULL, 'admin@admin.com', 10, 1501095025, 1501095025),
(7, 'SofSoff', 'teacher', 'z-EZTILWx_dZBp6jC4Wa7m_1YNlN6lab', '$2y$13$Yh63xGeW9S5Bf70lYyzjGeaG4FYO2hqpWW/kYAPdRsgFpNCXrf1Om', NULL, 'admin@admin.fr', 10, 1501095076, 1501095076),
(8, 'SofSofiane', 'teacher', 'N9FwXkqQgLiy4T3IE5_5SfL76WGZgoJj', '$2y$13$LrXPua139VvEQdmffn6/L.61IQN5su2BzyaBqPb87GGLF3DITz9Ym', NULL, 'admin@admin.dz', 10, 1501095211, 1501095211),
(9, 'userX', 'student', 'MGqj9RQGYAVZS6ekqlIhMi4UPhlf2neb', '$2y$13$4eAsEa0rcQDDWTR2lB1dSOTPqnMnQCA/fcnC0EqbzziInBD98O1lO', NULL, 'UserX@gmail.com', 10, 1501971961, 1501971961),
(11, 'abdou la logique', 'teacher', 'qpV5uCpvKqrQgjhFXcZqxz-jc5wxAfhJ', '$2y$13$hlWHN2N2IOdk9co2YLMazuqVpfo/gZNlAE5gNR9KdR9GjsKU7h2ca', NULL, 'abdouLaLogique@gmail.com', 10, 1501975062, 1501975062),
(12, 'unknown', 'other', '6LJP8RXcz73nkvdfs9-8bboec7NrrCHo', '$2y$13$vC/ZDJrcR6hVEkKG18D8GuNShKKWDe8bU5zy2otebkEcxAAKj8ceO', NULL, 'unknown@gmail.com', 10, 1501976567, 1501976567),
(13, 'Soso', 'student', 'c1s3TceX612wOf-_W1J7N71cXC084ewX', '$2y$13$/DyPvV3naJ4gs4guRxxbk.D69PrPTQB80kGaaB1jxUm.xwWYRT0Hi', NULL, 'mazri.sonia@gmail.com', 10, 1502306479, 1502306479);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comment_user` (`user_id`),
  ADD KEY `fk_comment_publication` (`publication_id`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`domain_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `fk_module_specialty` (`specialty_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notification_comment` (`comment_id`),
  ADD KEY `fk_notification_user` (`user_id`);

--
-- Indexes for table `other`
--
ALTER TABLE `other`
  ADD PRIMARY KEY (`other_id`),
  ADD KEY `fk_other_user` (`user_id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `fk_publication_user` (`user_id`),
  ADD KEY `fk_publication_module` (`module_id`),
  ADD KEY `fk_publication_tag` (`tag_id`),
  ADD KEY `fk_publication_school` (`publication_place`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_report_user` (`user_id`),
  ADD KEY `fk_report_publication` (`publication_id`),
  ADD KEY `fk_report_comment` (`comment_id`),
  ADD KEY `fk_reportedUser_user` (`reportedUser_id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`specialty_id`),
  ADD KEY `fk_specialty_domain` (`domain_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_student_user` (`user_id`),
  ADD KEY `fk_student_school` (`school_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `fk_teacher_user` (`user_id`),
  ADD KEY `fk_teacher_school` (`school_id`),
  ADD KEY `fk_teacher_domain` (`domain_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domain`
--
ALTER TABLE `domain`
  MODIFY `domain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `other`
--
ALTER TABLE `other`
  MODIFY `other_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `publication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `specialty`
--
ALTER TABLE `specialty`
  MODIFY `specialty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_publication` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`publication_id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fk_module_specialty` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`specialty_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_comment` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `other`
--
ALTER TABLE `other`
  ADD CONSTRAINT `fk_other_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `fk_publication_module` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `fk_publication_school` FOREIGN KEY (`publication_place`) REFERENCES `school` (`school_id`),
  ADD CONSTRAINT `fk_publication_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  ADD CONSTRAINT `fk_publication_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `fk_report_comment` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `fk_report_publication` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`publication_id`),
  ADD CONSTRAINT `fk_report_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_reportedUser_user` FOREIGN KEY (`reportedUser_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `fk_specialty_domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`domain_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  ADD CONSTRAINT `fk_student_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_teacher_domain` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`domain_id`),
  ADD CONSTRAINT `fk_teacher_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  ADD CONSTRAINT `fk_teacher_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

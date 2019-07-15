-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 02:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbelearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbfeedback`
--

CREATE TABLE `tbfeedback` (
  `id_feedback` char(5) NOT NULL,
  `Notes_feedback` varchar(20) NOT NULL,
  `Tgl_posting` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbfeedbacksiswa`
--

CREATE TABLE `tbfeedbacksiswa` (
  `id_siswa` int(10) NOT NULL,
  `id_feedback` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbmateri`
--

CREATE TABLE `tbmateri` (
  `id_materi` char(5) NOT NULL,
  `Nama_materi` varchar(10) NOT NULL,
  `Jlh_materi` int(5) NOT NULL,
  `id_pengajar` char(5) NOT NULL,
  `id_siswa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpengajar`
--

CREATE TABLE `tbpengajar` (
  `id_pengajar` char(5) NOT NULL,
  `Alamat_pengajar` varchar(20) NOT NULL,
  `Nama_pengajar` varchar(20) NOT NULL,
  `Email_pengajar` varchar(15) NOT NULL,
  `id_siswa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpost`
--

CREATE TABLE `tbpost` (
  `id_siswa` int(10) DEFAULT NULL,
  `Nama_siswa` varchar(20) NOT NULL,
  `Jlh_pertanyaan` int(5) NOT NULL,
  `id_query` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbquery`
--

CREATE TABLE `tbquery` (
  `id_query` int(4) NOT NULL,
  `Pertanyaan` varchar(100) NOT NULL,
  `Tgl_bertanya` varchar(15) NOT NULL,
  `Jawaban` varchar(100) NOT NULL,
  `Tgl_menjawab` varchar(15) NOT NULL,
  `id_pengajar` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbsiswa`
--

CREATE TABLE `tbsiswa` (
  `id_siswa` int(10) NOT NULL,
  `Nama_siswa` varchar(20) NOT NULL,
  `Alamat_siswa` varchar(20) NOT NULL,
  `Telepon` int(13) NOT NULL,
  `Email_siswa` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbtempat`
--

CREATE TABLE `tbtempat` (
  `id_tempat` char(5) NOT NULL,
  `Nama_tempat` varchar(20) NOT NULL,
  `Lokasi` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbtempatsiswa`
--

CREATE TABLE `tbtempatsiswa` (
  `id_siswa` int(10) NOT NULL,
  `id_tmpt` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbfeedback`
--
ALTER TABLE `tbfeedback`
  ADD PRIMARY KEY (`id_feedback`);

--
-- Indexes for table `tbfeedbacksiswa`
--
ALTER TABLE `tbfeedbacksiswa`
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_feedback` (`id_feedback`);

--
-- Indexes for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD PRIMARY KEY (`id_pengajar`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tbpost`
--
ALTER TABLE `tbpost`
  ADD KEY `id_query` (`id_query`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tbquery`
--
ALTER TABLE `tbquery`
  ADD PRIMARY KEY (`id_query`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `tbsiswa`
--
ALTER TABLE `tbsiswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tbtempat`
--
ALTER TABLE `tbtempat`
  ADD PRIMARY KEY (`id_tempat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbfeedbacksiswa`
--
ALTER TABLE `tbfeedbacksiswa`
  ADD CONSTRAINT `tbfeedbacksiswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tbsiswa` (`id_siswa`),
  ADD CONSTRAINT `tbfeedbacksiswa_ibfk_2` FOREIGN KEY (`id_feedback`) REFERENCES `tbfeedback` (`id_feedback`);

--
-- Constraints for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD CONSTRAINT `tbmateri_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tbsiswa` (`id_siswa`),
  ADD CONSTRAINT `tbmateri_ibfk_2` FOREIGN KEY (`id_pengajar`) REFERENCES `tbpengajar` (`id_pengajar`);

--
-- Constraints for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD CONSTRAINT `tbpengajar_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tbsiswa` (`id_siswa`);

--
-- Constraints for table `tbpost`
--
ALTER TABLE `tbpost`
  ADD CONSTRAINT `tbpost_ibfk_1` FOREIGN KEY (`id_query`) REFERENCES `tbquery` (`id_query`),
  ADD CONSTRAINT `tbpost_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tbsiswa` (`id_siswa`);

--
-- Constraints for table `tbquery`
--
ALTER TABLE `tbquery`
  ADD CONSTRAINT `tbquery_ibfk_1` FOREIGN KEY (`id_pengajar`) REFERENCES `tbpengajar` (`id_pengajar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

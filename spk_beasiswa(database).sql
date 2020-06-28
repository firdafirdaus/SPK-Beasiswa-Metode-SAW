-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2020 at 09:28 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_beasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

CREATE TABLE `beasiswa` (
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`kd_beasiswa`, `nama`) VALUES
(1, 'Beasiswa PPA'),
(2, 'Beasiswa BIDIKMISI');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `kd_hasil` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_beasiswa`, `nim`, `nilai`, `tahun`) VALUES
(21, 1, '01703037', 1, '2020'),
(22, 1, '01703007', 0.666667, '2020'),
(23, 1, '01703038', 0.533333, '2020'),
(24, 2, '01703002', 1, '2020'),
(25, 2, '01703007', 1, '2020');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `kd_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_beasiswa`, `nama`, `sifat`) VALUES
(1, 1, 'IPK', 'max'),
(2, 1, 'Semester', 'max'),
(3, 1, 'Penghasilan Orangtua', 'min'),
(7, 2, 'Semester', 'min'),
(8, 2, 'Penghasilan Orang Tua', 'min'),
(9, 2, 'Tanggungan Orang Tua', 'max');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_mengajukan` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `jenis_kelamin`, `tahun_mengajukan`) VALUES
('01703002', 'Sri Wahyuni', 'Cabbeng', 'Perempuan', '2020'),
('01703007', 'Firda Firdaus', 'Leworeng', 'Perempuan', '2020'),
('01703037', 'Yasmin', 'Batu - Batu', 'Laki-laki', '2020'),
('01703038', 'Syahrul ', 'Soppeng', 'Laki-laki', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `kd_model` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`kd_model`, `kd_beasiswa`, `kd_kriteria`, `bobot`) VALUES
(1, 1, 1, '0.50'),
(2, 1, 2, '0.20'),
(3, 1, 3, '0.30'),
(7, 2, 7, '0.40'),
(8, 2, 8, '0.40'),
(9, 2, 9, '0.20');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kd_nilai` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_beasiswa`, `kd_kriteria`, `nim`, `nilai`) VALUES
(93, 1, 1, '01703007', 1),
(94, 1, 2, '01703007', 3),
(95, 1, 3, '01703007', 2),
(96, 1, 1, '01703037', 3),
(97, 1, 2, '01703037', 3),
(98, 1, 3, '01703037', 2),
(99, 2, 7, '01703002', 3),
(100, 2, 8, '01703002', 1),
(101, 2, 9, '01703002', 1),
(102, 1, 1, '01703038', 1),
(103, 1, 2, '01703038', 1),
(104, 1, 3, '01703038', 2),
(105, 2, 7, '01703007', 2),
(106, 2, 8, '01703007', 1),
(107, 2, 9, '01703007', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `kd_pengguna` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `status` enum('petugas','puket','mahasiswa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`kd_pengguna`, `username`, `password`, `status`) VALUES
(1, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(2, 'puket', 'b679a71646e932b7c4647a081ee2a148', 'puket');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `kd_penilaian` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`kd_penilaian`, `kd_beasiswa`, `kd_kriteria`, `keterangan`, `bobot`) VALUES
(1, 1, 1, '3.00 - 3.20', 1),
(2, 1, 1, '3.21 - 3.40', 2),
(3, 1, 1, '3.41 - 3.40', 3),
(4, 1, 1, '>= 3.61', 4),
(5, 1, 2, '2 - 3', 1),
(6, 1, 2, '4 - 5', 2),
(7, 1, 2, '6 - 7', 3),
(8, 1, 2, '8', 4),
(9, 1, 3, '<= 500000', 1),
(10, 1, 3, '600000 - 1500000', 2),
(11, 1, 3, '1600000 - 2500000', 3),
(12, 1, 3, '>= 2600000', 4),
(25, 2, 7, '2 - 3', 1),
(26, 2, 7, '4 - 5', 2),
(27, 2, 7, '6 - 7', 3),
(28, 2, 7, '8', 4),
(29, 2, 8, '<= 500000', 1),
(30, 2, 8, '600000 - 1500000', 2),
(31, 2, 8, '1600000 - 2500000', 3),
(32, 2, 8, '>= 2600000', 4),
(33, 2, 9, '1 - 2', 1),
(34, 2, 9, '3 - 4', 2),
(35, 2, 9, '5 - 6', 3),
(36, 2, 9, '>= 7', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`kd_beasiswa`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`kd_hasil`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`kd_kriteria`),
  ADD KEY `kd_beasiswa` (`kd_beasiswa`),
  ADD KEY `kd_beasiswa_2` (`kd_beasiswa`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`kd_model`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kd_nilai`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`kd_pengguna`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`kd_penilaian`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `kd_beasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `kd_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `kd_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kd_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `kd_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `kd_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_beasiswa` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

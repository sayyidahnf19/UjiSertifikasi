-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 03:14 AM
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
-- Database: `onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '$2y$10$S/rkfvHUnYJO0xPwm3uOYOmUAPdSy5dP4n.Qs1y5Eoy9DLya5TU2u');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `namaLengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `password`, `namaLengkap`, `email`, `dob`, `gender`, `alamat`, `kota`, `contact`) VALUES
('nisa', '$2y$10$yD5EBoJcjSjTw9FTulvCIOpkZtVbop.olM9pAfBrfkoJdEEisTu9m', 'Sayyidah Nafisah', 'nisa@gmail.com', '2024-09-27', 'female', 'jl kesana', 'Surabaya', '087564646789');

-- --------------------------------------------------------

--
-- Table structure for table `guestbook`
--

CREATE TABLE `guestbook` (
  `idGuest` varchar(255) NOT NULL,
  `namaGuest` varchar(255) NOT NULL,
  `emailGuest` varchar(255) NOT NULL,
  `pesanGuest` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guestbook`
--

INSERT INTO `guestbook` (`idGuest`, `namaGuest`, `emailGuest`, `pesanGuest`) VALUES
('GUEST-1727399003', 'Sayyidah Nafisah', 'nisa@gmail.com', '<p>ncndiw windiwnckanf</p>');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `idKeranjang` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `idProduk` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('Belum Dibayar','Dibayar','Dibatalkan') NOT NULL,
  `idTransaksi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`idKeranjang`, `username`, `idProduk`, `jumlah`, `harga`, `status`, `idTransaksi`) VALUES
(119, 'nisa', 'PRD-1696503432', 1, 23000, 'Dibatalkan', 'TRS-1727393266'),
(120, 'nisa', 'PRD-1696585133', 1, 325000, 'Dibayar', 'TRS-1727393751');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idProduk` varchar(255) NOT NULL,
  `namaProduk` varchar(255) NOT NULL,
  `kategoriProduk` varchar(255) NOT NULL,
  `hargaProduk` int(11) NOT NULL,
  `stokProduk` int(11) NOT NULL,
  `gambarProduk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idProduk`, `namaProduk`, `kategoriProduk`, `hargaProduk`, `stokProduk`, `gambarProduk`) VALUES
('PRD-1696503432', 'Ponstan 5000', 'Obat dan Suplemen', 23000, 15, '65215147d427f.jpg'),
('PRD-1696569821', 'Ibuprofen', 'Obat dan Suplemen', 7000, 39, '65225dc07e1e9.jpg'),
('PRD-1696585133', 'Oximeter', 'Alat Pemantau Kesehatan', 325000, 4, '65215243b441e.jpg'),
('PRD-1696681878', 'Weifeng Tekken', 'Alat Bantu Jalan', 200000, 10, '65214f964da7b.jpg'),
('PRD-1696681976', 'Stetoskop', 'Peralatan Medis', 40000, 77, '65214ff8837ba.jpg'),
('PRD-1696751145', 'Beurer MG15', 'Alat Terapi dan Rehabilitasi', 425000, 14, '65225e290296f.jpg'),
('PRD-1727396452', 'Antasida', 'Obat dan Suplemen', 15000, 34, '66f5fa646db28.jpg'),
('PRD-1727396526', 'Alprazolam', 'Obat dan Suplemen', 36000, 23, '66f5faaed39a4.jpg'),
('PRD-1727396645', 'Kursi Roda', 'Alat Bantu Jalan', 560000, 13, '66f5fb25be776.jpeg'),
('PRD-1727396739', 'Tensimeter', 'Peralatan Medis', 125000, 28, '66f5fb8325be5.jpeg'),
('PRD-1727396883', 'Timbangan Badan', 'Peralatan Medis', 65000, 30, '66f5fc1334600.jpeg'),
('PRD-1727396977', 'Alat Cek Kolestrol', 'Alat Ukur Kesehatan', 250000, 7, '66f5fc7145464.jpeg'),
('PRD-1727397040', 'Otoskop', 'Alat Pemantau Kesehatan', 200000, 4, '66f5fcb0e4c26.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idTransaksi` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `tanggalTransaksi` date NOT NULL,
  `caraBayar` enum('Prepaid','Postpaid') NOT NULL,
  `bank` varchar(255) NOT NULL,
  `statusTransaksi` enum('Pending','Accepted','Rejected','Cancelled') NOT NULL,
  `totalHarga` int(11) NOT NULL,
  `statusPengiriman` enum('Pending','Dalam Perjalanan','Terkirim','Dibatalkan') NOT NULL,
  `feedBack` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idTransaksi`, `username`, `tanggalTransaksi`, `caraBayar`, `bank`, `statusTransaksi`, `totalHarga`, `statusPengiriman`, `feedBack`) VALUES
('TRS-1727393266', 'nisa', '2024-09-27', 'Prepaid', 'BNI', 'Cancelled', 23000, 'Dibatalkan', ''),
('TRS-1727393751', 'nisa', '2024-09-27', 'Prepaid', 'BCA', 'Accepted', 325000, 'Dalam Perjalanan', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`idGuest`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idKeranjang`),
  ADD KEY `username` (`username`,`idProduk`),
  ADD KEY `idProduk` (`idProduk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idProduk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `idKeranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`idProduk`) REFERENCES `produk` (`idProduk`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

`pembayaran`-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 06:29 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpizza_toba`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id_coupon` int(11) NOT NULL,
  `jenis` varchar(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pesanan`
--

CREATE TABLE `daftar_pesanan` (
  `id_dp` int(11) NOT NULL,
  `jenis` varchar(11) NOT NULL,
  `tgl_dipesan` datetime(6) NOT NULL,
  `harga` int(50) NOT NULL,
  `deskrips` varchar(50) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelangan`
--

CREATE TABLE `pelangan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` int(15) NOT NULL,
  `email` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_produk`
--

CREATE TABLE `pelanggan_produk` (
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `total_pembayaran` int(50) NOT NULL,
  `metode` varchar(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(17) NOT NULL,
  `gambar_produk` varchar(50) NOT NULL,
  `harga_produk` int(25) NOT NULL,
  `jenis_produk` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `gambar_produk`, `harga_produk`, `jenis_produk`) VALUES
(0, '', '', 0, ''),
(111, 'Pizza Andaliman', 'gbr1.jpeg', 150000, 'Large'),
(112, 'Pizza Andaliman', '', 100000, 'Medium'),
(113, 'Pizza Andaliman', '', 50000, 'Small'),
(121, 'Bandrek', 'gbr2.jpeg', 15000, 'Hot'),
(122, 'Jahe Madu', 'gbr3.jpeg', 20000, 'Hot'),
(123, 'Teh Susu Telur', 'gbr4.jpeg', 18000, 'Hot'),
(124, 'Boba Jahe', 'gbr5.jpeg', 25000, 'Cool'),
(125, 'Teh Manis', 'gbr6.jpeg', 10000, 'Cool'),
(126, 'Teh Manis', 'gbr7.jpeg', 15000, 'Hot'),
(127, 'Kopi', 'gbr8.jpeg', 20000, 'Hot'),
(128, 'Wedang Jahe', 'gbr9.jpeg', 25000, 'Hot'),
(221, 'Pizza Singkong', 'gbr10.jpeg', 200000, 'Large'),
(222, 'Pizza Singkong', '', 130000, 'Medium'),
(223, 'Pizza Singkong', '', 65000, 'Small'),
(331, 'Pizza Rendang', 'gbr11.jpeg', 180000, 'Large'),
(332, 'Pizza Rendang', '', 120000, 'Medium'),
(333, 'Pizza Rendang', '', 60000, 'Small'),
(442, 'Pizza Roll', 'gbr12.jpeg', 105000, 'Medium'),
(443, 'Pizza Roll', '', 70000, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pembelian`
--

CREATE TABLE `riwayat_pembelian` (
  `id_rp` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tlg_dipesan` datetime(6) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `total_pembayaran` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id_coupon`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `daftar_pesanan`
--
ALTER TABLE `daftar_pesanan`
  ADD PRIMARY KEY (`id_dp`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pelanggan_produk`
--
ALTER TABLE `pelanggan_produk`
  ADD KEY `id_pelanggan` (`id_pelanggan`,`id_produk`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  ADD PRIMARY KEY (`id_rp`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pelanggan_2` (`id_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`id_coupon`) REFERENCES `pelangan` (`id_pelanggan`);

--
-- Constraints for table `daftar_pesanan`
--
ALTER TABLE `daftar_pesanan`
  ADD CONSTRAINT `daftar_pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`);

--
-- Constraints for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD CONSTRAINT `pelangan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `daftar_pesanan` (`id_pelanggan`);

--
-- Constraints for table `pelanggan_produk`
--
ALTER TABLE `pelanggan_produk`
  ADD CONSTRAINT `pelanggan_produk_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`),
  ADD CONSTRAINT `pelanggan_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`);

--
-- Constraints for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  ADD CONSTRAINT `riwayat_pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

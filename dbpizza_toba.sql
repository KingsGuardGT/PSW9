-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2022 at 03:32 PM
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

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`id_coupon`, `jenis`, `potongan`, `id_pelanggan`) VALUES
(1, 'kupon minum', 50, 123),
(2, 'Kupon minum', 40, 133),
(3, 'Kupon minum', 80, 153),
(4, 'Kupon minum', 90, 163);

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pesanan`
--

CREATE TABLE `daftar_pesanan` (
  `id_dp` int(11) NOT NULL,
  `jenis` varchar(11) NOT NULL,
  `tgl_dipesan` datetime(6) NOT NULL,
  `harga` int(50) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_pesanan`
--

INSERT INTO `daftar_pesanan` (`id_dp`, `jenis`, `tgl_dipesan`, `harga`, `deskripsi`, `jumlah`) VALUES
(101, 'Large', '2022-04-14 09:58:49.000000', 150000, 'Pizza Andaliman', 1),
(102, 'Hot', '2022-04-14 10:02:54.000000', 20000, 'Kopi', 1),
(201, 'Medium', '2022-04-15 10:03:35.000000', 120000, 'Pizza Rendang', 1),
(202, 'Cool', '2022-04-15 10:05:05.000000', 25000, 'Boba Jahe', 1),
(301, 'Medium', '2022-04-16 10:05:50.000000', 100000, 'Pizza Andaliman', 1),
(302, 'Hot', '2022-04-16 10:07:22.000000', 50000, 'Wedang Jahe', 2),
(401, 'Large', '2022-04-17 10:09:47.000000', 200000, 'Pizza Singkong', 1),
(402, 'Cool', '2022-04-17 10:10:49.000000', 20000, 'Teh Manis', 2),
(501, 'Medium', '2022-04-18 10:11:38.000000', 210000, 'Pizza Roll', 2),
(502, 'Hot', '2022-04-18 10:12:25.000000', 36000, 'Teh Susu Telur', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pelangan`
--

CREATE TABLE `pelangan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` int(15) NOT NULL,
  `email` varchar(15) NOT NULL,
  `id_dp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelangan`
--

INSERT INTO `pelangan` (`id_pelanggan`, `nama_lengkap`, `alamat`, `no_telp`, `email`, `id_dp`) VALUES
(123, 'Yuni Siagian', 'Pintupohan', 2147483647, 'yunisiagian33@g', 101),
(124, 'Yuni Samosir', 'Pintupohan', 2147483647, 'yunisiagian33@g', 102),
(133, 'Angel Sihombing', 'Balige', 2147483647, 'angelsihombing@', 201),
(134, 'Fitri Sihombing', 'Balige', 2147483647, 'angelsihombing@', 202),
(143, 'Salma Witasarah', 'Porsea', 2147483647, 'salma45@gmail.c', 301),
(144, 'Jesika Witasarah', 'Porsea', 2147483647, 'salma45@gmail.c', 302),
(153, 'Riki Vitro', 'Siborong-borong', 2147483647, 'rikivitro@gmail', 401),
(154, 'Riki sastro', 'Siborong-borong', 2147483647, 'rikivitro@gmail', 402),
(163, 'Winda Sari', 'Pintupohan', 2147483647, 'winda23@gmail.c', 501),
(164, 'Winda Siagian', 'Pintupohan', 2147483647, 'winda23@gmail.c', 502);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_produk`
--

CREATE TABLE `pelanggan_produk` (
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan_produk`
--

INSERT INTO `pelanggan_produk` (`id_pelanggan`, `id_produk`) VALUES
(123, 111),
(124, 127),
(133, 332),
(134, 124),
(143, 112),
(144, 128),
(153, 221),
(154, 125),
(163, 442),
(164, 123);

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

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `nama_pelanggan`, `total_pembayaran`, `metode`, `id_pelanggan`) VALUES
(11, 'Yuni Siagian', 150000, 'manual', 123),
(12, 'Yuni Samosir', 20000, 'manual', 124),
(13, 'Angel Sihombing', 120000, 'manual', 133),
(14, 'Fitri Sihombing', 25000, 'manual', 134),
(15, 'Salma Witasarah', 100000, 'manual', 143),
(16, 'Jesika Witasarah', 50000, 'manual', 144),
(17, 'Riki Vitro', 200000, 'manual', 153),
(18, 'Riki sastro', 20000, 'manual', 154),
(19, 'Winda Sari', 210000, 'manual', 163),
(20, 'Winda Siagian', 36000, 'manual', 164);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(17) NOT NULL,
  `gambar_produk` varchar(50) NOT NULL,
  `harga_produk` int(25) NOT NULL,
  `jenis_produk` varchar(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `gambar_produk`, `harga_produk`, `jenis_produk`, `id_kategori`) VALUES
(0, '', '', 0, '', 0),
(111, 'Pizza Andaliman', 'gbr1.jpg', 150000, 'Large', 1),
(112, 'Pizza Andaliman', 'gbr1,1.jpg', 100000, 'Medium', 1),
(113, 'Pizza Andaliman', 'gbr1,2.jpg', 50000, 'Small', 1),
(121, 'Bandrek', 'gbr2.jpeg', 15000, 'Hot', 2),
(122, 'Jahe Madu', 'gbr3.jpg', 20000, 'Hot', 2),
(123, 'Teh Susu Telur', 'gbr4.jpeg', 18000, 'Hot', 2),
(124, 'Boba Jahe', 'gbr5.jpeg', 25000, 'Cool', 2),
(125, 'Teh Manis', 'gbr6.jpeg', 10000, 'Cool', 2),
(126, 'Teh Manis', 'gbr7.jpeg', 15000, 'Hot', 2),
(127, 'Kopi', 'gbr8.jpeg', 20000, 'Hot', 2),
(128, 'Wedang Jahe', 'gbr9.jpeg', 25000, 'Hot', 2),
(221, 'Pizza Singkong', 'gbr10.jpeg', 200000, 'Large', 1),
(222, 'Pizza Singkong', 'gbr10,1.jpeg', 130000, 'Medium', 1),
(223, 'Pizza Singkong', 'gbr10,2.jpeg', 65000, 'Small', 1),
(331, 'Pizza Rendang', 'gbr11.jpeg', 180000, 'Large', 1),
(332, 'Pizza Rendang', 'gbr11,1.jpeg', 120000, 'Medium', 1),
(333, 'Pizza Rendang', 'gbr11.2.jpeg', 60000, 'Small', 1),
(442, 'Pizza Roll', 'gbr12.jpeg', 105000, 'Medium', 1),
(443, 'Pizza Roll', 'gbr12,1.jpeg', 70000, 'Small', 1),
(551, 'Keripik Singkong', 'gbr13.jpeg', 20000, 'Medium', 3),
(552, 'Keripik Melinjo', 'gbr14.jpeg', 30000, 'Medium', 3),
(553, 'Kacang Sihobus', 'gbr15.jpeg', 35000, 'Medium', 3);

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_kategori`
--

INSERT INTO `produk_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Pizza'),
(2, 'Beverages'),
(3, 'Snack');

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
-- Dumping data for table `riwayat_pembelian`
--

INSERT INTO `riwayat_pembelian` (`id_rp`, `id_pelanggan`, `tlg_dipesan`, `nama_produk`, `total_pembayaran`) VALUES
(1, 123, '2022-04-14 19:52:01.000000', 'Pizza Andaliman', 150000),
(2, 124, '2022-04-14 19:52:51.000000', 'Kopi', 20000),
(3, 133, '2022-04-15 19:56:48.000000', 'Pizza Rendang', 120000),
(4, 134, '2022-04-15 19:57:31.000000', 'Boba Jahe', 25000),
(5, 143, '2022-04-16 19:58:19.000000', 'Pizza Andaliman', 100000),
(6, 144, '2022-04-16 19:59:55.000000', 'Wedang Jahe', 50000),
(7, 153, '2022-04-17 20:00:30.000000', 'Pizza Singkong', 200000),
(8, 154, '2022-04-17 20:01:13.000000', 'Teh Manis', 20000),
(9, 163, '2022-04-18 20:01:52.000000', 'Pizza Roll', 210000),
(11, 164, '2022-04-18 20:02:24.000000', 'Teh Susu Telur', 36000);

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
  ADD PRIMARY KEY (`id_dp`);

--
-- Indexes for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `pelangan_ibfk_1` (`id_dp`);

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
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_kategori` (`id_kategori`);

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
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`);

--
-- Constraints for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD CONSTRAINT `pelangan_ibfk_1` FOREIGN KEY (`id_dp`) REFERENCES `daftar_pesanan` (`id_dp`);

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
-- Constraints for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD CONSTRAINT `produk_kategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `produk` (`id_kategori`);

--
-- Constraints for table `riwayat_pembelian`
--
ALTER TABLE `riwayat_pembelian`
  ADD CONSTRAINT `riwayat_pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelangan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

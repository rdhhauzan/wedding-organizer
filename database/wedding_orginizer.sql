-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19 Sep 2023 pada 17.49
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wedding_orginizer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'Catering'),
(2, 'Dekorasi'),
(3, 'Gaun Pengantin'),
(4, 'Souvenir'),
(5, 'Rental Mobil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_gambar`
--

CREATE TABLE `detail_gambar` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_gambar`
--

INSERT INTO `detail_gambar` (`id`, `id_produk`, `foto`) VALUES
(1, 1, '16b05bb19c7d9da8073a7f48f8b73bb6.jpg'),
(2, 2, '0b2d2432bbf61792ed12a7eb8613db1e.png'),
(3, 3, 'bd465f3230ab47690d283da782486faf.jpg'),
(4, 3, '986e0e948dbc445c3ecb8ba1d61568d4.jpg'),
(5, 4, '8be075ae4c07d35f4782bacd658a16a1.jpg'),
(11, 5, '2e63ec3f635047502e6fca4134f14442.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id_detail` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `kuantiti` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id_detail`, `id_customer`, `id_produk`, `kuantiti`, `harga`) VALUES
(1, 5, 4, 1, 200000),
(1, 5, 1, 1, 100000),
(1, 5, 2, 1, 45000000),
(1, 5, 3, 1, 10000000),
(2, 5, 1, 2, 200000),
(2, 5, 2, 1, 45000000),
(3, 5, 1, 2, 200000),
(3, 5, 2, 1, 45000000),
(4, 8, 1, 1, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `rekening_dp` varchar(30) DEFAULT NULL,
  `rekening_lunas` varchar(30) DEFAULT NULL,
  `tgl_pembayaran_dp` date DEFAULT NULL,
  `tgl_pembayaran_lunas` date DEFAULT NULL,
  `bayar` int(11) NOT NULL,
  `foto_dp` varchar(255) DEFAULT NULL,
  `foto_lunas` varchar(255) DEFAULT NULL,
  `status` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `id_customer`, `rekening_dp`, `rekening_lunas`, `tgl_pembayaran_dp`, `tgl_pembayaran_lunas`, `bayar`, `foto_dp`, `foto_lunas`, `status`) VALUES
(1, 1, 5, 'BCA', NULL, '2022-07-22', NULL, 27650000, '325c034f9b6c28266b3a4263daf263eb.png', NULL, '1'),
(2, 4, 8, NULL, 'MANDIRI', NULL, '2023-09-19', 123456789, NULL, '7f84d18bb8bfd701f616bd73941fe2bf.jpg', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_detail` int(11) NOT NULL,
  `order_number` varchar(30) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total_harga` int(11) NOT NULL,
  `status` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_customer`, `id_detail`, `order_number`, `tgl_pembelian`, `total_harga`, `status`) VALUES
(1, 5, 1, 'A00SOAN', '2022-07-22', 55300000, '2'),
(2, 5, 2, 'A00LCKN', '2022-08-12', 45200000, '1'),
(3, 5, 3, 'A00EFY3', '2022-09-23', 45200000, '1'),
(4, 8, 4, 'A003JLL', '2023-09-19', 100000, '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_gambar` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `id_category`, `id_gambar`, `nama`, `harga`, `description`) VALUES
(1, 1, 1, 'Ayam Kremes', 100000, 'Ayam Kremes Enak'),
(2, 2, 2, 'Dekorasi Mewah Jawa', 45000000, 'Dekorasi mewah jawa'),
(3, 3, 3, 'Gaun Pengantin Gold', 10000000, 'Gaun Pengantin Gold'),
(4, 4, 4, 'Hampers Pernikahan Mewah', 200000, 'Hampers Pernikahan Mewah'),
(6, 5, 5, 'INNOVA REBORN', 500000, 'Rental harian maupun drop');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `no_rekening` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id`, `nama_bank`, `no_rekening`) VALUES
(1, 'BNI', 1234567890),
(2, 'BCA', 2147483647),
(3, 'BRI', 2147483647),
(4, 'MANDIRI', 2147483647);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `role` enum('Admin','Owner','Customer') NOT NULL,
  `is_active` enum('1','2') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `password`, `no`, `alamat`, `gender`, `role`, `is_active`, `created_at`) VALUES
(2, 'admin wo', 'admin@gmail.com', '$2y$10$hcgXlqfhjbGqwv2/B02KLOho3NnZM2/AZX9vz74IFwa3gvSiiDJNa', '181018101810', 'jakarta', 'L', 'Admin', '1', NULL),
(6, 'Owner', 'owner@gmail.com', '$2y$10$hcgXlqfhjbGqwv2/B02KLOho3NnZM2/AZX9vz74IFwa3gvSiiDJNa', '', '', '', 'Owner', '1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `detail_gambar`
--
ALTER TABLE `detail_gambar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `detail_gambar`
--
ALTER TABLE `detail_gambar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

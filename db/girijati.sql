-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 12:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `girijati`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'dontol', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'felix', '$2y$10$zObQp8Kt9q29/pmcq.8Un.8FsvRzdRVzhHtXbOjlfSDkiPKAuJ4CK');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `size` varchar(10) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `harga`, `quantity`, `size`, `added_at`) VALUES
(127, 8, 116, 120000.00, 1, 'L', '2025-06-19 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `looks`
--

CREATE TABLE `looks` (
  `id` int(11) NOT NULL,
  `look_name` varchar(255) DEFAULT NULL,
  `look_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `looks`
--

INSERT INTO `looks` (`id`, `look_name`, `look_image`) VALUES
(8, 'Putih Anggun', '(Free Shipping for Min_ Purchase $200 and Free….jpg'),
(9, 'Pria Jawa Sederhana', '01e43789-64aa-4b72-81c3-5ad8b2e99c77.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `look_produk`
--

CREATE TABLE `look_produk` (
  `id` int(11) NOT NULL,
  `look_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `look_produk`
--

INSERT INTO `look_produk` (`id`, `look_id`, `produk_id`) VALUES
(11, 8, 104),
(12, 8, 105),
(13, 9, 110),
(14, 9, 111);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status` enum('Pending','Diproses','Dikirim','Selesai','Dibatalkan') DEFAULT 'Pending',
  `tanggal_pesanan` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_penerima` varchar(255) NOT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `alamat_pengiriman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `waktutambah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `kategori`, `harga`, `deskripsi`, `stok`, `gambar`, `waktutambah`) VALUES
(103, 'Batik Lengan Panjang Pria – Parang Barong', 'Pria', 275000.00, 'Cocok untuk: Acara formal & semi-formal', 0, '6853d49140586_batik 1.jpg', '2025-06-19 09:12:49'),
(104, 'Outer Panjang', 'Wanita', 135000.00, 'Outer Putih Lengan Panjang', 0, '6853d4db9f700_(Free Shipping for Min_ Purchase $200 and Free….jpg', '2025-06-19 09:14:03'),
(105, 'Obi Belt Putih', 'Lain', 100000.00, 'Obi Belt Warna Putih', 0, '6853d53cc5f9a_(Free Shipping for Min_ Purchase $200 and Free… (1).jpg', '2025-06-19 09:56:50'),
(106, 'Outer Batik Teknik Percik', 'Lain', 110000.00, 'Cocok Untuk Pria maupun Wanita', 0, '6853d7b6b7488_777a8ab2-0800-45f2-8b8d-958b7b62cd09.jpg', '2025-06-19 09:26:14'),
(107, 'Toote Bag Batik', 'Lain', 85000.00, 'Tote bag dari bahan batik', 0, '6853d8281f628_60ce3c5f-8193-45b3-8476-ac36339c4e0b.jpg', '2025-06-19 09:28:08'),
(108, 'Tas Serut', 'Lain', 95000.00, 'Tas', 0, '6853d8891a471_Get my art printed on awesome products_ Support me….jpg', '2025-06-19 09:29:45'),
(109, 'Syall Batik Motif Random', 'Lain', 55000.00, 'syall', 0, '6853d9d84259a_From flowy rayon, this lovely patchwork scarf will….jpg', '2025-06-19 09:35:20'),
(110, 'Celana Batik Tulis', 'Pria', 255000.00, 'celana panjang', 0, '6853da3986759_366b7b04-ca34-4431-8e6a-c0c1ca5f8ec4.jpg', '2025-06-19 09:36:57'),
(111, 'Kemeja Moderen Putih', 'Pria', 125000.00, 'kemeja putih', 0, '6853db4916b1a_(Free Shipping for Min_ Purchase $200 and Free… (2).jpg', '2025-06-19 09:41:29'),
(112, 'Kemeja Motif Parang', 'Pria', 120000.00, 'kemeja', 0, '6853dd1e35971_01e43789-64aa-4b72-81c3-5ad8b2e99c77.jpg', '2025-06-19 09:49:18'),
(113, 'kemeja Motif Ayam', 'Pria', 110000.00, 'Ayam Wuruk', 0, '6853dd7b29d26_Motif batik untuk kemeja pria.jpg', '2025-06-19 09:50:51'),
(114, 'Kebaya Merah', 'Wanita', 155000.00, 'Kebaya', 0, '6853ddc8b5ef0_Simple tops batik.jpg', '2025-06-19 09:52:08'),
(115, 'Kemeja Motif Megamendung', 'Wanita', 145000.00, 'Megachan', 0, '6853de0946a25_Batik Wanita motif modern super best seller_Bahan….jpg', '2025-06-19 09:53:13'),
(116, 'Outer Panjang', 'Wanita', 120000.00, 'Outer Kece', 0, '6853de49bb791_Black Batik Outer, Bali Ethnic Batik Cardigan….jpg', '2025-06-19 09:54:17'),
(117, 'Cullotes Batik', 'Wanita', 110000.00, 'rok', 0, '6853dec3ca9c1_Cullotes batik.jpg', '2025-06-19 09:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `produk_ukuran`
--

CREATE TABLE `produk_ukuran` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk_ukuran`
--

INSERT INTO `produk_ukuran` (`id`, `produk_id`, `ukuran`, `stok`) VALUES
(179, 103, 'S', 5),
(180, 103, 'M', 8),
(181, 103, 'L', 10),
(182, 103, 'XL', 3),
(183, 104, 'S', 5),
(184, 104, 'M', 10),
(185, 104, 'L', 3),
(188, 106, 'S', 5),
(189, 106, 'M', 10),
(190, 106, 'L', 3),
(191, 107, 'S', 5),
(192, 108, 'M', 5),
(193, 109, 'M', 5),
(194, 110, 'M', 5),
(195, 110, 'L', 12),
(196, 110, 'XL', 4),
(197, 111, 'M', 5),
(198, 111, 'L', 10),
(203, 112, 'M', 5),
(204, 112, 'L', 7),
(205, 112, 'XL', 9),
(206, 113, 'M', 5),
(207, 113, 'L', 11),
(208, 113, 'XL', 9),
(209, 114, 'M', 5),
(210, 114, 'L', 11),
(211, 114, 'XL', 9),
(212, 115, 'M', 5),
(213, 115, 'L', 11),
(214, 115, 'XL', 9),
(215, 116, 'M', 5),
(216, 116, 'L', 11),
(217, 116, 'XL', 9),
(218, 117, 'M', 5),
(219, 117, 'L', 11),
(220, 105, 'S', 5),
(221, 105, 'M', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'alif', '$2y$10$tNTaIZL2Rx406ummOf1CCOIhNw2sjdqVyUWVWSLrqeRhigsolHGky', '2025-03-07 23:22:53'),
(2, 'jamal', '$2y$10$j9lrrsNPOCY/FG0FQI0CZe38GzRtdA9Hq0kjKZsntFn/nVvMI//ra', '2025-03-07 23:27:39'),
(3, 'doni', '$2y$10$aG1ss0w.NsQT6dtlQBO6.urTQ3UZAs64S5RzkWIMFB50TSWvx2E4e', '2025-03-08 02:29:03'),
(4, 'nanda', '$2y$10$lFJfNahq/h49ubZp4ISREuGMNYlBDKxSP1ZkjGmoHNXMRVkGnG9oa', '2025-03-08 15:06:19'),
(5, 'nandaprihadi', '$2y$10$xU9R8aR6ccsvdY5P125.J.G6/N3HD9HXPZDLs39El5WT67LDvwdBq', '2025-03-23 23:46:27'),
(7, '2233029', '$2y$10$Yd6W/Vp.M1xUohMkOrz0MuLmQ0B9QGIQqGe1lL5oCCNcg4vVFzVuq', '2025-06-12 12:19:07'),
(8, 'admin', '$2y$10$C0bP1Y6s/64o7GNjDmREwuaqrR0sKxWW0u3Xy2h0TuxDhAgIEGuE2', '2025-06-12 12:20:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cart_ibfk_1` (`product_id`);

--
-- Indexes for table `looks`
--
ALTER TABLE `looks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `look_produk`
--
ALTER TABLE `look_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `look_id` (`look_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `looks`
--
ALTER TABLE `looks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `look_produk`
--
ALTER TABLE `look_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `look_produk`
--
ALTER TABLE `look_produk`
  ADD CONSTRAINT `look_produk_ibfk_1` FOREIGN KEY (`look_id`) REFERENCES `looks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `look_produk_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD CONSTRAINT `produk_ukuran_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

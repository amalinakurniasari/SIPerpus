-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2016 at 02:14 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`barcode`, `id_title`, `status`, `created_at`, `updated_at`) VALUES
('PG-001-001', 'PG-001', 1, '2016-07-31 14:41:22', '2016-07-31 14:41:22'),
('PG-001-002', 'PG-001', 1, '2016-07-31 14:41:22', '2016-07-31 14:41:22'),
('PG-001-003', 'PG-001', 1, '2016-07-31 14:41:22', '2016-07-31 14:41:22'),
('PG-001-004', 'PG-001', 1, '2016-07-31 14:41:22', '2016-07-31 14:41:22'),
('PG-001-005', 'PG-001', 1, '2016-07-31 14:41:22', '2016-07-31 14:41:22'),
('PG-001-006', 'PG-001', 1, '2016-07-31 19:53:52', '2016-07-31 19:53:52'),
('PG-001-007', 'PG-001', 1, '2016-07-31 19:53:52', '2016-07-31 19:53:52'),
('PG-002-001', 'PG-002', 1, '2016-07-31 14:42:02', '2016-07-31 14:42:02'),
('PG-002-002', 'PG-002', 1, '2016-07-31 14:42:02', '2016-07-31 14:42:02'),
('PG-002-003', 'PG-002', 1, '2016-07-31 14:42:02', '2016-07-31 14:42:02'),
('PG-002-004', 'PG-002', 1, '2016-07-31 14:42:02', '2016-07-31 14:42:02'),
('PG-002-005', 'PG-002', 1, '2016-07-31 14:42:02', '2016-07-31 14:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `category`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Buku Pengayaan', 'PG', '2016-07-13 17:00:00', '2016-07-13 17:00:00'),
(2, 'Buku Paket', 'PK', '2016-07-13 17:00:00', '2016-07-13 17:00:00'),
(3, 'Buku Referensi', 'RF', '2016-07-13 17:00:00', '2016-07-13 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `nis` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`nis`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(12345, 'tuki', 1, '2016-07-20 13:26:26', '2016-07-20 13:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `can_be_borrowed` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `id_category`, `title`, `author`, `quantity`, `availability`, `can_be_borrowed`, `created_at`, `updated_at`) VALUES
('PG-001', 1, 'cek judul', 'cek author', 7, 7, 1, '2016-07-31 14:41:22', '2016-07-31 19:53:52'),
('PG-002', 1, 'cek judul 1', 'cek author 1', 5, 5, 0, '2016-07-31 14:42:02', '2016-07-31 14:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `book_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `borrowed_at` date NOT NULL,
  `expired_at` date NOT NULL,
  `returned_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `student_id`, `book_id`, `borrowed_at`, `expired_at`, `returned_at`) VALUES
(1, 12345, 'PG-001-004', '2016-07-31', '2016-08-07', '2016-07-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`barcode`),
  ADD KEY `title` (`id_title`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titles_id_category_foreign` (`id_category`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_student_id_foreign` (`student_id`),
  ADD KEY `transactions_book_id_foreign` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `nis` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12346;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_id_title_foreign` FOREIGN KEY (`id_title`) REFERENCES `titles` (`id`);

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`barcode`),
  ADD CONSTRAINT `transactions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

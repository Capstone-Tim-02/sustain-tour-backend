-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 34.121.235.108
-- Generation Time: Dec 12, 2023 at 05:17 AM
-- Server version: 8.0.31-google
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `destimate`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`) VALUES
(1, 'wisata alam', '2023-11-06 21:24:20.924'),
(2, 'wisata lifestyle', '2023-11-07 12:44:58.380'),
(16, 'wisata air', '2023-11-10 16:10:06.399'),
(21, 'wisata sejarah', '2023-11-15 06:32:39.127');

-- --------------------------------------------------------

--
-- Table structure for table `cooperation_messages`
--

CREATE TABLE `cooperation_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext,
  `email` longtext,
  `message` longtext,
  `created_at` datetime(3) DEFAULT NULL,
  `first_name` longtext,
  `last_name` longtext,
  `phone_number` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cooperation_messages`
--

INSERT INTO `cooperation_messages` (`id`, `name`, `email`, `message`, `created_at`, `first_name`, `last_name`, `phone_number`) VALUES
(1, 'Lee Haru', 'ruthputri135gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-12 10:09:26.519', NULL, NULL, NULL),
(2, 'Lee Haru', 'ruthputri135gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-12 10:09:36.106', NULL, NULL, NULL),
(3, 'Lee Haru', 'muhammadaimar77gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-12 10:09:49.065', NULL, NULL, NULL),
(4, 'Lee Haru', 'muhammadaimar77gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-12 10:29:28.352', NULL, NULL, NULL),
(5, 'Lee Haru', 'muhammadaimar77@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-12 10:38:13.020', NULL, NULL, NULL),
(6, 'Lee Haru', 'haru@gmail.com', 'Halo Tim DestiMate, Saya harap pesan ini menemui Anda dalam keadaan baik. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya menemukan website DestiMate dan sangat terkesan dengan fokusnya pada promosi dan pengembangan destinasi wisata. Setelah menjelajahi platform Anda, saya melihat potensi kolaborasi yang positif antara kami dan DestiMate. Kami yakin bahwa kerjasama ini dapat memberikan manfaat bagi kedua belah pihak dan mempromosikan pengalaman wisata yang luar biasa yang kami tawarkan. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-12 11:16:23.997', NULL, NULL, NULL),
(7, NULL, 'muhammadaimar77@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya yang sangat bagus ini, tolong hubungin saya', '2023-11-16 18:14:54.585', 'Aimar', 'Rizki', '085155480878'),
(8, NULL, 'yha@gmail.com', 'Mau bergabung gwh', '2023-11-23 14:35:30.824', 'Bryan', '', '089089089089'),
(9, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 14:36:51.141', 'Haru', 'Lee', '081234567892'),
(10, NULL, 'ruthputri135@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-28 14:51:42.581', 'budi', 'ss', '09919822222'),
(11, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 15:00:42.350', 'Haru', 'L', '081234567892'),
(12, NULL, 'ruthputri135@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-28 15:08:21.028', 'budi', 'ss', '09919822222'),
(13, NULL, 'ruthputri135@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya, tolong hubungin saya', '2023-11-28 15:08:46.201', 'budi', 'ss', '09919822222'),
(14, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 15:19:14.972', 'Haru', '', '081234567892'),
(15, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 15:21:56.730', 'Haru', '', '081234567892'),
(16, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:53:23.271', 'Haru', 'Lee', '081234567892'),
(17, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:53:24.341', 'Haru', 'L', '081234567892'),
(18, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:53:26.758', 'Haru', '', '081234567892'),
(19, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:55:53.548', 'Haru', 'Lee', '081234567892'),
(20, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:55:54.458', 'Haru', 'L', '081234567892'),
(21, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-11-28 16:55:57.265', 'Haru', '', '081234567892'),
(22, NULL, 'ken@progate.com', 'aaaaaaaaaaa', '2023-11-29 04:06:35.245', 'aass', '', '22222222222'),
(23, NULL, 'aaa@gmail.com', 'halo ini saya', '2023-11-29 04:28:52.677', 'aaa', 'sss', '09999999999'),
(24, NULL, 'aaa@gmail.com', 'halo ini saya', '2023-11-29 04:34:38.303', 'aaa', 'sss', '09999999999'),
(25, NULL, 'asdas@gmail.com', 'wwwkansdjknas asd', '2023-11-29 04:37:18.540', 'ass@', '', '0000000000000'),
(26, NULL, 'halo@gmail.com', 'halo ini siapa?', '2023-11-29 06:09:24.397', 'halo', 'ini', '00000000000'),
(27, NULL, 'destimate@gmail.com', 'halo destimate team!!!', '2023-11-29 06:11:22.899', 'Destimate', 'Junior', '0000000000000'),
(28, NULL, 'budiman@gmail.com', 'budiman for indonesia', '2023-11-29 06:12:15.666', 'Budiman', 'susano', '0222222222222'),
(29, NULL, 'haloo@gmail.com', 'Halo ini siapa', '2023-11-29 06:29:51.402', 'Halo', '', '08222222222'),
(30, NULL, 'test@gmail.com', 'Bismilah test terakhir', '2023-11-29 06:30:49.935', 'Test', 'Lagi', '00000000000'),
(31, NULL, 'julydsp04@gmail.com', 'destimate keren', '2023-11-29 06:53:58.884', 'july', 'dsp', '085684584588'),
(32, NULL, 'angga@gmail.com', 'Tidak ada ', '2023-11-29 07:45:52.448', 'Angga ', 'Saputra', '085723908234'),
(33, NULL, 'Gunawan@gmail.com', 'Budi gunawan', '2023-11-29 07:56:39.867', 'Budi', 'Gunawan', '00000000000'),
(34, NULL, 'sistem@gmail.com', 'sistem testing', '2023-11-29 07:57:36.891', 'sistem', '', '01234567891'),
(35, NULL, 'agus@gmail.com', 'aasd a ad ad asd ', '2023-11-29 08:12:04.624', 'agus', 'sutris', '08572398423'),
(36, NULL, 'sautraa170503@gmail.com', 'test asdokaosdk', '2023-11-29 15:09:21.009', 'Angga', 'Saputra', '0857298389231'),
(37, NULL, 'saputraa170503@gmail.com', 'asdasdasdasdasd', '2023-11-29 15:10:46.632', 'angga', 'saputra', '085729382323'),
(38, NULL, 'hokgiealan@gmail.com', 'Saya ingin menambahkan tempat wisata ', '2023-11-29 15:15:53.351', 'Alan', 'Hokgie', '081234382038'),
(39, NULL, 'hokgiealan@gmail.com', 'Saya ingin menambahkan tempat wisata ', '2023-11-29 15:15:54.237', 'Alan', 'Hokgie', '081234382038'),
(40, NULL, 'muhammadaimar77@gmail.com', 'Saya berminat bekerja sama dengan anda untuk menjual wisata saya yang sangat bagus ini, tolong hubungin saya', '2023-11-29 19:49:44.442', 'Aimar', 'Rizki', '085155480878'),
(41, NULL, 'tes@gmail.com', 'Anjay mabar', '2023-11-29 22:11:27.210', 'Tes', 'Testes', '08451613454'),
(42, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 01:45:20.133', 'Haru', 'Lee', '081234567892'),
(43, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 01:45:25.364', 'Haru', 'L', '081234567892'),
(44, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 01:45:30.633', 'Haru', '', '081234567892'),
(45, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 01:51:17.453', 'Haru', 'L', '081234567892'),
(46, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:12:35.233', 'Haru', 'Lee', '081234567892'),
(47, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:12:40.129', 'Haru', 'L', '081234567892'),
(48, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:12:45.084', 'Haru', '', '081234567892'),
(49, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:34:41.206', 'Haru', 'Lee', '081234567892'),
(50, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:34:46.662', 'Haru', 'L', '081234567892'),
(51, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 02:34:51.668', 'Haru', '', '081234567892'),
(52, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:33:42.799', 'Haru', 'Lee', '081234567892'),
(53, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:33:45.553', 'Haru', 'L', '081234567892'),
(54, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:33:47.500', 'Haru', '', '081234567892'),
(55, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:36:40.489', 'Haru', 'Lee', '081234567892'),
(56, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:36:43.437', 'Haru', 'L', '081234567892'),
(57, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:36:45.396', 'Haru', '', '081234567892'),
(58, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:41:54.566', 'Haru', 'Lee', '081234567892'),
(59, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:41:57.479', 'Haru', 'L', '081234567892'),
(60, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:41:59.722', 'Haru', '', '081234567892'),
(61, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:43:30.204', 'Haru', 'Lee', '081234567892'),
(62, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:43:32.763', 'Haru', 'L', '081234567892'),
(63, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:43:35.009', 'Haru', '', '081234567892'),
(64, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:51:55.679', 'Haru', 'Lee', '081234567892'),
(65, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:51:59.197', 'Haru', 'L', '081234567892'),
(66, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 03:52:04.077', 'Haru', '', '081234567892'),
(67, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:50:58.095', 'Haru', 'Lee', '081234567892'),
(68, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:51:01.179', 'Haru', 'L', '081234567892'),
(69, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:51:03.352', 'Haru', '', '081234567892'),
(70, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:52:41.547', 'Haru', 'Lee', '081234567892'),
(71, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:52:44.372', 'Haru', 'L', '081234567892'),
(72, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 04:52:46.518', 'Haru', '', '081234567892'),
(73, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:01:45.178', 'Haru', 'Lee', '081234567892'),
(74, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:01:47.966', 'Haru', 'L', '081234567892'),
(75, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:01:50.053', 'Haru', '', '081234567892'),
(76, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:02:33.387', 'Haru', 'Lee', '081234567892'),
(77, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:02:36.003', 'Haru', 'L', '081234567892'),
(78, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:02:38.280', 'Haru', '', '081234567892'),
(79, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:39:01.366', 'Haru', 'Lee', '081234567892'),
(80, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:39:04.235', 'Haru', 'L', '081234567892'),
(81, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:39:06.070', 'Haru', '', '081234567892'),
(82, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:47:34.376', 'Haru', 'Lee', '081234567892'),
(83, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:47:37.094', 'Haru', 'L', '081234567892'),
(84, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:47:39.404', 'Haru', '', '081234567892'),
(85, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:51:49.115', 'Haru', 'Lee', '081234567892'),
(86, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:51:51.740', 'Haru', 'L', '081234567892'),
(87, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 05:51:53.837', 'Haru', '', '081234567892'),
(88, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:04:21.074', 'Haru', 'Lee', '081234567892'),
(89, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:04:24.185', 'Haru', 'L', '081234567892'),
(90, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:04:26.062', 'Haru', '', '081234567892'),
(91, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:27:21.586', 'Haru', 'Lee', '081234567892'),
(92, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:27:26.063', 'Haru', 'L', '081234567892'),
(93, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:27:31.344', 'Haru', '', '081234567892'),
(94, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:35:20.004', 'Haru', 'Lee', '081234567892'),
(95, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:35:23.346', 'Haru', 'L', '081234567892'),
(96, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:35:25.516', 'Haru', '', '081234567892'),
(97, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:37:04.679', 'Haru', 'Lee', '081234567892'),
(98, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:37:07.367', 'Haru', 'L', '081234567892'),
(99, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:37:09.507', 'Haru', '', '081234567892'),
(100, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:56:01.496', 'Haru', 'Lee', '081234567892'),
(101, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:56:04.876', 'Haru', 'L', '081234567892'),
(102, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:56:08.701', 'Haru', '', '081234567892'),
(103, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:59:22.121', 'Haru', 'Lee', '081234567892'),
(104, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:59:24.802', 'Haru', 'L', '081234567892'),
(105, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 06:59:26.667', 'Haru', '', '081234567892'),
(106, NULL, 'saputraa170503@gmail.com', 'tesaijasidjaosdkasd', '2023-12-01 07:16:47.068', 'angga', 'saputra', '08523082392'),
(107, NULL, 'muhammadaimar77@gmail.com', 'halo saya ingin bekerja sama untuk menjual wisata saya', '2023-12-01 07:22:48.239', 'Aimar', 'Rizki', '085155489322'),
(108, NULL, 'muhammadaimar77@gmail.com', 'halo saya ingin bekerja sama untuk menjual wisata saya', '2023-12-01 07:22:49.778', 'Aimar', 'Rizki', '085155489322'),
(109, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:25:35.714', 'Haru', 'Lee', '081234567892'),
(110, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:25:38.575', 'Haru', 'L', '081234567892'),
(111, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:25:40.282', 'Haru', '', '081234567892'),
(112, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:27:02.356', 'Haru', 'Lee', '081234567892'),
(113, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:27:04.990', 'Haru', 'L', '081234567892'),
(114, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:27:07.124', 'Haru', '', '081234567892'),
(115, NULL, 'saputraa170503@gmail.com', 'asodkasodkaoksd', '2023-12-01 08:30:20.601', 'angga', 'saputra', '08572938238'),
(116, NULL, 'julydsp04@gmail.com', 'July Dwi Saputra', '2023-12-01 08:34:34.285', 'July', 'Dwi Saputra', '085489234823'),
(117, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:35:03.574', 'Haru', 'Lee', '081234567892'),
(118, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:35:06.370', 'Haru', 'L', '081234567892'),
(119, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:35:08.187', 'Haru', '', '081234567892'),
(120, NULL, 'saputraa170503@gmail.com', '123131203o', '2023-12-01 08:35:46.825', 'angga', 'saputra', '098912908012'),
(121, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:36:54.845', 'Haru', 'Lee', '081234567892'),
(122, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:36:57.300', 'Haru', 'L', '081234567892'),
(123, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:36:59.780', 'Haru', '', '081234567892'),
(124, NULL, 'julydsp04@gmail.com', 'asdkjasidjasdj', '2023-12-01 08:38:53.162', 'July', 'Dwi Saputra', '085809349348'),
(125, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:44:05.163', 'Haru', 'Lee', '081234567892'),
(126, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:44:07.889', 'Haru', 'L', '081234567892'),
(127, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:44:09.996', 'Haru', '', '081234567892'),
(128, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:45:32.123', 'Haru', 'Lee', '081234567892'),
(129, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:45:34.720', 'Haru', 'L', '081234567892'),
(130, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:45:37.656', 'Haru', '', '081234567892'),
(131, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:49:00.618', 'Haru', 'Lee', '081234567892'),
(132, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:49:03.404', 'Haru', 'L', '081234567892'),
(133, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-01 08:49:05.307', 'Haru', '', '081234567892'),
(134, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-02 05:34:48.449', 'Haru', 'Lee', '081234567892'),
(135, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-02 05:34:51.760', 'Haru', 'L', '081234567892'),
(136, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-02 05:34:53.824', 'Haru', '', '081234567892'),
(137, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:11:21.661', 'Haru', 'Lee', '081234567892'),
(138, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:11:26.934', 'Haru', 'L', '081234567892'),
(139, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:11:32.144', 'Haru', '', '081234567892'),
(140, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:21:33.820', 'Haru', 'Lee', '081234567892'),
(141, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:21:38.427', 'Haru', 'L', '081234567892'),
(142, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:21:45.172', 'Haru', '', '081234567892'),
(143, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:28:51.452', 'Haru', 'Lee', '081234567892'),
(144, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:28:54.171', 'Haru', 'L', '081234567892'),
(145, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:28:55.945', 'Haru', '', '081234567892'),
(146, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:50:44.920', 'Haru', 'Lee', '081234567892'),
(147, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:50:47.491', 'Haru', 'L', '081234567892'),
(148, NULL, 'haru@gmail.com', 'Halo Tim DestiMate. Saya adalah Haru, pemilik Tempat Wisata Pantai Bulbul, destinasi indah kami di Indonesia. Saya sangat berharap dapat bekerja sama dengan DestiMate.', '2023-12-04 09:50:49.788', 'Haru', '', '081234567892'),
(149, NULL, 'saputraa170503@gmail.com', 'teasdasd a', '2023-12-04 15:41:14.698', 'angga', 'saputra', '085728732231'),
(150, NULL, 'muhammadaimar77@gmail.com', 'Halo perkenalkan saya aimar, saya ingin menjual tempat wisata yang saya miliki', '2023-12-06 07:40:22.427', 'Aimar', 'Rizki', '085155489322'),
(151, NULL, 'muhammadaimar77@gmail.com', 'Halo perkenalkan saya aimar, saya ingin menjual tempat wisata yang saya miliki', '2023-12-06 09:29:37.342', 'Aimar', 'Rizki', '085155489322'),
(152, NULL, 'test@gmail.com', 'test test test', '2023-12-10 11:59:22.745', 'halo', '', '0867213687126'),
(153, NULL, 'test123@gmail.com', 'test test 321', '2023-12-10 12:02:31.057', 'first', 'last', '08976453145'),
(154, NULL, '21431012@gmail.com', 'halo halo halo', '2023-12-10 14:43:27.684', '2143', '1012', '09734858345');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `message` longtext,
  `status` longtext,
  `title` longtext,
  `invoice_number` longtext,
  `created_at` datetime(3) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `promo_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `title`, `invoice_number`, `created_at`, `is_read`, `promo_id`) VALUES
(1, 32, 'Tiket untuk wisata Candi Prambanan berhasil dibayar. Selamat liburan!', 'read', 'Transaksi Sukses', '1701779231-472', '2023-12-05 12:27:20.025', 0, 0),
(2, 32, 'Tiket untuk wisata Alas Purwo National Park Office berhasil dibayar. Selamat liburan!', 'read', 'Transaksi Sukses', '1701779285-652', '2023-12-05 12:28:17.505', 0, 0),
(3, 32, 'Tiket untuk wisata Kawasan Ekowisata Mangrove PIK 2 berhasil dibayar. Selamat liburan!', 'read', 'Transaksi Sukses', '1701779279-776', '2023-12-05 12:28:22.896', 0, 0),
(36, 1, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.943', 0, 94),
(37, 29, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.950', 0, 94),
(38, 32, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.960', 0, 94),
(39, 33, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.967', 0, 94),
(40, 34, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.974', 0, 94),
(41, 35, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.983', 0, 94),
(42, 36, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.990', 0, 94),
(43, 46, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:25.998', 0, 94),
(44, 47, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.006', 0, 94),
(45, 49, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.015', 0, 94),
(46, 55, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.026', 0, 94),
(47, 56, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.033', 0, 94),
(48, 62, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.042', 0, 94),
(49, 63, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.051', 0, 94),
(50, 67, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.058', 0, 94),
(51, 73, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.067', 0, 94),
(52, 74, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.077', 0, 94),
(53, 75, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.086', 0, 94),
(54, 76, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.096', 0, 94),
(55, 77, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.104', 0, 94),
(56, 78, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.111', 0, 94),
(57, 79, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.120', 0, 94),
(58, 80, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.128', 0, 94),
(59, 81, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.137', 0, 94),
(60, 83, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.146', 0, 94),
(61, 84, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.154', 0, 94),
(62, 85, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.162', 0, 94),
(63, 86, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.168', 0, 94),
(64, 87, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.176', 0, 94),
(65, 88, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.184', 0, 94),
(66, 104, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.192', 0, 94),
(67, 129, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Kemerdekaan', '', '2023-12-05 12:56:26.201', 0, 94),
(68, 78, 'Tiket untuk wisata Candi Borobudur berhasil dibayar. Selamat liburan!', 'read', 'Transaksi Sukses', '1701852157-962', '2023-12-06 08:59:47.674', 0, 0),
(69, 32, 'Tiket untuk wisata Kawasan Ekowisata Mangrove PIK 2 berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702022635-801', '2023-12-08 08:04:16.031', 0, 0),
(70, 1, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.240', 0, 95),
(71, 29, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.248', 0, 95),
(72, 32, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.257', 0, 95),
(73, 33, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.265', 0, 95),
(74, 34, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.275', 0, 95),
(75, 35, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.283', 0, 95),
(76, 36, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.292', 0, 95),
(77, 46, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.301', 0, 95),
(78, 47, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.321', 0, 95),
(79, 49, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.330', 0, 95),
(80, 55, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.339', 0, 95),
(81, 56, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.347', 0, 95),
(82, 63, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.355', 0, 95),
(83, 67, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.362', 0, 95),
(84, 73, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.372', 0, 95),
(85, 74, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.379', 0, 95),
(86, 75, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.388', 0, 95),
(87, 76, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.397', 0, 95),
(88, 77, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.406', 0, 95),
(89, 78, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.414', 0, 95),
(90, 79, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.422', 0, 95),
(91, 80, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.432', 0, 95),
(92, 81, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.440', 0, 95),
(93, 83, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.448', 0, 95),
(94, 84, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.457', 0, 95),
(95, 85, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.465', 0, 95),
(96, 86, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.472', 0, 95),
(97, 88, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.480', 0, 95),
(98, 104, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.488', 0, 95),
(99, 134, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.495', 0, 95),
(100, 136, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.503', 0, 95),
(101, 138, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.511', 0, 95),
(102, 146, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.520', 0, 95),
(103, 147, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Promo 7 hari', '', '2023-12-08 09:39:51.528', 0, 95),
(104, 29, 'Tiket untuk wisata Candi Borobudur berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702032353-925', '2023-12-08 10:46:24.166', 0, 0),
(105, 29, 'Tiket untuk wisata Candi Borobudur berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702032478-256', '2023-12-08 10:48:19.057', 0, 0),
(106, 29, 'Tiket untuk wisata Kawasan Ekowisata Mangrove PIK 2 berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1701703695-824', '2023-12-08 10:55:30.775', 0, 0),
(107, 32, 'Tiket untuk wisata Moja Museum berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702033550-962', '2023-12-08 11:06:17.769', 0, 0),
(108, 32, 'Tiket untuk wisata Moja Museum berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702033607-956', '2023-12-08 11:07:08.660', 0, 0),
(109, 1, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.426', 0, 96),
(110, 29, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.435', 0, 96),
(111, 32, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.442', 0, 96),
(112, 33, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.454', 0, 96),
(113, 34, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.463', 0, 96),
(114, 35, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.471', 0, 96),
(115, 36, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.479', 0, 96),
(116, 46, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.488', 0, 96),
(117, 47, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.495', 0, 96),
(118, 49, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.503', 0, 96),
(119, 55, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.512', 0, 96),
(120, 56, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.518', 0, 96),
(121, 63, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.526', 0, 96),
(122, 67, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.533', 0, 96),
(123, 73, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.540', 0, 96),
(124, 74, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.549', 0, 96),
(125, 75, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.556', 0, 96),
(126, 76, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.563', 0, 96),
(127, 77, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.571', 0, 96),
(128, 78, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.579', 0, 96),
(129, 79, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.586', 0, 96),
(130, 80, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.594', 0, 96),
(131, 81, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.601', 0, 96),
(132, 83, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.609', 0, 96),
(133, 84, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.616', 0, 96),
(134, 85, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.623', 0, 96),
(135, 86, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.630', 0, 96),
(136, 88, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.637', 0, 96),
(137, 104, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.645', 0, 96),
(138, 134, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.652', 0, 96),
(139, 136, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo Test Promo', '', '2023-12-08 13:49:47.659', 0, 96),
(140, 138, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.666', 0, 96),
(141, 146, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.674', 0, 96),
(142, 147, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo Test Promo', '', '2023-12-08 13:49:47.682', 0, 96),
(143, 1, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:45.963', 0, 97),
(144, 29, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:45.972', 0, 97),
(145, 32, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo testtest', '', '2023-12-08 14:01:45.978', 0, 97),
(146, 33, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo testtest', '', '2023-12-08 14:01:45.986', 0, 97),
(147, 34, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:45.994', 0, 97),
(148, 35, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.004', 0, 97),
(149, 36, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.012', 0, 97),
(150, 46, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.020', 0, 97),
(151, 47, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.028', 0, 97),
(152, 49, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.036', 0, 97),
(153, 55, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.046', 0, 97),
(154, 56, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.063', 0, 97),
(155, 63, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.071', 0, 97),
(156, 67, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.079', 0, 97),
(157, 73, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.086', 0, 97),
(158, 74, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.094', 0, 97),
(159, 75, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.103', 0, 97),
(160, 76, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.110', 0, 97),
(161, 77, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.117', 0, 97),
(162, 78, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.126', 0, 97),
(163, 79, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.134', 0, 97),
(164, 80, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.141', 0, 97),
(165, 81, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.150', 0, 97),
(166, 83, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.158', 0, 97),
(167, 84, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.165', 0, 97),
(168, 85, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.172', 0, 97),
(169, 86, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.179', 0, 97),
(170, 88, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.187', 0, 97),
(171, 104, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.195', 0, 97),
(172, 134, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.202', 0, 97),
(173, 136, 'Ada promo menarik buat kamu yang suka healing', 'read', 'promo testtest', '', '2023-12-08 14:01:46.209', 0, 97),
(174, 138, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.217', 0, 97),
(175, 146, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.224', 0, 97),
(176, 147, 'Ada promo menarik buat kamu yang suka healing', 'unread', 'promo testtest', '', '2023-12-08 14:01:46.232', 0, 97),
(177, 32, 'Tiket untuk wisata Kawasan Ekowisata Mangrove PIK 2 berhasil dibayar. Selamat liburan!', '', 'Transaksi Sukses', '1702055370-472', '2023-12-08 17:09:47.839', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext,
  `kode_voucher` varchar(255) DEFAULT NULL,
  `jumlah_potongan_persen` bigint DEFAULT NULL,
  `nama_promo` longtext,
  `status_aktif` tinyint(1) DEFAULT NULL,
  `tanggal_kadaluarsa` datetime(3) DEFAULT NULL,
  `image_voucher` longtext,
  `deskripsi` longtext,
  `peraturan` longtext,
  `created_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `promos`
--

INSERT INTO `promos` (`id`, `title`, `kode_voucher`, `jumlah_potongan_persen`, `nama_promo`, `status_aktif`, `tanggal_kadaluarsa`, `image_voucher`, `deskripsi`, `peraturan`, `created_at`) VALUES
(17, 'November Seru Dengan Potongan Diskon 15%', 'liburan15', 15, 'Promo November seru 15, dapatkan potongan harga sebesar 15%', 1, '2023-12-13 00:00:00.000', 'https://storage.googleapis.com/relaverse/promos/promo17/image_1700619857.jpg', 'promo november', '<p>minimal pembelian&nbsp;<strong>2 Tiket</strong></p>', '2023-11-17 06:36:22.856'),
(18, 'November Seru Dengan Diskon 20%', 'liburan20', 20, 'November Liburan', 1, '2023-12-14 00:00:00.000', 'https://storage.googleapis.com/relaverse/promos/promo/image_NZXT7k8xOx_1699692078.jpg', 'promo bulan november', '<p>minimal pembelian&nbsp;<strong>2 Tiket</strong></p>', '2023-11-17 06:36:22.856'),
(51, 'Promo akhir bulan', 'PROMO15', 100, 'Potongan', 1, '2023-12-30 00:00:00.000', 'https://storage.googleapis.com/relaverse/promos/promo51/image_1700638692.jpg', 'Ini deskripsi', '<p>Lalala</p>', '2023-11-20 10:09:03.145'),
(53, 'destimat', 'destimat', 10, 'destimat', 1, '2023-12-12 00:00:00.000', '', 'asdfghjklala', 'asdfghjklala', '2023-11-24 05:09:38.002'),
(54, 'Promo Voucher', 'merry_christmast', 20, 'Christmast_Discount', 1, '2023-12-24 00:00:00.000', 'https://storage.googleapis.com/relaverse/promos/promo/image_XSr26TQTHj_1700804375.jpg', 'Voucher untuk menyambut hari natal', 'Minimal membeli 4 tiket untuk keluarga', '2023-11-24 05:39:37.390'),
(55, 'destimate', 'destimate', 10, 'destimate', 1, '2023-12-12 00:00:00.000', '', 'asdfghklasa', 'asdfghklasa', '2023-11-24 07:18:18.079'),
(56, 'Promo Akhir Tahun', 'PROMO2023', 20, 'Promo Akhir Tahun', 1, '2023-12-31 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo56/image_1700847529.jpg', 'Promo menyambut akhir tahun 2023', '<ol>\r\n<li>Hanya bisa digunakan oleh satu akun</li>\r\n<li>Berlaku sekali pakai</li>\r\n</ol>', '2023-11-24 07:19:32.369'),
(57, 'CHRISTMAS10', 'CHRISTMAS10', 10, 'CHRISTMAS10', 1, '2023-12-12 00:00:00.000', '', 'CHRISTMAS10', 'CHRISTMAS10', '2023-11-24 08:12:21.388'),
(59, 'Promo Berkah Ramadhan Alterra', 'alterra20', 20, 'Promo Alterra', 1, '2023-12-28 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_CXPpDXFHAU_1700835565.jpg', 'Asik sekarang kita dapat berlibur dengan mendapatkan potongan tambahan sebesar 20%. Gunakan sekarang ', '<p>Anda harus ganteng</p>', '2023-11-24 14:19:25.490'),
(61, 'jalan21', 'JALAN JALAN', 15, 'jalan21', 0, '2023-12-09 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo61/image_1701415567.jpg', 'asdfghklasa', '<p>asdfghklasa</p>', '2023-11-25 07:45:20.899'),
(62, 'big sale', 'hsfhdhi', 50, 'big salee', 0, '2023-11-30 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_ojSs0o5CuH_1700914729.jpg', 'hdjfhiodogdwiduiwahidwd', '<p>1.jfvfvhvi</p>\r\n<p>2.vhcizihv</p>', '2023-11-25 12:18:49.195'),
(64, 'test promo baru', 'PromoBaru', 8, 'Promo', 0, '2023-11-29 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo64/image_1701086919.jpg', 'promo baru', '<p><strong>promo baru</strong></p>', '2023-11-27 08:42:56.180'),
(65, 'jalan2', 'jalan2', 15, 'jalan2', 1, '2023-12-12 00:00:00.000', '', 'asdfghklasa', 'asdfghklasa', '2023-11-27 12:00:22.929'),
(66, 'promo vacation', 'PromoAl', 90, 'vacation', 0, '2023-11-30 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo66/image_1701087714.jpg', 'test promo', '<p>test <strong>promo</strong> lagi</p>', '2023-11-27 12:13:10.976'),
(67, 'testasd', 'testas', 12, 'covid', 0, '2023-11-29 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo67/image_1701151710.jpg', 'testassaasd', '<p>asdadadasd</p>', '2023-11-28 06:08:09.838'),
(68, 'test asdasd ', 'LIBURANAJAH', 11, 'testa asd ad', 0, '2023-11-30 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_1epObjNK7d_1701236608.jpg', 'testasdasdasd', '<p>asdasdasdasdasd</p>', '2023-11-29 05:43:28.933'),
(69, 'testasodkaosd', 'TESDKASDOPKASASD', 12, 'asdasdasdasdasd', 0, '2023-11-30 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_XZcnNQc8UQ_1701238575.jpg', 'testasdasd', '<p>asdasda asd</p>', '2023-11-29 06:16:16.557'),
(70, 'asdasdasdasd asd', 'ASDASDASDASD ASDAS AS', 23, 'asdadasdasdad asd asd', 0, '2023-11-30 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_Rz8aJDAmoo_1701241194.jpg', 'asdasdasdasad', '<p>asdasdadasd</p>', '2023-11-29 06:59:55.183'),
(73, 'pantai', 'PANTAI', 10, 'pantai', 1, '2023-12-13 00:00:00.000', '', 'asdfghjklala', '<p>asdfghjklala</p>', '2023-12-01 02:17:43.238'),
(75, 'DUMMY2', 'DUMMY2', 10, 'DUMMY2', 0, '2023-12-12 00:00:00.000', '', 'asdfghjklala', 'asdfghjklala', '2023-12-01 04:10:14.660'),
(80, 'NEWYEAREVE', 'NEWYEAREVE', 15, 'NEWYEAREVE', 0, '2023-12-12 00:00:00.000', '', 'asdfghklasa', 'asdfghklasa', '2023-12-01 07:13:39.494'),
(83, 'Penyambutan Tahun Baru', '1JANUARI2024', 35, 'NEWYEAR2024', 0, '2024-01-01 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo83/image_1701594331.jpg', 'Menawarkan diskon sebesar 35% untuk penyambutan tahun baru', '<p>Batas pembelian tiket 5 kali</p>', '2023-12-01 07:37:03.623'),
(86, 'NEWYEAR2026', 'NEWYEAR2026', 15, 'NEWYEAR2026', 0, '2023-12-12 00:00:00.000', '', 'asdfghklasa', 'asdfghklasa', '2023-12-01 07:53:37.944'),
(90, 'Family The Best', 'PROMO2703', 35, 'Promo Happy Family', 1, '2024-03-27 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_lu3AzxLN4Z_1701613155.jpg', 'Menawarkan diskon sebesar 35% untuk keluarga yang membeli tiket wisata', '<p>minimal 4 tiket</p>', '2023-12-03 14:19:15.841'),
(94, 'Kemerdekaan', 'INDONESIA1945', 75, 'Promo Kemerdekaan', 1, '2023-12-28 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_vFv5r2dP6X_1701780985.jpg', 'Promo untuk memperingati hari kemerdekaan Republik Indonesia ke 75 Tahun', '<p>Harus tunduk terhadap syarat dan ketentuan pengguna</p>', '2023-12-05 12:56:25.932'),
(95, 'Promo 7 hari', '7 DAYS HAPPY', 20, 'Promo 7 Hari', 1, '2023-12-15 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_ru0JoANNeZ_1702028390.jpg', 'test test test', '<p>test test test</p>', '2023-12-08 09:39:51.227'),
(97, 'testtest', 'TESTTES', 10, 'testtes', 0, '2023-12-11 00:00:00.000', 'https://storage.googleapis.com/destimate/promos/promo/image_icigGodMtq_1702044105.jpg', 'test test test', '<p>test test test</p>', '2023-12-08 14:01:45.953');

-- --------------------------------------------------------

--
-- Table structure for table `term_conditions`
--

CREATE TABLE `term_conditions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext,
  `description` longtext,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `term_conditions`
--

INSERT INTO `term_conditions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Perjanjian Pengguna', '<p>Dokumen ini, yang disebut \"Perjanjian Pengguna\" (\"Perjanjian\"), merupakan kontrak antara Anda (\"Anda\" atau \"Pengguna\") dan Destimate (\"Storetasker\", \"kami\", \"kita\", atau \"kami\"). Anda harus membaca, menyetujui, dan menerima semua syarat dan ketentuan yang terdapat dalam Perjanjian ini untuk dapat menggunakan aplikasi kami. Semua aplikasi terafiliasi, termasuk situs web yang dimiliki dan dioperasikan oleh kami, pendahulu atau penerus kepentingan kami, atau Afiliasi kami (secara kolektif disebut \"Situs\"), semua layanan, aplikasi, dan produk yang dapat diakses melalui Situs, dan semua aplikasi seluler Storetasker yang mengaitkan atau merujuk pada Perjanjian ini (\"Layanan\") baik disediakan oleh kami atau Afiliasi kami.</p>', '2023-11-11 10:24:52.791', '2023-12-08 05:53:09.969'),
(3, 'Pembelian Tiket', '<p>Untuk pembelian tiket, user diharuskan login dan mengisi identitas diri</p>', '2023-11-11 10:25:34.487', '2023-11-23 05:28:50.110'),
(9, 'Ketentuan pengajuan pendaftaran wisata', '<p>Ketentuan mendaftarkan wisata di platform kami&nbsp;</p>', '2023-11-14 12:56:23.689', '2023-11-23 11:38:36.629'),
(10, 'ketentuan ayam goreng', '<ol>\n<li>asdasasd</li>\n<li>asdasdkasd</li>\n</ol>', '2023-11-14 13:07:02.994', '2023-12-08 08:33:06.419'),
(12, 'Pembelian Tiket Wisata', 'Untuk Pembelian tiket, user diharuskan login dan mengisi identitas diri', '2023-11-30 04:37:07.721', '2023-12-01 07:53:36.099'),
(13, 'Pembelian Tiket Pntai', 'gadshakfmlfafskakaa', '2023-11-30 04:37:12.938', '2023-11-30 04:37:12.938'),
(14, 'Pembelian Tiket Pantai', 'gadshakfmlfafskakaa', '2023-11-30 04:37:20.125', '2023-11-30 04:37:20.125'),
(15, 'Penjualan Tiket', 'gadshakfmlfafskakaa', '2023-11-30 04:37:34.655', '2023-11-30 04:37:34.655'),
(16, 'Perjanjian Pemilik Wisata', '<p>Perjanjian Pemilik Wisata merupakan dokumen yang menguraikan persyaratan dan ketentuan yang harus dipatuhi oleh pemilik atau pengelola wisata yang bermitra dengan platform DestiMate.</p>', '2023-12-01 01:49:36.633', '2023-12-03 15:40:02.312'),
(23, 'Dede inoen', '<p>Gratis tiket seumur hidup untuk dede inoen&nbsp;</p>', '2023-12-01 07:16:34.928', '2023-12-01 14:47:01.269'),
(24, 'Pembelian Tiket Taman Bermain', 'Untuk Pembelian tiket taman, user diharuskan login dan mengisi identitas diri', '2023-12-01 07:24:47.802', '2023-12-01 07:24:47.802'),
(25, 'Pembelian Tiket untuk Taman Bermain', 'Untuk Pembelian tiket taman, user diharuskan login dan mengisi identitas diri', '2023-12-01 07:37:01.246', '2023-12-01 07:37:01.246'),
(26, 'Pembelian Tiket Online untuk Taman', 'Untuk Pembelian tiket taman, user diharuskan login dan mengisi identitas diri', '2023-12-01 07:42:31.665', '2023-12-01 07:42:31.665'),
(27, 'Pembelian Tiket Online untuk Gunung dan Pantai', 'Untuk Pembelian tiket taman, user diharuskan login dan mengisi identitas diri', '2023-12-01 07:48:24.432', '2023-12-01 07:48:24.432'),
(28, 'Pembelian Tiket Online Pegunungan', 'Untuk Pembelian tiket taman, user diharuskan login dan mengisi identitas diri', '2023-12-01 07:53:36.124', '2023-12-01 07:53:36.124');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `wisata_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `kode_voucher` longtext,
  `used_points` bigint DEFAULT NULL,
  `use_all_points` tinyint(1) DEFAULT NULL,
  `points_earned` bigint DEFAULT NULL,
  `total_cost` bigint DEFAULT NULL,
  `invoice_number` longtext,
  `quantity` bigint DEFAULT NULL,
  `checkin_booking` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `carbon_footprint` double DEFAULT NULL,
  `paid_status` tinyint(1) DEFAULT '0',
  `status_order` varchar(191) DEFAULT 'pending',
  `tenggat_pembayaran` datetime(3) DEFAULT NULL,
  `total_potongan_kode_voucher` bigint DEFAULT NULL,
  `total_potongan_points` bigint DEFAULT NULL,
  `harga_sebelum_diskon` bigint DEFAULT NULL,
  `used_points_on_purchase` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `wisata_id`, `user_id`, `kode_voucher`, `used_points`, `use_all_points`, `points_earned`, `total_cost`, `invoice_number`, `quantity`, `checkin_booking`, `created_at`, `updated_at`, `carbon_footprint`, `paid_status`, `status_order`, `tenggat_pembayaran`, `total_potongan_kode_voucher`, `total_potongan_points`, `harga_sebelum_diskon`, `used_points_on_purchase`) VALUES
(55, 2, 29, 'liburan15', 0, 0, 0, 127500, '1700579240-327', 3, '2023-11-30 00:00:00.000', '2023-11-21 15:07:20.124', '2023-12-07 06:15:15.651', 14220.611256796656, 1, 'success', NULL, 22500, 0, 150000, 0),
(56, 2, 29, 'liburan15', 0, 0, 0, 127500, '1700579294-882', 3, '2023-11-21 00:00:00.000', '2023-11-21 15:08:14.948', '2023-11-28 12:07:57.028', 14220.611256796656, 0, 'pending', '2023-11-21 00:00:00.000', 22500, 0, 150000, 0),
(57, 11, 29, 'liburan15', 0, 0, 0, 170000, '1700582320-491', 4, '2023-11-21 00:00:00.000', '2023-11-21 15:58:40.932', '2023-11-21 15:59:08.816', 20220.4384108925, 0, 'dibatalkan', '2023-11-21 00:00:00.000', 30000, 0, 200000, NULL),
(61, 14, 29, 'liburan15', 0, 0, 0, 127500, '1700673264-203', 10, '2023-12-27 00:00:00.000', '2023-11-22 17:14:24.564', '2023-12-07 06:15:15.663', 23860.008117041023, 1, 'success', NULL, 22500, 0, 150000, 0),
(63, 2, 32, '', 0, 0, 10, 100000, '1700681648-367', 2, '2023-11-25 00:00:00.000', '2023-11-22 19:34:08.074', '2023-12-12 04:02:36.272', 166.2403436732599, 1, 'success', NULL, 0, 0, 100000, 0),
(64, 17, 32, 'liburan15', 10, 0, 0, 15500, '1700681847-255', 2, '2023-11-25 00:00:00.000', '2023-11-22 19:37:27.129', '2023-12-12 04:02:36.285', 16001.663451539403, 1, 'success', NULL, 4500, 10000, 30000, 0),
(65, 20, 32, 'liburan15', 8, 0, 0, 500, '1700688224-117', 2, '2023-11-25 00:00:00.000', '2023-11-22 21:23:44.812', '2023-12-12 04:02:36.297', 12705.521725520755, 1, 'success', NULL, 1500, 8000, 10000, 0),
(67, 2, 32, '', 13, 0, 5, 37000, '1700688581-215', 1, '2023-11-25 00:00:00.000', '2023-11-22 21:29:41.158', '2023-12-12 04:02:36.307', 166.2403436732599, 1, 'success', NULL, 0, 13000, 50000, 0),
(68, 14, 29, 'liburan15', 0, 0, 0, 127500, '1700725195-874', 10, '2023-12-27 00:00:00.000', '2023-11-23 07:39:55.559', '2023-12-07 06:15:15.674', 23860.008117041023, 1, 'success', NULL, 22500, 0, 150000, 0),
(69, 12, 29, '', 0, 0, 50, 500000, '1700725341-699', 10, '2023-12-27 00:00:00.000', '2023-11-23 07:42:21.187', '2023-12-01 07:53:36.981', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(70, 2, 32, '', 0, 0, 5, 50000, '1700737455-308', 1, '2023-11-25 00:00:00.000', '2023-11-23 11:04:15.758', '2023-12-12 04:02:36.318', 166.2403436732599, 1, 'success', NULL, 0, 0, 50000, 0),
(71, 11, 32, 'liburan20', 10, 0, 0, 30000, '1700737524-86', 1, '2023-11-25 00:00:00.000', '2023-11-23 11:05:24.034', '2023-12-12 04:02:36.329', 5972.324932997402, 1, 'success', NULL, 10000, 10000, 50000, 0),
(81, 2, 33, '', 0, 0, 5, 50000, '1700741552-565', 1, '2023-11-30 00:00:00.000', '2023-11-23 12:12:32.387', '2023-11-27 12:35:41.930', 175595.06142616717, 0, 'dibatalkan', '2023-11-30 00:00:00.000', 0, 0, 50000, 0),
(82, 20, 33, '', 0, 0, 2, 25000, '1700920537-252', 5, '2023-11-28 00:00:00.000', '2023-11-25 13:55:37.166', '2023-12-12 02:37:58.571', 187747.40709761044, 1, 'success', NULL, 0, 0, 25000, 0),
(83, 11, 33, 'liburan20', 2, 0, 0, 78000, '1700920584-372', 2, '2023-11-28 00:00:00.000', '2023-11-25 13:56:24.204', '2023-11-25 13:56:42.382', 181055.46425770674, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 2000, 100000, NULL),
(84, 11, 33, '', 0, 0, 10, 100000, '1700920956-840', 2, '2023-11-28 00:00:00.000', '2023-11-25 14:02:36.692', '2023-12-12 02:37:58.585', 181055.46425770674, 1, 'success', NULL, 0, 0, 100000, 0),
(85, 11, 32, 'liburan20', 5, 0, 0, 75000, '1700926275-573', 2, '2023-11-28 00:00:00.000', '2023-11-25 15:31:15.242', '2023-11-25 15:32:10.850', 5972.324932997402, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 5000, 100000, 5),
(86, 11, 32, 'liburan20', 0, 0, 0, 80000, '1700926366-764', 2, '2023-11-28 00:00:00.000', '2023-11-25 15:32:46.397', '2023-11-25 15:33:10.907', 5972.324932997402, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(87, 11, 32, 'liburan20', 0, 0, 0, 80000, '1700926413-65', 2, '2023-11-28 00:00:00.000', '2023-11-25 15:33:33.810', '2023-12-12 04:02:36.344', 5972.324932997402, 1, 'success', NULL, 20000, 0, 100000, 0),
(88, 11, 32, 'liburan20', 5, 0, 0, 75000, '1700926437-615', 2, '2023-11-28 00:00:00.000', '2023-11-25 15:33:57.989', '2023-11-25 15:34:20.942', 5972.324932997402, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 5000, 100000, 5),
(89, 11, 32, 'liburan20', 5, 0, 0, 75000, '1700940803-82', 2, '2023-11-28 00:00:00.000', '2023-11-25 19:33:23.712', '2023-12-12 04:02:36.358', 5972.324932997402, 1, 'success', NULL, 20000, 5000, 100000, 5),
(90, 11, 32, 'liburan20', 0, 0, 0, 80000, '1701089452-788', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:50:52.263', '2023-11-27 14:22:20.596', 5972.324932997402, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(91, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089459-322', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:50:59.051', '2023-11-27 14:40:46.537', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(92, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089468-741', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:08.938', '2023-11-27 14:35:58.266', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(93, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089472-359', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:12.693', '2023-11-27 14:36:23.007', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(94, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089475-346', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:15.111', '2023-11-27 14:34:44.526', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(95, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089477-435', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:17.823', '2023-11-27 14:41:06.418', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(96, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089480-959', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:20.150', '2023-11-27 14:41:28.546', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(97, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089482-253', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:22.481', '2023-11-28 04:05:12.748', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(98, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089485-51', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:25.122', '2023-11-27 12:51:25.122', 6497.344165249793, 0, 'pending', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(99, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089489-992', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:29.310', '2023-11-27 14:43:36.477', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(100, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089492-693', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:32.804', '2023-11-28 04:07:34.511', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(101, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089495-244', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:35.589', '2023-11-27 14:36:32.540', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(102, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701089498-182', 2, '2023-11-28 00:00:00.000', '2023-11-27 12:51:38.384', '2023-11-28 04:07:21.520', 6497.344165249793, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 20000, 0, 100000, 0),
(103, 14, 29, 'liburan15', 0, 0, 0, 51000, '1701137754-500', 4, '2023-11-28 00:00:00.000', '2023-11-28 02:15:54.199', '2023-12-07 06:15:15.685', 23860.008117041023, 1, 'success', NULL, 9000, 0, 60000, 0),
(104, 17, 32, 'liburan15', 0, 0, 0, 51000, '1701153710-549', 4, '2023-11-28 00:00:00.000', '2023-11-28 06:41:50.929', '2023-11-30 11:58:06.234', 16001.663451539403, 0, 'dibatalkan', '2023-11-28 00:00:00.000', 9000, 0, 60000, 0),
(105, 20, 29, 'liburan15', 0, 0, 0, 29750, '1701163175-233', 7, '2023-12-28 00:00:00.000', '2023-11-28 09:19:35.320', '2023-11-28 09:40:58.580', 26861.505023126232, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 5250, 0, 35000, 0),
(106, 20, 29, 'liburan15', 0, 0, 0, 29750, '1701165646-725', 7, '2023-12-28 00:00:00.000', '2023-11-28 10:00:46.672', '2023-11-28 10:02:04.353', 26861.505023126232, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 5250, 0, 35000, 0),
(107, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701166504-876', 2, '2023-11-28 00:00:00.000', '2023-11-28 10:15:04.920', '2023-12-12 04:02:36.397', 6497.344165249793, 1, 'success', NULL, 20000, 0, 100000, 0),
(108, 12, 32, 'liburan20', 0, 0, 0, 80000, '1701170472-8', 2, '2023-11-28 00:00:00.000', '2023-11-28 11:21:12.261', '2023-12-12 04:02:36.407', 6497.344165249793, 1, 'success', NULL, 20000, 0, 100000, 0),
(109, 3, 33, '', 0, 0, 20, 200000, '1701323954-996', 2, '2023-12-01 00:00:00.000', '2023-11-30 05:59:14.887', '2023-11-30 05:59:14.887', 175533.05148800544, 0, 'pending', '2023-12-01 00:00:00.000', 0, 0, 200000, 0),
(110, 3, 33, '', 0, 0, 20, 200000, '1701326561-241', 2, '2023-12-01 00:00:00.000', '2023-11-30 06:42:41.778', '2023-11-30 06:42:41.778', 175533.05148800544, 0, 'pending', '2023-12-01 00:00:00.000', 0, 0, 200000, 0),
(111, 3, 33, 'liburan15', 0, 0, 0, 170000, '1701326611-185', 2, '2023-12-01 00:00:00.000', '2023-11-30 06:43:31.284', '2023-12-01 10:27:44.833', 175533.05148800544, 0, 'dibatalkan', '2023-12-01 00:00:00.000', 30000, 0, 200000, 0),
(112, 2, 29, 'liburan15', 0, 0, 0, 297500, '1701334693-24', 7, '2023-12-28 00:00:00.000', '2023-11-30 08:58:13.827', '2023-12-07 06:15:15.696', 14220.611256796656, 1, 'success', NULL, 52500, 0, 350000, 0),
(113, 12, 29, '', 0, 0, 25, 250000, '1701336019-785', 5, '2023-12-28 00:00:00.000', '2023-11-30 09:20:19.333', '2023-12-07 06:15:15.706', 20745.87757537809, 1, 'success', NULL, 0, 0, 250000, 0),
(114, 12, 32, 'liburan20', 0, 0, 0, 40000, '1701346499-306', 1, '2023-12-02 00:00:00.000', '2023-11-30 12:14:59.138', '2023-11-30 12:26:04.578', 6497.344165249793, 0, 'dibatalkan', '2023-12-02 00:00:00.000', 10000, 0, 50000, 0),
(115, 12, 32, 'liburan20', 0, 0, 0, 40000, '1701347491-999', 1, '2023-12-02 00:00:00.000', '2023-11-30 12:31:31.013', '2023-12-12 04:02:36.418', 6497.344165249793, 1, 'success', NULL, 10000, 0, 50000, 0),
(116, 2, 29, '', 0, 0, 25, 250000, '1701359657-382', 5, '2023-12-28 00:00:00.000', '2023-11-30 15:54:17.353', '2023-12-07 06:15:15.714', 14220.611256796656, 1, 'success', NULL, 0, 0, 250000, 0),
(117, 12, 32, 'liburan20', 0, 0, 0, 40000, '1701372378-546', 1, '2023-12-02 00:00:00.000', '2023-11-30 19:26:18.614', '2023-12-12 04:02:36.428', 6497.344165249793, 1, 'success', NULL, 10000, 0, 50000, 0),
(118, 12, 32, 'liburan20', 0, 0, 0, 40000, '1701372651-332', 1, '2023-12-02 00:00:00.000', '2023-11-30 19:30:51.729', '2023-12-12 04:02:36.439', 6497.344165249793, 1, 'success', NULL, 10000, 0, 50000, 0),
(119, 11, 29, '', 0, 0, 20, 200000, '1701394981-207', 4, '2023-12-28 00:00:00.000', '2023-12-01 01:43:01.087', '2023-12-01 01:45:20.579', 20220.4384108925, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 0, 0, 200000, 0),
(120, 11, 29, '', 0, 0, 20, 200000, '1701394988-472', 4, '2023-12-28 00:00:00.000', '2023-12-01 01:43:08.166', '2023-12-01 02:12:35.702', 20220.4384108925, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 0, 0, 200000, 0),
(121, 11, 29, '', 0, 0, 20, 200000, '1701394989-60', 4, '2023-12-28 00:00:00.000', '2023-12-01 01:43:09.286', '2023-12-01 02:34:41.541', 20220.4384108925, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 0, 0, 200000, 0),
(122, 11, 29, '', 0, 0, 20, 200000, '1701394990-347', 4, '2023-12-28 00:00:00.000', '2023-12-01 01:43:10.791', '2023-12-01 03:33:43.301', 20220.4384108925, 0, 'dibatalkan', '2023-12-28 00:00:00.000', 0, 0, 200000, 0),
(123, 3, 29, 'liburan15', 850, 0, 0, 0, '1701395120-877', 10, '2023-12-27 00:00:00.000', '2023-12-01 01:45:20.692', '2023-12-01 01:45:20.692', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 850000, 1000000, 850),
(124, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701395128-194', 10, '2023-12-27 00:00:00.000', '2023-12-01 01:45:28.470', '2023-12-01 03:41:54.919', 23860.008117041023, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(125, 12, 29, '', 500, 0, 50, 0, '1701395129-154', 10, '2023-12-27 00:00:00.000', '2023-12-01 01:45:29.320', '2023-12-01 01:45:29.320', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 500000, 500000, 500),
(131, 3, 29, 'liburan15', 850, 0, 0, 0, '1701396755-47', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:12:35.743', '2023-12-01 02:12:35.743', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 850000, 1000000, 850),
(132, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701396764-464', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:12:44.328', '2023-12-01 03:51:56.337', 23860.008117041023, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(133, 12, 29, '', 300, 0, 50, 200000, '1701396764-262', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:12:44.826', '2023-12-03 15:08:48.116', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 300000, 500000, 300),
(134, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701398081-868', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:34:41.662', '2023-12-01 06:27:22.295', 14090.383507520233, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(135, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701398089-924', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:34:49.382', '2023-12-01 02:34:49.382', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(136, 12, 29, '', 0, 0, 50, 500000, '1701398089-295', 10, '2023-12-27 00:00:00.000', '2023-12-01 02:34:49.938', '2023-12-01 02:34:49.938', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(137, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701401622-586', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:33:42.743', '2023-12-01 03:33:42.743', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(138, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701401626-269', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:33:46.359', '2023-12-01 03:33:46.359', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(139, 12, 29, '', 0, 0, 50, 500000, '1701401626-572', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:33:46.575', '2023-12-01 03:33:46.575', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(140, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701401800-979', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:36:40.630', '2023-12-01 04:50:58.536', 14090.383507520233, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(141, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701401804-867', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:36:44.273', '2023-12-01 03:36:44.273', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(142, 12, 29, '', 0, 0, 50, 500000, '1701401804-280', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:36:44.453', '2023-12-01 03:36:44.453', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(143, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701402115-695', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:41:55.067', '2023-12-01 03:41:55.067', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(144, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701402118-154', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:41:58.642', '2023-12-01 03:41:58.642', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(145, 12, 29, '', 0, 0, 50, 500000, '1701402118-443', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:41:58.915', '2023-12-01 03:41:58.915', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(146, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701402210-980', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:43:30.611', '2023-12-01 03:43:30.611', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(147, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701402213-158', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:43:33.851', '2023-12-01 03:43:33.851', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(148, 12, 29, '', 0, 0, 50, 500000, '1701402214-293', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:43:34.067', '2023-12-01 03:43:34.067', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(149, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701402716-794', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:51:56.382', '2023-12-01 03:51:56.382', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(150, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701402721-192', 10, '2023-12-27 00:00:00.000', '2023-12-01 03:52:01.347', '2023-12-01 03:52:01.347', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(152, 3, 29, 'liburan15', 150, 0, 0, 700000, '1701406258-859', 10, '2023-12-27 00:00:00.000', '2023-12-01 04:50:58.573', '2023-12-01 05:01:45.590', 14090.383507520233, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 150000, 150000, 1000000, 150),
(164, 3, 33, 'liburan15', 0, 0, 0, 170000, '1701409108-566', 2, '2023-12-01 00:00:00.000', '2023-12-01 05:38:28.260', '2023-12-01 05:38:28.260', 175533.05148800544, 0, 'pending', '2023-12-01 00:00:00.000', 30000, 0, 200000, 0),
(169, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701409658-837', 10, '2023-12-27 00:00:00.000', '2023-12-01 05:47:38.458', '2023-12-01 05:47:38.458', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(170, 12, 29, '', 0, 0, 50, 500000, '1701409658-712', 10, '2023-12-27 00:00:00.000', '2023-12-01 05:47:38.714', '2023-12-01 05:47:38.714', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(171, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701409909-354', 10, '2023-12-27 00:00:00.000', '2023-12-01 05:51:49.557', '2023-12-01 05:51:49.557', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(172, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701409912-390', 10, '2023-12-27 00:00:00.000', '2023-12-01 05:51:52.771', '2023-12-01 05:51:52.771', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(173, 12, 29, '', 0, 0, 50, 500000, '1701409913-555', 10, '2023-12-27 00:00:00.000', '2023-12-01 05:51:53.101', '2023-12-01 06:35:20.417', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(174, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701410289-780', 1, '2023-12-03 00:00:00.000', '2023-12-01 05:58:09.272', '2023-12-12 04:02:36.449', 5972.324932997402, 1, 'success', NULL, 10000, 0, 50000, 0),
(175, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701410340-32', 1, '2023-12-03 00:00:00.000', '2023-12-01 05:59:00.868', '2023-12-12 04:02:36.460', 5972.324932997402, 1, 'success', NULL, 10000, 0, 50000, 0),
(179, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701411013-350', 1, '2023-12-03 00:00:00.000', '2023-12-01 06:10:13.573', '2023-12-12 04:02:36.476', 5972.324932997402, 1, 'success', NULL, 10000, 0, 50000, 0),
(183, 3, 33, 'liburan15', 0, 0, 0, 85000, '1701412118-219', 1, '2023-12-01 00:00:00.000', '2023-12-01 06:28:38.166', '2023-12-01 06:28:38.166', 175533.05148800544, 0, 'pending', '2023-12-01 00:00:00.000', 15000, 0, 100000, 0),
(184, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701412520-465', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:35:20.430', '2023-12-01 06:35:20.430', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(185, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701412523-869', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:35:23.568', '2023-12-01 06:35:23.568', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(186, 12, 29, '', 0, 0, 50, 500000, '1701412523-387', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:35:23.792', '2023-12-01 06:35:23.792', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(187, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701412624-371', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:37:04.977', '2023-12-01 06:37:04.977', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(188, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701412628-19', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:37:08.274', '2023-12-01 06:59:22.131', 23860.008117041023, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(189, 2, 33, '', 0, 0, 10, 100000, '1701413160-565', 2, '2023-12-03 00:00:00.000', '2023-12-01 06:46:00.544', '2023-12-01 06:46:00.544', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 100000, 0),
(190, 2, 33, '', 0, 0, 10, 100000, '1701413189-450', 2, '2023-12-03 00:00:00.000', '2023-12-01 06:46:29.957', '2023-12-01 06:46:29.957', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 100000, 0),
(191, 2, 33, '', 0, 0, 10, 100000, '1701413233-634', 2, '2023-12-03 00:00:00.000', '2023-12-01 06:47:13.909', '2023-12-01 10:25:14.747', 175595.06142616717, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 100000, 0),
(192, 2, 33, '', 10, 0, 35, 340000, '1701413301-115', 7, '2023-12-03 00:00:00.000', '2023-12-01 06:48:21.079', '2023-12-01 06:48:21.079', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 10000, 350000, 10),
(193, 2, 33, '', 0, 0, 5, 50000, '1701413414-539', 1, '2023-12-03 00:00:00.000', '2023-12-01 06:50:14.615', '2023-12-01 06:50:14.615', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(194, 2, 33, '', 0, 0, 5, 50000, '1701413420-430', 1, '2023-12-03 00:00:00.000', '2023-12-01 06:50:20.310', '2023-12-01 06:50:20.310', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(195, 2, 33, '', 0, 0, 5, 50000, '1701413423-420', 1, '2023-12-03 00:00:00.000', '2023-12-01 06:50:23.077', '2023-12-01 06:50:23.077', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(196, 3, 29, 'liburan15', 50, 0, 0, 800000, '1701413761-72', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:56:01.848', '2023-12-01 06:56:01.848', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 50000, 1000000, 50),
(197, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701413767-284', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:56:07.344', '2023-12-01 06:56:07.344', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(198, 12, 29, '', 50, 0, 50, 450000, '1701413767-626', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:56:07.926', '2023-12-01 06:56:07.926', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 50000, 500000, 50),
(199, 3, 29, 'liburan15', 50, 0, 0, 800000, '1701413962-164', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:59:22.551', '2023-12-01 06:59:22.551', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 50000, 1000000, 50),
(200, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701413966-571', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:59:26.873', '2023-12-01 06:59:26.873', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(201, 12, 29, '', 50, 0, 50, 450000, '1701413967-110', 10, '2023-12-27 00:00:00.000', '2023-12-01 06:59:27.015', '2023-12-01 08:25:36.056', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 50000, 500000, 50),
(202, 3, 33, 'liburan20', 0, 0, 0, 400000, '1701414185-643', 5, '2023-12-03 00:00:00.000', '2023-12-01 07:03:05.098', '2023-12-01 07:03:05.098', 175533.05148800544, 0, 'pending', '2023-12-03 00:00:00.000', 100000, 0, 500000, 0),
(203, 2, 33, 'liburan15', 0, 0, 0, 340000, '1701414472-741', 8, '2023-12-03 00:00:00.000', '2023-12-01 07:07:52.062', '2023-12-01 07:07:52.062', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 60000, 0, 400000, 0),
(204, 2, 33, 'liburan15', 0, 0, 0, 340000, '1701414531-77', 8, '2023-12-03 00:00:00.000', '2023-12-01 07:08:51.606', '2023-12-01 07:08:51.606', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 60000, 0, 400000, 0),
(205, 10, 78, '', 0, 0, 2, 20000, '1701415046-639', 1, '2023-12-05 00:00:00.000', '2023-12-01 07:17:26.716', '2023-12-01 07:17:26.716', 175824.1983313618, 0, 'pending', '2023-12-05 00:00:00.000', 0, 0, 20000, 0),
(208, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701415139-607', 1, '2023-12-03 00:00:00.000', '2023-12-01 07:18:59.074', '2023-12-12 04:02:36.486', 5972.324932997402, 1, 'success', NULL, 10000, 0, 50000, 0),
(210, 2, 33, '', 0, 0, 5, 50000, '1701417133-863', 1, '2023-12-03 00:00:00.000', '2023-12-01 07:52:13.726', '2023-12-01 07:52:13.726', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(211, 2, 33, '', 0, 0, 5, 50000, '1701417507-242', 1, '2023-12-03 00:00:00.000', '2023-12-01 07:58:27.174', '2023-12-01 07:58:27.174', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(212, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701418479-487', 1, '2023-12-03 00:00:00.000', '2023-12-01 08:14:39.659', '2023-12-12 04:02:36.495', 5971.964411863964, 1, 'success', NULL, 10000, 0, 50000, 0),
(213, 3, 29, 'liburan15', 600, 0, 0, 250000, '1701419135-100', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:25:35.686', '2023-12-01 08:25:35.686', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 600000, 1000000, 600),
(214, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701419139-863', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:25:39.233', '2023-12-01 08:25:39.233', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(215, 12, 29, '', 0, 0, 50, 500000, '1701419139-772', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:25:39.452', '2023-12-02 05:34:49.111', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(218, 12, 29, '', 0, 0, 50, 500000, '1701419226-510', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:27:06.494', '2023-12-01 08:35:03.877', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(224, 12, 29, '', 0, 0, 50, 500000, '1701419819-983', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:36:59.186', '2023-12-01 08:44:05.641', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(230, 12, 29, '', 0, 0, 50, 500000, '1701420336-507', 10, '2023-12-27 00:00:00.000', '2023-12-01 08:45:36.110', '2023-12-01 08:49:01.095', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(234, 2, 33, 'NEWYEAR2026', 0, 0, 0, 382500, '1701423099-908', 9, '2023-12-03 00:00:00.000', '2023-12-01 09:31:39.647', '2023-12-01 09:31:39.647', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 67500, 0, 450000, 0),
(235, 79, 33, '', 0, 0, 2, 25000, '1701425673-6', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:14:33.136', '2023-12-01 10:14:33.136', 87771.42538592634, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 25000, 0),
(236, 2, 33, 'NEWYEAR2026', 0, 0, 0, 382500, '1701425912-137', 9, '2023-12-03 00:00:00.000', '2023-12-01 10:18:32.826', '2023-12-01 10:18:32.826', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 67500, 0, 450000, 0),
(237, 2, 33, '', 0, 0, 5, 50000, '1701426187-703', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:23:07.300', '2023-12-01 10:23:07.300', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(238, 3, 33, '', 0, 0, 50, 500000, '1701426284-132', 5, '2023-12-03 00:00:00.000', '2023-12-01 10:24:44.281', '2023-12-01 10:24:44.281', 175533.05148800544, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 500000, 0),
(239, 2, 33, '', 0, 0, 25, 250000, '1701427099-408', 5, '2023-12-03 00:00:00.000', '2023-12-01 10:38:19.424', '2023-12-01 10:38:19.424', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 250000, 0),
(240, 2, 33, '', 0, 0, 5, 50000, '1701427148-491', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:39:08.648', '2023-12-01 10:39:08.648', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(241, 2, 33, '', 0, 0, 5, 50000, '1701427179-127', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:39:39.872', '2023-12-01 10:39:39.872', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(242, 2, 33, '', 0, 0, 5, 50000, '1701427195-619', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:39:55.305', '2023-12-01 10:39:55.305', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(243, 2, 33, '', 0, 0, 5, 50000, '1701427216-276', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:40:16.770', '2023-12-01 10:40:16.770', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(244, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427360-279', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:42:40.253', '2023-12-01 10:42:40.253', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(245, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427383-288', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:43:03.109', '2023-12-01 10:43:03.109', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(246, 2, 33, '', 0, 0, 5, 50000, '1701427476-35', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:44:36.612', '2023-12-01 10:44:36.612', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(247, 2, 33, '', 0, 0, 5, 50000, '1701427476-289', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:44:36.617', '2023-12-01 10:44:36.617', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(248, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427476-584', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:44:36.620', '2023-12-01 10:44:36.620', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(249, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427476-920', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:44:36.623', '2023-12-01 10:44:36.623', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(250, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427481-569', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:44:41.389', '2023-12-01 10:44:41.389', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(251, 2, 33, '', 0, 0, 5, 50000, '1701427670-994', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:47:50.196', '2023-12-01 10:47:50.196', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(252, 2, 33, '', 0, 0, 5, 50000, '1701427670-349', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:47:50.200', '2023-12-01 10:47:50.200', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(253, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427670-811', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:47:50.203', '2023-12-01 10:47:50.203', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(254, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427670-751', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:47:50.207', '2023-12-01 10:47:50.207', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(255, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427670-195', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:47:50.208', '2023-12-01 10:47:50.208', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(256, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427673-27', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:47:53.965', '2023-12-01 10:47:53.965', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(257, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427796-208', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:49:56.385', '2023-12-01 10:49:56.385', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(258, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427884-547', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.702', '2023-12-01 10:51:24.702', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(259, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427884-433', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.718', '2023-12-01 10:51:24.718', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(260, 2, 33, '', 0, 0, 5, 50000, '1701427884-437', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.723', '2023-12-01 10:51:24.723', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(261, 2, 33, '', 0, 0, 5, 50000, '1701427884-276', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.733', '2023-12-01 10:51:24.733', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(262, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427884-313', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.748', '2023-12-01 10:51:24.748', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(263, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427884-206', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.747', '2023-12-01 10:51:24.747', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(264, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427884-446', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:51:24.759', '2023-12-01 10:51:24.759', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(265, 2, 33, '', 0, 0, 5, 50000, '1701427942-565', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.288', '2023-12-01 10:52:22.288', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(266, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427942-271', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.290', '2023-12-01 10:52:22.290', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(267, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427942-463', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.293', '2023-12-01 10:52:22.293', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(268, 2, 33, '', 0, 0, 5, 50000, '1701427942-255', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.295', '2023-12-01 10:52:22.295', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(269, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427942-519', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.304', '2023-12-01 10:52:22.304', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(270, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427942-787', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:22.304', '2023-12-01 10:52:22.304', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(271, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427943-845', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:23.324', '2023-12-01 10:52:23.324', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(272, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427947-519', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:27.251', '2023-12-01 10:52:27.251', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(273, 2, 33, '', 0, 0, 5, 50000, '1701427960-574', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.932', '2023-12-01 10:52:40.932', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(274, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701427960-338', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.935', '2023-12-01 10:52:40.935', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(275, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701427960-270', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.944', '2023-12-01 10:52:40.944', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(276, 2, 33, '', 0, 0, 5, 50000, '1701427960-367', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.944', '2023-12-01 10:52:40.944', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(277, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427960-205', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.948', '2023-12-01 10:52:40.948', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(278, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427960-793', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:40.952', '2023-12-01 10:52:40.952', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(279, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701427961-991', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:52:41.768', '2023-12-01 10:52:41.768', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(280, 2, 33, '', 0, 0, 5, 50000, '1701428107-199', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.566', '2023-12-01 10:55:07.566', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(281, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701428107-195', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.568', '2023-12-01 10:55:07.568', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(282, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428107-51', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.579', '2023-12-01 10:55:07.579', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(283, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428107-279', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.579', '2023-12-01 10:55:07.579', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(284, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701428107-607', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.584', '2023-12-01 10:55:07.584', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(285, 2, 33, '', 0, 0, 5, 50000, '1701428107-900', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:55:07.590', '2023-12-01 10:55:07.590', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(286, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428108-111', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:08.392', '2023-12-01 10:55:08.392', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(287, 2, 33, '', 0, 0, 5, 50000, '1701428111-906', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.016', '2023-12-01 10:55:11.016', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(288, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428111-33', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.043', '2023-12-01 10:55:11.043', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(289, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701428111-628', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.044', '2023-12-01 10:55:11.044', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(290, 2, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428111-931', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.045', '2023-12-01 10:55:11.045', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(291, 17, 33, 'NEWYEAR2026', 0, 0, 0, 89250, '1701428111-534', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.057', '2023-12-01 10:55:11.057', 160370.7531225919, 0, 'pending', '2023-12-03 00:00:00.000', 15750, 0, 105000, 0),
(292, 11, 33, 'NEWYEAR2026', 0, 0, 0, 297500, '1701428111-342', 7, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.058', '2023-12-01 10:55:11.058', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 52500, 0, 350000, 0),
(293, 2, 33, '', 0, 0, 5, 50000, '1701428111-25', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:55:11.058', '2023-12-01 10:55:11.058', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(294, 2, 33, '', 0, 0, 5, 50000, '1701428287-909', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:58:07.732', '2023-12-01 10:58:07.732', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(295, 2, 33, '', 0, 0, 5, 50000, '1701428289-108', 1, '2023-12-03 00:00:00.000', '2023-12-01 10:58:09.698', '2023-12-01 10:58:09.698', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(296, 11, 33, '', 0, 0, 15, 150000, '1701428305-782', 3, '2023-12-03 00:00:00.000', '2023-12-01 10:58:25.391', '2023-12-01 10:58:25.391', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 150000, 0),
(297, 11, 33, '', 0, 0, 15, 150000, '1701428307-852', 3, '2023-12-03 00:00:00.000', '2023-12-01 10:58:27.559', '2023-12-01 10:58:27.559', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 150000, 0),
(298, 2, 33, '', 0, 0, 30, 300000, '1701430235-952', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:30:35.446', '2023-12-01 11:30:35.446', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(299, 2, 33, '', 0, 0, 30, 300000, '1701430236-598', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:30:36.782', '2023-12-01 11:30:36.782', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(300, 2, 33, '', 0, 0, 30, 300000, '1701430341-335', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:32:21.431', '2023-12-01 11:32:21.431', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(301, 2, 33, '', 0, 0, 30, 300000, '1701430342-270', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:32:22.985', '2023-12-01 11:32:22.985', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(302, 2, 33, '', 0, 0, 30, 300000, '1701430360-161', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:32:40.849', '2023-12-01 11:32:40.849', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(303, 2, 33, '', 0, 0, 30, 300000, '1701430441-302', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:34:01.640', '2023-12-01 11:34:01.640', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(304, 2, 33, '', 0, 0, 30, 300000, '1701430454-293', 6, '2023-12-03 00:00:00.000', '2023-12-01 11:34:14.694', '2023-12-01 11:34:14.694', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 300000, 0),
(305, 68, 33, '', 0, 0, 1, 11000, '1701430755-820', 11, '2023-12-03 00:00:00.000', '2023-12-01 11:39:15.301', '2023-12-01 11:39:15.301', 157303.44037273707, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 11000, 0),
(306, 74, 33, 'NEWYEAR2026', 0, 0, 0, 153000, '1701430801-942', 9, '2023-12-03 00:00:00.000', '2023-12-01 11:40:01.494', '2023-12-01 11:40:01.494', 175570.02452874123, 0, 'pending', '2023-12-03 00:00:00.000', 27000, 0, 180000, 0),
(307, 74, 33, 'NEWYEAR2026', 0, 0, 0, 153000, '1701430804-735', 9, '2023-12-03 00:00:00.000', '2023-12-01 11:40:04.037', '2023-12-01 11:40:04.037', 175570.02452874123, 0, 'pending', '2023-12-03 00:00:00.000', 27000, 0, 180000, 0),
(308, 14, 33, 'NEWYEAREVE', 0, 0, 0, 12750, '1701432070-766', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:01:10.461', '2023-12-01 12:01:10.461', 185209.2200132761, 0, 'pending', '2023-12-03 00:00:00.000', 2250, 0, 15000, 0),
(309, 14, 33, 'NEWYEAREVE', 0, 0, 0, 12750, '1701432076-95', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:01:16.853', '2023-12-01 12:01:16.853', 185209.2200132761, 0, 'pending', '2023-12-03 00:00:00.000', 2250, 0, 15000, 0),
(310, 2, 33, '', 0, 0, 5, 50000, '1701432127-225', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:02:07.951', '2023-12-01 12:02:07.951', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(311, 2, 33, '', 0, 0, 5, 50000, '1701432130-322', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:02:10.083', '2023-12-01 12:02:10.083', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(312, 48, 33, '', 0, 0, 1, 10000, '1701432233-492', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:03:53.905', '2023-12-01 12:03:53.905', 162375.56377518622, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 10000, 0),
(313, 48, 33, '', 0, 0, 1, 10000, '1701432522-981', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:08:42.097', '2023-12-06 15:36:17.752', 162375.56377518622, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 10000, 0),
(314, 48, 33, '', 0, 0, 1, 10000, '1701432591-334', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:09:51.368', '2023-12-01 12:09:51.368', 162375.56377518622, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 10000, 0),
(315, 48, 33, '', 0, 0, 1, 10000, '1701432597-364', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:09:57.589', '2023-12-01 12:09:57.589', 162375.56377518622, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 10000, 0),
(316, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701432663-831', 7, '2023-12-03 00:00:00.000', '2023-12-01 12:11:03.932', '2023-12-01 12:11:03.932', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(317, 10, 33, 'NEWYEAR2026', 0, 0, 0, 119000, '1701432668-808', 7, '2023-12-03 00:00:00.000', '2023-12-01 12:11:08.329', '2023-12-01 12:11:08.329', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 21000, 0, 140000, 0),
(318, 2, 33, '', 0, 0, 5, 50000, '1701432927-405', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:15:27.295', '2023-12-01 12:15:27.295', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(319, 2, 33, '', 0, 0, 5, 50000, '1701432995-834', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:16:35.729', '2023-12-01 12:16:35.729', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(320, 2, 33, '', 0, 0, 5, 50000, '1701433045-373', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:17:25.411', '2023-12-01 12:17:25.411', 175595.06142616717, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(321, 78, 33, '', 0, 0, 2, 25000, '1701433298-883', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:21:38.460', '2023-12-01 12:21:38.460', 87771.42538592634, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 25000, 0),
(322, 10, 33, '', 0, 0, 2, 20000, '1701433404-606', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:23:24.946', '2023-12-01 12:23:24.946', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(323, 10, 33, '', 0, 0, 2, 20000, '1701433435-691', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:23:55.078', '2023-12-01 12:23:55.078', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(324, 11, 33, 'NEWYEAREVE', 0, 0, 0, 467500, '1701433471-114', 11, '2023-12-03 00:00:00.000', '2023-12-01 12:24:31.610', '2023-12-01 12:24:31.610', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 82500, 0, 550000, 0),
(325, 11, 33, 'NEWYEAREVE', 0, 0, 0, 467500, '1701433505-999', 11, '2023-12-03 00:00:00.000', '2023-12-01 12:25:05.271', '2023-12-01 12:25:05.271', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 82500, 0, 550000, 0),
(326, 10, 33, 'NEWYEAR2026', 0, 0, 0, 85000, '1701433520-553', 5, '2023-12-03 00:00:00.000', '2023-12-01 12:25:20.663', '2023-12-01 12:25:20.663', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 15000, 0, 100000, 0),
(327, 10, 33, 'NEWYEAR2026', 0, 0, 0, 85000, '1701433535-762', 5, '2023-12-03 00:00:00.000', '2023-12-01 12:25:35.806', '2023-12-01 12:25:35.806', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 15000, 0, 100000, 0),
(328, 10, 33, 'NEWYEAR2026', 0, 0, 0, 102000, '1701434002-131', 6, '2023-12-03 00:00:00.000', '2023-12-01 12:33:22.305', '2023-12-01 12:33:22.305', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 18000, 0, 120000, 0),
(329, 10, 33, '', 0, 0, 2, 20000, '1701434087-131', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:34:47.271', '2023-12-01 12:34:47.271', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(330, 10, 33, '', 0, 0, 2, 20000, '1701434158-279', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:35:58.550', '2023-12-01 12:35:58.550', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(331, 10, 33, '', 0, 0, 2, 20000, '1701434481-757', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:41:21.198', '2023-12-01 12:41:21.198', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(332, 10, 33, '', 0, 0, 2, 20000, '1701434517-546', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:41:57.982', '2023-12-01 12:41:57.982', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(333, 11, 33, '', 0, 0, 5, 50000, '1701434539-831', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:42:19.163', '2023-12-01 12:42:19.163', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(334, 11, 33, '', 0, 0, 5, 50000, '1701434758-605', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:45:58.182', '2023-12-06 15:36:40.188', 181055.50790228267, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(335, 11, 33, '', 0, 0, 5, 50000, '1701434766-985', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:46:06.833', '2023-12-01 12:46:06.833', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(336, 10, 33, '', 0, 0, 2, 20000, '1701434770-755', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:46:10.039', '2023-12-01 12:46:10.039', 175824.1983313618, 0, 'pending', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(337, 11, 33, 'NEWYEAR2026', 0, 0, 0, 467500, '1701435026-175', 11, '2023-12-03 00:00:00.000', '2023-12-01 12:50:26.986', '2023-12-01 12:50:26.986', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 82500, 0, 550000, 0),
(338, 11, 33, 'NEWYEAR2026', 0, 0, 0, 467500, '1701435041-576', 11, '2023-12-03 00:00:00.000', '2023-12-01 12:50:41.919', '2023-12-01 12:50:41.919', 181055.50790228267, 0, 'pending', '2023-12-03 00:00:00.000', 82500, 0, 550000, 0),
(339, 2, 33, '', 0, 0, 5, 50000, '1701435203-391', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:53:23.812', '2023-12-06 16:14:28.567', 175595.06142616717, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 50000, 0);
INSERT INTO `tickets` (`id`, `wisata_id`, `user_id`, `kode_voucher`, `used_points`, `use_all_points`, `points_earned`, `total_cost`, `invoice_number`, `quantity`, `checkin_booking`, `created_at`, `updated_at`, `carbon_footprint`, `paid_status`, `status_order`, `tenggat_pembayaran`, `total_potongan_kode_voucher`, `total_potongan_points`, `harga_sebelum_diskon`, `used_points_on_purchase`) VALUES
(340, 2, 33, '', 0, 0, 5, 50000, '1701435220-908', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:53:40.607', '2023-12-01 12:56:31.163', 175595.06142616717, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 50000, 0),
(341, 10, 33, '', 0, 0, 2, 20000, '1701435363-224', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:56:03.719', '2023-12-01 12:56:37.380', 175824.1983313618, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(342, 10, 33, '', 0, 0, 2, 20000, '1701435372-392', 1, '2023-12-03 00:00:00.000', '2023-12-01 12:56:12.111', '2023-12-06 15:35:53.743', 175824.1983313618, 0, 'dibatalkan', '2023-12-03 00:00:00.000', 0, 0, 20000, 0),
(343, 46, 33, 'PANTAI', 0, 0, 0, 135000, '1701435443-68', 6, '2023-12-03 00:00:00.000', '2023-12-01 12:57:23.419', '2023-12-01 12:57:23.419', 176872.4643154769, 0, 'pending', '2023-12-03 00:00:00.000', 15000, 0, 150000, 0),
(344, 46, 33, 'PANTAI', 0, 0, 0, 135000, '1701435454-879', 6, '2023-12-03 00:00:00.000', '2023-12-01 12:57:34.684', '2023-12-01 12:57:34.684', 176872.4643154769, 0, 'pending', '2023-12-03 00:00:00.000', 15000, 0, 150000, 0),
(345, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701495289-74', 10, '2023-12-27 00:00:00.000', '2023-12-02 05:34:49.127', '2023-12-02 05:34:49.127', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(346, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701495292-578', 10, '2023-12-27 00:00:00.000', '2023-12-02 05:34:52.207', '2023-12-02 05:34:52.207', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(347, 12, 29, '', 0, 0, 50, 500000, '1701495292-810', 10, '2023-12-27 00:00:00.000', '2023-12-02 05:34:52.389', '2023-12-04 09:11:22.086', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(348, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701656912-79', 1, '2023-12-08 00:00:00.000', '2023-12-04 02:28:32.767', '2023-12-12 04:02:36.504', 5971.964411863964, 1, 'success', NULL, 10000, 0, 50000, 0),
(349, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701656919-583', 1, '2023-12-08 00:00:00.000', '2023-12-04 02:28:39.239', '2023-12-12 04:02:36.515', 5971.964411863964, 1, 'success', NULL, 10000, 0, 50000, 0),
(350, 11, 29, '', 0, 0, 20, 200000, '1701670191-990', 4, '2023-12-28 00:00:00.000', '2023-12-04 06:09:51.450', '2023-12-07 06:15:15.803', 20220.06118161341, 1, 'success', NULL, 0, 0, 200000, 0),
(351, 3, 29, 'liburan15', 170, 0, 0, 680000, '1701681081-412', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:11:21.637', '2023-12-04 09:11:21.637', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 170000, 1000000, 170),
(352, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701681090-270', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:11:30.270', '2023-12-04 09:11:30.270', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(353, 12, 29, '', 0, 0, 50, 500000, '1701681091-0', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:11:31.009', '2023-12-04 09:21:34.181', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(354, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701681694-240', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:21:34.213', '2023-12-04 09:21:34.213', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(355, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701681704-480', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:21:44.075', '2023-12-04 09:28:51.845', 23860.008117041023, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(356, 12, 29, '', 0, 0, 50, 500000, '1701681704-739', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:21:44.978', '2023-12-04 09:21:44.978', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(357, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701682131-295', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:28:51.853', '2023-12-04 09:28:51.853', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(358, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701682135-597', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:28:55.106', '2023-12-04 09:28:55.106', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(359, 12, 29, '', 0, 0, 50, 500000, '1701682135-577', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:28:55.314', '2023-12-04 09:50:45.273', 20745.87757537809, 0, 'dibatalkan', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(360, 3, 33, 'PROMO2703', 0, 0, 0, 975000, '1701682394-5', 15, '2023-12-06 00:00:00.000', '2023-12-04 09:33:14.323', '2023-12-04 09:33:14.323', 175533.05148800544, 0, 'pending', '2023-12-06 00:00:00.000', 525000, 0, 1500000, 0),
(361, 3, 33, 'PROMO2703', 0, 0, 0, 975000, '1701682413-829', 15, '2023-12-06 00:00:00.000', '2023-12-04 09:33:33.125', '2023-12-06 15:35:06.624', 175533.05148800544, 0, 'dibatalkan', '2023-12-06 00:00:00.000', 525000, 0, 1500000, 0),
(362, 3, 29, 'liburan15', 0, 0, 0, 850000, '1701683445-463', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:50:45.285', '2023-12-04 09:50:45.285', 14090.383507520233, 0, 'pending', '2023-12-27 00:00:00.000', 150000, 0, 1000000, 0),
(363, 14, 29, 'liburan15', 0, 0, 0, 127500, '1701683448-711', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:50:48.768', '2023-12-04 09:50:48.768', 23860.008117041023, 0, 'pending', '2023-12-27 00:00:00.000', 22500, 0, 150000, 0),
(364, 12, 29, '', 0, 0, 50, 500000, '1701683449-720', 10, '2023-12-27 00:00:00.000', '2023-12-04 09:50:49.080', '2023-12-04 09:50:49.080', 20745.87757537809, 0, 'pending', '2023-12-27 00:00:00.000', 0, 0, 500000, 0),
(365, 11, 33, 'NEWYEAR2026', 0, 0, 0, 552500, '1701690002-971', 13, '2023-12-06 00:00:00.000', '2023-12-04 11:40:02.236', '2023-12-04 11:40:02.236', 181055.50790228267, 0, 'pending', '2023-12-06 00:00:00.000', 97500, 0, 650000, 0),
(366, 11, 33, 'NEWYEAR2026', 0, 0, 0, 552500, '1701690026-750', 13, '2023-12-06 00:00:00.000', '2023-12-04 11:40:26.264', '2023-12-06 15:35:36.543', 181055.50790228267, 0, 'dibatalkan', '2023-12-06 00:00:00.000', 97500, 0, 650000, 0),
(367, 2, 33, 'PROMO2703', 0, 0, 0, 357500, '1701692504-492', 11, '2023-12-06 00:00:00.000', '2023-12-04 12:21:44.902', '2023-12-06 15:34:44.986', 175595.06142616717, 0, 'dibatalkan', '2023-12-06 00:00:00.000', 192500, 0, 550000, 0),
(368, 2, 33, 'PROMO2703', 0, 0, 0, 357500, '1701692511-796', 11, '2023-12-06 00:00:00.000', '2023-12-04 12:21:51.790', '2023-12-06 15:45:27.158', 175595.06142616717, 0, 'dibatalkan', '2023-12-06 00:00:00.000', 192500, 0, 550000, 0),
(369, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701703360-201', 1, '2023-12-08 00:00:00.000', '2023-12-04 15:22:40.261', '2023-12-04 15:23:14.599', 5971.964411863964, 0, 'pending', '2023-12-08 00:00:00.000', 10000, 0, 50000, 0),
(370, 3, 29, '', 0, 0, 30, 300000, '1701703596-489', 3, '2023-12-06 00:00:00.000', '2023-12-04 15:26:36.261', '2023-12-07 06:15:15.828', 14090.383507520233, 1, 'success', NULL, 0, 0, 300000, 0),
(372, 11, 32, 'liburan20', 0, 0, 0, 40000, '1701704933-279', 1, '2023-12-08 00:00:00.000', '2023-12-04 15:48:53.194', '2023-12-04 15:48:53.194', 5971.964411863964, 0, 'pending', '2023-12-08 00:00:00.000', 10000, 0, 50000, 0),
(373, 11, 32, 'liburan20', 0, 1, 0, 40000, '1701708212-614', 1, '2023-12-08 00:00:00.000', '2023-12-04 16:43:32.830', '2023-12-04 16:43:52.443', 5971.964411863964, 0, 'pending', '2023-12-08 00:00:00.000', 10000, 0, 50000, 0),
(374, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701736151-27', 1, '2023-12-08 00:00:00.000', '2023-12-05 00:29:11.893', '2023-12-12 04:02:36.532', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(375, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701778547-921', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:15:47.265', '2023-12-12 04:02:36.542', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(376, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701778549-7', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:15:49.796', '2023-12-12 04:02:36.552', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(377, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701778551-69', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:15:51.363', '2023-12-12 04:02:36.563', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(378, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701778552-211', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:15:52.697', '2023-12-12 04:02:36.574', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(379, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701778786-104', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:19:46.968', '2023-12-12 04:02:36.583', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(380, 12, 32, 'liburan20', 0, 1, 0, 40000, '1701778812-484', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:20:12.824', '2023-12-12 04:02:36.593', 6497.344165249793, 1, 'success', NULL, 10000, 0, 50000, 0),
(381, 12, 32, 'liburan20', 0, 1, 0, 40000, '1701779231-472', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:27:11.083', '2023-12-12 04:02:36.601', 6497.344165249793, 1, 'success', NULL, 10000, 0, 50000, 0),
(382, 3, 32, 'liburan20', 0, 1, 0, 80000, '1701779279-776', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:27:59.634', '2023-12-12 04:02:36.610', 167.2109549575712, 1, 'success', NULL, 20000, 0, 100000, 0),
(383, 20, 32, 'liburan20', 0, 1, 0, 4000, '1701779285-652', 1, '2023-12-08 00:00:00.000', '2023-12-05 12:28:05.235', '2023-12-12 04:02:36.620', 12705.521725520755, 1, 'success', NULL, 1000, 0, 5000, 0),
(384, 2, 78, '', 0, 0, 15, 150000, '1701851258-75', 3, '2023-12-08 00:00:00.000', '2023-12-06 08:27:38.800', '2023-12-06 08:27:38.800', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 150000, 0),
(385, 2, 78, '', 0, 0, 15, 150000, '1701851398-464', 3, '2023-12-08 00:00:00.000', '2023-12-06 08:29:58.183', '2023-12-06 08:29:58.183', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 150000, 0),
(386, 2, 78, '', 0, 0, 5, 50000, '1701851773-789', 1, '2023-12-08 00:00:00.000', '2023-12-06 08:36:13.182', '2023-12-06 08:36:13.182', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(387, 2, 78, '', 0, 0, 5, 50000, '1701851778-699', 1, '2023-12-08 00:00:00.000', '2023-12-06 08:36:18.065', '2023-12-06 08:36:18.065', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(388, 11, 78, '', 0, 0, 5, 50000, '1701851820-918', 1, '2023-12-08 00:00:00.000', '2023-12-06 08:37:00.161', '2023-12-06 08:37:00.161', 181055.50790228267, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(389, 11, 78, '', 0, 0, 10, 100000, '1701852112-360', 2, '2023-12-08 00:00:00.000', '2023-12-06 08:41:52.664', '2023-12-09 08:13:34.533', 181055.50790228267, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 100000, 0),
(390, 11, 78, '', 0, 0, 10, 100000, '1701852157-962', 2, '2023-12-08 00:00:00.000', '2023-12-06 08:42:37.161', '2023-12-11 14:01:02.108', 181055.50790228267, 1, 'success', NULL, 0, 0, 100000, 0),
(391, 2, 78, '', 0, 0, 5, 50000, '1701854128-281', 1, '2023-12-08 00:00:00.000', '2023-12-06 09:15:28.933', '2023-12-07 05:23:31.607', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(392, 2, 33, 'NEWYEAR2026', 0, 1, 0, 42500, '1701874434-707', 1, '2023-12-08 00:00:00.000', '2023-12-06 14:53:54.258', '2023-12-06 15:34:19.032', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 7500, 0, 50000, 0),
(393, 10, 33, '', 0, 0, 4, 40000, '1701874983-260', 2, '2023-12-08 00:00:00.000', '2023-12-06 15:03:03.838', '2023-12-06 15:33:59.541', 175824.1983313618, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 40000, 0),
(394, 2, 134, '', 0, 0, 25, 250000, '1701875706-103', 5, '2023-12-08 00:00:00.000', '2023-12-06 15:15:06.451', '2023-12-06 15:15:24.537', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 250000, 0),
(395, 2, 134, '', 0, 0, 25, 250000, '1701875715-500', 5, '2023-12-08 00:00:00.000', '2023-12-06 15:15:15.692', '2023-12-06 15:15:57.099', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 250000, 0),
(396, 2, 33, '', 0, 0, 35, 350000, '1701875744-245', 7, '2023-12-08 00:00:00.000', '2023-12-06 15:15:44.270', '2023-12-06 15:16:02.708', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 350000, 0),
(397, 2, 33, '', 0, 0, 35, 350000, '1701875750-874', 7, '2023-12-08 00:00:00.000', '2023-12-06 15:15:50.148', '2023-12-06 15:40:25.699', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 350000, 0),
(398, 14, 134, '', 0, 0, 1, 15000, '1701877202-231', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:40:02.213', '2023-12-06 15:43:49.339', 185209.2200132761, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 15000, 0),
(399, 14, 134, '', 0, 0, 1, 15000, '1701877206-455', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:40:06.236', '2023-12-06 15:44:00.560', 185209.2200132761, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 15000, 0),
(400, 2, 134, '', 0, 0, 5, 50000, '1701877215-87', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:40:15.256', '2023-12-06 15:40:15.256', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(401, 2, 134, '', 0, 0, 5, 50000, '1701877288-529', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:41:28.142', '2023-12-10 03:08:37.722', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(402, 2, 33, '', 0, 0, 5, 50000, '1701877291-486', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:41:31.107', '2023-12-06 16:24:17.556', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(403, 2, 33, '', 0, 0, 5, 50000, '1701877315-861', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:41:55.395', '2023-12-06 15:45:17.257', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(404, 2, 134, '', 0, 0, 5, 50000, '1701877315-784', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:41:55.897', '2023-12-06 15:41:55.897', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(405, 2, 33, '', 0, 0, 5, 50000, '1701877327-668', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:42:07.402', '2023-12-06 16:12:37.025', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(406, 2, 134, '', 0, 0, 5, 50000, '1701877351-210', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:42:31.498', '2023-12-06 15:42:31.498', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(407, 2, 134, '', 0, 0, 5, 50000, '1701877385-672', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:43:05.152', '2023-12-06 15:43:05.152', 175595.06142616717, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(408, 2, 33, '', 0, 0, 5, 50000, '1701877386-662', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:43:06.385', '2023-12-06 15:44:45.769', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(409, 2, 134, '', 0, 0, 5, 50000, '1701877388-870', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:43:08.797', '2023-12-08 16:14:58.215', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(410, 2, 33, '', 0, 0, 5, 50000, '1701877393-737', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:43:13.231', '2023-12-06 15:44:55.494', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(411, 2, 134, '', 0, 0, 5, 50000, '1701877403-42', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:43:23.196', '2023-12-06 15:45:27.582', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(412, 11, 33, '', 0, 0, 5, 50000, '1701878054-439', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:54:14.181', '2023-12-06 15:54:40.698', 181055.50790228267, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(413, 11, 33, '', 0, 0, 5, 50000, '1701878056-185', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:54:16.769', '2023-12-06 15:55:43.437', 181055.50790228267, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(414, 14, 33, '', 0, 0, 1, 15000, '1701878177-404', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:56:17.476', '2023-12-06 16:02:26.651', 185209.2200132761, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 15000, 0),
(415, 14, 33, '', 0, 0, 1, 15000, '1701878179-39', 1, '2023-12-08 00:00:00.000', '2023-12-06 15:56:19.590', '2023-12-06 16:02:41.173', 185209.2200132761, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 15000, 0),
(416, 2, 33, '', 0, 0, 5, 50000, '1701879077-416', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:11:17.838', '2023-12-06 16:14:05.821', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(417, 2, 33, '', 0, 0, 5, 50000, '1701879128-267', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:12:08.766', '2023-12-06 16:12:49.605', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 50000, 0),
(418, 48, 33, 'INDONESIA1945', 0, 0, 0, 2500, '1701879136-534', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:12:16.930', '2023-12-06 16:13:29.866', 162375.56377518622, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 7500, 0, 10000, 0),
(419, 76, 33, '', 0, 0, 2, 25000, '1701879922-864', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:25:22.444', '2023-12-06 16:25:48.716', 87771.42538592634, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(420, 76, 33, '', 0, 0, 2, 25000, '1701879925-1', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:25:25.177', '2023-12-06 16:25:43.384', 87771.42538592634, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(421, 20, 33, '', 0, 0, 0, 5000, '1701879967-780', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:26:07.111', '2023-12-06 16:26:07.111', 187747.40709761044, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 5000, 0),
(422, 20, 33, '', 0, 0, 0, 5000, '1701879969-40', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:26:09.421', '2023-12-06 16:26:09.421', 187747.40709761044, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 5000, 0),
(423, 76, 33, '', 0, 0, 2, 25000, '1701879976-998', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:26:16.336', '2023-12-06 16:26:16.336', 87771.42538592634, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(424, 87, 33, '', 0, 0, 2, 25000, '1701880021-877', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:27:01.684', '2023-12-06 16:27:01.684', 87771.42538592634, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(425, 76, 33, '', 0, 0, 2, 25000, '1701880031-826', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:27:11.273', '2023-12-06 16:28:37.461', 87771.42538592634, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(426, 74, 33, '', 0, 0, 2, 20000, '1701880172-143', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:29:32.398', '2023-12-06 16:29:32.398', 175570.02452874123, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 20000, 0),
(427, 74, 33, '', 0, 0, 2, 20000, '1701880173-797', 1, '2023-12-08 00:00:00.000', '2023-12-06 16:29:33.734', '2023-12-06 16:39:25.498', 175570.02452874123, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 20000, 0),
(428, 76, 135, '', 0, 0, 2, 25000, '1701883287-636', 1, '2023-12-09 00:00:00.000', '2023-12-06 17:21:27.641', '2023-12-06 17:21:44.608', 87771.42538592634, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(429, 76, 135, '', 0, 0, 2, 25000, '1701883293-162', 1, '2023-12-09 00:00:00.000', '2023-12-06 17:21:33.823', '2023-12-06 17:21:33.823', 87771.42538592634, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(430, 11, 135, '', 0, 0, 15, 150000, '1701883362-820', 3, '2023-12-09 00:00:00.000', '2023-12-06 17:22:42.104', '2023-12-06 17:23:06.204', 181055.50790228267, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 150000, 0),
(431, 11, 135, '', 0, 0, 15, 150000, '1701883377-734', 3, '2023-12-09 00:00:00.000', '2023-12-06 17:22:57.644', '2023-12-06 17:22:57.644', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 150000, 0),
(432, 2, 135, '', 0, 0, 5, 50000, '1701883416-991', 1, '2023-12-09 00:00:00.000', '2023-12-06 17:23:36.156', '2023-12-06 17:23:51.638', 175595.06142616717, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(433, 2, 135, '', 0, 0, 5, 50000, '1701883419-310', 1, '2023-12-09 00:00:00.000', '2023-12-06 17:23:39.880', '2023-12-06 17:24:17.369', 175595.06142616717, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(434, 10, 33, '', 0, 0, 2, 20000, '1701888071-433', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:41:11.059', '2023-12-06 18:41:11.059', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(435, 10, 33, '', 0, 0, 2, 20000, '1701888072-703', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:41:12.858', '2023-12-06 18:41:12.858', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(436, 11, 33, '', 0, 0, 5, 50000, '1701888098-567', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:41:38.463', '2023-12-06 18:41:38.463', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(437, 11, 33, '', 0, 0, 5, 50000, '1701888100-390', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:41:40.993', '2023-12-06 18:41:40.993', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(438, 12, 33, '', 0, 0, 5, 50000, '1701888255-932', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:44:15.524', '2023-12-06 18:44:15.524', 181512.36646395063, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(439, 3, 33, '', 0, 0, 10, 100000, '1701888290-464', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:44:50.449', '2023-12-06 18:44:50.449', 175533.05148800544, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 100000, 0),
(440, 3, 33, '', 0, 0, 10, 100000, '1701888292-227', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:44:52.277', '2023-12-06 18:45:21.559', 175533.05148800544, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 100000, 0),
(441, 11, 33, '', 0, 0, 5, 50000, '1701888700-217', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:51:40.375', '2023-12-06 18:51:40.375', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(442, 66, 33, '', 0, 0, 2, 20000, '1701888716-236', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:51:56.544', '2023-12-06 18:52:14.971', 175595.9624042777, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(443, 2, 33, '', 0, 0, 5, 50000, '1701888752-569', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:52:32.126', '2023-12-06 18:52:46.931', 175595.06142616717, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(444, 2, 33, '', 0, 0, 5, 50000, '1701888754-472', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:52:34.325', '2023-12-06 18:52:34.325', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(445, 75, 33, '', 0, 0, 2, 25000, '1701888786-697', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:53:06.511', '2023-12-06 18:53:06.511', 87771.42538592634, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(446, 75, 33, '', 0, 0, 2, 25000, '1701888788-536', 1, '2023-12-09 00:00:00.000', '2023-12-06 18:53:08.058', '2023-12-06 18:53:21.885', 87771.42538592634, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(447, 11, 33, '', 0, 0, 35, 350000, '1701889091-757', 7, '2023-12-09 00:00:00.000', '2023-12-06 18:58:11.403', '2023-12-06 18:58:11.403', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 350000, 0),
(448, 11, 33, '', 0, 0, 35, 350000, '1701889093-674', 7, '2023-12-09 00:00:00.000', '2023-12-06 18:58:13.753', '2023-12-06 18:58:13.753', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 350000, 0),
(449, 2, 33, '', 0, 0, 5, 50000, '1701928123-89', 1, '2023-12-09 00:00:00.000', '2023-12-07 05:48:43.691', '2023-12-07 05:48:43.691', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(450, 2, 33, '', 0, 0, 5, 50000, '1701928140-764', 1, '2023-12-09 00:00:00.000', '2023-12-07 05:49:00.975', '2023-12-07 05:49:00.975', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(451, 46, 33, '', 0, 0, 2, 25000, '1701954182-351', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:03:02.076', '2023-12-07 13:03:02.076', 176872.4643154769, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(452, 46, 33, '', 0, 0, 2, 25000, '1701954185-947', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:03:05.545', '2023-12-07 13:03:05.545', 176872.4643154769, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(453, 10, 33, 'PROMO2703', 0, 0, 0, 13000, '1701954659-17', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:10:59.355', '2023-12-07 13:10:59.355', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 7000, 0, 20000, 0),
(454, 10, 33, 'PROMO2703', 0, 0, 0, 13000, '1701954676-905', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:11:16.559', '2023-12-07 13:11:16.559', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 7000, 0, 20000, 0),
(455, 2, 33, '', 0, 0, 5, 50000, '1701954728-568', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:12:08.362', '2023-12-07 13:12:08.362', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(456, 2, 33, '', 0, 0, 5, 50000, '1701954732-771', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:12:12.733', '2023-12-07 13:12:12.733', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(457, 48, 33, '', 0, 0, 7, 70000, '1701956071-78', 7, '2023-12-09 00:00:00.000', '2023-12-07 13:34:31.733', '2023-12-07 13:34:31.733', 162375.56377518622, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 70000, 0),
(458, 48, 33, '', 0, 0, 7, 70000, '1701956073-363', 7, '2023-12-09 00:00:00.000', '2023-12-07 13:34:33.856', '2023-12-07 13:34:33.856', 162375.56377518622, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 70000, 0),
(459, 10, 33, '', 0, 0, 4, 40000, '1701956119-492', 2, '2023-12-09 00:00:00.000', '2023-12-07 13:35:19.421', '2023-12-07 13:35:19.421', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 40000, 0),
(460, 10, 33, '', 0, 0, 4, 40000, '1701956121-949', 2, '2023-12-09 00:00:00.000', '2023-12-07 13:35:21.074', '2023-12-07 13:35:21.074', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 40000, 0),
(461, 2, 33, '', 0, 0, 5, 50000, '1701956503-227', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:41:43.174', '2023-12-07 13:41:43.174', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(462, 2, 33, '', 0, 0, 5, 50000, '1701956504-779', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:41:44.684', '2023-12-07 13:41:44.684', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(463, 2, 33, '', 0, 0, 5, 50000, '1701956513-169', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:41:53.462', '2023-12-07 13:41:53.462', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(464, 2, 33, '', 0, 0, 5, 50000, '1701956514-571', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:41:54.993', '2023-12-07 13:41:54.993', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(465, 12, 33, '', 0, 0, 5, 50000, '1701956969-287', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:49:29.825', '2023-12-07 13:49:45.371', 181512.36646395063, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(466, 12, 33, '', 0, 0, 5, 50000, '1701956971-442', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:49:31.953', '2023-12-07 13:49:52.340', 181512.36646395063, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(467, 10, 33, '', 0, 0, 2, 20000, '1701957046-885', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:50:46.339', '2023-12-07 13:50:46.339', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(468, 10, 33, '', 0, 0, 2, 20000, '1701957048-855', 1, '2023-12-09 00:00:00.000', '2023-12-07 13:50:48.122', '2023-12-07 13:50:48.122', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(469, 10, 33, '', 0, 0, 2, 20000, '1701958701-844', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:18:21.711', '2023-12-07 14:18:21.711', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(470, 10, 33, '', 0, 0, 2, 20000, '1701958759-202', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:19:19.094', '2023-12-07 14:19:19.094', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(471, 11, 33, '', 0, 0, 5, 50000, '1701958772-141', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:19:32.333', '2023-12-07 14:19:32.333', 181055.50790228267, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(472, 10, 33, '', 0, 0, 2, 20000, '1701958917-110', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:21:57.767', '2023-12-07 14:21:57.767', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(473, 75, 33, '', 0, 0, 2, 25000, '1701958924-914', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:04.402', '2023-12-07 14:22:04.402', 87771.42538592634, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(474, 10, 33, '', 0, 0, 2, 20000, '1701958936-798', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:16.893', '2023-12-07 14:22:16.893', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(475, 75, 33, '', 0, 0, 2, 25000, '1701958936-668', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:16.899', '2023-12-07 14:22:16.899', 87771.42538592634, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(476, 2, 33, '', 0, 0, 5, 50000, '1701958940-569', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:20.007', '2023-12-07 14:22:20.007', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(477, 10, 33, '', 0, 0, 2, 20000, '1701958942-833', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:22.143', '2023-12-07 14:22:22.143', 175824.1983313618, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(478, 75, 33, '', 0, 0, 2, 25000, '1701958942-2', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:22.145', '2023-12-07 14:22:22.145', 87771.42538592634, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 25000, 0),
(479, 2, 33, '', 0, 0, 5, 50000, '1701958942-549', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:22:22.145', '2023-12-07 14:22:22.145', 175595.06142616717, 0, 'pending', '2023-12-09 00:00:00.000', 0, 0, 50000, 0),
(480, 99, 33, '', 0, 0, 2, 20000, '1701959209-761', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:26:49.416', '2023-12-07 14:27:04.015', 248265.81628768513, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(481, 99, 33, '', 0, 0, 2, 20000, '1701959226-136', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:27:06.989', '2023-12-07 14:28:06.178', 248265.81628768513, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(482, 72, 33, '', 0, 0, 1, 12209, '1701960566-687', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:49:26.498', '2023-12-07 14:49:36.631', 146466.2081751793, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 12209, 0),
(483, 72, 33, '', 0, 0, 1, 12209, '1701960579-626', 1, '2023-12-09 00:00:00.000', '2023-12-07 14:49:39.720', '2023-12-07 14:50:59.261', 146466.2081751793, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 12209, 0),
(484, 10, 33, '', 0, 0, 2, 20000, '1701962218-488', 1, '2023-12-09 00:00:00.000', '2023-12-07 15:16:58.425', '2023-12-07 23:51:18.148', 175824.1983313618, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(485, 10, 33, '', 0, 0, 2, 20000, '1701962220-240', 1, '2023-12-09 00:00:00.000', '2023-12-07 15:17:00.578', '2023-12-07 23:51:38.761', 175824.1983313618, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 0, 0, 20000, 0),
(486, 20, 33, '', 0, 0, 0, 5000, '1701972715-852', 1, '2023-12-10 00:00:00.000', '2023-12-07 18:11:55.543', '2023-12-07 18:13:42.573', 187747.40709761044, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 0, 0, 5000, 0),
(487, 20, 33, '', 0, 0, 0, 5000, '1701972740-803', 1, '2023-12-10 00:00:00.000', '2023-12-07 18:12:20.618', '2023-12-07 18:13:53.363', 187747.40709761044, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 0, 0, 5000, 0),
(488, 77, 33, 'INDONESIA1945', 0, 0, 0, 6250, '1701998234-580', 1, '2023-12-10 00:00:00.000', '2023-12-08 01:17:14.386', '2023-12-08 01:17:37.165', 87771.42538592634, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 18750, 0, 25000, 0),
(489, 10, 33, 'INDONESIA1945', 0, 0, 0, 10000, '1702000461-693', 2, '2023-12-10 00:00:00.000', '2023-12-08 01:54:21.039', '2023-12-08 01:54:21.039', 175824.1983313618, 0, 'pending', '2023-12-10 00:00:00.000', 30000, 0, 40000, 0),
(490, 10, 33, 'INDONESIA1945', 0, 0, 0, 10000, '1702000469-44', 2, '2023-12-10 00:00:00.000', '2023-12-08 01:54:29.708', '2023-12-08 01:54:29.708', 175824.1983313618, 0, 'pending', '2023-12-10 00:00:00.000', 30000, 0, 40000, 0),
(491, 10, 33, 'INDONESIA1945', 0, 0, 0, 25000, '1702000855-284', 5, '2023-12-10 00:00:00.000', '2023-12-08 02:00:55.855', '2023-12-08 02:00:55.855', 175824.1983313618, 0, 'pending', '2023-12-10 00:00:00.000', 75000, 0, 100000, 0),
(492, 10, 33, 'INDONESIA1945', 0, 0, 0, 25000, '1702000857-919', 5, '2023-12-10 00:00:00.000', '2023-12-08 02:00:57.475', '2023-12-09 12:30:39.310', 175824.1983313618, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 75000, 0, 100000, 0),
(493, 10, 33, '', 0, 0, 2, 20000, '1702005166-957', 1, '2023-12-08 00:00:00.000', '2023-12-08 03:12:46.301', '2023-12-08 03:12:46.301', 175824.1983313618, 0, 'pending', '2023-12-08 00:00:00.000', 0, 0, 20000, 0),
(494, 10, 33, '', 0, 0, 2, 20000, '1702005177-738', 1, '2023-12-08 00:00:00.000', '2023-12-08 03:12:57.871', '2023-12-09 12:30:27.982', 175824.1983313618, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 20000, 0),
(495, 10, 33, 'INDONESIA1945', 0, 0, 0, 20000, '1702005212-171', 4, '2023-12-13 00:00:00.000', '2023-12-08 03:13:32.801', '2023-12-08 03:25:35.551', 175824.1983313618, 0, 'dibatalkan', '2023-12-13 00:00:00.000', 60000, 0, 80000, 0),
(496, 10, 33, 'INDONESIA1945', 0, 0, 0, 20000, '1702005219-768', 4, '2023-12-13 00:00:00.000', '2023-12-08 03:13:39.521', '2023-12-08 03:13:39.521', 175824.1983313618, 0, 'pending', '2023-12-13 00:00:00.000', 60000, 0, 80000, 0),
(497, 10, 33, 'INDONESIA1945', 0, 0, 0, 50000, '1702005847-941', 10, '2023-12-14 00:00:00.000', '2023-12-08 03:24:07.886', '2023-12-08 03:25:27.424', 175824.1983313618, 0, 'dibatalkan', '2023-12-14 00:00:00.000', 150000, 0, 200000, 0),
(498, 3, 33, 'PROMO2703', 0, 0, 0, 780000, '1702005973-82', 12, '2023-12-13 00:00:00.000', '2023-12-08 03:26:13.952', '2023-12-08 03:26:13.952', 175533.05148800544, 0, 'pending', '2023-12-13 00:00:00.000', 420000, 0, 1200000, 0),
(499, 99, 33, 'INDONESIA1945', 0, 0, 0, 40000, '1702006087-727', 8, '2023-12-13 00:00:00.000', '2023-12-08 03:28:07.958', '2023-12-08 03:28:07.958', 248265.81628768513, 0, 'pending', '2023-12-13 00:00:00.000', 120000, 0, 160000, 0),
(500, 46, 33, 'INDONESIA1945', 0, 0, 0, 62500, '1702006211-21', 10, '2023-12-12 00:00:00.000', '2023-12-08 03:30:11.592', '2023-12-08 03:55:08.604', 176872.4643154769, 0, 'dibatalkan', '2023-12-12 00:00:00.000', 187500, 0, 250000, 0),
(501, 10, 33, 'NEWYEAR2026', 0, 0, 0, 170000, '1702006994-874', 10, '2023-12-12 00:00:00.000', '2023-12-08 03:43:14.769', '2023-12-08 03:43:27.982', 175824.1983313618, 0, 'dibatalkan', '2023-12-12 00:00:00.000', 30000, 0, 200000, 0),
(502, 76, 33, '', 0, 0, 2, 25000, '1702008348-990', 1, '2023-12-08 00:00:00.000', '2023-12-08 04:05:48.106', '2023-12-08 04:06:27.340', 87771.42538592634, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(503, 76, 33, 'PROMO2703', 0, 0, 0, 65000, '1702008473-627', 4, '2023-12-09 00:00:00.000', '2023-12-08 04:07:53.273', '2023-12-08 04:08:37.983', 87771.42538592634, 0, 'dibatalkan', '2023-12-09 00:00:00.000', 35000, 0, 100000, 0),
(504, 2, 33, '', 0, 0, 10, 100000, '1702008536-491', 2, '2023-12-08 00:00:00.000', '2023-12-08 04:08:56.627', '2023-12-08 04:10:13.975', 175595.06142616717, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 100000, 0),
(505, 14, 33, '', 0, 0, 1, 15000, '1702008579-430', 1, '2023-12-10 00:00:00.000', '2023-12-08 04:09:39.760', '2023-12-09 06:51:47.511', 185209.2200132761, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 0, 0, 15000, 0),
(506, 76, 33, '', 0, 0, 2, 25000, '1702008822-365', 1, '2023-12-08 00:00:00.000', '2023-12-08 04:13:42.196', '2023-12-08 04:37:15.736', 87771.42538592634, 0, 'dibatalkan', '2023-12-08 00:00:00.000', 0, 0, 25000, 0),
(507, 104, 33, 'PROMO2703', 0, 0, 0, 3997926501498, '1702010203-509', 50, '2023-12-10 00:00:00.000', '2023-12-08 04:36:43.518', '2023-12-08 04:37:09.466', 134383.98973843822, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 2152729654652, 0, 6150656156150, 0),
(508, 10, 33, 'PROMO2703', 0, 0, 0, 65000, '1702010410-508', 5, '2023-12-13 00:00:00.000', '2023-12-08 04:40:10.625', '2023-12-08 04:40:32.916', 175824.1983313618, 0, 'dibatalkan', '2023-12-13 00:00:00.000', 35000, 0, 100000, 0),
(509, 3, 32, '', 0, 0, 10, 100000, '1702022625-202', 1, '2023-12-10 00:00:00.000', '2023-12-08 08:03:45.200', '2023-12-08 08:05:44.155', 167.2109549575712, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 0, 0, 100000, 0),
(510, 3, 32, '', 0, 0, 10, 100000, '1702022635-801', 1, '2023-12-10 00:00:00.000', '2023-12-08 08:03:55.736', '2023-12-12 04:02:36.631', 167.2109549575712, 1, 'success', NULL, 0, 0, 100000, 0),
(513, 2, 32, '', 0, 0, 5, 50000, '1702033550-962', 1, '2023-12-10 00:00:00.000', '2023-12-08 11:05:50.768', '2023-12-12 04:02:36.641', 166.2403436732599, 1, 'success', NULL, 0, 0, 50000, 0),
(514, 2, 32, '', 0, 0, 5, 50000, '1702033601-840', 1, '2023-12-10 00:00:00.000', '2023-12-08 11:06:41.840', '2023-12-08 11:06:41.840', 166.2403436732599, 0, 'pending', '2023-12-10 00:00:00.000', 0, 0, 50000, 0),
(515, 2, 32, '', 0, 0, 5, 50000, '1702033607-956', 1, '2023-12-10 00:00:00.000', '2023-12-08 11:06:47.131', '2023-12-12 04:02:36.653', 166.2403436732599, 1, 'success', NULL, 0, 0, 50000, 0),
(516, 2, 134, '', 0, 0, 5, 50000, '1702052059-886', 1, '2023-12-10 00:00:00.000', '2023-12-08 16:14:19.513', '2023-12-08 16:15:07.173', 175595.06142616717, 0, 'dibatalkan', '2023-12-10 00:00:00.000', 0, 0, 50000, 0),
(517, 3, 134, '', 0, 1, 10, 100000, '1702052317-494', 1, '2023-12-10 00:00:00.000', '2023-12-08 16:18:37.658', '2023-12-08 16:18:37.658', 175533.05148800544, 0, 'pending', '2023-12-10 00:00:00.000', 0, 0, 100000, 0),
(518, 3, 32, '', 0, 0, 10, 100000, '1702055370-472', 1, '2023-12-11 00:00:00.000', '2023-12-08 17:09:30.600', '2023-12-12 04:02:36.663', 167.2109549575712, 1, 'success', NULL, 0, 0, 100000, 0),
(519, 10, 33, 'TESTTES', 0, 0, 0, 90000, '1702055422-36', 5, '2023-12-14 00:00:00.000', '2023-12-08 17:10:22.183', '2023-12-08 17:10:35.589', 175824.1983313618, 0, 'dibatalkan', '2023-12-14 00:00:00.000', 10000, 0, 100000, 0),
(520, 3, 32, '', 0, 0, 10, 100000, '1702055576-661', 1, '2023-12-11 00:00:00.000', '2023-12-08 17:12:56.428', '2023-12-08 17:12:56.428', 167.2109549575712, 0, 'pending', '2023-12-11 00:00:00.000', 0, 0, 100000, 0),
(521, 20, 148, 'liburan20', 0, 1, 0, 4000, '1702065484-876', 1, '2023-12-08 00:00:00.000', '2023-12-08 19:58:04.469', '2023-12-08 19:58:04.469', 187747.40709761044, 0, 'pending', '2023-12-08 00:00:00.000', 1000, 0, 5000, 0),
(522, 20, 32, 'liburan20', 4, 1, 0, 0, '1702067753-951', 1, '2023-12-08 00:00:00.000', '2023-12-08 20:35:53.119', '2023-12-08 20:35:53.119', 12705.521725520755, 0, 'pending', '2023-12-08 00:00:00.000', 1000, 4000, 5000, 4),
(523, 20, 32, 'liburan20', 4, 1, 0, 0, '1702067807-259', 1, '2023-12-08 00:00:00.000', '2023-12-08 20:36:47.828', '2023-12-08 20:36:47.828', 12705.521725520755, 0, 'pending', '2023-12-08 00:00:00.000', 1000, 4000, 5000, 4),
(524, 2, 32, 'liburan20', 22, 1, 0, 18000, '1702067833-829', 1, '2023-12-08 00:00:00.000', '2023-12-08 20:37:13.019', '2023-12-08 20:37:13.019', 166.2403436732599, 0, 'pending', '2023-12-08 00:00:00.000', 10000, 22000, 50000, 22),
(525, 10, 33, 'TESTTES', 0, 0, 0, 180000, '1702125081-280', 10, '2023-12-15 00:00:00.000', '2023-12-09 12:31:21.529', '2023-12-09 12:31:30.457', 175824.1983313618, 0, 'dibatalkan', '2023-12-15 00:00:00.000', 20000, 0, 200000, 0),
(526, 10, 33, '', 0, 0, 2, 20000, '1702149932-909', 1, '2023-12-10 00:00:00.000', '2023-12-09 19:25:32.142', '2023-12-09 19:25:32.142', 175824.1983313618, 0, 'pending', '2023-12-10 00:00:00.000', 0, 0, 20000, 0),
(527, 10, 33, 'TESTTES', 0, 0, 0, 126000, '1702150059-81', 7, '2023-12-10 00:00:00.000', '2023-12-09 19:27:39.250', '2023-12-09 19:27:39.250', 175824.1983313618, 0, 'pending', '2023-12-10 00:00:00.000', 14000, 0, 140000, 0),
(528, 10, 33, '', 0, 0, 2, 20000, '1702150153-326', 1, '2023-12-12 00:00:00.000', '2023-12-09 19:29:13.827', '2023-12-09 19:29:13.827', 175824.1983313618, 0, 'pending', '2023-12-12 00:00:00.000', 0, 0, 20000, 0),
(529, 10, 33, 'TESTTES', 0, 0, 0, 108000, '1702150576-659', 6, '2023-12-11 00:00:00.000', '2023-12-09 19:36:16.002', '2023-12-09 19:45:47.444', 175824.1983313618, 0, 'dibatalkan', '2023-12-11 00:00:00.000', 12000, 0, 120000, 0),
(530, 14, 33, '7 DAYS HAPPY', 0, 0, 0, 120000, '1702151174-72', 10, '2023-12-16 00:00:00.000', '2023-12-09 19:46:14.754', '2023-12-09 19:46:14.754', 185209.2200132761, 0, 'pending', '2023-12-16 00:00:00.000', 30000, 0, 150000, 0),
(531, 124, 136, '7 DAYS HAPPY', 0, 0, 0, 16000, '1702294627-606', 1, '2023-12-11 00:00:00.000', '2023-12-11 11:37:07.624', '2023-12-11 11:37:47.936', 163030.66232357715, 0, 'dibatalkan', '2023-12-11 00:00:00.000', 4000, 0, 20000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` longtext,
  `phone_number` varchar(255) DEFAULT NULL,
  `points` bigint DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `is_verified` tinyint(1) DEFAULT '0',
  `verification_token` longtext,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `photo_profil` longtext,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `category_kesukaan` longtext,
  `confirm_password` longtext,
  `status_category` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `phone_number`, `points`, `is_admin`, `is_verified`, `verification_token`, `lat`, `long`, `created_at`, `photo_profil`, `category_id`, `category_kesukaan`, `confirm_password`, `status_category`) VALUES
(1, 'Admin Destimate', 'admin', 'hidestimate@gmail.com', '$2a$10$WBq8dw8Ac4SrSAW/LsytV.F5uyqAd872PGsqmphefXvUJb0581qYe', '8128090502', 280, 1, 1, '', 0, 0, '2023-11-10 15:09:15.755', 'https://storage.googleapis.com/destimate/users/user1/profile_1701284757.jpg', 1, 'wisata alam', '', 0),
(29, 'Putri Ruth Berliana Siahaan', 'putrishn27', 'ruthputri135@gmail.com', '$2a$10$XD3lspVAwWcvKrklnx84j.SwM4m3PuuK6byw06v10niBP0EPK.B5K', '0852608927035', 90, 0, 1, '', 2.32909, 99.0626, '2023-11-10 15:09:15.755', 'https://storage.googleapis.com/destimate/users/user29/profile_1701683445.jpg', 150, 'Air terjun', '', 0),
(32, 'Aimar Rizki', 'aimrzki', 'muhammadaimar77@gmail.com', '$2a$10$d.QgB1QjjiYPBl6UHkdc5OW3IRclcMe0hNpqpePjPFWf2ypHBuilC', '85155489322', 0, 0, 1, '', 37.4219983, -122.084, '2023-11-10 15:50:52.736', 'https://storage.googleapis.com/destimate/users/user32/profile_1700813649.jpg', 1, 'wisata alam', '', 1),
(33, 'bebek kakinya ', 'steven', 'bebek@hotmail.com', '$2a$10$nLnid3WFMX61a9oV.rJ8/e2.wCoZfWyeMH0TyzLf4C/ZaVXcFU.zK', '8135035221', 0, 0, 1, '', 0, 0, '2023-11-11 00:55:59.452', 'https://storage.googleapis.com/relaverse/users/user33/profile_1700745860.jpg', 2, 'wisata lifestyle', '', 1),
(34, 'anjay lupa password', 'gabriel123', 'gtrmastah@gmail.com', '$2a$10$tL6w9UQAyqFWrOPKol8W7ulBx36pfTpVTOYnhP8rGKJgP3Swxc2zi', '00918281211', 0, 0, 1, '', 0, 0, '2023-11-11 02:41:56.956', '', 1, 'Wisata Alam', '', 0),
(35, 'Muhammad Aimar Rizki Utama', 'aimrzky', 'aimrzki@student.telkomuniversity.ac.id', '$2a$10$rkey4Wpak2pHVdScYUHuB.LEk3nxkQHikzqWdExSihdTaIiUSE6kq', '851554893222', 0, 0, 1, '', 0, 0, '2023-11-11 08:26:48.031', '', 0, '', '', 0),
(36, 'kentang goreng', 'kentanggoreng123', 'kentang11@gamil.com', '$2a$10$1BlpxhaqXUQNO1yCKWIxuud/ITQoy4hhmUCI6miKBJWX5Omp38VPa', '89696969696', 0, 0, 0, 'fS42KdlUc8gkHFfiLrGAv7AkkN70Z8LkA4nDxH5t_B4=', 0, 0, '2023-11-11 08:42:35.915', '', 0, '', '', 0),
(46, 'Anzaaay', '108482099765712019379', 'kuntiutami123@gmail.com', 'xSG6gciLze', '81234567234', 0, 0, 1, '', 0, 0, '2023-11-12 11:56:11.526', '', 0, '', '', 0),
(47, 'Rafi', '105085510803277215935', 'faizty06@gmail.com', 'V458MIkaM4', '9239812399', 0, 0, 1, '', 0, 0, '2023-11-12 11:56:55.550', '', 0, '', '', 0),
(49, 'sri wahyu', '116477492463978065892', 'sriwahyuk46@gmail.com', 'no8z41dliL', '812345678910', 0, 0, 1, '', 0, 0, '2023-11-12 12:06:53.646', '', 0, '', '', 0),
(55, 'eassesment bandung', 'easessment', 'eassesmentbandung@gmail.com', 'ijfH1GVF6k', '7973324420', 0, 0, 1, '', 0, 0, '2023-11-13 11:54:17.481', '', 0, '', '', 0),
(56, 'Zahra Fitria', 'zahraftrm', 'zahrafitria.m@gmail.com', '$2a$10$omJPldA.dhq8/OzuWLC4gudwx1yIII0m36YnKAGggfz8mBAWl4K5u', '81234567890', 0, 0, 1, '', 7.2575, 112.7521, '2023-11-13 12:01:43.667', '', 0, '', '', 0),
(63, 'Bryan', 'bryan', 'bryanrp1950@gmail.com', '$2a$10$QHWIfbDHUz7rXklmKs2jdOE1WZF9Zon11OsKNuQR9TKxwOfxchgnC', '89898989898', 0, 0, 1, '', 0, 0, '2023-11-14 15:46:32.764', '', 0, '', '', 0),
(67, 'Hanief Fathul Bahri Ahmad', '101039270246511058052', 'hanieffathulb03@gmail.com', 'cGmZJP581J', '6589337143', 0, 0, 1, '', 0, 0, '2023-11-17 05:48:21.644', '', 0, '', '', 0),
(73, 'Rafli', 'Rafli', 'rafli@gmail.com', '$2a$10$3m/P3nYswIuQz9cEYPxKPOxND0PrLdrJ5JZRLTr1.EUvZoMsZdeaO', '821201212912', 0, 0, 0, 'Z5deo9Qj9YPyKSTNdRdnszwE53uFesnP0IUb_afGqrc=', 0, 0, '2023-11-20 12:11:06.901', '', 0, '', 'rafli123', 0),
(74, 'raka f', '108354487685115362660', 'rakafajar18@gmail.com', 'UOXrlA95CS', '1292273481', 0, 0, 1, '', 0, 0, '2023-11-22 08:15:17.449', '', 0, '', '', 0),
(75, 'hibisasuke mlb', '102265452141368351636', 'hibisasuke.mlb12@gmail.com', 'NetQXpB8In', '0487413612', 0, 0, 1, '', 0, 0, '2023-11-22 11:42:20.827', '', 0, '', '', 0),
(76, 'Angeline', 'angeline89', 'angeine@gmail.com', '$2a$10$/dHcTkG/U3tlVXpdxkrigu9yDxIxQNYc5320on1hpOvjK63PCTiZi', '82244118582', 0, 0, 0, 'velhXUDEv8uYtxrc2U95PcHuvgfdRAML3JevDSvi99w=', 0, 0, '2023-11-23 04:02:38.481', '', 0, '', 'angeline89', 0),
(77, 'Angeline', 'angelinevalencia', 'angeline@gmail.com', '$2a$10$VGvLluF/CHjs4yibI1bSZ.HNzYmqgWBEzoSXhuvmLwJAUBnlAbxQa', '82244119595', 0, 0, 0, 'N3oV2QD9S1D3WCbTnmFWQj_wTxN4Km8oqnoq0za9CXE=', 0, 0, '2023-11-23 13:04:04.149', '', 0, '', 'angeline89', 0),
(78, 'AngelL', 'angelinevalencia123', 'vangeline893@gmail.com', '$2a$10$wMqe8Zp8Kv8WsgzhN03v0OPchxtStlKZiHbQPcQr/8mlbUukFeiPu', '8224411856', 10, 0, 1, '', 0, 0, '2023-11-23 13:04:49.698', 'https://storage.googleapis.com/destimate/users/user78/profile_1702104140.jpg', 161, 'Pantai', 'angeline89', 1),
(79, 'Teh Pucuk', 'TehPucuk', 'tehpucuk8700@gmail.com', 'PvLBtoOpF1', '1393711555', 0, 0, 1, '', 0, 0, '2023-11-25 17:33:53.643', '', 0, '', '', 0),
(80, 'dummy', 'dummyy', 'gabrieldwiputra12@gmail.com', '$2a$10$nJUafyDZkowycYKDXXQGGeleKDB3H6KupHA8RFwxVQr3MbLsBA39a', '81248123313', 0, 0, 1, '', 0, 0, '2023-11-26 07:02:38.290', '', 0, '', 'dummy123', 0),
(81, 'Mauricio Bethoven', 'bethoven', 'bethoven.tigauw@gmail.com', '$2a$10$2QnkjIyCV.w9z9SFrHYMluyZUpvzyNUX.mUzztfOERKwwOAudxMnG', '851554893232', 0, 0, 1, '', 0, 0, '2023-11-27 09:53:53.996', '', 0, '', 'telyu123', 0),
(83, 'Laode Saady', '101299590433536460872', 'laodesaady12345@gmail.com', 'NzFntWHu8A', '7154397970', 0, 0, 1, '', 0, 0, '2023-11-29 02:51:00.913', '', 0, '', '', 0),
(84, 'Admin Destimate 2', 'admin2', 'hidestimate2@gmail.com', '$2a$10$FV1.1qlXelXAwX.nb9koLOJXgRaOXWnCfcjVk4fpDLVh2LMneA0J6', '851554893233', 0, 1, 1, '', 0, 0, '2023-11-29 18:15:01.796', 'https://storage.googleapis.com/destimate/users/user84/profile_1701281953.jpg', 0, '', 'admin123', 0),
(85, 'Admin Destimate 3', 'admin3', 'hidestimate3@gmail.com', '$2a$10$f/ZWI7wIpQBXRggAPHgPEOVhxTiZ/WzfBH.nrLTssAet6zyGr9j3W', '851554893234', 0, 1, 1, '', 0, 0, '2023-11-29 18:15:12.873', 'https://storage.googleapis.com/destimate/users/user85/profile_1701281970.jpg', 0, '', 'admin123', 0),
(86, 'Admin Destimate 4', 'admin4', 'hidestimate4@gmail.com', '$2a$10$h0ZtcSPe5mkVU73d/Pp0WevGpQRFfSSYsVlEkPEajb81mLZ3vg4pa', '851554893235', 0, 1, 1, '', 0, 0, '2023-11-29 18:15:22.033', 'https://storage.googleapis.com/destimate/users/user86/profile_1701281983.jpg', 0, '', 'admin123', 0),
(88, 'AutomationTesting', 'angeline123', 'angeline123@gmail.com', '$2a$10$sD/pdmJc.VkS4AVs/ylbj.xgDxWGXa3VF7JLU.TFh0PdqabtoqUYy', '8238912392', 0, 0, 0, 'AJGIGw7XAcE4YiD2uAWLU51pUSkfPlPdryY_1r3Z06Q=', 0, 0, '2023-11-30 03:46:02.599', '', 0, '', 'automationtesting1', 0),
(104, 'AutomationTesting3', 'automationtesting3', 'val.v21@mhs.istts.ac.id', '$2a$10$6ESaYlKqAMiaPJkZcH1uueIke6SUc2g2bXb7CI2h8DdGBQYXmkeOC', '0812345678910', 0, 0, 0, 'Wk2-ZkX9tMtoAoDoJUwYNYAL5fGCmrx_-RnD4FL9UAQ=', 0, 0, '2023-12-01 07:05:37.233', '', 0, '', 'automationtesting3', 0),
(134, 'Hokgiealan', 'alan123', 'hokgiealan@gmail.com', '$2a$10$HDtsLUleJ8.6wv4Rx8vH.OVWOrGjoGj1wzvGPcs.4cDHSdaX2MPc6', '77777777777', 0, 0, 1, '', 0, 0, '2023-12-06 15:07:06.435', 'https://storage.googleapis.com/destimate/users/user134/profile_1702038010.jpg', 154, 'Perkebunan', 'alan1234', 0),
(136, 'Aditya Tri', 'adriyo', 'adriyo96begaye@gmail.com', '$2a$10$uCSgX/mLnf7iGjCqbjvluuN0DHU82gbwr9CQhkTZiXH1P4AUTvw6W', '089669699696', 0, 0, 1, '', 0, 0, '2023-12-06 17:33:00.939', '', 1, 'wisata alam', 'adit1234', 1),
(138, 'Dwi Wahyu', '117178972710369054163', 'dwiw4hyuu@gmail.com', 'K3P7J4iIuG', '0912826867', 0, 0, 1, '', 0, 0, '2023-12-06 17:36:33.508', '', 0, '', '', 0),
(146, 'Ana Shn', 'putrishn273', 'ruthputri123@gmail.com', '$2a$10$Ic8Tr8jkEKs3mOTxA181cuZRW8vK9fKaUpplEV4skIqkDLzQbfmgG', '085260892703', 0, 0, 0, 'dztTU8QY5UfVscirup0RJOucf98X6pyrOJ84dFdn4xw=', 0, 0, '2023-12-08 08:10:05.687', '', 0, '', 'siahaan123', 0),
(147, 'Hanna Erita Saragih', 'hannaeritasaragih123', 'hannaeritasaragih@gmail.com', '$2a$10$0tcaC73BHnTA2xl1sDG5He9huAxZf3GwZC4AgdvRjfD4zGNZ1N5qO', '8309491172', 0, 0, 0, 'fuf8nGM9h1he_hkljfVx3jCXYlViLBh0TTIGOhE0EwQ=', 0, 0, '2023-12-08 08:10:23.769', '', 0, '', 'siahaan123', 0),
(148, 'HRIS Cloud', 'hriscloud', 'hriscloud@gmail.com', '$2a$10$IFWRM2Z6IoXmuQMdodJZ0uVSJsOere91uZ5CrTSnvEcR2PCo9bajK', '0851554893270', 0, 0, 1, '', 0, 0, '2023-12-08 19:56:27.631', '', 0, '', 'alterra123', 0),
(149, 'July Dsp', '104828565402484052631', 'julydsp04@gmail.com', 'uPsITu15Ol', '0739859960', 0, 0, 1, '', 0, 0, '2023-12-09 13:44:45.677', '', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext,
  `location` longtext,
  `description` longtext,
  `price` bigint DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `available_tickets` bigint DEFAULT NULL,
  `photo_wisata1` longtext,
  `photo_wisata2` longtext,
  `photo_wisata3` longtext,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `kota` longtext,
  `maps_link` longtext,
  `is_open` tinyint(1) DEFAULT NULL,
  `description_is_open` longtext,
  `fasilitas` json DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `video_link` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `title`, `location`, `description`, `price`, `lat`, `long`, `user_id`, `available_tickets`, `photo_wisata1`, `photo_wisata2`, `photo_wisata3`, `category_id`, `created_at`, `updated_at`, `kota`, `maps_link`, `is_open`, `description_is_open`, `fasilitas`, `kode`, `video_link`) VALUES
(2, 'Moja Museum', 'Komplek Gelora Bung Karno Main Stadium, Jl. Gerbang Pemuda No.1, RT.1/RW.3, Gelora, Daerah Khusus Ibukota Jakarta 10270', 'Creative venue offering colorful & whimsical interactive sets as backdrops for photos.', 50000, -6.218392662475265, 106.8020591440487, 1, 673, 'https://storage.googleapis.com/destimate/wisata2/photo1_1700813751.jpg', 'https://storage.googleapis.com/destimate/wisata2/photo2_1700813752.jpg', 'https://storage.googleapis.com/destimate/wisata2/photo3_1700813752.jpg', 2, '2023-11-07 12:45:18.637', '2023-12-08 20:37:13.011', 'Jakarta', 'https://maps.app.goo.gl/7NcCheSshmCFT1AT9', 1, 'Buka Pukul 10.00 - 18.00 WIB', '[\"restoran\", \" toilet\", \" mushola\"]', 'MMJ', 'https://youtu.be/ZVE4bz0iLYU?si=IoskHVSBaRxZ3eBN'),
(3, 'Kawasan Ekowisata Mangrove PIK 2', 'Jalan Katamaran Indah 1 RT.7, RT.1/RW.7, Kapuk Muara, Kec. Penjaringan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14460', 'Tempat wisata alam yang konsepnya sangat unik, warga Jakarta yang sudah terbiasa dengan mall dan keramaian di ajak kembali melihat kelestarian alam, yaitu pelesatarian hutan bakau. Pengunjung dapat menikmati pengalaman menanam bibit bakau secara langsung di sini\r\nAda juga wisata air, dimana pengunjung bisa bersampan sendiri menyusuri danau mangrove, juga banyak tempat menarik untuk foto yang banyak digunakan pre wedding\r\nAda juga villa //resort menarik yang bisa disewakan di sini\r\nSayangnya tidak banyak pengunjung, mungkin belum banyak warga Jakarta yang tau karena kurang sosialisasi', 100000, 6.1221, 106.761, 1, 49, 'https://storage.googleapis.com/destimate/wisata3/photo1_1700813835.jpg', 'https://storage.googleapis.com/destimate/wisata3/photo2_1700813836.jpg', 'https://storage.googleapis.com/destimate/wisata3/photo3_1700813836.jpg', 1, '2023-11-09 09:36:00.720', '2023-12-08 17:12:56.420', 'Jakarta', 'https://maps.app.goo.gl/MAnHj3imJMoY5PBC7', 1, 'Buka Pukul 10.00 - 18.00 WIB', '[\"restoran\", \"  toilet\", \"  mushola\"]', 'KEM', 'https://youtu.be/095eEP0n_0U?si=XLstDYbUBcg-PnCE'),
(10, 'Curug Leuwi Hejo', 'Jalan raya, Cibadak, Kec. Sukamakmur, Kabupaten Bogor, Jawa Barat 16830', 'Curug Leuwi Hejo merupakan salah satu destinasi wisata alam di Bogor yang mencuri perhatian masyarakat. Curug Leuwi Hejo bisa jadi pilihan tepat buat liburan singkat. Sambil menikmati airnya yang jernih kehijauan, melepas semua rasa penat. Terdapat berbagai aktivitas yang bisa Anda lakukan untuk menikmati liburan di curug yang satu ini. Keindahannya  bahkan sudah bisa dirasakan sejak masuk kawasan perbukitan yang menuju lokasi. Sejauh mata memandang, panorama alam yang hijau nan asri serta gemericik aliran air menghadirkan sensasi perjalanan yang berkesan.\n\nDaya tarik utama curug ini tentu saja warna airnya yang hijau toska. Airnya sejuk dan dingin khas alami air dari pegunungan. Ditambah lagi dengan tebing-tebing kokoh yang mengapit kolam/cekungan menambah keindahan curug ini. \n\n', 20000, 6.5927, 106.955, 1, 1, 'https://storage.googleapis.com/destimate/wisata10/photo1_1700814037.jpg', 'https://storage.googleapis.com/destimate/wisata10/photo2_1700814037.jpg', 'https://storage.googleapis.com/destimate/wisata10/photo3_1700814037.jpg', 16, '2023-11-15 16:07:37.269', '2023-12-09 19:36:15.993', 'Bogor', 'https://maps.app.goo.gl/efRFT6SoyzaHMSTv9', 1, 'Buka pukul 06.00 - 18.00 WIB', '[\"Mushola\", \"Tempat parkir\", \"Penginapan\", \"Gazebo\", \" Warung makan\", \" Toilet\"]', 'CLH', 'https://youtu.be/O4v-1dGHSbE?si=HM-nAZ1KVe5urmpf'),
(11, 'Candi Borobudur', 'Jalan Raya Jogya – Solo Km 16 Prambanan Sleman, Yogyakarta 55571, Indonesia', 'Dinasti Sailendra membangun peninggalan Budha terbesar di dunia antara 780-840 Masehi. Dinasti Sailendra merupakan dinasti yang berkuasa pada masa itu. Peninggalan ini dibangun sebagai tempat pemujaan Budha dan tempat ziarah. Tempat ini berisi petunjuk agar manusia menjauhkan diri dari nafsu dunia dan menuju pencerahan dan kebijaksanaan menurut Buddha. Peninggalan ini ditemukan oleh Pasukan Inggris pada tahun 1814 dibawah pimpinan Sir Thomas Stanford Raffles. Area candi berhasil dibersihkan seluruhnya pada tahun 1835.\n\nBorobudur dibangun dengan gaya Mandala yang mencerminkan alam semesta dalam kepercayaan Buddha. Struktur bangunan ini berbentuk kotak dengan empat pintu masuk dan titik pusat berbentuk lingkaran. Jika dilihat dari luar hingga ke dalam terbagi menjadi dua bagian yaitu alam dunia yang terbagi menjadi tiga zona di bagian luar, dan alam Nirwana di bagian pusat.', 50000, -7.607355, 110.2038, 1, 99994, 'https://storage.googleapis.com/destimate/wisata11/photo1_1700814155.jpg', 'https://storage.googleapis.com/destimate/wisata11/photo2_1700814155.jpg', 'https://storage.googleapis.com/destimate/wisata11/photo3_1700814155.jpg', 21, '2023-11-15 16:13:52.955', '2023-12-08 10:47:58.447', 'Yogyakarta', 'https://maps.app.goo.gl/T4UXYmSMDD51yJLD9', 1, 'Buka pukul 06.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\", \" Museum\", \" Andong Tour\"]', 'CBY', 'https://youtu.be/sdvW7vGWecA?si=U-gcWAIINXHzlU3G'),
(12, 'Candi Prambanan', 'Jl. Raya Solo - Yogyakarta No.16, Kranggan, Bokoharjo, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55571', 'Candi Prambanan merupakan candi Hindu yang terbesar di Indonesia. Sampai saat ini belum dapat dipastikan kapan candi ini dibangun dan atas perintah siapa, namun kuat dugaan bahwa Candi Prambanan dibangun sekitar pertengahan abad ke-9 oleh raja dari Wangsa Sanjaya, yaitu Raja Balitung Maha Sambu. Dugaan tersebut didasarkan pada isi Prasasti Syiwagrha yang ditemukan di sekitar Prambanan dan saat ini tersimpan di Museum Nasional di Jakarta. Prasasti berangka tahun 778 Saka (856 M) ini ditulis pada masa pemerintahan Rakai Pikatan.\n\n', 50000, -7.752, 110.4915, 1, 99855, 'https://storage.googleapis.com/destimate/wisata12/photo1_1700814274.jpg', 'https://storage.googleapis.com/destimate/wisata12/photo2_1700814274.jpg', 'https://storage.googleapis.com/destimate/wisata12/photo3_1700814274.jpg', 21, '2023-11-15 16:19:07.668', '2023-12-07 13:49:31.943', 'Yogyakarta', 'https://maps.app.goo.gl/2NHKh1se8aEm8Jhc7', 1, 'Buka pukul 06.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\", \" Museum\", \" Andong Tour\"]', 'CPY', 'https://youtu.be/1Lx9zu7r-e4?si=lHmfpRXuyxBRK8c5'),
(14, 'Surabaya Zoo', 'Jl. Setail No.1, Darmo, Kec. Wonokromo, Surabaya, Jawa Timur 60241', 'Kebun Binatang Surabaya adalah salah satu kebun binatang yang populer di Indonesia dan terletak di Surabaya. KBS merupakan kebun binatang yang pernah terlengkap se-Asia Tenggara, di dalamnya terdapat lebih dari 230 spesies satwa yang berbeda yang terdiri lebih dari 2179 ekor satwa.', 15000, 7.296, 112.7366, 1, 1629, 'https://storage.googleapis.com/destimate/wisata14/photo1_1700814397.jpg', 'https://storage.googleapis.com/destimate/wisata14/photo2_1700814397.jpg', 'https://storage.googleapis.com/destimate/wisata14/photo3_1700814397.jpg', 2, '2023-11-15 16:32:36.595', '2023-12-09 19:46:14.745', 'Surabaya', 'https://maps.app.goo.gl/U6gdtABcMxY6VfzZ7', 1, 'Buka pukul 08.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\", \" Wahana Permainan\", \" Animal Edutainment\", \" Tunggang Gajah\"]', 'SBZ', 'https://youtu.be/i1mAxzIiTyI?si=eyzQuW-g6F7ItXA-'),
(17, 'Taman Nasional Gunung Leuser', 'GF97+P97 Barisan mountain range, Aceh 24653', 'Taman Nasional Gunung Leuser adalah salah satu Kawasan Pelestarian Alam di Indonesia seluas 1.094.692 hektare yang secara administrasi pemerintahan terletak di Provinsi Aceh dan Sumatera Utara.', 15000, 3.5193, 97.4634, 1, 937, 'https://storage.googleapis.com/destimate/wisata17/photo1_1700814524.jpg', 'https://storage.googleapis.com/destimate/wisata17/photo2_1700814524.jpg', 'https://storage.googleapis.com/destimate/wisata17/photo3_1700814525.jpg', 1, '2023-11-15 16:49:00.301', '2023-12-01 10:55:11.047', 'Aceh', 'https://maps.app.goo.gl/YuNL6AwzKgLokrEh8', 1, 'Buka pukul 08.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\"]', 'TNG', 'https://youtu.be/Qj-nKainTsA?si=_Lctt8n9fRaJAWu9'),
(20, 'Alas Purwo National Park Office', 'Jl. Brawijaya No.20, Kebalenan, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68417', 'Taman Nasional Alas Purwo adalah sebuah taman nasional yang terletak di Kecamatan Tegaldlimo dan Kecamatan Purwoharjo, Kabupaten Banyuwangi, Jawa Timur, Indonesia. Letak taman nasional ini di ujung paling timur dari Pulau Jawa.', 5000, 8.2339, 114.3517, 1, 933, 'https://storage.googleapis.com/destimate/wisata20/photo1_1700814569.jpg', 'https://storage.googleapis.com/destimate/wisata20/photo2_1700814569.jpg', 'https://storage.googleapis.com/destimate/wisata20/photo3_1700814569.jpg', 1, '2023-11-22 09:16:56.941', '2023-12-12 02:27:22.151', 'Banyuwangi', 'https://maps.app.goo.gl/vk9g7SMdnaWmEmQdA', 1, 'Buka pukul 08.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\"]', 'ALP', 'https://youtu.be/JG2vRtFrH_8?si=OpSuRd9wvtZ9b2VZ'),
(46, 'Farmhouse Lembang', 'Jl. Raya Lembang No.108, Gudangkahuripan, Kec. Lembang, Kabupaten Bandung Barat, Jawa Barat 40391', 'Wisata edukasi yang ditawarkan mulai dari berinteraksi dengan hewan seperti burung, kelinci, iguana, ular, kambing, rusa sampai anak sapi', 25000, 6.833, 107.6056, 1, 979, 'https://storage.googleapis.com/destimate/wisata46/photo1.jpg', 'https://storage.googleapis.com/destimate/wisata46/photo2.jpg', 'https://storage.googleapis.com/destimate/wisata46/photo3.jpg', 2, '2023-11-24 13:37:40.576', '2023-12-12 02:25:05.717', 'Bandung', 'https://maps.app.goo.gl/ypcRAM6Dp25ahPvn9', 1, 'Buka pukul 08.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\", \" Restaurant\"]', 'FSL', 'https://youtu.be/OoWJui1YSiY?si=pabC5p277fQr-qpf'),
(74, 'Kebun Raya Bogor', 'Jl. Ir. H. Juanda No.13, Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat 16122', 'Kebun Raya Bogor terletak di kota Bogor dan tersebar di lahan seluas sekitar 87 hektar dengan Istana Kepresidenan Bogor di luar kota yang mengesankan di depannya dan Gunung Salak yang menjulang tinggi sebagai latar belakangnya dan memiliki lebih dari 400 spesies pohon palem, 5.000 pohon yang dikumpulkan dari seluruh daerah tropis dunia, dan rumah anggrek berisi 3.000 varietas. Catatan menunjukkan, Kebun Raya Bogor menampung 3.504 spesies tumbuhan, 1.273 genus dalam 199 famili.', 20000, 6.5976, 106.7996, 84, 990, 'https://storage.googleapis.com/destimate/wisatas/wisata/image_QRHtwIwYo3_1701282685_1.jpg', 'https://storage.googleapis.com/destimate/wisatas/wisata/image_QRHtwIwYo3_1701282685_2.jpg', 'https://storage.googleapis.com/destimate/wisatas/wisata/image_QRHtwIwYo3_1701282685_3.jpg', 1, '2023-11-29 18:31:25.113', '2023-12-12 02:31:08.550', 'Bogor', 'https://maps.app.goo.gl/3MEAZt1oMVgesrbo6', 1, 'Buka pukul 08.00 - 18.00 WIB', '[\"Tempat parkir\", \" Toilet\", \" Spot Foto\"]', 'KRB', 'https://youtu.be/RGmFuiHn6o0?si=fEq2yMkxJY13DQF8'),
(127, 'Pantai Bulbul', 'Sumatera Utara', 'Berbeda dari pantai pada umumnya, pantai air tawar ini berada di tepi sekitar Danau Toba. Di sepanjang pinggiran pantainya terdapat pasir putih yang menjadi ciri khas dari tempat wisata ini.', 20000, 2.348616508757384, 99.0732244877909, 1, 10000, 'https://storage.googleapis.com/destimate/wisatas/wisata/image_JQmeLJjwyp_1702353092_1.jpg', 'https://storage.googleapis.com/destimate/wisatas/wisata/image_JQmeLJjwyp_1702353093_2.jpg', 'https://storage.googleapis.com/destimate/wisatas/wisata/image_JQmeLJjwyp_1702353093_3.jpg', 1, '2023-12-12 03:51:32.840', '2023-12-12 03:52:29.927', 'Balige', 'https://maps.app.goo.gl/kTnbAAuH5J3FhVw39', 1, 'Pukul 07.00 - 19.00 WIB', '[\"toilet\", \" banana boat\", \" speed boat\"]', 'PBB', 'https://www.youtube.com/watch?v=wcMeux4lZnc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `cooperation_messages`
--
ALTER TABLE `cooperation_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_promos_kode_voucher` (`kode_voucher`);

--
-- Indexes for table `term_conditions`
--
ALTER TABLE `term_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_users_email` (`email`),
  ADD UNIQUE KEY `idx_users_phone_number` (`phone_number`),
  ADD UNIQUE KEY `idx_users_username` (`username`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD UNIQUE KEY `idx_wisata_kode` (`kode`),
  ADD KEY `fk_wisata_category` (`category_id`),
  ADD KEY `fk_users_wisata` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `cooperation_messages`
--
ALTER TABLE `cooperation_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `term_conditions`
--
ALTER TABLE `term_conditions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wisata`
--
ALTER TABLE `wisata`
  ADD CONSTRAINT `fk_users_wisata` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_wisata_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

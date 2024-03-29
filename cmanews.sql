-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Feb 2024 pada 04.35
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmanews`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `posting_date`, `updated_date`) VALUES
(1, 'Pendidikan', 'Berita tentang pendidikan', 1, '2024-02-11 08:34:46', NULL),
(2, 'Pariwisata', 'Berita tentang pariwisata', 1, '2024-02-11 08:35:11', NULL),
(3, 'Kuliner', 'Berita tentang makanan', 1, '2024-02-20 03:13:43', NULL),
(6, 'Pertambangan', 'Berita tentang tambang', 1, '2024-02-21 03:15:10', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_posts`
--

CREATE TABLE `offline_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `analyze_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `source_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `posted_by` varchar(255) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_posts`
--

INSERT INTO `offline_posts` (`id`, `category_id`, `analyze_id`, `title`, `slug`, `source_id`, `date`, `description`, `view_counter`, `active`, `posted_by`, `last_updated_by`, `posting_date`, `updated_date`) VALUES
(27, 1, 87, 'bupati karanganyar diduga melakukan pelecehan seksual di dalam masjid', 'bupati_karanganyar_diduga_melakukan_pelecehan_seksual_di_dalam_masjid', 1, NULL, '<p>parah sekali</p>', 5, 1, NULL, NULL, '2024-02-12 13:48:16', NULL),
(28, 2, 88, 'kepala desa melakukan korupsi dengan baik', 'kepala_desa_melakukan_korupsi_dengan_baik', 0, NULL, 'alvin baik', 5, 1, NULL, NULL, '2024-02-12 13:53:33', NULL),
(29, 1, 89, 'selasa 2', 'selasa_2', 0, NULL, 'mutiah baik hati', 5, 1, NULL, NULL, '2024-02-13 00:44:22', NULL),
(30, 2, 90, 'kamis', 'kamis', 0, NULL, '<p>berita hari ini cukup menarik</p>', 5, 1, NULL, NULL, '2024-02-15 06:08:53', NULL),
(40, 2, 100, 'sabtu sehat', 'sabtu_sehat', 0, NULL, '<p>sabtu pagi memulai hari dengan jalan sehat</p>', 5, 1, NULL, NULL, '2024-02-17 04:31:22', NULL),
(49, 2, 109, 'sabtu gosip', 'sabtu_gosip', 0, NULL, '<p>menggunjing orang itu sarang dosa</p>', 5, 1, 'admin', NULL, '2024-02-17 08:27:03', NULL),
(51, 2, 111, 'Selasa Kenyang', 'selasa_kenyang', 0, NULL, '', NULL, 0, 'admin', 'admin', '2024-02-20 03:32:13', NULL),
(52, 1, 112, 'Longsor di kabupaten karanganyar', 'longsor_di_kabupaten_karanganyar', 0, NULL, '<p>arus lalu lintas mengalami kemacetan mencapai radius 5km</p>', NULL, 1, 'admin', NULL, '2024-02-20 07:29:38', NULL),
(53, 2, 113, 'Tanah longsor karanganyar', 'tanah_longsor_karanganyar', 0, NULL, '<p><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Orang-orang membawa peti mati saat pemakaman massal korban longsor Masara, di Mawab, Davao de Oro, Filipina, Rabu (14/2/2024).&nbsp;Menurut laporan pemerintah setempat, jumlah korban tewas akibat tanah longsor telah meningkat menjadi 85 orang. Sementara 38 orang lainnya masih hilang.</span><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Baca artikel detiknews, \"Korban Tewas Akibat Tanah Longsor di Filipina Bertambah Jadi 85 Orang\" selengkapnya&nbsp;</span><a href=\"https://news.detik.com/foto-news/d-7194917/korban-tewas-akibat-tanah-longsor-di-filipina-bertambah-jadi-85-orang\" style=\"background: rgb(255, 255, 255); color: rgb(0, 0, 0); transition: color 0.3s ease-in-out 0s, background 0.3s ease-in-out 0s, opacity 0.3s ease-in-out 0s; font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">https://news.detik.com/foto-news/d-7194917/korban-tewas-akibat-tanah-longsor-di-filipina-bertambah-jadi-85-orang</a><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">.</span><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Download Apps Detikcom Sekarang https://apps.detik.com/detik/</span><br></p>', 2, 1, 'admin', NULL, '2024-02-20 07:32:05', NULL),
(54, 2, 114, 'selasa lelah', 'selasa_lelah', 1, NULL, '<p>hari ini sangat melelahkan</p>', 1, 1, 'admin', NULL, '2024-02-20 15:04:42', NULL),
(55, 3, 115, 'Rabu Tulus', 'rabu_tulus', 2, '2024-02-14', '<p>Walau harus menunggu seribu tahun lamanyaaaa</p>', NULL, 1, 'admin', NULL, '2024-02-21 02:13:24', NULL),
(56, 2, 116, 'Astagfirullah banyune mati', 'astagfirullah_banyune_mati', 1, '2024-02-20', '<p>Astagfirullah di kost luthfiah zahra mengalami krisis air bersih 2 hari 2 malam karena saluran air mampet</p>', NULL, 1, 'admin', NULL, '2024-02-21 03:07:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_post_analyze`
--

CREATE TABLE `offline_post_analyze` (
  `id` int(11) NOT NULL,
  `positive` int(11) NOT NULL,
  `negative` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_post_analyze`
--

INSERT INTO `offline_post_analyze` (`id`, `positive`, `negative`, `total`, `result`, `timestamp`) VALUES
(78, 0, 1, 1, 'Negatif', '2024-02-11 12:14:30'),
(79, 1, 2, 2, 'Negatif', '2024-02-11 12:19:32'),
(80, 1, 7, 7, 'Negatif', '2024-02-11 16:14:42'),
(81, 3, 2, 3, 'Positif', '2024-02-11 16:16:21'),
(85, 3, 5, 2, '', '2024-02-12 12:21:22'),
(86, 4, 4, 3, '', '2024-02-12 12:22:11'),
(87, 0, 2, 0, 'Positif', '2024-02-12 13:48:16'),
(88, 2, 2, 3, '', '2024-02-12 13:53:33'),
(89, 2, 0, 5, '', '2024-02-13 00:44:22'),
(90, 2, 2, 3, '', '2024-02-15 06:08:53'),
(91, 4, 1, 4, 'Positif', '2024-02-16 01:48:20'),
(92, 2, 2, 3, '', '2024-02-16 01:58:07'),
(93, 2, 1, 3, '', '2024-02-16 01:59:42'),
(94, 1, 1, 3, '', '2024-02-16 02:03:39'),
(95, 1, 1, 3, '', '2024-02-16 02:05:40'),
(96, 1, 1, 3, '', '2024-02-16 02:11:45'),
(97, 1, 1, 3, '', '2024-02-16 02:15:08'),
(98, 1, 1, 3, '', '2024-02-16 02:15:34'),
(99, 2, 1, 3, '', '2024-02-16 02:16:35'),
(100, 2, 1, 3, '', '2024-02-17 04:31:22'),
(101, 1, 1, 3, '', '2024-02-17 05:26:37'),
(102, 1, 1, 3, '', '2024-02-17 05:27:45'),
(103, 1, 2, 2, 'Negatif', '2024-02-17 05:29:46'),
(104, 1, 2, 2, 'Negatif', '2024-02-17 07:59:13'),
(105, 0, 3, 0, 'Positif', '2024-02-17 08:13:09'),
(106, 0, 3, 0, 'Positif', '2024-02-17 08:13:17'),
(107, 0, 3, 0, 'Positif', '2024-02-17 08:17:55'),
(108, 0, 3, 0, 'Positif', '2024-02-17 08:19:11'),
(109, 0, 3, 0, 'Positif', '2024-02-17 08:27:03'),
(110, 1, 4, 1, 'Positif', '2024-02-20 03:31:16'),
(111, 0, 1, 0, 'Positif', '2024-02-20 03:32:13'),
(112, 0, 3, 0, 'Positif', '2024-02-20 07:29:38'),
(113, 3, 10, 1, '', '2024-02-20 07:32:05'),
(114, 1, 5, 1, 'Positif', '2024-02-20 15:04:42'),
(115, 2, 2, 3, '', '2024-02-21 02:13:24'),
(116, 1, 4, 1, 'Positif', '2024-02-21 03:07:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_post_images`
--

CREATE TABLE `offline_post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_post_images`
--

INSERT INTO `offline_post_images` (`id`, `post_id`, `name`, `serial_number`, `url`, `posting_date`, `updated_date`) VALUES
(37, 27, 'arpit-bansal-bird-4k_01.png', 1, 'postimages/arpit-bansal-bird-4k_01.png', '2024-02-12 13:48:16', NULL),
(38, 27, 'arpit-bansal-bird-4k_03.png', 2, 'postimages/arpit-bansal-bird-4k_03.png', '2024-02-12 13:48:16', NULL),
(39, 27, 'arpit-bansal-bird-4k_05.png', 3, 'postimages/arpit-bansal-bird-4k_05.png', '2024-02-12 13:48:16', NULL),
(40, 27, 'arpit-bansal-bird-4k_07.png', 4, 'postimages/arpit-bansal-bird-4k_07.png', '2024-02-12 13:48:16', NULL),
(41, 28, 'arpit-bansal-bird-4k_14.png', 1, 'postimages/arpit-bansal-bird-4k_14.png', '2024-02-12 13:53:33', NULL),
(42, 29, 'arpit-bansal-bird-4k_01.png', 1, 'postimages/arpit-bansal-bird-4k_01.png', '2024-02-13 00:44:22', NULL),
(43, 30, 'pallete.png', 1, 'postimages/pallete.png', '2024-02-15 06:08:53', NULL),
(44, 40, 'pallete.png', 1, 'postimages/pallete.png', '2024-02-17 04:31:22', NULL),
(45, 49, 'LOGO HMP REMAKE PNG.png', 1, 'postimages/LOGO HMP REMAKE PNG.png', '2024-02-17 08:27:03', NULL),
(49, 51, 'LOGO HMP REMAKE PNG.png', 1, 'postimages/LOGO HMP REMAKE PNG.png', '2024-02-20 03:32:13', NULL),
(50, 52, 'CCI_000002.jpg', 1, 'postimages/CCI_000002.jpg', '2024-02-20 07:29:38', NULL),
(51, 52, 'CCI_000003.jpg', 2, 'postimages/CCI_000003.jpg', '2024-02-20 07:29:38', NULL),
(52, 53, 'CCI_000002.jpg', 1, 'postimages/CCI_000002.jpg', '2024-02-20 07:32:05', NULL),
(53, 53, 'CCI_000003.jpg', 2, 'postimages/CCI_000003.jpg', '2024-02-20 07:32:05', NULL),
(54, 54, 'LOGO HMP REMAKE PNG.png', 1, 'postimages/LOGO HMP REMAKE PNG.png', '2024-02-20 15:04:42', NULL),
(55, 55, '3973985_f669a817-0c2d-4c0c-a3d3-2b5f4a18d7ba_581_581.jpg', 1, 'postimages/3973985_f669a817-0c2d-4c0c-a3d3-2b5f4a18d7ba_581_581.jpg', '2024-02-21 02:13:24', NULL),
(56, 56, 'SNOW_20240126_094627_874.jpg', 1, 'postimages/SNOW_20240126_094627_874.jpg', '2024-02-21 03:07:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_posts`
--

CREATE TABLE `online_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `analyze_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `active` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_posts`
--

INSERT INTO `online_posts` (`id`, `category_id`, `analyze_id`, `link`, `title`, `date`, `description`, `active`, `posting_date`) VALUES
(37, 2, 102, 'https://bisnis.solopos.com/presiden-pastikan-stok-beras-cukup-untuk-ramadan-pemerintah-fokus-distribusi-1864762', 'Presiden Pastikan Stok Beras Cukup untuk Ramadan, Pemerintah Fokus Distribusi - Solopos.com | Panduan Informasi dan Inspirasi', NULL, 'Solopos.com, JAKARTA – Presiden Joko Widodo (Jokowi) memastikan stok beras nasional cukup untuk menghadapi bulan puasa Ramadan, yang diperkirakan berlangsung pada Maret hingga April 2024.\nPernyataan itu, ia sampaikan di sela-sela acara silaturahim dengan para nasabah Program Membina Ekonomi Keluarga Sejahtera (Mekaar) Binaan Permodalan Nasional Madani (PNM), usai meninjau langsung stok beras di Gudang Bulog, Cibitung, Bekasi, Jawa Barat, pada Jumat (16/2/2024).\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \n“Ya kalau stok nggak ada masalah, tadi kita lihat sendiri stoknya melimpah seperti itu,” ujar Jokowi seperti dilansir Antaranews.\nMenurut Presiden, yang menjadi perhatian pemerintah saat ini adalah bagaimana mendistribusikan beras dengan baik dan merata ke pasar, hingga sampai ke tangan masyarakat.\r\n                            \n“Yang paling penting memang bagaimana mendistribusikan secara baik dan sampai ke pasar, sampai ke masyarakat, sampai ke supermarket semuanya bisa tersedia. Itu bukan barang [perkara] mudah ya,” tuturnya.\nMeskipun demikian, Jokowi menyebut upaya menyiapkan stok dan distribusi beras terutama menjelang Ramadan dan Idulfitri, adalah rutinitas yang telah dikerjakan pemerintah setiap tahun—sehingga tidak akan menjadi masalah serius.\nDia pun menegaskan bahwa pemerintah akan menyiapkan stok untuk berbagai jenis beras, mulai dari medium hingga premium. “Ya semua stok kita siapkan,” ujar dia.\nSebelumnya, Presiden menanggapi isu kenaikan harga beras yang disebutnya karena produksi panen beras dari daerah belum masuk ke Pasar Induk Beras Cipinang.\nSelain itu, kenaikan harga beras juga disebabkan distribusi yang terganggu, salah satunya dipengaruhi banjir rob yang melanda kabupaten Demak dan Grobogan di Jawa Tengah.\r\n                            \nBerdasarkan situs resmi Pasar Induk Beras Cipinang, stok beras per 15 Februari 2024 mencapai 33.525 ton dengan harga rata-rata Rp13.815 per kilogram. Sementara itu, Perum Bulog mencatat saat ini stok beras mencapai 1,18 juta ton yang dipastikan aman untuk memenuhi kebutuhan beras nasional hingga April 2024.\nSebelumnya, Badan Pusat Statistik (BPS) menyebutkan nilai impor beras Indonesia pada Januari 2024 mencapai US$279,2 juta atau setara dengan Rp4,36 triliun.\nPlt Kepala BPS Amalia A Widyasanti mengatakan, nilai impor beras Indonesia ini naik sebesar 135,1 persen dibandingkan dengan Januari 2023 yang mencapai US$118,7 juta.\n“Impor beras pada Januari 2024 senilai 279,2 juta dolar AS,” ujar Amalia di Jakarta, Kamis (15/2/2024) seperti dilansir Antaranews.\nNamun demikian, Amalia menyebut, nilai impor ini jika dilihat secara bulanan turun sebesar 16,73 persen. Impor beras Indonesia masih didominasi dari Thailand yakni sebesar US$153 juta, disusul dengan Pakistan sebesar US$79,3 juta, dan Myanmar sebesar US$23,98 juta.\r\n                            \nMenurut Amalia, beras yang diimpor ini tidak langsung di lepas ke pasar, tetapi mengikuti kebijakan yang dibuat oleh Pemerintah. Oleh karena itu, pola impor beras tidak bisa diketahui secara pasti.\nSebelumnya Menteri Koordinator Bidang Perekonomian Airlangga Hartarto mengatakan pemerintah memutuskan untuk mengimpor 1,6 juta ton beras untuk memenuhi kebutuhan domestik akibat mundurnya masa panen selama dua bulan.\nSelain merealisasikan impor, ia menyatakan pemerintah juga meningkatkan distribusi beras Stabilisasi Pasokan dan Harga Pangan (SPHP) dari 150.000 ton menjadi 250.000 ton untuk memenuhi kebutuhan masyarakat.\nUntuk mempermudah distribusi, ia menuturkan bahwa paket beras SPHP dapat dikemas ulang dengan berat yang disesuaikan.\n“Biasanya kan SPHP kiloannya 5 kilogram. Jadi, untuk beberapa wilayah silakan didistribusi dalam kiloan yang lebih besar dan di lapangan diberi kesempatan untuk melakukan pengemasan ulang dari 50 kilo atau 25 kilo menjadi 5 kilo,” ucap Airlangga.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 1, '2024-02-20 02:32:35'),
(38, 1, 103, 'https://bisnis.solopos.com/presiden-pastikan-stok-beras-cukup-untuk-ramadan-pemerintah-fokus-distribusi-1864762', 'Presiden Pastikan Stok Beras Cukup untuk Ramadan, Pemerintah Fokus Distribusi - Solopos.com | Panduan Informasi dan Inspirasi', NULL, 'Solopos.com, JAKARTA – Presiden Joko Widodo (Jokowi) memastikan stok beras nasional cukup untuk menghadapi bulan puasa Ramadan, yang diperkirakan berlangsung pada Maret hingga April 2024.\nPernyataan itu, ia sampaikan di sela-sela acara silaturahim dengan para nasabah Program Membina Ekonomi Keluarga Sejahtera (Mekaar) Binaan Permodalan Nasional Madani (PNM), usai meninjau langsung stok beras di Gudang Bulog, Cibitung, Bekasi, Jawa Barat, pada Jumat (16/2/2024).\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \n“Ya kalau stok nggak ada masalah, tadi kita lihat sendiri stoknya melimpah seperti itu,” ujar Jokowi seperti dilansir Antaranews.\nMenurut Presiden, yang menjadi perhatian pemerintah saat ini adalah bagaimana mendistribusikan beras dengan baik dan merata ke pasar, hingga sampai ke tangan masyarakat.\r\n                            \n“Yang paling penting memang bagaimana mendistribusikan secara baik dan sampai ke pasar, sampai ke masyarakat, sampai ke supermarket semuanya bisa tersedia. Itu bukan barang [perkara] mudah ya,” tuturnya.\nMeskipun demikian, Jokowi menyebut upaya menyiapkan stok dan distribusi beras terutama menjelang Ramadan dan Idulfitri, adalah rutinitas yang telah dikerjakan pemerintah setiap tahun—sehingga tidak akan menjadi masalah serius.\nDia pun menegaskan bahwa pemerintah akan menyiapkan stok untuk berbagai jenis beras, mulai dari medium hingga premium. “Ya semua stok kita siapkan,” ujar dia.\nSebelumnya, Presiden menanggapi isu kenaikan harga beras yang disebutnya karena produksi panen beras dari daerah belum masuk ke Pasar Induk Beras Cipinang.\nSelain itu, kenaikan harga beras juga disebabkan distribusi yang terganggu, salah satunya dipengaruhi banjir rob yang melanda kabupaten Demak dan Grobogan di Jawa Tengah.\r\n                            \nBerdasarkan situs resmi Pasar Induk Beras Cipinang, stok beras per 15 Februari 2024 mencapai 33.525 ton dengan harga rata-rata Rp13.815 per kilogram. Sementara itu, Perum Bulog mencatat saat ini stok beras mencapai 1,18 juta ton yang dipastikan aman untuk memenuhi kebutuhan beras nasional hingga April 2024.\nSebelumnya, Badan Pusat Statistik (BPS) menyebutkan nilai impor beras Indonesia pada Januari 2024 mencapai US$279,2 juta atau setara dengan Rp4,36 triliun.\nPlt Kepala BPS Amalia A Widyasanti mengatakan, nilai impor beras Indonesia ini naik sebesar 135,1 persen dibandingkan dengan Januari 2023 yang mencapai US$118,7 juta.\n“Impor beras pada Januari 2024 senilai 279,2 juta dolar AS,” ujar Amalia di Jakarta, Kamis (15/2/2024) seperti dilansir Antaranews.\nNamun demikian, Amalia menyebut, nilai impor ini jika dilihat secara bulanan turun sebesar 16,73 persen. Impor beras Indonesia masih didominasi dari Thailand yakni sebesar US$153 juta, disusul dengan Pakistan sebesar US$79,3 juta, dan Myanmar sebesar US$23,98 juta.\r\n                            \nMenurut Amalia, beras yang diimpor ini tidak langsung di lepas ke pasar, tetapi mengikuti kebijakan yang dibuat oleh Pemerintah. Oleh karena itu, pola impor beras tidak bisa diketahui secara pasti.\nSebelumnya Menteri Koordinator Bidang Perekonomian Airlangga Hartarto mengatakan pemerintah memutuskan untuk mengimpor 1,6 juta ton beras untuk memenuhi kebutuhan domestik akibat mundurnya masa panen selama dua bulan.\nSelain merealisasikan impor, ia menyatakan pemerintah juga meningkatkan distribusi beras Stabilisasi Pasokan dan Harga Pangan (SPHP) dari 150.000 ton menjadi 250.000 ton untuk memenuhi kebutuhan masyarakat.\nUntuk mempermudah distribusi, ia menuturkan bahwa paket beras SPHP dapat dikemas ulang dengan berat yang disesuaikan.\n“Biasanya kan SPHP kiloannya 5 kilogram. Jadi, untuk beberapa wilayah silakan didistribusi dalam kiloan yang lebih besar dan di lapangan diberi kesempatan untuk melakukan pengemasan ulang dari 50 kilo atau 25 kilo menjadi 5 kilo,” ucap Airlangga.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 1, '2024-02-20 02:32:44'),
(39, 1, 104, 'https://news.detik.com/berita/d-7201484/korupsi-izin-tambang-di-babel-timbulkan-kerugian-lingkungan-rp-271-t', 'Korupsi Izin Tambang di Babel Timbulkan Kerugian Lingkungan Rp 271 T', NULL, 'Kejaksaan Agung (Kejagung) mengusut kasus korupsi tata niaga komoditas timah wilayah Izin Usaha Pertambangan (IUP) PT Timah Tbk tahun 2015-2022. Diketahui kasus tersebut juga turut menyebabkan kerugian lingkungan.\nAhli lingkungan dari Institut Pertanian Bogor (IPB), Bambang Hero Saharjo, memaparkan setidaknya terdapat kerugian kerusakan hutan di Bangka Belitung (Babel) akibat kasus ini mencapai Rp 271.069.688.018.700 atau Rp 271 triliun.\n\"Totalnya kerugian itu yang harus juga ditanggung negara adalah 271.069.687.018.700,\" kata Bambang dalam jumpa pers di Kejagung, Jakarta Selatan, Senin (19/2/2024).\nADVERTISEMENT\r\n\nSCROLL TO CONTINUE WITH CONTENT\r\n\nJumlah itu, kata Bambang, adalah perhitungan kerugian kerusakan lingkungan dalam kawasan hutan dan nonkawasan hutan. Dia merinci perhitungan kerugian dalam kawasan hutan dan nonkawasan hutan.\n\"Di kawasan hutan sendiri kerugian lingkungan ekologisnya itu Rp 157,83 T, ekonomi lingkungannya Rp 60,276 T, pemulihannya itu Rp 5,257 T. Totalnya saja untuk yang di kawasan hutan itu adalah 223.366.246.027.050,\" rincinya.\n\"Dan kemudian yang non kawasan hutan biaya kerugian ekologisnya Rp 25,87 Triliun dan kerugian ekonomi lingkungannya Rp 15,2 T dan biaya pemulihan lingkungan itu adalah Rp 6,629 T. Jadi total untuk untuk yang nonkawasan hutan APL adalah 47,703 triliun,\" tambahnya.\nLebih jauh, Bambang mendata total luas galian terkait kasus PT Timah Tbk di Bangka Belitung sekitar 170.363.064 hektar. Namun, luas galian yang memiliki izin usaha tambang atau IUP hanya 88.900,462 hektare.\n\"Dan dari luasan yang 170 ribu (hektare) ini ternyata yang memiliki IUP itu hanya 88.900,661 hektare, dan yang non-IUP itu 81.462,602 hektare,\" ujar dia.\nAdapun perhitungan itu, lanjutnya, dilakukan merujuk Peraturan Menteri Lingkungan Hidup (Permen LH) Nomor 7 Tahun 2014 tentang Kerugian Lingkungan Hidup Akibat Pencemaran Dan/atau Kerusakan Lingkungan Hidup.\n\"Kami menghitung berdasarkan permen LH Nomor 7 Tahun 2014,\" ujar Bambang.\nPada kesempatan yang sama, Direktur Penyidikan Jaksa Agung Muda Bidang Tindak Pidana Khusus (Dirdik Jampidsus) Kejagung, Kuntadi, mengatakan angka kerugian kerusakan lingkungan hidup ini berbeda dengan kerugian keuangan negara. Dia menuturkan jumlah kerugian negara dalam kasus ini masih dihitung.\n\"Kerugian ini masih akan kita tambah dengan kerugian keuangan negara yang sampai saat ini masih berproses. Berapa hasilnya masih kita tunggu,\" kata Kuntadi.\nDiketahui, total sudah ada 11 tersangka kasus korupsi yang ditahan dalam kasus ini. Satu tersangka terkait dugaan perintangan penyidikan atau obstruction of justice. Berikut rinciannya:\n1. SG alias AW selaku Pengusaha Tambang di Kota Pangkalpinang, Provinsi Kepulauan Bangka Belitung2. MBG selaku Pengusaha Tambang di Kota Pangkalpinang, Provinsi Kepulauan Bangka Belitung3. HT alias ASN selaku Direktur Utama CV VIP (perusahaan milik Tersangka TN alias AN)4. MRPT alias RZ selaku Direktur Utama PT Timah Tbk tahun 2016-2021.5. EE alias EML selaku Direktur Keuangan PT Timah Tbk tahun 2017-2018.6. BY selaku Mantan Komisaris CV VIP7. RI selaku Direktur Utama PT SBS8. TN selaku beneficial ownership CV VIP dan PT MCN9. AA selaku Manajer Operasional tambang CV VIP10. TT, Tersangka perintangan penyidikan perkara11. RL, General Manager PT TIN', 1, '2024-02-20 02:32:49'),
(40, 1, 105, 'https://aceh.tribunnews.com/2023/06/27/pria-ini-bunuh-wanita-teman-kencan-di-karanganyar-pelaku-dibantu-pacar-buang-jasad-korban', 'Pria Ini Bunuh Wanita Teman Kencan di Karanganyar, Pelaku Dibantu Pacar Buang Jasad Korban - Serambinews.com', NULL, 'SERAMBINEWS.COM - Wanita asal Colomadu, Karanganyar berinisial YSA (22) yang ditemukan tewas berselimut daun pisang di Sragen ternyata dibunuh oleh teman kencannya.\nKapolres Sragen AKBP Piter Yanottama mengatakan korban berkenalan dengan pelaku yang berinisial AT (23) dari aplikasi kencan.\nKorban diketahui baru mengenal pelaku selama tiga minggu.\nMereka juga sempat bertemu sebelumnya sebanyak 1 kali.\nPada pertemuan keduanya, YSA ternyata justru dibunuh oleh AT.\n\"Sempat bertemu sekali, hingga kedua kalinya korban dibunuh,\" ujar Piter Yanottama, kepada TribunSolo.com, Selasa (27/6/2023).\nPelaku Ingin Setubuhi YSA\nAwal mula dari pembunuhan itu adalah pelaku AT (23) asal Sumatra Selatan ingin mengajak YSA untuk berhubungan badan. \nModusnya, dia mengajak YSA datang ke rumahnya di kawasan Ngemplak, Boyolali. \nDi rumah tersebut, dia meminta YSA untuk membeli es teh. \nSaat YSA pergi membeli es teh, AT menyiapkan lima jenis obat.\nBegitu kembali, AT meminta YSA untuk membeli es teh lagi.\n\"Sementara YSA pergi membeli es teh yang kedua itu, AT mencampurkan obat racikannya ke es teh yang dibeli pertama,\" kata Kapolres Sragen, AKBP Piter Yanottama. \nSetelah kembali ke rumah, YSA diberi es teh yang sudah dicampur obat, hasilnya korban malah lemas dan pucat. ', 1, '2024-02-20 02:33:37'),
(42, 3, 107, 'https://solo.tribunnews.com/2024/02/20/sosok-rinto-subekti-caleg-dpr-ri-asal-karanganyar-raih-suara-terbanyak-kedua-di-dapil-jateng-iv', 'Sosok Rinto Subekti, Caleg DPR RI Asal Karanganyar, Raih Suara Terbanyak Kedua di Dapil Jateng IV  - Tribunsolo.com', NULL, 'Laporan Wartawan TribunSolo.com, Mardon Widiyanto\nTRIBUNSOLO.COM, KARANGANYAR - Calon Legislatif (Caleg) DPR RI dari daerah pemilihan (Dapil) Jateng IV dari Partai Demokrat, Rinto Subekti memperoleh suara terbanyak kedua setelah Dolfie OFP.\nHingga Selasa (20/2/2024) pukul 09.30 WIB, Rinto mendapat suara  80.185. \nIni di bawah Caleg DPR RI Dolfie OFP dari PDIP yang mendapat suara 83.506. \nKetua DPC Partai Demokrat Tri Haryadi mengatakan, Rinto Subekti berdomisili di Tawangmangu, Karanganyar.\n\"Alamat rumah di KTP beliau dari Dusun Beji, Tawangmangu, Karanganyar,\" ucap Tri Haryadi, Senin (19/2/2024).\nTri Haryadi mengatakan, Rinto Subekti memiliki latar belakang keluarga pengusaha di Jakarta.\nBahkan, orang tua Rinto Subekti, yang bernama almarhum Suparmin memiliki usaha hotel di Solo Raya.\n\"Rinto juga seorang wiraswasta dan cukup dikenal baik oleh masyarakat Karanganyar, dan Wonogiri,\" ucap Tri Haryadi.\nIa mengatakan, Rinto pernah tinggal di Kabupaten Wonogiri.\n Baca juga: Capres Ganjar Dorong Gulirkan Hak Angket ke DPR RI dan Ajak Koalisi Anies Usut Kecurangan Pilpres\nDia menuturkan, Rinto memiliki keluarga di Kabupaten Wonogiri itu.\n\"Selain itu, Rinto juga memiliki pengalaman menjadi anggota DPR RI selama dua periode yaitu periode 2009-2014 dan 2014-2019,\" kata Tri Haryadi.\nIa mengatakan, Rinto pernah menjabat sebagai ketua DPC Partai Demokrat Karanganyar pada tahun 2006-2011 dan 2011-2016.\nPada saat tahun 2009, Rinto mencalonkan diri sebagai Caleg DPR RI dapil Jateng IV dan langsung terpilih sebagai anggota di Pileg tersebut. \n\"Kenapa bisa kenal Wonogiri dan Sragen karena pernah menjabat anggota DPR RI selama dua periode. Sehingga dia juga sudah memahami peta masyarakat di Wonogiri,\" ungkap dia.\nMenurutnya, pada pemilu 2024, Rinto memperoleh suara cukup tinggi karena usaha dan kerja kerasnya secara masif.\nSelama kampanye, pergerakan Rinto juga masif, melakukan pertemuan -pertemuan desa-desa di tiga kabupaten.\n\"Kalau selama menjabat dua periode, 2009-2019 menurut saya dan pengamatan beberapa orang, anggota DPR RI yang berasal dari dapil IV itu hanya pak Rinto yang sering turun ke bawah,\" ucap dia.\n\"Atas pengalaman itu, dia mulai menata jaringan yang lebih baik lagi, dan 2024, all out dan menata jaringan dan bekerjasama secara kolektif kolegial, Solid bersama  para caleg kabupaten maupun provinsi dan struktur partai dan alhamdulillah beliau dapat suara  yang signifikan, yang saya dengar dapil 4 masih yang tertinggi,\" ungkap dia. (*)', 1, '2024-02-20 04:03:24'),
(43, 3, 108, 'https://solo.tribunnews.com/2024/02/20/sosok-rinto-subekti-caleg-dpr-ri-asal-karanganyar-raih-suara-terbanyak-kedua-di-dapil-jateng-iv', 'Sosok Rinto Subekti, Caleg DPR RI Asal Karanganyar, Raih Suara Terbanyak Kedua di Dapil Jateng IV  - Tribunsolo.com', NULL, 'Laporan Wartawan TribunSolo.com, Mardon Widiyanto\nTRIBUNSOLO.COM, KARANGANYAR - Calon Legislatif (Caleg) DPR RI dari daerah pemilihan (Dapil) Jateng IV dari Partai Demokrat, Rinto Subekti memperoleh suara terbanyak kedua setelah Dolfie OFP.\nHingga Selasa (20/2/2024) pukul 09.30 WIB, Rinto mendapat suara  80.185. \nIni di bawah Caleg DPR RI Dolfie OFP dari PDIP yang mendapat suara 83.506. \nKetua DPC Partai Demokrat Tri Haryadi mengatakan, Rinto Subekti berdomisili di Tawangmangu, Karanganyar.\n\"Alamat rumah di KTP beliau dari Dusun Beji, Tawangmangu, Karanganyar,\" ucap Tri Haryadi, Senin (19/2/2024).\nTri Haryadi mengatakan, Rinto Subekti memiliki latar belakang keluarga pengusaha di Jakarta.\nBahkan, orang tua Rinto Subekti, yang bernama almarhum Suparmin memiliki usaha hotel di Solo Raya.\n\"Rinto juga seorang wiraswasta dan cukup dikenal baik oleh masyarakat Karanganyar, dan Wonogiri,\" ucap Tri Haryadi.\nIa mengatakan, Rinto pernah tinggal di Kabupaten Wonogiri.\n Baca juga: Capres Ganjar Dorong Gulirkan Hak Angket ke DPR RI dan Ajak Koalisi Anies Usut Kecurangan Pilpres\nDia menuturkan, Rinto memiliki keluarga di Kabupaten Wonogiri itu.\n\"Selain itu, Rinto juga memiliki pengalaman menjadi anggota DPR RI selama dua periode yaitu periode 2009-2014 dan 2014-2019,\" kata Tri Haryadi.\nIa mengatakan, Rinto pernah menjabat sebagai ketua DPC Partai Demokrat Karanganyar pada tahun 2006-2011 dan 2011-2016.\nPada saat tahun 2009, Rinto mencalonkan diri sebagai Caleg DPR RI dapil Jateng IV dan langsung terpilih sebagai anggota di Pileg tersebut. \n\"Kenapa bisa kenal Wonogiri dan Sragen karena pernah menjabat anggota DPR RI selama dua periode. Sehingga dia juga sudah memahami peta masyarakat di Wonogiri,\" ungkap dia.\nMenurutnya, pada pemilu 2024, Rinto memperoleh suara cukup tinggi karena usaha dan kerja kerasnya secara masif.\nSelama kampanye, pergerakan Rinto juga masif, melakukan pertemuan -pertemuan desa-desa di tiga kabupaten.\n\"Kalau selama menjabat dua periode, 2009-2019 menurut saya dan pengamatan beberapa orang, anggota DPR RI yang berasal dari dapil IV itu hanya pak Rinto yang sering turun ke bawah,\" ucap dia.\n\"Atas pengalaman itu, dia mulai menata jaringan yang lebih baik lagi, dan 2024, all out dan menata jaringan dan bekerjasama secara kolektif kolegial, Solid bersama  para caleg kabupaten maupun provinsi dan struktur partai dan alhamdulillah beliau dapat suara  yang signifikan, yang saya dengar dapil 4 masih yang tertinggi,\" ungkap dia. (*)', 0, '2024-02-20 07:08:46'),
(45, 1, 112, 'https://solo.tribunnews.com/2024/02/20/sosok-rinto-subekti-caleg-dpr-ri-asal-karanganyar-raih-suara-terbanyak-kedua-di-dapil-jateng-iv', 'Sosok Rinto Subekti, Caleg DPR RI Asal Karanganyar, Raih Suara Terbanyak Kedua di Dapil Jateng IV  - Tribunsolo.com', NULL, 'Laporan Wartawan TribunSolo.com, Mardon Widiyanto\nTRIBUNSOLO.COM, KARANGANYAR - Calon Legislatif (Caleg) DPR RI dari daerah pemilihan (Dapil) Jateng IV dari Partai Demokrat, Rinto Subekti memperoleh suara terbanyak kedua setelah Dolfie OFP.\nHingga Selasa (20/2/2024) pukul 09.30 WIB, Rinto mendapat suara  80.185. \nIni di bawah Caleg DPR RI Dolfie OFP dari PDIP yang mendapat suara 83.506. \nKetua DPC Partai Demokrat Tri Haryadi mengatakan, Rinto Subekti berdomisili di Tawangmangu, Karanganyar.\n\"Alamat rumah di KTP beliau dari Dusun Beji, Tawangmangu, Karanganyar,\" ucap Tri Haryadi, Senin (19/2/2024).\nTri Haryadi mengatakan, Rinto Subekti memiliki latar belakang keluarga pengusaha di Jakarta.\nBahkan, orang tua Rinto Subekti, yang bernama almarhum Suparmin memiliki usaha hotel di Solo Raya.\n\"Rinto juga seorang wiraswasta dan cukup dikenal baik oleh masyarakat Karanganyar, dan Wonogiri,\" ucap Tri Haryadi.\nIa mengatakan, Rinto pernah tinggal di Kabupaten Wonogiri.\n Baca juga: Capres Ganjar Dorong Gulirkan Hak Angket ke DPR RI dan Ajak Koalisi Anies Usut Kecurangan Pilpres\nDia menuturkan, Rinto memiliki keluarga di Kabupaten Wonogiri itu.\n\"Selain itu, Rinto juga memiliki pengalaman menjadi anggota DPR RI selama dua periode yaitu periode 2009-2014 dan 2014-2019,\" kata Tri Haryadi.\nIa mengatakan, Rinto pernah menjabat sebagai ketua DPC Partai Demokrat Karanganyar pada tahun 2006-2011 dan 2011-2016.\nPada saat tahun 2009, Rinto mencalonkan diri sebagai Caleg DPR RI dapil Jateng IV dan langsung terpilih sebagai anggota di Pileg tersebut. \n\"Kenapa bisa kenal Wonogiri dan Sragen karena pernah menjabat anggota DPR RI selama dua periode. Sehingga dia juga sudah memahami peta masyarakat di Wonogiri,\" ungkap dia.\nMenurutnya, pada pemilu 2024, Rinto memperoleh suara cukup tinggi karena usaha dan kerja kerasnya secara masif.\nSelama kampanye, pergerakan Rinto juga masif, melakukan pertemuan -pertemuan desa-desa di tiga kabupaten.\n\"Kalau selama menjabat dua periode, 2009-2019 menurut saya dan pengamatan beberapa orang, anggota DPR RI yang berasal dari dapil IV itu hanya pak Rinto yang sering turun ke bawah,\" ucap dia.\n\"Atas pengalaman itu, dia mulai menata jaringan yang lebih baik lagi, dan 2024, all out dan menata jaringan dan bekerjasama secara kolektif kolegial, Solid bersama  para caleg kabupaten maupun provinsi dan struktur partai dan alhamdulillah beliau dapat suara  yang signifikan, yang saya dengar dapil 4 masih yang tertinggi,\" ungkap dia. (*)', 1, '2024-02-20 13:46:02'),
(46, 3, 113, 'https://solo.tribunnews.com/2024/02/20/eks-kades-gedongan-karanganyar-ditetapkan-tersangka-korupsi-salah-gunakan-fungsi-tanah-bengkok', 'Eks Kades Gedongan Karanganyar Ditetapkan Tersangka Korupsi, Salah Gunakan Fungsi Tanah Bengkok - Tribunsolo.com', NULL, 'Laporan Wartawan TribunSolo.com, Mardon Widiyanto\nTRIBUNSOLO.COM, KARANGANYAR - Mantan Kades Gedongan Tri Wiyono resmi ditetapkan menjadi tersangka atas tindak pidana korupsi oleh Kejaksaan Negeri (Kejari) Karanganyar, Senin (19/2/2024).\nMantan kades tersebut ditetapkan sebagai tersangka karena menyalahgunakan wewenangnya saat menjadi Kades Gedongan.\nKasi Pidana Khusus (Pidsus) Kejari Karanganyar Sutanto membenarkan kabar tersebut.\n\"Mantan kades Gedongan, resmi kami tetapkan menjadi tersangka atas kasus tindak pidana korupsi,\" kata Sutanto, Senin (29/2/2024).\nSutanto mengatakan, mantan Kades Gedongan ini akan dijerat dengan pasal 2 dan 3 Undang-undang No. 31 Tahun 1999 sebagaimana diubah dengan Undang-undang No. 20 Tahun 2001, tentang Tindak Pidana Korupsi (Tipikor).\n Baca juga: Pj Kades Gedongan Meninggal Saat Senam Bareng Warga, Sempat Dirujuk ke RSUD dr Karyadi Semarang\nSebagai informasi, Pasal 2 ayat (1) UU Tipikor menyebutkan setiap orang yang secara melawan hukum melakukan perbuatan memperkaya  diri sendiri atau orang lain atau suatu korporasi yang dapat merugikan keuangan negara atau perekonomian negara dipidana dengan pidana penjara  minimal 4 tahun dan maksimal 20 tahun dan denda paling sedikit 200 juta rupiah  dan paling banyak 1 miliar rupiah.\nLebih lanjut, Pasal 3 menyebutkan setiap orang yang dengan tujuan menguntungkan diri sendiri atau  orang lain atau suatu korporasi, menyalahgunakan kewenangan, kesempatan atau sarana yang ada padanya karena jabatan atau karena kedudukan yang dapat merugikan keuangan negara atau perekonomian negara dipidana seumur hidup, atau pidana penjara paling singkat 1 tahun dan paling lama 20 tahun dan atau denda paling sedikit  50 juta rupiah dan maksimal 1 miliar.\n\"Mantan Kades Gedongan menyalagunakan lahan bengkok untuk mendirikan bangunan, salah satunya berdirinya kafe black orion,\" ucap dia. (*)', 1, '2024-02-20 13:47:45'),
(47, 2, 114, 'https://soloraya.solopos.com/cek-jadwal-dan-lokasi-samsat-keliling-karanganyar-hari-ini-21-februari-2024-1867658', 'Cek Jadwal dan Lokasi Samsat Keliling Karanganyar Hari Ini 21 Februari 2024 - Solopos.com | Panduan Informasi dan Inspirasi', '0000-00-00', 'Solopos.com, KARANGANYAR — Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.\nBerikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Rabu (21/2/2024), yang dikutip Solopos.com dari akun Instagram @samsat_karanganyar:\r\n                                                                                            \nAnda juga bisa membayar pajak kendaraan bermotor di Kantor Samsat yang beralamat di Jl. Lawu No. 389 Kelurahan Cangakan, Kecamatan Karanganyar, Kabupaten Karanganyar dengan nomor telepon 0271-495186. Atau anda bisa mengaksesnya secara online di bapenda.jatengprov.go.id.\r\n                            \nDemikian informasi jadwal Samsat Keliling Karanganyar hari ini, semoga bermanfaat.', 1, '2024-02-21 02:19:20'),
(48, 1, 115, 'https://soloraya.solopos.com/cek-jadwal-dan-lokasi-samsat-keliling-karanganyar-hari-ini-21-februari-2024-1867658', 'Cek Jadwal dan Lokasi Samsat Keliling Karanganyar Hari Ini 21 Februari 2024 - Solopos.com | Panduan Informasi dan Inspirasi', '0000-00-00', 'Solopos.com, KARANGANYAR — Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.\nBerikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Rabu (21/2/2024), yang dikutip Solopos.com dari akun Instagram @samsat_karanganyar:\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \nAnda juga bisa membayar pajak kendaraan bermotor di Kantor Samsat yang beralamat di Jl. Lawu No. 389 Kelurahan Cangakan, Kecamatan Karanganyar, Kabupaten Karanganyar dengan nomor telepon 0271-495186. Atau anda bisa mengaksesnya secara online di bapenda.jatengprov.go.id.\r\n                            \nDemikian informasi jadwal Samsat Keliling Karanganyar hari ini, semoga bermanfaat.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 0, '2024-02-21 03:11:00'),
(49, 1, 116, 'https://soloraya.solopos.com/cek-jadwal-dan-lokasi-samsat-keliling-karanganyar-hari-ini-21-februari-2024-1867658', 'Cek Jadwal dan Lokasi Samsat Keliling Karanganyar Hari Ini 21 Februari 2024 - Solopos.com | Panduan Informasi dan Inspirasi', '0000-00-00', 'Solopos.com, KARANGANYAR — Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.\nBerikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Rabu (21/2/2024), yang dikutip Solopos.com dari akun Instagram @samsat_karanganyar:\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \nAnda juga bisa membayar pajak kendaraan bermotor di Kantor Samsat yang beralamat di Jl. Lawu No. 389 Kelurahan Cangakan, Kecamatan Karanganyar, Kabupaten Karanganyar dengan nomor telepon 0271-495186. Atau anda bisa mengaksesnya secara online di bapenda.jatengprov.go.id.\r\n                            \nDemikian informasi jadwal Samsat Keliling Karanganyar hari ini, semoga bermanfaat.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 1, '2024-02-21 02:30:52'),
(50, 2, 117, 'https://soloraya.solopos.com/cek-jadwal-dan-lokasi-samsat-keliling-karanganyar-hari-ini-21-februari-2024-1867658', 'Cek Jadwal dan Lokasi Samsat Keliling Karanganyar Hari Ini 21 Februari 2024 - Solopos.com | Panduan Informasi dan Inspirasi', '2024-02-08', 'Solopos.com, KARANGANYAR — Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.\nBerikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Rabu (21/2/2024), yang dikutip Solopos.com dari akun Instagram @samsat_karanganyar:\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \nAnda juga bisa membayar pajak kendaraan bermotor di Kantor Samsat yang beralamat di Jl. Lawu No. 389 Kelurahan Cangakan, Kecamatan Karanganyar, Kabupaten Karanganyar dengan nomor telepon 0271-495186. Atau anda bisa mengaksesnya secara online di bapenda.jatengprov.go.id.\r\n                            \nDemikian informasi jadwal Samsat Keliling Karanganyar hari ini, semoga bermanfaat.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 1, '2024-02-21 03:11:19'),
(51, 2, 118, 'https://soloraya.solopos.com/cek-jadwal-dan-lokasi-samsat-keliling-karanganyar-hari-ini-21-februari-2024-1867658', 'Cek Jadwal dan Lokasi Samsat Keliling Karanganyar Hari Ini 21 Februari 2024 - Solopos.com | Panduan Informasi dan Inspirasi', '2024-02-08', 'Solopos.com, KARANGANYAR — Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.\nBerikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Rabu (21/2/2024), yang dikutip Solopos.com dari akun Instagram @samsat_karanganyar:\r\n                                                                                            \nPromosi\r\n                                    Tokopedia Jadi e-Commerce Terbaik, Raih Penghargaan BI Awards 2023\r\n                                \r\n                                \nAnda juga bisa membayar pajak kendaraan bermotor di Kantor Samsat yang beralamat di Jl. Lawu No. 389 Kelurahan Cangakan, Kecamatan Karanganyar, Kabupaten Karanganyar dengan nomor telepon 0271-495186. Atau anda bisa mengaksesnya secara online di bapenda.jatengprov.go.id.\r\n                            \nDemikian informasi jadwal Samsat Keliling Karanganyar hari ini, semoga bermanfaat.\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 1, '2024-02-21 02:35:08'),
(52, 2, 119, 'https://soloraya.solopos.com/konser-pesta-rakyat-gibran-fans-di-karanganyar-meriah-1839814', 'Konser Pesta Rakyat Gibran Fans di Karanganyar Meriah - Solopos.com | Panduan Informasi dan Inspirasi', '2024-01-13', 'Solopos.com, KARANGANYAR–Konser Pesta Rakyat Ayo Joget Bareng Gibran Fans yang dihelat di lapangan Alun-alun Karanganyar, pecah pada Jumat (12/1/2024) malam.\nSeribuan masyarakat tumplek blek menyaksikan penampilan artis lokal Lala Atila, Difarina Indra, Vivi Violetha, Bakar Musik dan Romansa yang tampil dalam konser musik tersebut.\r\n                                                                                            \nAcara yang bisa disaksikan gratis ini batal dihadiri Ibu Negara Iriana Joko Widodo (Jokowi) yang juga ibunda Gibran Rakabuming Raka, dan Ketua Umum Partai Solidaritas Indonesia (PSI) Kaesang Pangarep. Keduanya tak hadir hingga acara tersebut berakhir pukul 22.00 WIB.\nBerdasarkan pantauan Solopos.com, konser berlangsung sejak pukul 15.00 WIB sampai dengan 22.00 WIB. Di tengah penyelenggaraan, konser sempat dihentikan sejenak mulai pukul 18.00 WIB sampai dengan 19.00 WIB untuk waktu isoma. Penyanyi tampil mulai Jumat malam dan berakhir pada pukul 22.00 WIB.\r\n                            \nKetua Gibran Fans Riadhus Surya Setiabudi mengatakan Pesta Rakyat Ayo Joget Bareng Gibran Fans merupakan inisiasi dari para sukarelawan pendukung Gibran yang mengatasnamakan Gibran Fans.\nKegiatan ini sebagai media menyosialisasikan program kerja dari pasangan calon (paslon) nomor dua, Prabowo Subianto dan Gibran Rakabuming Raka.\nDia menilai antusiasme masyarakat hadir di konser pesta rakyat ini cukup tinggi. Bahkan, sesekali para penonton ikut menyanyikan lagu hingga berjoget. Di pengujung acara, dia mengatakan konser berlangsung tertib dan aman.\nSekretaris Jenderal Gibran Fans, Dicky Derek Loupatty mengatakan konser musik ini merupakan persembahan untuk Ibu Negara Iriana Jokowi. Menurutnya Gibran Fans yang terbentuk pada Oktober 2023, terinspirasi oleh Ibu Iriana.\n“Beliau yang melahirkan serta membesarkan mas Gibran yang saat ini tokoh nasional usia milenial,” katanya.\r\n                            \nDia mengaku tidak mengetahui penyebab Ibu Iriana batal menghadiri acara tersebut. “Kami hanya memberikan undangan saja,” katanya.\nMenurutnya, konser ini merupakan salah satu bentuk memeriahkan pesta demokrasi untuk mendukung pasangan Prabowo-Gibran di kontestasi Pemilu 2024 mendatang.\nPihaknya optimistis dan yakin bahwa apa yang dilakukan saat ini adalah bagian dari kegiatan pesta demokrasi. Saat disinggung target kemengan Prabowo-Gibran, dia mengatakan, relawan Gibran Fans siap ikut andil memenangkan capres dan cawapres nomer 2 dalam 1 putaran dengan capaian suara 50+1 persen.\n“Target kemenangan kita adalah, 50+ 1 persen. Jadi kami dari Gibran Fans, hanya mampu menambahkan presentasi kemenangan, dan kami yakin, satu putaran akan terjadi pada pemilu tanggal 14 Februari 2024,” ujarnya.', 1, '2024-02-21 03:10:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_post_analyze`
--

CREATE TABLE `online_post_analyze` (
  `id` int(11) NOT NULL,
  `positive` int(11) NOT NULL,
  `negative` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_post_analyze`
--

INSERT INTO `online_post_analyze` (`id`, `positive`, `negative`, `total`, `result`, `timestamp`) VALUES
(94, 19, 22, 2, '', '2024-02-19 12:43:58'),
(95, 19, 22, 2, '', '2024-02-19 12:47:47'),
(96, 19, 22, 2, '', '2024-02-19 12:50:13'),
(97, 19, 22, 2, '', '2024-02-19 12:50:25'),
(98, 19, 22, 2, '', '2024-02-19 12:51:25'),
(99, 19, 22, 2, '', '2024-02-19 12:52:54'),
(100, 19, 22, 2, '', '2024-02-19 13:05:39'),
(101, 56, 42, 3, '', '2024-02-19 13:06:27'),
(102, 56, 42, 3, '', '2024-02-19 13:18:54'),
(103, 56, 42, 3, '', '2024-02-19 14:15:07'),
(104, 15, 26, 2, '', '2024-02-19 14:33:30'),
(105, 6, 15, 1, '', '2024-02-20 00:43:38'),
(106, 20, 13, 3, '', '2024-02-20 02:16:24'),
(107, 18, 24, 2, '', '2024-02-20 03:41:35'),
(108, 18, 24, 2, '', '2024-02-20 03:46:22'),
(109, 18, 24, 2, '', '2024-02-20 03:48:04'),
(110, 76, 110, 2, '', '2024-02-20 07:06:15'),
(111, 76, 110, 2, '', '2024-02-20 07:07:55'),
(112, 18, 24, 2, '', '2024-02-20 13:46:02'),
(113, 15, 34, 2, '', '2024-02-20 13:47:45'),
(114, 12, 5, 4, '', '2024-02-21 02:19:20'),
(115, 23, 8, 4, '', '2024-02-21 02:25:18'),
(116, 23, 8, 4, '', '2024-02-21 02:30:52'),
(117, 23, 8, 4, '', '2024-02-21 02:33:49'),
(118, 23, 8, 4, '', '2024-02-21 02:35:08'),
(119, 35, 27, 3, '', '2024-02-21 03:10:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_post_images`
--

CREATE TABLE `online_post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_post_images`
--

INSERT INTO `online_post_images` (`id`, `post_id`, `name`, `serial_number`, `url`, `posting_date`, `updated_date`) VALUES
(47, 38, 'adhi.jpg', 1, 'postimages/adhi.jpg', '2024-02-19 14:15:07', NULL),
(48, 38, 'backButton.png', 2, 'postimages/backButton.png', '2024-02-19 14:15:07', NULL),
(49, 39, 'WIN_20240129_15_09_56_Pro.jpg', 1, 'postimages/WIN_20240129_15_09_56_Pro.jpg', '2024-02-19 14:33:30', NULL),
(50, 40, 'WIN_20240129_15_09_55_Pro.jpg', 1, 'postimages/WIN_20240129_15_09_55_Pro.jpg', '2024-02-20 00:43:38', NULL),
(51, 41, 'gibran-rakabuming-raka-saat-menghadiri-konser-rakyat.jpg', 1, 'postimages/gibran-rakabuming-raka-saat-menghadiri-konser-rakyat.jpg', '2024-02-20 02:16:24', NULL),
(52, 42, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:41:35', NULL),
(53, 43, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:46:22', NULL),
(54, 44, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:48:04', NULL),
(55, 45, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 13:46:02', NULL),
(56, 46, 'Ilustrasi-korupsi-suap.jpg', 1, 'postimages/Ilustrasi-korupsi-suap.jpg', '2024-02-20 13:47:45', NULL),
(57, 47, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:19:20', NULL),
(58, 48, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:25:18', NULL),
(59, 49, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:30:52', NULL),
(60, 50, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:33:49', NULL),
(61, 51, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:35:08', NULL),
(62, 52, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 03:10:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sources`
--

CREATE TABLE `sources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sources`
--

INSERT INTO `sources` (`id`, `name`, `description`, `active`, `posting_date`, `updated_date`) VALUES
(1, 'karanganyar.com', 'Berita tentang politik di Karanganyar', 1, '2024-02-20 14:19:55', NULL),
(2, 'solopos.com', 'Berita tentang Surakarta dan sekitarnya', 1, '2024-02-20 14:20:17', NULL),
(5, 'liputan6.com', 'Berita nasional', 1, '2024-02-21 03:15:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 'phpgurukulofficial@gmail.com', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 'Pendidikan', 'Berita tentang pendidikan', '2024-02-01 02:51:31', '2024-02-01 03:51:44', 1),
(2, 'Pariwisata', 'Berita tentang pariwisata', '2024-02-01 02:52:09', NULL, 1),
(3, 'Kuliner', 'Berita tentang makanan', '2024-02-16 01:46:49', NULL, 1),
(4, 'Industri', 'berita mengenai industri di kabupaten karanganyar', '2024-02-17 04:34:36', '2024-02-17 04:54:49', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblposts_offline`
--

CREATE TABLE `tblposts_offline` (
  `id` int(11) NOT NULL,
  `id_analyze` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostAnalyze` varchar(255) NOT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`analyze_id`),
  ADD KEY `analyze_id` (`analyze_id`);

--
-- Indeks untuk tabel `offline_post_analyze`
--
ALTER TABLE `offline_post_analyze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeks untuk tabel `online_posts`
--
ALTER TABLE `online_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`analyze_id`);

--
-- Indeks untuk tabel `online_post_analyze`
--
ALTER TABLE `online_post_analyze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `online_post_images`
--
ALTER TABLE `online_post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeks untuk tabel `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indeks untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `subadmin` (`postedBy`),
  ADD KEY `id_analyze` (`id_analyze`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `offline_post_analyze`
--
ALTER TABLE `offline_post_analyze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `online_posts`
--
ALTER TABLE `online_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `online_post_analyze`
--
ALTER TABLE `online_post_analyze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `online_post_images`
--
ALTER TABLE `online_post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  ADD CONSTRAINT `offline_posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_posts_ibfk_2` FOREIGN KEY (`analyze_id`) REFERENCES `offline_post_analyze` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  ADD CONSTRAINT `offline_post_images_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `offline_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblposts_offline_ibfk_1` FOREIGN KEY (`id_analyze`) REFERENCES `offline_post_analyze` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

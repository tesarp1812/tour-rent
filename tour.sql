-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jul 2024 pada 14.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tour`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `konten` varchar(500) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id`, `nama`, `konten`, `gambar`) VALUES
(20, 'Mbolata', '', 'hotel.png'),
(21, 'Wolobobo', '', 'wolobobo-hill.png'),
(22, 'Pulau komodo', '', 'komodo island.png'),
(24, 'Air Panas So,a', '', 'pemandia-air-panas-soa-menggeruda.png'),
(25, 'belaraghi village', '', 'bena.png'),
(26, 'Tololela village', '', 'tololela.png'),
(27, 'Waebela Village', '', 'waebela village.png'),
(28, 'Pink Beach', '', 'pink beach.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `user_admin` varchar(20) NOT NULL,
  `pass_admin` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `foto`, `user_admin`, `pass_admin`, `level`, `nama`) VALUES
(4, '_20160421_074522.JPG', 'admin', 'admin', '1', 'admin'),
(6, 'Bajawa.jpg', 'operator', 'operator', '2', 'operator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bukti`
--

CREATE TABLE `tbl_bukti` (
  `id_bukti` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_bukti`
--

INSERT INTO `tbl_bukti` (`id_bukti`, `id_pesan`, `file`) VALUES
(36, 48, 'WIN_20240515_19_41_01_Pro.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_daerah`
--

CREATE TABLE `tbl_daerah` (
  `id_provinsi` int(11) NOT NULL,
  `id_daerah` int(11) NOT NULL,
  `nama_daerah` varchar(35) NOT NULL,
  `biaya` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_daerah`
--

INSERT INTO `tbl_daerah` (`id_provinsi`, `id_daerah`, `nama_daerah`, `biaya`) VALUES
(7, 1, 'Bajawa', 100000),
(7, 2, 'Maggarai', 200000),
(7, 3, 'Nagekeo', 200000),
(7, 4, 'Ende', 250000),
(7, 5, 'Larantuka', 300000),
(7, 6, 'BRV Office', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_hotel`
--

CREATE TABLE `tbl_hotel` (
  `id_hotel` int(11) NOT NULL,
  `hotel` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `ket_hotel` text NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`id_hotel`, `hotel`, `harga`, `ket_hotel`, `foto`) VALUES
(1, 'Hotel Flaminggo Avia', 750000, '<p><strong>- Hotel Flaminggo Avia Labuan Bajo<br />Dirancang</strong>&nbsp;<em>untuk</em>&nbsp;wisata dan bisnis, Flaminggo Avia Hotel terletak strategis di Labuan Bajo; salah satu daerah lokal terkenal. Hotel ini tidak terlalu jauh dari pusat kota, hanya dari sini dan umumnya hanya membutuhkan waktu 90 menit untuk mencapai bandara. Dengan lokasinya yang strategis, hotel ini menawarkan akses mudah ke destinasi yang wajib dilihat di kota ini.</p>\r\n<p>Fasilitas dan pelayanan yang ditawarkan Flaminggo Avia Hotel menjaminkan penginapan menyenangkan bagi para tamu. Ketika menginap di properti yang luar biasa ini, para tamu dapat menikmati wi-fi di tempat-tempat umum, ruang merokok , concierge, layanan laundry, tur.</p>\r\n<p>Flaminggo Avia Hotel memiliki 22 kamar tidur yang semuanya dirancang dengan citarasa tinggi untuk menyediakan kenyamanan seperti televisi, meja tulis, internet (wireless), AC, kulkas. Hotel ini menyediakan sejumlah fasilitas rekreasi seperti kolam (anak), taman, lapangan tenis, klub anak. Fasilitas super dan lokasi yang cemerlang menjadikan Flaminggo Avia Hotel tempat yang sempurna untuk menikmati penginapan Anda selama di Labuan Bajo.</p>\r\n<h3>Kebijakan Hotel</h3>\r\n<ul>\r\n<li>Minimum umur tamu adalah: 1 tahun</li>\r\n<li>Tamu berumur diatas 7 tahun dianggap sebagai tamu dewasa</li>\r\n<li>Ekstra bed tergantung pada kamar yang Anda pilih, silahkan cek kebijakan setiap kamar untuk detil lebih lanjut</li>\r\n</ul>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Bayi 1 tahun</td>\r\n<td>Menginap gratis dengan menggunakan tempat tidur yang tersedia. Catatan, biaya tambahan kemungkinan dikenakan jika Anda membutuhkan ranjang bayi</td>\r\n</tr>\r\n<tr>\r\n<td>Anak-anak 2-7 tahun</td>\r\n<td>Harus menggunakan ekstra bed</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3>Fasilitas Hotel</h3>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Fasilitas</td>\r\n<td>coffee shop, concierge, fasilitas rapat,layanan kamar, layanan kamar 24 jam, layanan laundry, restoran, ruang keluarga, ruang merokok, wi-fi di tempat-tempat umum, Wi-Fi gratis di semua kamar</td>\r\n</tr>\r\n<tr>\r\n<td>Olahraga dan Rekreasi</td>\r\n<td>klub anak, kolam (anak), lapangan tenis, taman</td>\r\n</tr>\r\n<tr>\r\n<td>Internet dalam Kamar</td>\r\n<td>Akses WiFi gratis</td>\r\n</tr>\r\n<tr>\r\n<td>Parkir</td>\r\n<td>tempat parkir mobil</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Flamingo-Avia-Labuan-Bajo.jpg'),
(2, 'Hotel Manulalu Junggle', 247000, '<p><strong>- Hotel Manulalu Jungle</strong><br />Dirancang untuk wisata dan bisnis, Manulalu Junggle Hotel terletak strategis di Bajawa; salah satu daerah lokal terkenal. Hotel ini tidak terlalu jauh dari pusat kota, hanya dari sini dan umumnya hanya membutuhkan waktu 90 menit . Dengan lokasinya yang strategis, hotel ini menawarkan akses mudah ke destinasi yang wajib dilihat di kota ini.</p>\r\n<p>Fasilitas dan pelayanan yang ditawarkan Manulalu Junggle Hotel menjaminkan penginapan menyenangkan bagi para tamu. Ketika menginap di properti yang luar biasa ini, para tamu dapat menikmati wi-fi di tempat-tempat umum, ruang merokok , concierge, layanan laundry, tur.</p>\r\n<p>Manulalu Junggle Hotel memiliki 22 kamar tidur yang semuanya dirancang dengan citarasa tinggi untuk menyediakan kenyamanan seperti televisi, meja tulis, internet (wireless), AC, kulkas. Hotel ini menyediakan sejumlah fasilitas rekreasi seperti kolam (anak), taman, lapangan tenis, klub anak. Fasilitas super dan lokasi yang cemerlang menjadikan Campago Resort Hotel tempat yang sempurna untuk menikmati penginapan Anda selama di Bajawa.</p>\r\n<h3>Kebijakan Hotel</h3>\r\n<ul>\r\n<li>Minimum umur tamu adalah: 1 tahun</li>\r\n<li>Tamu berumur diatas 7 tahun dianggap sebagai tamu dewasa</li>\r\n<li>Ekstra bed tergantung pada kamar yang Anda pilih, silahkan cek kebijakan setiap kamar untuk detil lebih lanjut</li>\r\n</ul>\r\n<h3>Fasilitas Hotel</h3>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Fasilitas</td>\r\n<td>coffee shop, concierge, fasilitas rapat,layanan kamar, layanan kamar 24 jam, layanan laundry, restoran, ruang keluarga, ruang merokok, wi-fi di tempat-tempat umum, Wi-Fi gratis di semua kamar</td>\r\n</tr>\r\n<tr>\r\n<td>Olahraga dan Rekreasi</td>\r\n<td>klub anak, kolam (anak), lapangan tenis, taman</td>\r\n</tr>\r\n<tr>\r\n<td>Internet dalam Kamar</td>\r\n<td>Akses WiFi gratis</td>\r\n</tr>\r\n<tr>\r\n<td>Parkir</td>\r\n<td>tempat parkir mobil</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Manulalu-Jungle.jpg'),
(3, 'Hotel Bintang Wisata Riung', 247000, '<p><strong>- Hotel&nbsp;Bintang Wisata Riung</strong></p>\r\n<p>Dirancang untuk wisata plesir dan bisnis, Bintang Wisata Riung Hotel terletak strategis di Riung; salah satu daerah lokal terkenal. Hotel ini tidak terlalu jauh dari pusat kota, hanya dari sini dan umumnya hanya membutuhkan waktu 90 menit untuk mencapai bandara. Dengan lokasinya yang strategis, hotel ini menawarkan akses mudah ke destinasi yang wajib dilihat di kota ini.</p>\r\n<p>Fasilitas dan pelayanan yang ditawarkan Bintang Wisata Riung Hotel menjaminkan penginapan menyenangkan bagi para tamu. Ketika menginap di properti yang luar biasa ini, para tamu dapat menikmati wi-fi di tempat-tempat umum, ruang merokok , concierge, layanan laundry, tur.</p>\r\n<p>Bintang Wisata Riung Hotel memiliki 22 kamar tidur yang semuanya dirancang dengan citarasa tinggi untuk menyediakan kenyamanan seperti televisi, meja tulis, internet (wireless), AC, kulkas. Hotel ini menyediakan sejumlah fasilitas rekreasi seperti kolam (anak), taman, lapangan tenis, klub anak. Fasilitas super dan lokasi yang cemerlang menjadikan Campago Resort Hotel tempat yang sempurna untuk menikmati penginapan Anda selama di Bukittinggi.</p>\r\n<h3>Kebijakan Hotel</h3>\r\n<ul>\r\n<li>Minimum umur tamu adalah: 1 tahun</li>\r\n<li>Tamu berumur diatas 7 tahun dianggap sebagai tamu dewasa</li>\r\n<li>Ekstra bed tergantung pada kamar yang Anda pilih, silahkan cek kebijakan setiap kamar untuk detil lebih lanjut</li>\r\n</ul>\r\n<h3>Fasilitas Hotel</h3>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Fasilitas</td>\r\n<td>coffee shop, concierge, fasilitas rapat,layanan kamar, layanan kamar 24 jam, layanan laundry, restoran, ruang keluarga, ruang merokok, wi-fi di tempat-tempat umum, Wi-Fi gratis di semua kamar</td>\r\n</tr>\r\n<tr>\r\n<td>Olahraga dan Rekreasi</td>\r\n<td>klub anak, kolam (anak), lapangan tenis, taman</td>\r\n</tr>\r\n<tr>\r\n<td>Internet dalam Kamar</td>\r\n<td>Akses WiFi gratis</td>\r\n</tr>\r\n<tr>\r\n<td>Parkir</td>\r\n<td>tempat parkir mobil</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tarif-Hotel-Wisata-Indah-Sibolga.jpg'),
(12, 'Local Collection', 1900000, '<p><strong>- Hotel Local Collection</strong><br />Dirancang untuk wisata plesir dan bisnis, local collection Resort Hotel terletak strategis di labuan bajo; salah satu daerah lokal terkenal. Hotel ini tidak terlalu jauh dari pusat kota, hanya dari sini dan umumnya hanya membutuhkan waktu 90 menit untuk mencapai bandara. Dengan lokasinya yang strategis, hotel ini menawarkan akses mudah ke destinasi yang wajib dilihat di kota ini.</p>\r\n<p>Fasilitas dan pelayanan yang ditawarkan local collection Hotel menjaminkan penginapan menyenangkan bagi para tamu. Ketika menginap di properti yang luar biasa ini, para tamu dapat menikmati wi-fi di tempat-tempat umum, ruang merokok , concierge, layanan laundry, tur.</p>\r\n<p>locall collection Hotel memiliki 22 kamar tidur yang semuanya dirancang dengan citarasa tinggi untuk menyediakan kenyamanan seperti televisi, meja tulis, internet (wireless), AC, kulkas. Hotel ini menyediakan sejumlah fasilitas rekreasi seperti kolam (anak), taman, lapangan tenis, klub anak. Fasilitas super dan lokasi yang cemerlang menjadikan Local Collection Hotel tempat yang sempurna untuk menikmati penginapan Anda selama di Labuan Bajo.</p>\r\n<h3>Kebijakan Hotel</h3>\r\n<ul>\r\n<li>Minimum umur tamu adalah: 1 tahun</li>\r\n<li>Tamu berumur diatas 7 tahun dianggap sebagai tamu dewasa</li>\r\n<li>Ekstra bed tergantung pada kamar yang Anda pilih, silahkan cek kebijakan setiap kamar untuk detil lebih lanjut</li>\r\n</ul>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Anak-anak 2-7 tahun</td>\r\n<td>Harus menggunakan ekstra bed</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3>Fasilitas Hotel</h3>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Fasilitas</td>\r\n<td>coffee shop, concierge, fasilitas rapat,layanan kamar, layanan kamar 24 jam, layanan laundry, restoran, ruang keluarga, ruang merokok, wi-fi di tempat-tempat umum, Wi-Fi gratis di semua kamar</td>\r\n</tr>\r\n<tr>\r\n<td>Olahraga dan Rekreasi</td>\r\n<td>klub anak, kolam (anak), lapangan tenis, taman</td>\r\n</tr>\r\n<tr>\r\n<td>Internet dalam Kamar</td>\r\n<td>Akses WiFi gratis</td>\r\n</tr>\r\n<tr>\r\n<td>Parkir</td>\r\n<td>tempat parkir mobil</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'locca-collection-hotel.png'),
(13, 'Manulalu Villa', 1900000, '<p><strong>&nbsp;Hotel Manulalu Villa</strong><br />Dirancang untuk wisata plesir dan bisnis, manulalu villa Hotel terletak strategis di bajawa; salah satu daerah lokal terkenal. Hotel ini tidak terlalu jauh dari pusat kota, hanya dari sini dan umumnya hanya membutuhkan waktu 90 menit untuk mencapai bandara. Dengan lokasinya yang strategis, hotel ini menawarkan akses mudah ke destinasi yang wajib dilihat di kota ini.</p>\r\n<p>Fasilitas dan pelayanan yang ditawarkan manulalu villa menjaminkan penginapan menyenangkan bagi para tamu. Ketika menginap di properti yang luar biasa ini, para tamu dapat menikmati wi-fi di tempat-tempat umum, ruang merokok , concierge, layanan laundry, tur.</p>\r\n<p>manulalu villa memiliki 22 kamar tidur yang semuanya dirancang dengan citarasa tinggi untuk menyediakan kenyamanan seperti televisi, meja tulis, internet (wireless), AC, kulkas. Hotel ini menyediakan sejumlah fasilitas rekreasi seperti kolam (anak), taman, lapangan tenis, klub anak. Fasilitas super dan lokasi yang cemerlang menjadikan Manulalu Villa Hotel tempat yang sempurna untuk menikmati penginapan Anda selama di Bajawa.</p>\r\n<h3>Kebijakan Hotel</h3>\r\n<ul>\r\n<li>Minimum umur tamu adalah: 1 tahun</li>\r\n<li>Tamu berumur diatas 7 tahun dianggap sebagai tamu dewasa</li>\r\n<li>Ekstra bed tergantung pada kamar yang Anda pilih, silahkan cek kebijakan setiap kamar untuk detil lebih lanjut</li>\r\n</ul>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Bayi 1 tahun</td>\r\n<td>Menginap gratis dengan menggunakan tempat tidur yang tersedia. Catatan, biaya tambahan kemungkinan dikenakan jika Anda membutuhkan ranjang bayi</td>\r\n</tr>\r\n<tr>\r\n<td>Anak-anak 2-7 tahun</td>\r\n<td>Harus menggunakan ekstra bed</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3>Fasilitas Hotel</h3>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>Fasilitas</td>\r\n<td>coffee shop, concierge, fasilitas rapat,layanan kamar, layanan kamar 24 jam, layanan laundry, restoran, ruang keluarga, ruang merokok, wi-fi di tempat-tempat umum, Wi-Fi gratis di semua kamar</td>\r\n</tr>\r\n<tr>\r\n<td>Olahraga dan Rekreasi</td>\r\n<td>klub anak, kolam (anak), lapangan tenis, taman</td>\r\n</tr>\r\n<tr>\r\n<td>Internet dalam Kamar</td>\r\n<td>Akses WiFi gratis</td>\r\n</tr>\r\n<tr>\r\n<td>Parkir</td>\r\n<td>tempat parkir mobil</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Manulalu-Jungle-Hotel-Bajawa-Exterior.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_paket`
--

CREATE TABLE `tbl_paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `harga_paket` int(11) NOT NULL,
  `ket_paket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_paket`
--

INSERT INTO `tbl_paket` (`id_paket`, `nama_paket`, `harga_paket`, `ket_paket`) VALUES
(1, 'Labuan Bajo', 1000000, '<p><span style=\"color: #ffcc00;\">3 Hari + Makan 3x sehari + Kuota 6 Orang</span></p>'),
(2, 'Wisata Bajawa', 350000, '<p><span style=\"color: rgb(255, 204, 0);\">3 Hari + Makan 3x sehari + Kouta 6 Orang</span></p>\r\n<p>&nbsp;</p>'),
(5, 'Wisata 17 Pulau Riung', 950000, '<p><span style=\"color: #ffcc00;\">3 Hari + Makan 3x sehari + Kuota 6 Orang</span></p>'),
(6, 'Promo Tahun Baru', 215000, '<p><span style=\"color: #ffcc00;\">Makam Bung Karno+Green Park+Taman Sentul</span></p>'),
(7, 'Promo GILAAA', 500000, '<p><span style=\"color: #ffcc00;\">blablablablablablablablbalba</span></p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pesan`
--

CREATE TABLE `tbl_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_daerah` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `tgl_tour` date NOT NULL,
  `status` char(2) NOT NULL DEFAULT 'S1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_pesan`
--

INSERT INTO `tbl_pesan` (`id_pesan`, `id_user`, `id_paket`, `id_hotel`, `id_daerah`, `tgl_pesan`, `tgl_tour`, `status`) VALUES
(46, 30, 1, 2, 3, '2024-07-08', '2024-07-17', 'S2'),
(47, 30, 2, 2, 6, '2024-07-08', '2024-07-15', 'S1'),
(48, 31, 7, 3, 1, '2024-07-09', '2024-07-24', 'S2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_provinsi`
--

CREATE TABLE `tbl_provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_provinsi`
--

INSERT INTO `tbl_provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Jawa Timur'),
(2, 'Jawa tengah'),
(3, 'Jawa Barat'),
(4, 'Jakarta'),
(5, 'Yogyagarta'),
(6, 'Banten'),
(7, 'Nusa Tenggara Timur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `no_rek` varchar(50) NOT NULL,
  `nama_rek` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(12) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jekel` varchar(1) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `foto`, `nama_user`, `email_user`, `no_hp`, `no_rek`, `nama_rek`, `username`, `password`, `tgl_lahir`, `jekel`, `alamat`) VALUES
(23, 'komodo.jpg', 'rani', 'rani@gmail.com', '085790365889', '8899987399', 'rani', 'rani', 'rani', '2010-12-14', 'P', 'jalan wates blitar'),
(29, 'WhatsApp Image 2024-06-04 at 18.21.56_bad9ab06.jpg', 'san', 'welloidon613@gmail.com', '087854921923', '12356778', 'fridolin wello', 'san', 'idon', '1997-03-02', 'L', 'malang'),
(30, '', 'yahya`', 'yahya@gmail.com', '08867869786', '0787655786', 'yahya', 'yahya', 'yahya', '2024-07-08', 'L', 'jl. anggrek'),
(31, 'paket wisata.png', 'joni', 'jonilosa@gmail.com', '08867869786', '98765443222', 'yohanes wago losa', 'joni', 'losa', '1999-06-12', 'L', 'bajawa ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tempat`
--

CREATE TABLE `tempat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `konten` varchar(500) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tempat`
--

INSERT INTO `tempat` (`id`, `nama`, `konten`, `gambar`) VALUES
(2, 'Labuan Bajo', '<p><strong>Labuan Bajo</strong>&nbsp;merupakan salah satu kelurahan&nbsp;yang berada di kecamatan<a title=\"Komodo, Manggarai Barat\" href=\"https://id.wikipedia.org/wiki/Komodo,_Manggarai_Barat\">&nbsp;</a>Komodo, Kabupaten Manggarai Barat, Privinsi Nusa Tenggara Timur, Indonesia. Labuan Bajo juga merupakan pusat pemerintahan dari Kecamatan Komodo dan sekaligus merupakan ibu<a title=\"Ibu kota kabupaten\" href=\"https://id.wikipedia.org/wiki/Ibu_kota_kabupaten\">&nbsp;</a>kota&nbsp;Kabupaten Manggarai ', 'pantai-pink.jpg'),
(6, 'Kampung Bena', '<p><strong>Kampung Bena</strong>&nbsp;adalah salah satu perkampungan megalitikum&nbsp;yang terletak di Kabupaten<a title=\"Kabupaten Ngada\" href=\"https://id.wikipedia.org/wiki/Kabupaten_Ngada\">&nbsp;</a>Ngada, Nusa Tenggara Timur. Tepatnya di Desa Tiwuriwu, Kecamatan Aimere, sekitar 19&nbsp;km selatan Bajawa. Kampung yang terletak di puncak bukit&nbsp;dengan view gunung inerie. Keberadaannya di bawah gunung merupakan ciri khas masyarakat lama pemuja gunung sebagai tempat para dewa. Menurut pendud', 'Kampung-Bena1.jpg'),
(7, '17 Pulau Riung', '<p>17 Pulau Riung terdiri dari sejumlah pulau kecil yang tersebar di sepanjang pantai utara Pulau Flores. Pulau-pulau ini dikelilingi oleh air laut yang jernih dan terumbu karang yang indah.</p>', 'Pulau-Kelelawar.jpg'),
(32, 'Waerebo Village', '<p><strong>Wae Rebo</strong>&nbsp;atau&nbsp;<strong>Waerebo</strong>&nbsp;adalah sebuah desa adat terpencil dan misterius di Kabupaten<a title=\"Kabupaten Manggarai\" href=\"https://id.wikipedia.org/wiki/Kabupaten_Manggarai\">&nbsp;</a>Manggarai, Nusa Tenggara Timur. Wae Rebo merupakan salah satu destinasi wisata budaya di Kabupaten Manggarai.&nbsp;Terletak di ketinggian 1.200 meter di atas permukaan laut. Di kampung ini hanya terdapat 7 rumah utama atau yang disebut sebagai Mbaru Niang. Wae Rebo di', 'pexels-waerebo.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  ADD PRIMARY KEY (`id_bukti`),
  ADD KEY `id_pesan` (`id_pesan`);

--
-- Indeks untuk tabel `tbl_daerah`
--
ALTER TABLE `tbl_daerah`
  ADD PRIMARY KEY (`id_daerah`),
  ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indeks untuk tabel `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indeks untuk tabel `tbl_paket`
--
ALTER TABLE `tbl_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_paket_2` (`id_paket`),
  ADD KEY `id_paket_3` (`id_paket`),
  ADD KEY `id_daerah` (`id_daerah`);

--
-- Indeks untuk tabel `tbl_provinsi`
--
ALTER TABLE `tbl_provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  MODIFY `id_bukti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_paket`
--
ALTER TABLE `tbl_paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tempat`
--
ALTER TABLE `tempat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  ADD CONSTRAINT `tbl_bukti_ibfk_1` FOREIGN KEY (`id_pesan`) REFERENCES `tbl_pesan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_daerah`
--
ALTER TABLE `tbl_daerah`
  ADD CONSTRAINT `tbl_daerah_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `tbl_provinsi` (`id_provinsi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  ADD CONSTRAINT `tbl_pesan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pesan_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tbl_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pesan_ibfk_3` FOREIGN KEY (`id_hotel`) REFERENCES `tbl_hotel` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pesan_ibfk_4` FOREIGN KEY (`id_daerah`) REFERENCES `tbl_daerah` (`id_daerah`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
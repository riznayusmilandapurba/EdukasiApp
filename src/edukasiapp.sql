-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2024 pada 16.39
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edukasiapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `berita` text NOT NULL,
  `gambar` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `berita`, `gambar`) VALUES
(1, 'Grand Canyon', 'Grand Canyon adalah ngarai raksasa yang terbentang di Arizona, Amerika Serikat. Terbentuk oleh Sungai Colorado selama jutaan tahun, Grand Canyon menampilkan lapisan-lapisan batuan yang berwarna-warni dan struktur geologis yang menakjubkan. Panorama yang spektakuler dan luasnya yang luar biasa membuat Grand Canyon menjadi salah satu keajaiban alam paling terkenal di dunia', 'grandcanyon.jpeg'),
(2, 'Great Barrier Reef', 'Terletak di lepas pantai timur Queensland, Australia, Great Barrier Reef adalah terumbu karang terbesar di dunia. Dengan panjang sekitar 2.300 kilometer, Great Barrier Reef menyajikan keanekaragaman hayati yang luar biasa, termasuk ribuan spesies ikan, moluska, dan karang. Keindahan alam bawah lautnya yang menakjubkan menjadikannya salah satu tujuan snorkeling dan menyelam paling populer di dunia', 'greatbarierbreef.jpeg'),
(3, 'Aurora Borealis (Southern Lights)', 'Aurora Borealis, atau yang lebih dikenal sebagai Southern Lights di Antartika, adalah fenomena alam yang menakjubkan yang terjadi ketika partikel-partikel bermuatan dari Matahari bertabrakan dengan atmosfer Bumi. Ini menghasilkan tampilan cahaya yang berwarna-warni di langit, termasuk hijau, merah, biru, dan ungu. Menyaksikan Aurora Borealis adalah pengalaman yang magis dan mempesona', 'aurora.jpeg'),
(4, 'Victoria Falls', 'Victoria Falls, yang juga dikenal sebagai \"Perdamaian Asap\", adalah air terjun terbesar di dunia berdasarkan lebar dan tinggi. Terletak di perbatasan Zambia dan Zimbabwe, air terjun ini membentuk dinding air setinggi 108 meter dan membentang sepanjang hampir 1,7 kilometer. Suara gemuruh air yang jatuh dan pemandangan kabut yang menyembur membuatnya menjadi salah satu keajaiban alam yang paling menakjubkan.', 'victoriafalls.jpeg'),
(5, 'Mount Everest', 'Mount Everest adalah puncak tertinggi di dunia, dengan ketinggian puncak mencapai 8.848 meter di atas permukaan laut. Terletak di perbatasan antara Nepal dan Tibet, gunung ini menjadi tujuan utama bagi para pendaki gunung dan penggemar petualangan. Pemandangan spektakuler dari puncak gunung dan tantangan mendaki yang menggetarkan jiwa menjadikan Mount Everest sebagai simbol ketahanan manusia dan keajaiban alam yang menakjubkan', 'mountheverest.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nobp` varchar(12) NOT NULL,
  `nohp` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tanggal_input` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nobp`, `nohp`, `email`, `tanggal_input`) VALUES
(1, 'Sarah Johnson', 'BP123456', '081234567890', 'sarahjohnson@gmail.com', '2024-03-12 10:39:08'),
(2, 'Michael Smith', 'BP654321', '085678901234', 'michaelsmith@gmail.com', '2024-03-12 10:39:08'),
(3, 'Emily Brown', 'BP987654', '087654321098', 'emilybrown@gmail.com', '2024-03-12 10:41:16'),
(4, 'David Taylor', 'BP234567', '089012345678', 'davidtaylor@gmail.com', '2024-03-12 10:41:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nohp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `email`, `nohp`) VALUES
(1, 'Emily', 'emily123', '$2y$10$4Oc5ZkfWT6BbBcNO.nKFouv3Lb42A3kCcXcTccK.w9u', 'emily@gmail.com', '082234567890'),
(2, 'Sarah', 'sarah123', '25d55ad283aa400af464c76d713c07ad', 'sarah@gmail.com', '081298347856'),
(3, 'John', 'john123', '25d55ad283aa400af464c76d713c07ad', 'john@gmail.com', '081234567890');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

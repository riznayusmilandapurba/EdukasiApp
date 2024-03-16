-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Mar 2024 pada 21.30
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
  `gambar` varchar(500) NOT NULL
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
(2, 'Michael Smith', 'BP654321', '085678901234', 'michaelsmith@gmail.com', '2024-03-12 10:39:08'),
(3, 'Emily Brown1', 'BP9876541', '087654321098', 'emilybrown1@gmail.com', '2024-03-12 10:41:16'),
(4, 'David Taylor', 'BP234567', '089012345678', 'davidtaylor@gmail.com', '2024-03-12 10:41:16'),
(5, 'Olla Western', '123', '1234567890', 'olla@gmail.com', '0000-00-00 00:00:00'),
(6, 'Hitachi', '123', '1234', 'hitachi@gmail.com', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `nohp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `email`, `nohp`) VALUES
(1, 'Susan23', 'susan123', '12345678', 'susan13@gmail.com', '123456789'),
(2, 'Sarah', 'sarah123', '25d55ad283aa400af464c76d713c07ad', 'sarah@gmail.com', '081298347856'),
(3, 'John', 'john123', '25d55ad283aa400af464c76d713c07ad', 'john@gmail.com', '081234567890'),
(4, 'Kenedy', 'kenedy123', '25d55ad283aa400af464c76d713c07ad', 'kenedy@gmail.com', '081234567890'),
(5, 'rizna', 'rizna123', '25d55ad283aa400af464c76d713c07ad', 'rizna@gmail.com', '082293763630'),
(6, 'yusmi', 'yusmi123', '25d55ad283aa400af464c76d713c07ad', 'yusmi@gmail.com', '087723456789'),
(7, 'fitri', 'fitri123', '25d55ad283aa400af464c76d713c07ad', 'fitri@gmail.com', '08229376360'),
(8, 'nora', 'nora123', 'd959caadac9b13dcb3e609440135cf54', 'nora@gmail.com', '123456789012'),
(9, 'Sora', 'sora123', '25d55ad283aa400af464c76d713c07ad', 'soragmail.com', '081234567890'),
(10, 'kim', 'kim123', '$2y$10$LpSSvjlqy3fesjPO5QnVy.gBGj2X2CRva9QkWl/ShQA', 'kim@gmail.com', '081234567890'),
(11, 'ana', 'ana12', '$2y$10$KFx0QG8QPtM13tR/zQ2DleA8NtaOMXOhvMIKDKrX7JX', 'ana@gmail.com', '134567899098'),
(12, 'ki', 'ki123', '$2y$10$wJzSwQOgRECYItXjrLcZR.rdGc5HykAHw4lMUX5/7U4', 'ki@gmail.com', '081234567890'),
(13, 'siti', 'siti123', '$2y$10$u9nTtAMyvdyvwa/ALt50LekhA8YIXQl7v69rNcnT2Tj', 'siti@gmail.com', '12345678'),
(14, 'nike', 'nike123', '$2y$10$.5Y5ZbnM5IZhHWyXcFRr8eMiZNiNh501mzQZVagob.W', 'nike@gmail.com', '1234567890'),
(15, 'lusi', 'lusi123', '$2y$10$NVxth65aTa78BPtbaoRuu.iQt9ZduR4WMMcx2o/m2dL', 'lusi@gmail.com', '1234567890'),
(16, 'lita', 'lita123', '$2y$10$/7VkV2uHL22NwchVXpMeDuVIsKgnTtnm6iUE.2rQ5FyDGV6LxFnWO', 'lita@gmail.com', '1234567890'),
(17, 'yudi', 'yudi123', '$2y$10$GNnA9mY.FDCDzyqAcdgKpu7LEJ1TLmRFqJRlpJMy2fUZ.z6cwC6ve', 'yudi@gmail.com', '081234567890'),
(18, 'budi', 'budi123', '202cb962ac59075b964b07152d234b70', 'budi@gmail.com', '081234567890'),
(19, 'hendra', 'hendra1', '202cb962ac59075b964b07152d234b70', 'hendra@gmail.com', '1234567890'),
(20, 'alan', 'alan1', '202cb962ac59075b964b07152d234b70', 'alan@gmail.com', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

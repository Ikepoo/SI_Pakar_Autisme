-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 04.45
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_pakar_autisme`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`) VALUES
('', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_aturan`
--

CREATE TABLE `tb_aturan` (
  `id_aturan` varchar(10) NOT NULL,
  `id_gejala` varchar(10) NOT NULL,
  `id_jenis` varchar(10) NOT NULL,
  `id_penanganan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `id_gejala` varchar(10) NOT NULL,
  `nama_gejala` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hasildiagnosa`
--

CREATE TABLE `tb_hasildiagnosa` (
  `id_diagnosa` varchar(10) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `id_aturan` varchar(10) NOT NULL,
  `id_penanganan` varchar(10) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL,
  `nama_gejala` varchar(20) NOT NULL,
  `cara_penanganan` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_pakar` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `id_jenis` varchar(10) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konsultasi`
--

CREATE TABLE `tb_konsultasi` (
  `id_konsultasi` varchar(10) NOT NULL,
  `id_pakar` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `gejala` text NOT NULL,
  `hasil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pakar`
--

CREATE TABLE `tb_pakar` (
  `id_pakar` varchar(10) NOT NULL,
  `profesi` varchar(40) NOT NULL,
  `bio` text NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penanganan`
--

CREATE TABLE `tb_penanganan` (
  `id_penanganan` varchar(10) NOT NULL,
  `id_jenis` varchar(10) NOT NULL,
  `cara_penanganan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `nam_pengguna` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `status` enum('Anggota','Pelanggan') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_riwayat_diagnosa`
--

CREATE TABLE `tb_riwayat_diagnosa` (
  `id_riwayat` varchar(10) NOT NULL,
  `id_diagnosa` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_gejala` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD PRIMARY KEY (`id_aturan`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `id_penanganan` (`id_penanganan`);

--
-- Indeks untuk tabel `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indeks untuk tabel `tb_hasildiagnosa`
--
ALTER TABLE `tb_hasildiagnosa`
  ADD PRIMARY KEY (`id_diagnosa`),
  ADD KEY `id_aturan` (`id_aturan`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_penanganan` (`id_penanganan`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_pakar` (`id_pakar`);

--
-- Indeks untuk tabel `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD PRIMARY KEY (`id_konsultasi`),
  ADD KEY `id_pakar` (`id_pakar`);

--
-- Indeks untuk tabel `tb_pakar`
--
ALTER TABLE `tb_pakar`
  ADD PRIMARY KEY (`id_pakar`);

--
-- Indeks untuk tabel `tb_penanganan`
--
ALTER TABLE `tb_penanganan`
  ADD PRIMARY KEY (`id_penanganan`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_riwayat_diagnosa`
--
ALTER TABLE `tb_riwayat_diagnosa`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_diagnosa` (`id_diagnosa`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD CONSTRAINT `tb_aturan_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `tb_gejala` (`id_gejala`),
  ADD CONSTRAINT `tb_aturan_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis` (`id_jenis`),
  ADD CONSTRAINT `tb_aturan_ibfk_3` FOREIGN KEY (`id_penanganan`) REFERENCES `tb_penanganan` (`id_penanganan`);

--
-- Ketidakleluasaan untuk tabel `tb_hasildiagnosa`
--
ALTER TABLE `tb_hasildiagnosa`
  ADD CONSTRAINT `tb_hasildiagnosa_ibfk_1` FOREIGN KEY (`id_aturan`) REFERENCES `tb_aturan` (`id_aturan`),
  ADD CONSTRAINT `tb_hasildiagnosa_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`),
  ADD CONSTRAINT `tb_hasildiagnosa_ibfk_3` FOREIGN KEY (`id_penanganan`) REFERENCES `tb_penanganan` (`id_penanganan`);

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`id_pakar`) REFERENCES `tb_pakar` (`id_pakar`);

--
-- Ketidakleluasaan untuk tabel `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD CONSTRAINT `tb_konsultasi_ibfk_1` FOREIGN KEY (`id_pakar`) REFERENCES `tb_pakar` (`id_pakar`);

--
-- Ketidakleluasaan untuk tabel `tb_penanganan`
--
ALTER TABLE `tb_penanganan`
  ADD CONSTRAINT `tb_penanganan_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis` (`id_jenis`);

--
-- Ketidakleluasaan untuk tabel `tb_riwayat_diagnosa`
--
ALTER TABLE `tb_riwayat_diagnosa`
  ADD CONSTRAINT `tb_riwayat_diagnosa_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `tb_gejala` (`id_gejala`),
  ADD CONSTRAINT `tb_riwayat_diagnosa_ibfk_2` FOREIGN KEY (`id_diagnosa`) REFERENCES `tb_hasildiagnosa` (`id_diagnosa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

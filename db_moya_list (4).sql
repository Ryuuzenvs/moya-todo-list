-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Sep 2025 pada 08.02
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_moya_list`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2025-09-12 13:43:50', '2025-09-13 07:32:28'),
(2, 'gc1', 1, '2025-09-12 13:49:00', '2025-09-13 07:32:28'),
(3, '123', 1, '2025-09-13 00:31:17', '2025-09-13 07:32:28'),
(4, '123', 1, '2025-09-13 00:35:16', '2025-09-13 00:35:16'),
(5, '1233', 1, '2025-09-13 00:39:58', '2025-09-13 00:39:58'),
(6, 'tumbal1', 27, '2025-09-14 03:56:11', '2025-09-14 03:56:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `user_id`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '2025-09-13 00:40:00', '2025-09-13 00:40:00'),
(2, 1, 1, 1, '2025-09-13 10:12:53', '2025-09-13 10:12:53'),
(3, 1, 22, 0, '2025-09-13 11:32:28', '2025-09-14 11:02:33'),
(4, 1, 27, 0, '2025-09-13 14:01:22', '2025-09-16 06:57:03'),
(5, 1, 2, 0, '2025-09-13 23:29:59', '2025-09-13 23:29:59'),
(6, 6, 27, 1, '2025-09-14 03:56:14', '2025-09-16 06:57:09'),
(7, 6, 1, 0, '2025-09-14 03:56:40', '2025-09-14 03:56:40'),
(8, 1, 6, 0, '2025-09-14 11:05:09', '2025-09-14 11:05:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `user_id`, `module_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'yu', '2025-09-06 10:07:05', '2025-09-06 10:07:05'),
(2, 22, 'dino', '2025-09-07 08:48:18', '2025-09-07 08:48:18'),
(3, 16, 'dahna', '2025-09-07 09:26:07', '2025-09-07 09:26:07'),
(4, 1, 'testing', '2025-09-09 06:11:20', '2025-09-09 06:11:20'),
(6, 26, 'group 1', '2025-09-10 22:15:07', '2025-09-10 22:15:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `task_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(2, 7, 28, 'Tugas \"tugas 11\" sudah terlewat batas!', 0, '2025-09-05 00:00:18', '2025-09-08 20:38:41'),
(16, 22, 37, 'Tugas \"ngoding\" sudah terlewat batas!', 1, '2025-09-06 22:56:00', '2025-09-08 20:38:41'),
(18, 16, 55, 'Tugas \"Ryuuzenvs\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-06 23:27:43', '2025-09-08 20:38:41'),
(19, 22, 56, 'Tugas \"PBO\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-06 23:45:45', '2025-09-08 20:38:41'),
(20, 16, 57, 'Tugas \"Ryuuzenvs\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-07 00:26:42', '2025-09-08 20:38:41'),
(26, 24, 61, 'Tugas \"testing10\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-09 17:04:32', '2025-09-10 00:04:32'),
(33, 27, 80, 'Tugas \"tugas 1\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-13 21:32:02', '2025-09-14 04:32:02'),
(37, 1, 87, 'Tugas \"tugas 112345\" akan jatuh tempo hari ini atau besok!', 0, '2025-09-15 21:27:32', '2025-09-16 04:27:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `owner`
--

INSERT INTO `owner` (`id`, `username`, `password`) VALUES
(1, 'owner', 'Dahna1357');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_list`
--

CREATE TABLE `tb_list` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `priority` enum('biasa','cukup','penting','') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('belum','selesai') NOT NULL DEFAULT 'belum',
  `keterangan` text NOT NULL,
  `deadline` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `group_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_list`
--

INSERT INTO `tb_list` (`task_id`, `task_name`, `priority`, `created_at`, `status`, `keterangan`, `deadline`, `user_id`, `deleted_at`, `module_id`, `updated_at`, `group_id`) VALUES
(28, 'tugas 11', 'biasa', '2025-08-29 00:00:00', 'belum', '', '2025-09-12', 7, '2025-09-05 07:01:02', NULL, NULL, NULL),
(30, 'bayu', 'biasa', '2025-09-01 00:00:00', 'selesai', '123', '2025-09-11', 18, NULL, NULL, NULL, NULL),
(31, 'bayu', 'biasa', '2025-09-01 00:00:00', 'belum', '', '2025-09-17', 18, NULL, NULL, NULL, NULL),
(33, 'tugas 1', 'penting', '0000-00-00 00:00:00', 'belum', '', '2025-09-12', 20, NULL, NULL, NULL, NULL),
(34, 'tugas 3', 'biasa', '0000-00-00 00:00:00', 'belum', '', '2025-09-06', 7, NULL, NULL, NULL, NULL),
(35, 'tugas 3', 'biasa', '0000-00-00 00:00:00', 'belum', '', '2025-09-06', 7, NULL, NULL, NULL, NULL),
(36, 'tugas 3', 'cukup', '0000-00-00 00:00:00', 'belum', '', '2025-09-06', 7, NULL, NULL, NULL, NULL),
(37, 'PBO', 'penting', '0000-00-00 00:00:00', 'selesai', 'PBO Ngoding membuat todo-list', '2025-09-30', 22, NULL, 2, NULL, NULL),
(38, 'MTK', 'biasa', '0000-00-00 00:00:00', 'belum', '', '2025-10-02', 22, '2025-09-07 06:24:39', NULL, NULL, NULL),
(55, 'Ryuuzenvs', 'biasa', '2025-09-07 00:00:00', 'belum', '123', '2025-09-07', 16, NULL, NULL, NULL, NULL),
(56, 'PBO', 'penting', '2025-09-07 00:00:00', 'belum', 'Ngoding', '2025-09-07', 22, NULL, NULL, NULL, NULL),
(57, 'Ryuuzenvs', 'biasa', '2025-09-07 00:00:00', 'selesai', '123', '2025-09-07', 16, NULL, 3, NULL, NULL),
(61, 'testing10', 'biasa', '2025-09-10 00:04:28', 'selesai', '123', '2025-09-10', 24, '2025-09-10 00:04:55', NULL, NULL, NULL),
(63, 'ngoding', 'biasa', '2025-09-10 22:13:31', 'selesai', 'qwe', '2025-10-21', 26, NULL, NULL, NULL, NULL),
(64, 'nama', 'biasa', '2025-09-10 22:16:04', 'belum', '123', '2025-09-22', 26, NULL, 6, NULL, NULL),
(72, 'pkk presentasi', 'biasa', '2025-09-11 12:10:21', 'belum', '.', '2026-01-09', 1, NULL, NULL, NULL, NULL),
(73, 'bk persiapan presentasi', 'biasa', '2025-09-11 12:10:53', 'belum', '1', '2025-11-13', 1, NULL, NULL, NULL, NULL),
(74, 'b ing interview senin', 'biasa', '2025-09-11 12:11:16', 'selesai', '1', '2025-11-20', 1, NULL, NULL, NULL, NULL),
(75, 'agama hafalan ', 'biasa', '2025-09-11 12:13:11', 'selesai', '1', '2025-09-25', 1, NULL, NULL, NULL, NULL),
(76, 'Ryuuzenvs', 'biasa', '2025-09-13 11:05:26', 'selesai', '123', '2025-10-04', 1, NULL, 1, NULL, NULL),
(77, 'Ryuuzenvs', 'biasa', '2025-09-13 11:06:57', 'belum', '123', '2025-10-04', 1, NULL, 4, NULL, NULL),
(78, 'Ryuuzenvs1', 'biasa', '2025-09-13 11:07:11', 'belum', '123', '2025-10-04', 1, NULL, 4, NULL, NULL),
(79, 'tugas 1', 'biasa', '2025-09-13 13:30:38', 'selesai', '123', '2025-10-10', 27, NULL, NULL, NULL, NULL),
(80, 'tugas 1', 'biasa', '2025-09-14 04:31:58', '', '123', '2025-09-14', 27, NULL, NULL, NULL, NULL),
(84, 'tugas 1123', 'biasa', '2025-09-15 23:43:14', 'belum', '123', '2025-09-26', 1, '2025-09-16 05:56:38', NULL, NULL, 1),
(85, 'tugas 11234', 'biasa', '2025-09-15 23:47:45', 'belum', '123', '2025-09-26', 1, NULL, NULL, NULL, 1),
(86, 'tugas 112345', 'biasa', '2025-09-15 23:53:22', 'belum', '123', '2025-09-26', 1, NULL, NULL, NULL, 1),
(87, 'tugas 112345', 'biasa', '2025-09-15 23:54:05', '', '123', '2025-09-16', 1, NULL, NULL, NULL, 1),
(88, 'ryuu', 'biasa', '2025-09-18 01:17:34', 'selesai', '123', '2025-09-29', 8, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup_requests`
--

CREATE TABLE `topup_requests` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `balance`, `status`) VALUES
(1, 'owner', '123', 9999999999999.99, 'Premium'),
(2, '2', '123', 0.00, 'free'),
(3, 'bayu', '123', 0.00, 'free'),
(6, 'bayu1', '123', 0.00, 'free'),
(7, 'bot', '123', 0.00, NULL),
(8, 'user1', '123', 0.00, NULL),
(11, 'admin', '123', 0.00, NULL),
(16, 'akun1', '123', 0.00, NULL),
(18, 'bayu 1 ', '123', 0.00, NULL),
(20, 'akunhp', '12345', 0.00, NULL),
(22, 'dino78900', 'dino5677', 99999999.00, 'Premium'),
(23, 'radit', '123', 0.00, NULL),
(24, 'newbi', '123', 10000000.00, 'vip'),
(25, 'doni', 'dino', 0.00, 'Free'),
(26, 'akunbaru', '123', 0.00, NULL),
(27, 'tumbal1', '123', 0.00, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_owner` (`owner_id`);

--
-- Indeks untuk tabel `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`user_id`),
  ADD KEY `fk_group_member_user` (`user_id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indeks untuk tabel `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_list`
--
ALTER TABLE `tb_list`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `fk_task_group` (`group_id`);

--
-- Indeks untuk tabel `topup_requests`
--
ALTER TABLE `topup_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_list`
--
ALTER TABLE `tb_list`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT untuk tabel `topup_requests`
--
ALTER TABLE `topup_requests`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `fk_group_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_group_member_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_member_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tb_list` (`task_id`);

--
-- Ketidakleluasaan untuk tabel `tb_list`
--
ALTER TABLE `tb_list`
  ADD CONSTRAINT `fk_task_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_list_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `topup_requests`
--
ALTER TABLE `topup_requests`
  ADD CONSTRAINT `topup_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

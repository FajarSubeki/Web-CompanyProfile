-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2019 at 02:51 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saranade_slo`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `author` tinytext,
  `author_email` varchar(100) DEFAULT NULL,
  `author_url` varchar(200) DEFAULT NULL,
  `author_ip` varchar(50) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `approved` varchar(1) DEFAULT 'N',
  `type` varchar(20) DEFAULT NULL,
  `comment_parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `organizer_name` varchar(255) DEFAULT NULL,
  `organizer_phone` varchar(255) DEFAULT NULL,
  `organizer_email` varchar(255) DEFAULT NULL,
  `organizer_url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `slug`, `description`) VALUES
(1, 'Administrator', 'administrator', 'CDU'),
(2, 'Editor', 'editor', 'somebody who can publish and manage posts including the posts of other users. '),
(3, 'Author', 'author', 'somebody who can publish and manage their own posts. '),
(4, 'Contributor', 'contributor', 'somebody who can write and manage their own posts but cannot publish them. '),
(5, 'Subscriber', 'subscriber', 'somebody who can only manage their profile. ');

-- --------------------------------------------------------

--
-- Table structure for table `group_role`
--

CREATE TABLE `group_role` (
  `group_role_id` bigint(20) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `link_id` bigint(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_role`
--

INSERT INTO `group_role` (`group_role_id`, `group_id`, `link_id`, `role_id`) VALUES
(1, 1, 2, 1),
(2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inf_lokasi`
--

CREATE TABLE `inf_lokasi` (
  `lokasi_ID` int(11) NOT NULL,
  `lokasi_kode` varchar(50) NOT NULL DEFAULT '',
  `lokasi_nama` varchar(100) NOT NULL DEFAULT '',
  `lokasi_propinsi` int(2) NOT NULL,
  `lokasi_kabupatenkota` int(2) UNSIGNED ZEROFILL DEFAULT NULL,
  `lokasi_kecamatan` int(2) UNSIGNED ZEROFILL NOT NULL,
  `lokasi_kelurahan` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kab`
--

CREATE TABLE `kab` (
  `id` int(11) NOT NULL,
  `kode_kab` int(11) NOT NULL,
  `kode_prov` int(11) NOT NULL,
  `kab` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kab`
--

INSERT INTO `kab` (`id`, `kode_kab`, `kode_prov`, `kab`) VALUES
(1, 1101, 11, 'KAB ACEH SELATAN'),
(2, 1102, 11, 'KAB ACEH TENGGARA'),
(3, 1103, 11, 'KAB ACEH TIMUR'),
(4, 1104, 11, 'KAB ACEH TENGAH'),
(5, 1105, 11, 'KAB ACEH BARAT'),
(6, 1106, 11, 'KAB ACEH BESAR'),
(7, 1107, 11, 'KAB PIDIE'),
(8, 1108, 11, 'KAB ACEH UTARA'),
(9, 1109, 11, 'KAB SIMEULUE'),
(10, 1110, 11, 'KAB ACEH SINGKIL'),
(11, 1111, 11, 'KAB BIREUEN'),
(12, 1112, 11, 'KAB ACEH BARAT DAYA'),
(13, 1113, 11, 'KAB GAYOLUES'),
(14, 1114, 11, 'KAB ACEH JAYA'),
(15, 1115, 11, 'KAB NAGAN RAYA'),
(16, 1116, 11, 'KAB ACEH TAMIANG'),
(17, 1117, 11, 'KAB BENER MERIAH'),
(18, 1118, 11, 'KAB PIDIE JAYA'),
(19, 1171, 11, 'KOTA BANDA ACEH'),
(20, 1172, 11, 'KOTA SABANG'),
(21, 1173, 11, 'KOTA LHOKSEUMAWE'),
(22, 1174, 11, 'KOTA LANGSA'),
(23, 1175, 11, 'KOTA SUBULUSSALAM'),
(24, 1201, 12, 'KAB TAPANULI TENGAH'),
(25, 1202, 12, 'KAB TAPANULI UTARA'),
(26, 1203, 12, 'KAB TAPANULI SELATAN'),
(27, 1204, 12, 'KAB NIAS'),
(28, 1205, 12, 'KAB LANGKAT'),
(29, 1206, 12, 'KAB KARO'),
(30, 1207, 12, 'KAB DELI SERDANG'),
(31, 1208, 12, 'KAB SIMALUNGUN'),
(32, 1209, 12, 'KAB ASAHAN'),
(33, 1210, 12, 'KAB LABUHANBATU'),
(34, 1211, 12, 'KAB DAIRI'),
(35, 1212, 12, 'KAB TOBA SAMOSIR'),
(36, 1213, 12, 'KAB MANDAILING NATAL'),
(37, 1214, 12, 'KAB NIAS SELATAN'),
(38, 1215, 12, 'KAB PAKPAK BHARAT'),
(39, 1216, 12, 'KAB HUMBANG HASUNDUTAN'),
(40, 1217, 12, 'KAB SAMOSIR'),
(41, 1218, 12, 'KAB SERDANG BEDAGAI'),
(42, 1219, 12, 'KAB BATUBARA'),
(43, 1220, 12, 'KAB PADANG LAWAS UTARA'),
(44, 1221, 12, 'KAB PADANG LAWAS'),
(45, 1222, 12, 'KAB LABUHANBATU SELATAN'),
(46, 1223, 12, 'KAB LABUHANBATU UTARA'),
(47, 1224, 12, 'KAB NIAS '),
(48, 1225, 12, 'KAB NIAS BARAT'),
(49, 1271, 12, 'KOTA MEDAN'),
(50, 1272, 12, 'KOTA PEMATANG SIANTAR'),
(51, 1273, 12, 'KOTA SIBOLGA'),
(52, 1274, 12, 'KOTA TANJUNG BALAI'),
(53, 1275, 12, 'KOTA BINJAI'),
(54, 1276, 12, 'KOTA TEBING TINGGI'),
(55, 1277, 12, 'KOTA PADANGSIDIMPUAN'),
(56, 1278, 12, 'KOTA GUNUNGSITOLI'),
(57, 1301, 13, 'KAB PESISIR SELATAN'),
(58, 1302, 13, 'KAB SOLOK'),
(59, 1303, 13, 'KAB SIJUNJUNG'),
(60, 1304, 13, 'KAB TANAH DATAR'),
(61, 1305, 13, 'KAB PADANG PARIAMAN'),
(62, 1306, 13, 'KAB AGAM'),
(63, 1307, 13, 'KAB LIMA PULUH KOTA'),
(64, 1308, 13, 'KAB PASAMAN'),
(65, 1309, 13, 'KAB KEPULAUAN MENTAWAI'),
(66, 1310, 13, 'KAB DHARMASRAYA'),
(67, 1311, 13, 'KAB SOLOK SELATAN'),
(68, 1312, 13, 'KAB PASAMAN BARAT'),
(69, 1371, 13, 'KOTA PADANG'),
(70, 1372, 13, 'KOTA SOLOK'),
(71, 1373, 13, 'KOTA SAWAHLUNTO'),
(72, 1374, 13, 'KOTA PADANG PANJANG'),
(73, 1375, 13, 'KOTA BUKITTINGGI'),
(74, 1376, 13, '18 KOTA PAYAKUMBUH'),
(75, 1377, 13, '19 KOTA PARIAMAN'),
(76, 1401, 14, 'KAB KAMPAR'),
(77, 1402, 14, 'KAB INDRAGIRI HULU'),
(78, 1403, 14, 'KAB BENGKALIS'),
(79, 1404, 14, 'KAB INDRAGIRI HILIR'),
(80, 1405, 14, 'KAB PELALAWAN'),
(81, 1406, 14, 'KAB ROKAN HULU'),
(82, 1407, 14, 'KAB ROKAN HILIR'),
(83, 1408, 14, 'KAB SIAK'),
(84, 1409, 14, 'KAB KUANTAN SINGINGI'),
(85, 1410, 14, 'KAB KEPULAUAN MERANTI'),
(86, 1471, 14, 'KOTA PEKANBARU'),
(87, 1472, 14, 'KOTA DUMAI'),
(88, 1501, 15, 'KAB KERINCI'),
(89, 1502, 15, 'KAB MERANGIN'),
(90, 1503, 15, 'KAB SAROLANGUN'),
(91, 1504, 15, 'KAB BATANGHARI'),
(92, 1505, 15, 'KAB MUARO JAMBI'),
(93, 1506, 15, 'KAB TANJUNG JABUNG BARAT'),
(94, 1507, 15, 'KAB TANJUNG JABUNG TIMUR'),
(95, 1508, 15, 'KAB BUNGO'),
(96, 1509, 15, 'KAB TEBO'),
(97, 1571, 15, 'KOTA JAMBI'),
(98, 1572, 15, 'KOTA SUNGAI PENUH'),
(99, 1601, 16, 'KAB OGAN KOMERING ULU'),
(100, 1602, 16, 'KAB OGAN KOMERING ILIR'),
(101, 1603, 16, 'KAB MUARA ENIM'),
(102, 1604, 16, 'KAB LAHAT'),
(103, 1605, 16, 'KAB MUSI RAWAS'),
(104, 1606, 16, 'KAB MUSI BANYUASIN'),
(105, 1607, 16, 'KAB BANYUASIN'),
(106, 1608, 16, 'KAB OKU TIMUR'),
(107, 1609, 16, 'KAB OKU SELATAN'),
(108, 1610, 16, 'KAB OGAN ILIR'),
(109, 1611, 16, 'KAB EMPAT LAWANG'),
(110, 1671, 16, 'KOTA PALEMBANG'),
(111, 1672, 16, 'KOTA PAGAR ALAM'),
(112, 1673, 16, 'KOTA LUBUK LINGGAU'),
(113, 1674, 16, 'KOTA PRABUMULIH'),
(114, 1701, 17, 'KAB BENGKULU SELATAN'),
(115, 1702, 17, 'KAB REJANG LEBONG'),
(116, 1703, 17, 'KAB BENGKULU UTARA'),
(117, 1704, 17, 'KAB KAUR'),
(118, 1705, 17, 'KAB SELUMA'),
(119, 1706, 17, 'KAB MUKO MUKO'),
(120, 1707, 17, 'KAB LEBONG'),
(121, 1708, 17, 'KAB KEPAHIANG'),
(122, 1709, 17, 'KAB BENGKULU TENGAH'),
(123, 1771, 17, 'KOTA BENGKULU'),
(124, 1801, 18, 'KAB LAMPUNG SELATAN'),
(125, 1802, 18, 'KAB LAMPUNG TENGAH'),
(126, 1803, 18, 'KAB LAMPUNG UTARA'),
(127, 1804, 18, 'KAB LAMPUNG BARAT'),
(128, 1805, 18, 'KAB TULANG BAWANG'),
(129, 1806, 18, 'KAB TANGGAMUS'),
(130, 1807, 18, 'KAB LAMPUNG TIMUR'),
(131, 1808, 18, 'KAB WAY KANAN'),
(132, 1, 1, 'KAB PESAWARAN'),
(133, 1810, 18, 'KAB PRINGSEWU'),
(134, 1811, 18, 'KAB MESUJI'),
(135, 1812, 18, 'KAB TULANG BAWANG BARAT'),
(136, 1871, 18, 'KOTA BANDAR LAMPUNG'),
(137, 1872, 18, 'KOTA METRO'),
(138, 1901, 19, 'KAB BANGKA'),
(139, 1902, 19, 'KAB BELITUNG'),
(140, 1903, 19, 'KAB BANGKA SELATAN'),
(141, 1904, 19, 'KAB BANGKA TENGAH'),
(142, 1905, 19, 'KAB BANGKA BARAT'),
(143, 1906, 19, 'KAB BELITUNG TIMUR'),
(144, 1971, 19, 'KOTA PANGKAL PINANG'),
(145, 2101, 21, 'KAB BINTAN'),
(146, 2102, 21, 'KAB KARIMUN'),
(147, 2103, 21, 'KAB NATUNA'),
(148, 2104, 21, 'KAB LINGGA'),
(149, 2105, 21, 'KAB KEPULAUAN ANAMBAS'),
(150, 2171, 21, 'KOTA BATAM'),
(151, 2172, 21, 'KOTA TANJUNG PINANG'),
(152, 3101, 31, 'KAB ADM KEP SERIBU'),
(153, 3171, 31, 'KOTA ADM JAKARTA PUSAT'),
(154, 3172, 31, 'KOTA ADM JAKARTA UTARA'),
(155, 3173, 31, 'KOTA ADM JAKARTA BARAT'),
(156, 3174, 31, 'KOTA ADM JAKARTA SELATAN'),
(157, 3175, 31, 'KOTA ADM JAKARTA TIMUR'),
(158, 3201, 32, 'KAB BOGOR'),
(159, 3202, 32, 'KAB SUKABUMI'),
(160, 3203, 32, 'KAB CIANJUR'),
(161, 3204, 32, 'KAB BANDUNG'),
(162, 3205, 32, 'KAB GARUT'),
(163, 3206, 32, 'KAB TASIKMALAYA'),
(164, 3207, 32, 'KAB CIAMIS'),
(165, 3208, 32, 'KAB KUNINGAN'),
(166, 3209, 32, 'KAB CIREBON'),
(167, 3210, 32, 'KAB MAJALENGKA'),
(168, 3211, 32, 'KAB SUMEDANG'),
(169, 3212, 32, 'KAB INDRAMAYU'),
(170, 3213, 32, 'KAB SUBANG'),
(171, 3214, 32, 'KAB PURWAKARTA'),
(172, 3215, 32, 'KAB KARAWANG'),
(173, 3216, 32, 'KAB BEKASI'),
(174, 3217, 32, 'KAB BANDUNG BARAT'),
(175, 3271, 32, 'KOTA BOGOR'),
(176, 3272, 32, 'KOTA SUKABUMI'),
(177, 3273, 32, 'KOTA BANDUNG'),
(178, 3274, 32, 'KOTA CIREBON'),
(179, 3275, 32, 'KOTA BEKASI'),
(180, 3276, 32, 'KOTA DEPOK'),
(181, 3277, 32, 'KOTA CIMAHI'),
(182, 3278, 32, 'KOTA TASIKMALAYA'),
(183, 3279, 32, 'KOTA BANJAR'),
(184, 3301, 33, 'KAB CILACAP'),
(185, 3302, 33, 'KAB BANYUMAS'),
(186, 3303, 33, 'KAB PURBALINGGA'),
(187, 3304, 33, 'KAB BANJARNEGARA'),
(188, 3305, 33, 'KAB KEBUMEN'),
(189, 3306, 33, 'KAB PURWOREJO'),
(190, 3307, 33, 'KAB WONOSOBO'),
(191, 3308, 33, 'KAB MAGELANG'),
(192, 3309, 33, 'KAB BOYOLALI'),
(193, 3310, 33, 'KAB KLATEN'),
(194, 3311, 33, 'KAB SUKOHARJO'),
(195, 3312, 33, 'KAB WONOGIRI'),
(196, 3313, 33, 'KAB KARANGANYAR'),
(197, 3314, 33, 'KAB SRAGEN'),
(198, 3315, 33, 'KAB GROBOGAN'),
(199, 3316, 33, 'KAB BLORA'),
(200, 3317, 33, 'KAB REMBANG'),
(201, 3318, 33, 'KAB PATI'),
(202, 3319, 33, 'KAB KUDUS'),
(203, 3320, 33, 'KAB JEPARA'),
(204, 3321, 33, 'KAB DEMAK'),
(205, 3322, 33, 'KAB SEMARANG'),
(206, 3323, 33, 'KAB TEMANGGUNG'),
(207, 3324, 33, 'KAB KENDAL'),
(208, 3325, 33, 'KAB BATANG'),
(209, 3326, 33, 'KAB PEKALONGAN'),
(210, 3327, 33, 'KAB PEMALANG'),
(211, 3328, 33, 'KAB TEGAL'),
(212, 3329, 33, 'KAB BREBES'),
(213, 3371, 33, 'KOTA MAGELANG'),
(214, 3372, 33, 'KOTA SURAKARTA'),
(215, 3373, 33, 'KOTA SALATIGA'),
(216, 3374, 33, 'KOTA SEMARANG'),
(217, 3375, 33, 'KOTA PEKALONGAN'),
(218, 3376, 33, 'KOTA TEGAL'),
(219, 3401, 34, 'KAB KULON PROGO'),
(220, 3402, 34, 'KAB BANTUL'),
(221, 3403, 34, 'KAB GUNUNG KIDUL'),
(222, 3404, 34, 'KAB SLEMAN'),
(223, 3471, 34, 'KOTA YOGYAKARTA'),
(224, 3501, 35, 'KAB PACITAN'),
(225, 3502, 35, 'KAB PONOROGO'),
(226, 3503, 35, 'KAB TRENGGALEK'),
(227, 3504, 35, 'KAB TULUNGAGUNG'),
(228, 3505, 35, 'KAB BLITAR'),
(229, 3506, 35, 'KAB KEDIRI'),
(230, 3507, 35, 'KAB MALANG'),
(231, 3508, 35, 'KAB LUMAJANG'),
(232, 3509, 35, 'KAB JEMBER'),
(233, 3510, 35, 'KAB BANYUWANGI'),
(234, 3511, 35, 'KAB BONDOWOSO'),
(235, 3512, 35, 'KAB SITUBONDO'),
(236, 3513, 35, 'KAB PROBOLINGGO'),
(237, 3514, 35, 'KAB PASURUAN'),
(238, 3515, 35, 'KAB SIDOARJO'),
(239, 3516, 35, 'KAB MOJOKERTO'),
(240, 3517, 35, 'KAB JOMBANG'),
(241, 3518, 35, 'KAB NGANJUK'),
(242, 3519, 35, 'KAB MADIUN'),
(243, 3520, 35, 'KAB MAGETAN'),
(244, 3521, 35, 'KAB NGAWI'),
(245, 3522, 35, 'KAB BOJONEGORO'),
(246, 3523, 35, 'KAB TUBAN'),
(247, 3524, 35, 'KAB LAMONGAN'),
(248, 3525, 35, 'KAB GRESIK'),
(249, 3526, 35, 'KAB BANGKALAN'),
(250, 3527, 35, 'KAB SAMPANG'),
(251, 3528, 35, 'KAB PAMEKASAN'),
(252, 3529, 35, 'KAB SUMENEP'),
(253, 3571, 35, 'KOTA KEDIRI'),
(254, 3572, 35, 'KOTA BLITAR'),
(255, 3573, 35, 'KOTA MALANG'),
(256, 3574, 35, 'KOTA PROBOLINGGO'),
(257, 3575, 35, 'KOTA PASURUAN'),
(258, 3576, 35, 'KOTA MOJOKERTO'),
(259, 3577, 35, 'KOTA MADIUN'),
(260, 3578, 35, 'KOTA SURABAYA'),
(261, 3579, 35, 'KOTA BATU'),
(262, 3601, 36, 'KAB PANDEGLANG'),
(263, 3602, 36, 'KAB LEBAK'),
(264, 3603, 36, 'KAB TANGERANG'),
(265, 3604, 36, 'KAB SERANG'),
(266, 3671, 36, 'KOTA TANGERANG'),
(267, 3672, 36, 'KOTA CILEGON'),
(268, 3673, 36, 'KOTA SERANG'),
(269, 3674, 36, 'KOTA TANGERANG SELATAN'),
(270, 5101, 51, 'KAB JEMBRANA'),
(271, 5102, 51, 'KAB TABANAN'),
(272, 5103, 51, 'KAB BADUNG'),
(273, 5104, 51, 'KAB GIANYAR'),
(274, 5105, 51, 'KAB KLUNGKUNG'),
(275, 5106, 51, 'KAB BANGLI'),
(276, 5107, 51, 'KAB KARANGASEM'),
(277, 5108, 51, 'KAB BULELENG'),
(278, 5171, 51, 'KOTA DENPASAR'),
(279, 5201, 52, 'KAB LOMBOK BARAT'),
(280, 5202, 52, 'KAB LOMBOK TENGAH'),
(281, 5203, 52, 'KAB LOMBOK TIMUR'),
(282, 5204, 52, 'KAB SUMBAWA'),
(283, 5205, 52, 'KAB DOMPU'),
(284, 5206, 52, 'KAB BIMA'),
(285, 5207, 52, 'KAB SUMBAWA BARAT'),
(286, 5208, 52, 'KAB LOMBOK UTARA'),
(287, 5271, 52, 'KOTA MATARAM'),
(288, 5272, 52, 'KOTA BIMA'),
(289, 5301, 53, 'KAB KUPANG'),
(290, 5302, 53, 'KAB TIMOR TENGAH SELATAN'),
(291, 5303, 53, 'KABTIMOR TENGAH UTARA'),
(292, 5304, 53, 'KAB BELU'),
(293, 5305, 53, 'KAB ALOR'),
(294, 5306, 53, 'KAB FLORES TIMUR'),
(295, 5307, 53, 'KAB SIKKA'),
(296, 5308, 53, 'KAB ENDE'),
(297, 5309, 53, 'KAB NGADA'),
(298, 5310, 53, 'KAB MANGGARAI'),
(299, 5311, 53, 'KAB SUMBA TIMUR'),
(300, 5312, 53, 'KAB SUMBA BARAT'),
(301, 5313, 53, 'KAB LEMBATA'),
(302, 5314, 53, 'KAB ROTE NDAO'),
(303, 5315, 53, 'KAB MANGGARAI BAKAT'),
(304, 5316, 53, 'KAB NAGEKEO'),
(305, 5317, 53, 'KAB SUMBA TENGAH'),
(306, 5318, 53, 'KAB SUMBA BARAT DAYA'),
(307, 5319, 53, 'KAB MANGGARAI TIMUR'),
(308, 5320, 53, 'KAB SABU RAIJUA'),
(309, 5371, 53, 'KOTA KUPANG'),
(310, 6101, 61, 'KAB SAMBAS'),
(311, 6102, 61, 'KAB PONTIANAK'),
(312, 6103, 61, 'KAB SANGGAU'),
(313, 6104, 61, 'KAB KETAPANG'),
(314, 6105, 61, 'KAB SINTANG'),
(315, 6106, 61, 'KAB KAPUAS HULU'),
(316, 6107, 61, 'KAB BENGKAYANG'),
(317, 6108, 61, 'KAB LANDAK'),
(318, 6109, 61, 'KAB SEKADAU'),
(319, 6110, 61, 'KAB MELAWI'),
(320, 6111, 61, 'KAB KAYONG UTARA'),
(321, 6112, 61, 'KAB KUBU RAYA'),
(322, 6171, 61, 'KOTA PONTIANAK'),
(323, 6172, 61, 'KOTA SINGKAWANG'),
(324, 6201, 62, 'KAB KOTAWARINGIN BARAT'),
(325, 6202, 62, 'KAB KOTAWARINGIN TIMUR'),
(326, 6203, 62, 'KABKAPUAS'),
(327, 6204, 62, 'KAB BARITO SELATAN'),
(328, 6205, 62, 'KAB BARITO UTARA'),
(329, 6206, 62, 'KAB KATINGAN'),
(330, 6207, 62, 'KAB SERUYAN'),
(331, 6208, 62, 'KAB SUKAMARA'),
(332, 6209, 62, 'KAB LAMANDAU'),
(333, 6210, 62, 'KAB GUNUNG MAS'),
(334, 6211, 62, 'KAB PULANG PISAU'),
(335, 6212, 62, 'KAB MURUNG RAYA'),
(336, 6213, 62, 'KAB BARITO TIMUR'),
(337, 6271, 62, 'KOTA PALANGKARAYA'),
(338, 6301, 63, 'KAB TANAH LAUT'),
(339, 6302, 63, 'KAB KOTABARU'),
(340, 6303, 63, 'KAB BANJAR'),
(341, 6304, 63, 'KAB BARITO KUALA'),
(342, 6305, 63, 'KAB TAPIN'),
(343, 6306, 63, 'KAB HULU SUNGAI SELATAN'),
(344, 6307, 63, 'KAB HULU SUNGAI TENGAH'),
(345, 6308, 63, 'KAB HULU SUNGAI UTARA'),
(346, 6309, 63, 'KAB TABALONG'),
(347, 6310, 63, 'KAB TANAH BUMBU'),
(348, 6311, 63, 'KAB BALANGAN'),
(349, 6371, 63, 'KOTA BANJARMASIN'),
(350, 6372, 63, 'KOTA BANJARBARU'),
(351, 6401, 64, 'KAB PASER'),
(352, 6402, 64, 'KAB KUTAI KARTANEGARA'),
(353, 6403, 64, 'KAB BERAU'),
(354, 6404, 64, 'KAB BULUNGAN'),
(355, 6405, 64, 'KABNUNUKAN'),
(356, 6406, 64, 'KAB MALINAU'),
(357, 6407, 64, 'KAB KUTAI BARAT'),
(358, 6408, 64, 'KAB KUTAI TIMUR'),
(359, 6409, 64, 'KAB PENAJAM PASER UTARA'),
(360, 6410, 64, 'KAB TANA TIDUNG'),
(361, 6471, 64, 'KOTA BALIKPAPAN'),
(362, 6472, 64, 'KOTA SAMARINDA'),
(363, 6473, 64, 'KOTA TARAKAN'),
(364, 6474, 64, 'KOTA BONTANG'),
(365, 7101, 71, 'KAB BOLAANG MONGONDOW'),
(366, 7102, 71, 'KAB MINAHASA'),
(367, 7103, 71, 'KAB KEPULAUAN SANGIHE'),
(368, 7104, 71, 'KAB KEPULAUAN TALAUD'),
(369, 7105, 71, 'KAB MINAHASA SELATAN'),
(370, 7106, 71, 'KAB MINAHASA UTARA'),
(371, 7107, 71, 'KAB MINAHASA TENGGARA'),
(372, 7108, 71, 'KAB BOLAANG MONGONDOWUT'),
(373, 7109, 71, 'KAB KEP SIAU TAGULANDANG B'),
(374, 7110, 71, 'KAB BOLAANG MONGONDOW TI'),
(375, 7111, 71, 'KAB BOLAANG MONGONDOW SE'),
(376, 7171, 71, 'KOTA MANADO'),
(377, 7172, 71, 'KOTA BITUNG'),
(378, 7173, 71, 'KOTA TOMOHON'),
(379, 7174, 71, 'KOTA KOTAMOBAGU'),
(380, 7201, 72, 'KAB BANGGAI'),
(381, 7202, 72, 'KAB POSO'),
(382, 7203, 72, 'KAB DONGGALA'),
(383, 7204, 72, 'KAB TOLI TOLI'),
(384, 7265, 72, 'KAB BUOL'),
(385, 7264, 72, 'KAB MOROWALI'),
(386, 7207, 72, 'KAB BANGGAI KEPULAUAN'),
(387, 7208, 72, 'KAB PARIGI MOUTONG'),
(388, 7209, 72, 'KAB TOJO UNA UNA'),
(389, 7210, 72, 'KAB SIGI'),
(390, 7271, 72, 'KOTA PALU'),
(391, 7301, 73, 'KAB KEPULAUAN SELAYAR'),
(392, 7302, 73, 'KAB BULUKUMBA'),
(393, 7303, 73, 'KAB BANTAENG'),
(394, 7304, 73, 'KAB JENEPONTO'),
(395, 7305, 73, 'KAB TAKALAR'),
(396, 7306, 73, 'KAB GOWA'),
(397, 7307, 73, 'KAB SINJAI'),
(398, 7308, 73, 'KAB BONE'),
(399, 7309, 73, 'KAB MAROS'),
(400, 7310, 73, 'KAB PANGKAJENE KEPULAUAN'),
(401, 7311, 73, 'KAB BARRU'),
(402, 7312, 73, 'KAB SOPPENG'),
(403, 7313, 73, 'KAB WAJO'),
(404, 7314, 73, 'KAB SIDENRENG RAPPANG'),
(405, 7315, 73, 'KAB PINRANG'),
(406, 7316, 73, 'KAB ENREKANG'),
(407, 7317, 73, 'KAB LUWU'),
(408, 7318, 73, 'KAB TANA TORAJA'),
(409, 7319, 73, 'KAB POLEWALI MAMASA'),
(410, 7320, 73, 'KAB MAJENE'),
(411, 7321, 73, 'KAB MAMUJU'),
(412, 7322, 73, 'KAB LUWU UTARA'),
(413, 7323, 73, 'KAB MAMASA'),
(414, 7324, 73, 'KAB LUWU TIMUR'),
(415, 7325, 73, 'KAB MAMUJU UTARA'),
(416, 7326, 73, 'KAB TORAJA UTARA'),
(417, 7371, 73, 'KOTA MAKASSAR'),
(418, 7372, 73, 'KOTA PARE PARE'),
(419, 7373, 73, 'KOTA PALOPO'),
(420, 7401, 74, 'KAB KOLAKA'),
(421, 7402, 74, 'KAB KONAWE'),
(422, 7403, 74, 'KAB MUNA'),
(423, 7404, 74, 'KAB BUTON'),
(424, 7405, 74, 'KAB KONAWE SELATAN'),
(425, 7406, 74, 'KAB BOMBANA'),
(426, 7407, 74, 'KAB WAKATOBI'),
(427, 7408, 74, 'KAB KOLAKA UTARA'),
(428, 7409, 74, 'KAB KONAWE UTARA'),
(429, 7410, 74, 'KAB BUTON UTARA'),
(430, 7471, 74, 'KOTA KENDARI'),
(431, 7472, 74, 'KOTA BAU BAU'),
(432, 7501, 75, 'KAB GORONTALO'),
(433, 7502, 75, 'KAB BOALEMO'),
(434, 7503, 75, 'KAB BONE BOLANGO'),
(435, 7504, 75, 'KAB PAHUWATO'),
(436, 7505, 75, 'KAB GORONTALO UTARA'),
(437, 7571, 75, 'KOTA GORONTALO'),
(438, 7601, 76, 'KAB MAMUJU UTARA'),
(439, 7602, 76, 'KAB MAMUJU'),
(440, 7603, 76, 'KAB MAMASA'),
(441, 7604, 76, 'KAB POLEWALI MANDAR'),
(442, 7605, 76, 'KAB MAJENE'),
(443, 8101, 81, 'KAB MALUKU TENGAH'),
(444, 8102, 81, 'KAB MALUKU TENGGARA'),
(445, 8103, 81, 'KAB MALUKU TENGGARA BARAT'),
(446, 8104, 81, 'KAB BURU'),
(447, 8105, 81, 'KAB SERAM BAGIAN TIMUR'),
(448, 8106, 81, 'KAB SERAM BAGIAN BARAT'),
(449, 8107, 81, 'KAB KEPULAUAN ARU'),
(450, 8108, 81, 'KAB MALUKU BARAT BAYA'),
(451, 8109, 81, 'KAB BURU SELATAN'),
(452, 8171, 81, 'KOTA AMBON'),
(453, 8172, 81, 'KOTA TUAL'),
(454, 8201, 82, 'KAB HALMAHERA BARAT'),
(455, 8202, 82, 'KAB HALMAHERA TENGAH'),
(456, 8203, 82, 'KAB HALMAHERA UTARA'),
(457, 8204, 82, 'KAB HALMAHERA SELATAN'),
(458, 8205, 82, 'KAB KEPULAUAN SULA'),
(459, 8206, 82, 'KAB HALMAHERA TIMUR'),
(460, 8207, 82, 'KAB PULAU MOROTAI'),
(461, 8271, 82, 'KOTA TERNATE'),
(462, 8272, 82, 'KOTA TIDORE KEPULAUAN'),
(463, 9101, 91, 'KAB MERAUKE'),
(464, 9102, 91, 'KAB JAYAWIJAYA'),
(465, 9103, 91, 'KAB JAYAPURA'),
(466, 9104, 91, 'KAB NABIRE'),
(467, 9105, 91, 'KAB KEPULAUAN YAPEN'),
(468, 9106, 91, 'KAB BIAK NUMFOR'),
(469, 9107, 91, 'KAB PUNCAK JAYA'),
(470, 9108, 91, 'KAB PANIAI'),
(471, 9109, 91, 'KAB MIMIKA'),
(472, 9110, 91, 'KAB SARMI'),
(473, 9111, 91, 'KAB KEEROM'),
(474, 9112, 91, 'KAB PEGUNUNGAN BINTANG'),
(475, 9113, 91, 'KAB YAHUKIMO'),
(476, 9114, 91, 'KAB TOLIKARA'),
(477, 9115, 91, 'KAB WAROPEN'),
(478, 9116, 91, 'KAB BOVEN DIGOEL'),
(479, 9117, 91, 'KAB MAPPI'),
(480, 9118, 91, 'KAB ASMAT'),
(481, 9119, 91, 'KAB SUPIORI'),
(482, 9120, 91, 'KAB MAMBERAMO RAYA'),
(483, 9121, 91, 'KAB MAMBERAMO TENGAH'),
(484, 9122, 91, 'KAB YALIMO'),
(485, 9123, 91, 'KAB LANNY JAYA'),
(486, 9124, 91, 'KAB NDUGA'),
(487, 9125, 91, 'KAB PUNCAK'),
(488, 9126, 91, 'KAB DOGIYAI'),
(489, 9127, 91, 'KAB INTAN JAYA'),
(490, 9128, 91, 'KAB DEIYAI'),
(491, 9171, 91, 'KOTA JAYAPURA'),
(492, 9201, 92, 'KAB SORONG'),
(493, 9202, 92, 'KAB MANOKWARI'),
(494, 9203, 92, 'KAB FAKFAK'),
(495, 9204, 92, 'KAB SORONG SELATAN'),
(496, 9205, 92, 'KAB RAJA AMPAT'),
(497, 9206, 92, 'KAB TELUK BINTUNI'),
(498, 9207, 92, 'KAB TELUK WONDAMA'),
(499, 9208, 92, 'KAB KAIMANA'),
(500, 9209, 92, 'KAB TAMBRAUW'),
(501, 9210, 92, 'KABMAYBRAT'),
(502, 9271, 92, 'KOTASORONG');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_id` bigint(20) NOT NULL,
  `term_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `css_icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `parent` varchar(1) DEFAULT 'N',
  `link_parent_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `id_grub` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`link_id`, `term_id`, `url`, `text`, `css_icon`, `image`, `target`, `description`, `type`, `parent`, `link_parent_id`, `created_at`, `sort_order`, `id_grub`) VALUES
(78, NULL, 'account/dashboard', 'Dashboard', '<i class=\"fa fa-th-large\"></i>', NULL, NULL, 'Dashboard Admin Page', 'backend_menu', 'Y', NULL, '2015-10-30 18:51:27', 1, 1),
(86, NULL, '#', 'Pembangkit', '<i class=\"fa fa-bolt\"></i>', '', '_blank', 'Pembangkit', 'backend_menu', 'Y', 0, '2016-03-20 14:07:48', 2, 1),
(113, NULL, '#', 'Administrasi', '<i class=\"fa fa-users\"></i>', '', '', 'Administration', 'backend_menu', 'Y', NULL, '2015-11-01 12:08:18', 7, 1),
(114, NULL, 'account/user', 'User', '', '', '', 'Manajemen user', 'backend_menu', 'N', 113, '2015-11-01 12:08:18', 1, 1),
(116, NULL, 'frontend/registrasi', 'Registrasi SLO', '<i class=\"fa fa-archive\"></i>', NULL, '_blank', 'Register SLO', 'backend_menu', 'Y', NULL, NULL, 1, 2),
(117, NULL, 'account/dashboard', 'Dashboard', '<i class=\"fa fa-th-large\"></i>', '', '', 'Dashboard Admin Page', 'backend_menu', 'Y', NULL, '2015-10-30 18:51:27', 1, 2),
(125, NULL, '#', 'Distribusi', '<i class=\"fa fa-tasks\"></i>', NULL, '_self', 'Distribusi', 'backend_menu', 'Y', 0, '2016-03-20 14:13:16', 4, 1),
(126, NULL, '#', 'Pemanfaatan', '<i class=\"fa fa-birthday-cake\"></i>', NULL, '_self', 'Pemanfaatan', 'backend_menu', 'Y', 0, '2016-03-20 14:16:01', 5, 1),
(127, NULL, 'account/pembangkit/news', 'Data Baru', '', NULL, '_self', 'Pengajuan Baru', 'backend_menu', 'N', 86, '2016-03-20 18:59:24', 1, 1),
(128, NULL, 'account/pembangkit/result', 'Data Hasil', '', NULL, '_self', 'Data Hasil', 'backend_menu', 'N', 86, '2016-03-20 19:01:29', 2, 1),
(131, NULL, 'account/distribusi/news', 'Data Baru', '', '', '_self', 'Pengajuan Baru', 'backend_menu', 'N', 125, '2016-03-20 18:59:24', 1, 1),
(132, NULL, 'account/distribusi/result', 'Data Hasil', '', '', '_self', 'Data Hasil', 'backend_menu', 'N', 125, '2016-03-20 19:01:29', 2, 1),
(133, NULL, 'account/pemanfaatan/news', 'Data Baru', '', '', '_self', 'Pengajuan Baru', 'backend_menu', 'N', 126, '2016-03-20 18:59:24', 1, 1),
(134, NULL, 'account/pemanfaatan/result', 'Data Hasil', '', '', '_self', 'Data Hasil', 'backend_menu', 'N', 126, '2016-03-20 19:01:29', 2, 1),
(137, NULL, '#', 'Pembangkit', '<i class=\"fa fa-bolt\"></i>', '', '_blank', 'Pembangkit', 'backend_menu', 'Y', 0, '2016-03-20 14:07:48', 2, 2),
(141, NULL, '#', 'Distribusi', '<i class=\"fa fa-tasks\"></i>', '', '_self', 'Distribusi', 'backend_menu', 'Y', 0, '2016-03-20 14:13:16', 4, 2),
(142, NULL, '#', 'Pemanfaatan', '<i class=\"fa fa-birthday-cake\"></i>', '', '_self', 'Pemanfaatan', 'backend_menu', 'Y', 0, '2016-03-20 14:16:01', 5, 2),
(143, NULL, 'account/pembangkit/news', 'Data Baru', '', '', '_self', 'Pengajuan Baru', 'backend_menu', 'N', 137, '2016-03-20 18:59:24', 1, 2),
(144, NULL, 'account/pembangkit/result', 'Data Hasil', '', '', '_self', 'Data Hasil', 'backend_menu', 'N', 137, '2016-03-20 19:01:29', 2, 2),
(147, NULL, 'account/distribusi/news', 'Data Baru', '', '', '_self', 'Pengajuan Baru', 'backend_menu', 'N', 141, '2016-03-20 18:59:24', 1, 2),
(148, NULL, 'account/distribusi/result', 'Data Hasil', '', '', '_self', 'Data Hasil', 'backend_menu', 'N', 141, '2016-03-20 19:01:29', 2, 2),
(149, NULL, 'account/pemanfaatan/news', 'Data Baru', '', '', '_self', 'Pengajuan Baru', 'backend_menu', 'N', 142, '2016-03-20 18:59:24', 1, 2),
(150, NULL, 'account/pemanfaatan/result', 'Data Hasil', '', '', '_self', 'Data Hasil', 'backend_menu', 'N', 142, '2016-03-20 19:01:29', 2, 2),
(151, NULL, 'frontend/registrasi', 'Registrasi SLO', '<i class=\"fa fa-archive\"></i>', '', '_blank', 'Register SLO', 'backend_menu', 'Y', NULL, '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `name`, `value`) VALUES
(1, 'site_url', 'http://www.saranadeteksienergi.com'),
(2, 'home_title', 'Sarana Deteksi Energi'),
(3, 'site_key', 'Sarana Deteksi Energi'),
(4, 'site_description', 'Sarana Deteksi Energi'),
(5, 'users_can_register', '0'),
(6, 'admin_email', 'webmaster@saranadeteksienergi.com'),
(7, 'posts_per_page', '10'),
(8, 'template', 'sde'),
(9, 'comments_per_page', '50'),
(10, 'site_logo', NULL),
(11, 'homepage_post_limit', '5'),
(12, 'headline_limit', '10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext,
  `caption` varchar(255) DEFAULT NULL,
  `post_status` varchar(20) DEFAULT NULL COMMENT 'Draft/Publish/Archive',
  `post_type` varchar(20) DEFAULT NULL COMMENT 'page/post',
  `post_format` varchar(20) DEFAULT NULL,
  `mime_type` varchar(30) DEFAULT NULL,
  `file_path` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `can_comment` varchar(1) DEFAULT 'N',
  `comment_count` bigint(20) DEFAULT NULL,
  `coordinate_y` varchar(100) NOT NULL,
  `coordinate_x` varchar(100) NOT NULL,
  `hit` bigint(20) DEFAULT '0',
  `old_post_id` varchar(20) DEFAULT NULL COMMENT 'Untuk kebutuhan migrasi saja, selanjutnya dihapus',
  `old_post_category` varchar(20) DEFAULT NULL COMMENT 'Untuk kebutuhan migrasi saja, selanjutnya dihapus',
  `headline` char(1) DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_meta`
--

CREATE TABLE `post_meta` (
  `post_meta_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_meta`
--

INSERT INTO `post_meta` (`post_meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 9665, 'keywords', ''),
(2, 9665, 'description', ''),
(3, 9666, 'keywords', ''),
(4, 9666, 'description', ''),
(5, 9667, 'keywords', ''),
(6, 9667, 'description', '');

-- --------------------------------------------------------

--
-- Table structure for table `post_term`
--

CREATE TABLE `post_term` (
  `post_term_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `term_id` int(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `kode_prov` int(11) NOT NULL,
  `prov` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`kode_prov`, `prov`) VALUES
(11, 'ACEH'),
(12, 'SUMATERA UTARA'),
(13, 'SUMATERA BARAT'),
(14, 'RIAU'),
(15, 'JAMBI'),
(16, 'SUMATERA SELATAN'),
(17, 'BENGKULU'),
(18, 'LAMPUNG'),
(19, 'KEPULAUAN BANGKA BELITUNG'),
(21, 'KEPULAUAN RIAU'),
(31, 'DKI JAKARTA'),
(32, 'JAWA BARAT'),
(33, 'JAWA TENGAH'),
(34, 'DI YOGYAKARTA'),
(35, 'JAWA TIMUR'),
(36, 'BANTEN'),
(51, 'BALI'),
(52, 'NUSA TENGGARA BARAT'),
(53, 'NUSA TENGGARA TIMUR'),
(61, 'KALIMANTAN BARAT'),
(62, 'KALIMANTAN TENGAH'),
(63, 'KALIMANTAN SELATAN'),
(64, 'KALIMANTAN TIMUR'),
(65, 'KALIMANTAN UTARA'),
(71, 'SULAWESI UTARA'),
(72, 'SULAWESI TENGAH'),
(73, 'SULAWESI SELATAN'),
(74, 'SULAWESI TENGGARA'),
(75, 'GORONTALO'),
(76, 'SULAWESI BARAT'),
(81, 'MALUKU'),
(82, 'MALUKU UTARA'),
(92, 'PAPUA BARAT'),
(91, 'PAPUA');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `description`) VALUES
(1, 'INSERT', 'Insert Data'),
(2, 'UPDATE', 'Update Data'),
(3, 'DELETE', 'Delete Data'),
(4, 'BROWSE_SELF', 'Browse Data'),
(5, 'BROWSE_ALL', 'Browse All Data'),
(6, 'APPROVE', 'Approve Data'),
(7, 'PUBLISH', 'Publish Data'),
(8, 'UPLOAD', 'Upload File/Data'),
(9, 'PRINT_PDF', 'Print PDF'),
(10, 'PRINT_DOC', 'Print DOC'),
(11, 'PRINT_XLS', 'Print XLS');

-- --------------------------------------------------------

--
-- Table structure for table `sk`
--

CREATE TABLE `sk` (
  `id_sk` int(20) NOT NULL,
  `nomorsk` varchar(50) DEFAULT NULL,
  `perusahaan` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sk`
--

INSERT INTO `sk` (`id_sk`, `nomorsk`, `perusahaan`, `tanggal`) VALUES
(1, '0/SDE/SK/III/2018', 'tes', '2018-03-05'),
(2, '1/SDE/SK/III/2018', 'PT. ANDHIKA MAKMUR PERSADA', '2018-03-15'),
(3, '2/SDE/SK/III/2018', 'Pernyataan Direktur Utama ke ESDM Jakarta', '0000-00-00'),
(4, '3/SDE/SK/III/2018', 'PT. CIPTA SELARAS NUSANTARA', '0000-00-00'),
(5, '4/SDE/SK/V/2018', 'PT. MULIA CEMERLANG (SUKABUMI)', '0000-00-00'),
(6, '5/SDE/SK/V/2018', 'Hotel Sarinah Bandung', '0000-00-00'),
(7, '6/SDE/SK/V/2018', 'PT. HA TIRE', '2018-05-16'),
(8, '7/SDE/SK/V/2018', 'PT. TELKOMSEL (NEGERI BATIN 2)', '0000-00-00'),
(9, '28/SDE/SK/VII/2018', 'PT. RUCIKA ', '2018-07-02');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text,
  `type` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_bahan_bakar`
--

CREATE TABLE `t_bahan_bakar` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_bahan_bakar`
--

INSERT INTO `t_bahan_bakar` (`id`, `nama`) VALUES
(1, 'Batubara'),
(2, 'Air'),
(3, 'Gas'),
(4, 'HSD/MFO/LFO'),
(5, 'Panas Bumi'),
(6, 'Nuklir'),
(7, 'EBT Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `t_cetak_ulang_slo_api`
--

CREATE TABLE `t_cetak_ulang_slo_api` (
  `id_api_cetak_slo` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` longblob,
  `nomorKTP` varchar(50) DEFAULT NULL,
  `nomorRegistrasiSLO` varchar(50) DEFAULT NULL,
  `nomorSLO` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_distribusi`
--

CREATE TABLE `t_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `kode_provinsi` varchar(50) DEFAULT NULL,
  `kode_kota` varchar(50) DEFAULT NULL,
  `nama_distribusi` varchar(100) NOT NULL,
  `alamat_distribusi` text NOT NULL,
  `tujuan_pemasangan` varchar(50) DEFAULT NULL,
  `kode_jid` varchar(50) DEFAULT NULL,
  `kode_uptl` varchar(50) DEFAULT NULL,
  `kode_ksj` varchar(50) DEFAULT NULL,
  `kode_sj` varchar(50) DEFAULT NULL,
  `kode_tegangan_pengenal` varchar(50) DEFAULT NULL,
  `jtr` varchar(50) DEFAULT NULL,
  `sutr` varchar(50) DEFAULT NULL,
  `sktr` varchar(50) DEFAULT NULL,
  `jtm` varchar(255) DEFAULT NULL,
  `sutm` varchar(255) DEFAULT NULL,
  `sktm` varchar(255) DEFAULT NULL,
  `cubicle` varchar(50) DEFAULT NULL,
  `tp` varchar(255) DEFAULT NULL,
  `kgd` varchar(255) DEFAULT NULL,
  `jgd` varchar(100) DEFAULT NULL,
  `jp` varchar(100) DEFAULT NULL,
  `kahs` varchar(100) DEFAULT NULL,
  `unit2` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_distribusi`
--

INSERT INTO `t_distribusi` (`id_distribusi`, `id_pemohon`, `kode_provinsi`, `kode_kota`, `nama_distribusi`, `alamat_distribusi`, `tujuan_pemasangan`, `kode_jid`, `kode_uptl`, `kode_ksj`, `kode_sj`, `kode_tegangan_pengenal`, `jtr`, `sutr`, `sktr`, `jtm`, `sutm`, `sktm`, `cubicle`, `tp`, `kgd`, `jgd`, `jp`, `kahs`, `unit2`) VALUES
(1, '00C', '', '', 'TBG_TSEL_WKB108_SMPN1LOLI', 'Jl. Basuki Rahmat Rt. 02/02, Dusun II Desa Bera Dolu Kec. Loli Kab. Sumba Barat Prov. NTT', 'Pasang Baru', '311', 'P', '2', 'N', '15', '-', '-', '-', '-', '-', '', '-', '20', '25', '1', '1', '0.43', NULL),
(2, '00D', '', '', 'TBG_TSEL_WKB117_WANGASPAR', 'Jl. Palangata Km.6 Rt. 01/08, Kel. Dira Tana Kec. Loli Kab. Sumba Barat – Prov. NTT', 'Pasang Baru', '311', 'P', '2', 'N', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,43', NULL),
(3, '00Q', '', '', 'TBG_TSEL_MAB 130_TENAM _2 qq PT. PLN (Persero) WS2JB', 'Desa Pasir Putih Rt. 14 Desa Candi Kec. Tanah Sepenggal, Kab. Bungo, Prov. Jambi', 'Pasang Baru', '311', 'P', '2', 'F', '15', '-', '-', '-', '-', '-', '-', '-', '20', '10,6', '1', '1', '125', NULL),
(4, '00Y', '', '', 'TBG_TSEL_KAI035_TELUKMUTE3, qq. PT. PLN (Persero) Area Kupang', 'Jl. Watatuku Rt. 002/001, Kel. Walai Timur, Kec. Teluk Mutiara, Kab. Alor Nusa Tenggara Timur', '', '311', 'P', '2', 'N', '15', '', '', '', '', '', '', '', '20', '', '1', '1', '', NULL),
(5, '00Z', '', '', 'TBG_TSEL_KAI035_TELUKMUTE3, qq. PT. PLN (Persero) Area Kupang', 'Jl. Watatuku Rt. 002/001, Kel. Walai Timur, Kec. Teluk Mutiara, Kab. Alor Nusa Tenggara Timur', 'Pasang Baru', '311', 'P', '2', 'N', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,250', NULL),
(6, '010', '', '', 'Telkomsel KAI012 SITE MORU qq. PT. PLN (Persero) Area Kupang', 'Kelurahan Moru, Kecamatan Alor Barat Daya, Kab. Alor, Prov. Nusa Tenggara Timur', 'Pasang Baru', '311', 'P', '2', 'N', '15', '-', '-', '-', '-', '-', '-', '-', '20 ', '50', '1', '1', '0,250', NULL),
(7, '011', '', '', 'Telkomsel KAI012 SITE MORU qq. PT. PLN (Persero) Area Kupang', 'Kelurahan Moru, Kecamatan Alor Barat Daya, Kab. Alor, Prov. Nusa Tenggara Timur', 'Pasang Baru', '311', 'P', '2', 'N', '15', '-', '-', '-', '-', '-', '-', '-', '20 ', '25', '1', '1', '0,250', NULL),
(8, '012', '', '', 'TBG_TSEL_PBM078_SUKARAJA ', 'Jl. SMPN 9, Dusun V Desa Tanjung Telang Kec. Prabumulih Barat, Prov. Sumatera Selatan', 'Pasang Baru', '311', 'P', '2', 'F', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,063', NULL),
(10, '01H', '', '', 'GARDU DISTRIBUSI RSUD PESISIR BARAT', 'Desa Seray Waikujir No. 12 Kec. Krui Selatan, Kab. Lampung Barat - Prov. Lampung', 'Pasang Baru', '311', 'P', '1', 'U', '15', '-', '-', '-', '-', '0,080', '-', '-', '20', '160', '1', '1', '0,4', NULL),
(9, '013', '', '', 'TBG_TSEL_PBM077_TJ_TELANG ', 'Jl. SMPN 9, Dusun V, Desa Tanjung Telang Kec. Prabumulih Barat Prov. Sumatera Utara', 'Pasang baru', '311', 'P', '2', 'F', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,063', NULL),
(11, '01Y', '', '', 'TBG_TSEL_PBM078_SUKARAJA', 'Jl. Pertamina Talang Jimar Kota Prabumulih Privinsi Sumatera Selatan', 'Pasang Baru', '311', 'P', '2', 'F', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,063', NULL),
(12, '03D', '', '', 'tes', 'tes', 'tes3', '311', 'O', '1', 'A', '11', '10', '10', '10', '10', '10', '10', '1', '200', '10', '1', '1', '10', NULL),
(13, '03E', '', '', 'tes', 'tes', 'tess', '311', 'O', '1', 'A', '11', '24', '22', '22', '22', '22', '22', '1', '22', '22', '1', '1', '2', NULL),
(14, '04V', '16', '1607', 'Telkomsel-PBI080', 'Jl. Dusun II Kelapa Dua Rt. 005/002 Kel. Kelapa Dua Kec. Pulau Rimau, Kab. Banyuasin Provinsi Sumatera Selatan', '', '311', 'P', '2', 'E', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,16', NULL),
(15, '04W', '16', '1607', 'Telkomsel-PBI080', 'Jl. Dusun II Kelapa Dua Rt. 005/002 Kel. Kelapa Dua Kec. Pulau Rimau, Kab. Banyuasin Provinsi Sumatera Selatan', 'Pasang Baru', '311', 'P', '2', 'E', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,160', NULL),
(16, '053', NULL, NULL, 'NEGERI BATIN 2/BLU037 (PT. Telkomsel)', 'Desa Negara Batin Rt. 08/02, Kec. Negara Batin, Way Kanan Provinsi Lampung', '', '311', 'P', '2', 'U', '15', '-', '-', '-', '-', '0,16', '-', '-', '20', '25', '1', '1', '', NULL),
(17, '054', '18', '1808', 'NEGERI BATIN 2/BLU037 (PT. Telkomsel)', 'Desa Negara Batin Rt. 08/02, Kec. Negara Batin, Way Kanan Provinsi Lampung', 'Pasang Baru', '311', 'P', '2', 'U', '15', '-', '-', '-', '-', '-', '-', '-', '20', '25', '1', '1', '0,16', NULL),
(18, '056', '16', '1607', 'test', 'test', 'Pasang Baru', '311', 'O', '1', 'T', '11', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_hasil_permohonan_api`
--

CREATE TABLE `t_hasil_permohonan_api` (
  `id_api_hasil_permohonan` int(11) NOT NULL,
  `nomorpermohonan` varchar(50) DEFAULT NULL,
  `no_agenda` varchar(255) DEFAULT NULL,
  `hasilPermohonan` varchar(50) DEFAULT NULL,
  `noRegistrasiSLO` varchar(50) DEFAULT NULL,
  `tanggalTerbitSLO` date DEFAULT NULL,
  `tanggalBerakirSLO` date DEFAULT NULL,
  `alasanPenolakan` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_hasil_permohonan_api`
--

INSERT INTO `t_hasil_permohonan_api` (`id_api_hasil_permohonan`, `nomorpermohonan`, `no_agenda`, `hasilPermohonan`, `noRegistrasiSLO`, `tanggalTerbitSLO`, `tanggalBerakirSLO`, `alasanPenolakan`) VALUES
(1, '2274091321233', '', '1', 'FBG4.17', '2017-06-15', '2027-06-15', NULL),
(2, '2234761324621', '', '1', 'FBG9.17', '2017-06-15', '2027-06-15', NULL),
(3, '1916062968743', '', '1', 'FBN7.17', '2017-06-19', '2027-06-19', NULL),
(4, '1738193833889', '', '1', 'FBT2.17', '2017-06-21', '2027-06-21', NULL),
(5, '1151154859813', '', '0', NULL, '0000-00-00', '0000-00-00', 'kapasitas trafo 4000 kVA  200 kVA lebih kecil dari daya terpasang sebesar 5190 kVA,\r\n\r\ntitik koordinat tidak sesuai lokasi instalasi (surat permohonan dan SLD menunjukkan lokasi ada di bendung cipasauran)'),
(6, '7200099785115', '', '1', 'GBU7.17', '2017-07-04', '2027-07-04', NULL),
(7, '8182848979185', '', '1', 'GC30.17', '2017-07-06', '2027-07-06', NULL),
(8, '6985008717889', '', '0', NULL, '0000-00-00', '0000-00-00', 'untuk instalasi distribusi yang tersambung dengan penyedia tenaga listrik (PLN) menggunakan qq PT PLN (Persero)pada nama pemilik instalasi'),
(9, '1171328133635', '', '0', NULL, '0000-00-00', '0000-00-00', 'untuk instalasi distribusi yang tersambung dengan penyedia tenaga listrik (PLN) menggunakan qq PT PLN (Persero)pada nama pemilik instalasi'),
(10, '1843718586374', '', '1', 'GC58.17', '2017-07-11', '2027-07-11', NULL),
(11, '6985008717889', '', '1', 'GCD4.17', '2017-07-17', '2027-07-17', NULL),
(12, '1171328133635', '', '1', 'GCD5.17', '2017-07-17', '2027-07-17', NULL),
(13, '2582402811227', '', '1', 'GCE2.17', '2017-07-17', '2027-07-17', NULL),
(14, '1151154859813', '', '0', NULL, '0000-00-00', '0000-00-00', 'kapasitas trafo 4000 kVA  200 kVA lebih kecil dari daya terpasang sebesar 5190 kVA\r\n\r\nmohon dilampirkan surat keterangan dari penanggung jawab/pemilik instalasi bahwa peralatan yang dipasang dapat dioperasikan dengan baik meskipun trafo lebih kecil kapasitanya dari daya terpasng.'),
(15, '4432161926238', '', '1', 'GCY6.17', '2017-07-24', '2027-07-24', NULL),
(16, '9574100548939', '', '0', NULL, '0000-00-00', '0000-00-00', 'File LHPP Tidak dapat diakses (perlu akses login), mohon diperbaiki'),
(17, '1207774191025', '', '0', NULL, '0000-00-00', '0000-00-00', 'BA pemeriksaan dan pegujian terlampir tidak sesuai dengan instalasi'),
(18, '2200181185715', '', '0', NULL, '0000-00-00', '0000-00-00', 'BA Pemeriksaan dan Pengujian Tidak sesuai dengan instlasi yang diperiksa'),
(19, '2337819518151', '', '0', NULL, '0000-00-00', '0000-00-00', 'BA Pemeriksaan dan Pengujian Tidak sesuai dengan instalasi yang diperiksa'),
(20, '2337819518151', '', '0', NULL, '0000-00-00', '0000-00-00', 'BA Pemeriksaan dan Pengujian Tidak sesuai dengan instalasi yang diperiksa'),
(21, '2200181185715', '', '1', 'HDD4.17', '2017-08-02', '2027-08-02', NULL),
(22, '2337819518151', '', '1', 'HDD5.17', '2017-08-02', '2027-08-02', NULL),
(23, '9574100548939', '', '1', 'HDD6.17', '2017-08-02', '2027-08-02', NULL),
(24, '1207774191025', '', '1', 'HDD7.17', '2017-08-02', '2027-08-02', NULL),
(25, '1151154859813', '', '1', 'HDD8.17', '2017-08-02', '2027-08-02', NULL),
(26, '1812268895268', '', '0', NULL, '0000-00-00', '0000-00-00', 'Kode Badan Usaha menggunakan 0000 tidak disertai dengan surata pernyataan.'),
(27, '2886548885215', '', '1', 'HDQ9.17', '2017-08-09', '2027-08-09', NULL),
(28, '2894652552897', '', '1', 'HDR1.17', '2017-08-09', '2027-08-09', NULL),
(29, '1812268895268', '', '0', NULL, '0000-00-00', '0000-00-00', 'Kode Badan Usaha menggunakan 0000 yang tidak disertai dengan surat pernyataan dari pemilik instalasi.'),
(30, '2741796428254', '', '1', 'HE85.17', '2017-08-14', '2027-08-14', NULL),
(31, '1033357288192', '', '1', 'HEB3.17', '2017-08-18', '2027-08-18', NULL),
(32, '1812268895268', '', '1', 'HEB4.17', '2017-08-18', '2027-08-18', NULL),
(33, '2924610884619', '', '1', 'HEJ7.17', '2017-08-18', '2027-08-18', NULL),
(34, '2906934502565', '', '1', 'IF98.17', '2017-09-08', '2027-09-08', NULL),
(35, '2181911704177', '', '1', 'IFB7.17', '2017-09-11', '2027-09-11', NULL),
(36, '1042617855803', '', '1', 'IFB8.17', '2017-09-11', '2027-09-11', NULL),
(37, '2498527393901', '', '1', 'IFB9.17', '2017-09-11', '2027-09-11', NULL),
(38, '6581122051548', '', '1', 'IFC1.17', '2017-09-11', '2027-09-11', NULL),
(39, '1566117381761', '', '1', 'IFS1.17', '2017-09-15', '2027-09-15', NULL),
(40, '1128975671637', '', '0', NULL, '0000-00-00', '0000-00-00', 'tidak mencantumkan foto pelaksana TT saat melaksanakan pemeriksaan dan pengujian'),
(41, '1128975671637', '', '1', 'IGA2.17', '2017-09-27', '2027-09-27', NULL),
(42, '2811382599819', '', '1', 'IGA9.17', '2017-09-27', '2027-09-27', NULL),
(43, '2455951504232', '', '0', NULL, '0000-00-00', '0000-00-00', 'Nama pemilik seharusnya menggunakan qq PLN, dan foto pelaksanaan sertifikasi TT tidak tercantum'),
(44, '1147772558479', '', '0', NULL, '0000-00-00', '0000-00-00', 'Nama pemilik seharusnya menggunakan qq PLN, dan foto pelaksanaan sertifikasi TT tidak tercantum'),
(45, '2455951504232', '', '0', NULL, '0000-00-00', '0000-00-00', 'foto pelaksana pemeriksaan dan pengujian dilapangan tidak sesuai dengan TT dan PJT dari PT SDE'),
(46, '1789576751616', '', '1', 'JGX6.17', '2017-10-09', '2027-10-09', NULL),
(47, '1167880465908', '', '1', 'JGX9.17', '2017-10-06', '2027-10-06', NULL),
(48, '1725077108660', '', '1', 'JGY1.17', '2017-10-06', '2027-10-06', NULL),
(49, '1030609807005', '', '0', NULL, '0000-00-00', '0000-00-00', 'titik koordinat tidak sesuai dengan lokasi instalasi'),
(50, '4113079654905', '', '0', NULL, '0000-00-00', '0000-00-00', 'Mohon diperhatikan spelling nama pemilik di LHPP dan sistem menggunakan penamaan yang sesuai'),
(51, '1147772558479', '', '1', 'JH54.17', '2017-10-10', '2027-10-10', NULL),
(52, '8828113739642', '', '1', 'JH75.17', '2017-10-12', '2027-10-12', NULL),
(53, '2249913744878', '', '1', 'JH76.17', '2017-10-12', '2027-10-12', NULL),
(54, '4403979045174', '', '1', 'JHK2.17', '2017-10-18', '2027-10-18', NULL),
(55, '1247364926219', '', '1', 'JHK3.17', '2017-10-18', '2027-10-18', NULL),
(56, '1525103390946', '', '1', 'JHK5.17', '2017-10-18', '2027-10-18', NULL),
(57, '1030609807005', '', '1', 'JHK6.17', '2017-10-18', '2027-10-18', NULL),
(58, '4113079654905', '', '1', 'JHK7.17', '2017-10-18', '2027-10-18', NULL),
(59, '1283335063336', '', '1', 'JHV8.17', '2017-10-23', '2027-10-23', NULL),
(60, '9867267942435', '', '0', NULL, '0000-00-00', '0000-00-00', 'titik koordinat tidak sesuai lokasi'),
(61, '2627316210991', '', '1', 'JI97.17', '2017-10-27', '2027-10-27', NULL),
(62, '1278927956273', '', '0', NULL, '0000-00-00', '0000-00-00', 'sesuai Permen ESDM no 10 tahun 2016, Badan usaha Non Badan Hukum (CV) hanya boleh mengerjakan instalasi sampai dengan daya 900 VA.\\r\\n\\r\\nTitik koordinat lokasi instalasi tidak sesuai dengan alamat instalasi'),
(63, '1278927956273', '', '0', NULL, '0000-00-00', '0000-00-00', 'sesuai Permen ESDM no 10 tahun 2016, Badan usaha Non Badan Hukum (CV) hanya boleh mengerjakan instalasi sampai dengan daya 900 VA'),
(64, '1792368813312', '', '1', 'KI97.17', '2017-11-01', '2027-11-01', NULL),
(65, '1330470812490', '', '1', 'KI98.17', '2017-11-01', '2027-11-01', NULL),
(66, '1425669816695', '', '1', 'KII7.17', '2017-11-06', '2027-11-06', NULL),
(67, '9867267942435', '', '0', NULL, '0000-00-00', '0000-00-00', 'titik koordinat tidak sesuai lokasi (lapangan Disjas TNI AD?)'),
(68, '2349275892272', '', '0', NULL, '0000-00-00', '0000-00-00', 'Sesuai Permen 10/2016, bentuk badan usaha pembangunan pemasangan CV hanya untuk instalasi pemanfaatan tenaga listrik TR sampai daya 900 VA.'),
(69, '2911417989155', '', '1', 'KIP7.17', '2017-11-09', '2027-11-09', NULL),
(70, '9867267942435', '', '1', 'KIQ2.17', '2017-11-09', '2027-11-09', NULL),
(71, '2500748256574', '', '1', 'KIQ4.17', '2017-11-09', '2027-11-09', NULL),
(72, '2884519648657', '', '1', 'KIU4.17', '2017-11-10', '2027-11-10', NULL),
(73, '7673622482735', '', '1', 'KIU5.17', '2017-11-10', '2027-11-10', NULL),
(74, '2351073439887', '', '1', 'KJ10.17', '2017-11-14', '2027-11-14', NULL),
(75, '2263904723880', '', '1', 'KJ14.17', '2017-11-20', '2027-11-20', NULL),
(76, '2800634426988', '', '1', 'KJ95.17', '2017-11-20', '2027-11-20', NULL),
(77, '1131519790791', '', '1', 'KJ96.17', '2017-11-20', '2027-11-20', NULL),
(78, '9507943939113', '', '0', NULL, '0000-00-00', '0000-00-00', 'File LHPP terkunci untuk masuk ke sistem PT SDE tidak bisa diakses'),
(79, '9284032607125', '', '1', 'KJL5.17', '2017-11-23', '2027-11-23', NULL),
(80, '6540623593950', '', '1', 'KJM2.17', '2017-11-22', '2027-11-22', NULL),
(81, '1010427705257', '', '1', 'KJN1.17', '2017-11-22', '2027-11-22', NULL),
(82, '3235486412274', '', '0', NULL, '0000-00-00', '0000-00-00', 'BA pemeriksaan tidak sesuai dengan instalasi yang dimaksud'),
(83, '2844842243127', '', '1', 'KJX3.17', '2017-11-27', '2027-11-27', NULL),
(84, '8379278451361', '', '0', NULL, '0000-00-00', '0000-00-00', 'File menggunakan kode 0000 tanpa pembangunan tidak disertakan dengan surat pernyataan,, mohon klarifikasi terdapat 2 permohonan dari PT IMCP,\\r\\n'),
(85, '9507943939113', '', '1', 'LKA7.17', '2017-12-04', '2027-12-04', NULL),
(86, '3068683355900', '', '1', 'LKE5.17', '2017-12-04', '2027-12-04', NULL),
(87, '3235486412274', '', '1', 'LKF4.17', '2017-12-04', '2027-12-04', NULL),
(88, '2349275892272', '', '0', NULL, '0000-00-00', '0000-00-00', 'Sesuai Permen 10/2016, bentuk badan usaha pembangunan pemasangan CV hanya untuk instalasi pemanfaatan tenaga listrik TR sampai daya 900 VA. (pada database masih menggunakan CV)'),
(89, '8379278451361', '', '0', NULL, '0000-00-00', '0000-00-00', 'File menggunakan kode 0000 tanpa pembangunan tidak disertakan dengan surat pernyataan dan BA tidak sesuai instalasi'),
(90, '2626074298978', '', '1', 'LKX5.17', '2017-12-06', '2027-12-06', NULL),
(91, '8379278451361', '', '1', 'LLB9.17', '2017-12-13', '2027-12-13', NULL),
(92, '1892475876295', '', '1', 'LLC1.17', '2017-12-13', '2027-12-13', NULL),
(93, '1698696661081', '', '1', 'LLF2.17', '2017-12-13', '2027-12-13', NULL),
(94, '2106778039865', '', '1', 'LLF3.17', '2017-12-13', '2027-12-13', NULL),
(95, '2724224069696', '', '0', NULL, '0000-00-00', '0000-00-00', 'tolong dicek lagi kapasitas trafo yang diinput pada permohonan, 100 atau 1000 kVA?\\r\\n\\r\\ntolong dicek lagi pada SLD yang dilampirkan, disitu disebutkan nama Instalatir Elektrikal dan Mekanikal (pemasang instalasi listriknya)'),
(96, '8553270648620', '', '1', 'LLH9.17', '2017-12-13', '2027-12-13', NULL),
(97, '5308335386191', '', '1', 'LM73.17', '2017-12-20', '2027-12-20', NULL),
(98, '2617610019504', '', '1', 'LM82.17', '2017-12-20', '2027-12-20', NULL),
(99, '3232722411028', '', '1', 'LM88.17', '2017-12-20', '2027-12-20', NULL),
(100, '1878775743319', '', '1', 'LM92.17', '2017-12-21', '2027-12-21', NULL),
(101, '1076781983443', '', '1', 'LMA5.17', '2017-12-22', '2027-12-22', NULL),
(102, '1305649773528', '', '0', NULL, '0000-00-00', '0000-00-00', 'detail LHPP tidak bisa diakses, harus login ke sistem SDE'),
(103, '1473502959960', '', '1', 'A128.18', '2018-01-09', '2028-01-09', NULL),
(104, '1752504593727', '', '1', 'A129.18', '2018-01-09', '2028-01-09', NULL),
(105, '2555058998199', '', '1', 'A130.18', '2018-01-09', '2028-01-09', NULL),
(106, '8705238640086', '', '1', 'A146.18', '2018-01-09', '2028-01-09', NULL),
(107, '3948784861854', '', '1', 'A151.18', '2018-01-09', '2028-01-09', NULL),
(108, '1905856331933', '', '0', NULL, '0000-00-00', '0000-00-00', 'foto pelaksana pemeriksaan dan pengujian (tenaga teknik) tidak sesuai dengan dokumen pendukung'),
(109, '6921183497239', '', '0', NULL, '0000-00-00', '0000-00-00', 'foto pelaksana pemeriksaan dan pengujian (tenaga teknik) tidak sesuai dengan dokumen pendukung');

-- --------------------------------------------------------

--
-- Table structure for table `t_instalasi`
--

CREATE TABLE `t_instalasi` (
  `id_instalasi` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `nama_instalasi` varchar(255) DEFAULT NULL,
  `alamat_instalasi` varchar(255) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `wilayah_kerja` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_instalasi`
--

INSERT INTO `t_instalasi` (`id_instalasi`, `id_pemohon`, `nama_instalasi`, `alamat_instalasi`, `lokasi`, `wilayah_kerja`) VALUES
(12, '008', 'PT. KRAKATAU TIRTA INDUSTRI', 'Jl. Ir. Sutami Kebonsari Citangkil Cilegon, Banten', 'Jl. Ir. Sutami Kebonsari Citangkil Cilegon, Banten', 'Banten'),
(11, '007', 'PT. MITRA RUBBER SEJATI', 'Kawasan Industri Korin Rt. 16/05  Desa Kembang Kuning, Klapanunggal Bogor', 'Kawasan Industri Korin Rt. 16/05  Desa Kembang Kun', 'Jawa Barat'),
(4, '004', 'WISNU KUNCORO', 'Jl. Lingkar Waleri Desa Tratemulyo Kecamatan Waleri Kabupaten Kendal Provinsi Jawa Tengah', 'Jl. Lingkar Waleri Desa Tratemulyo Kecamatan Waler', 'Jawa Tengah'),
(10, '006', 'BALAI DIKLAT BASARNAS', 'Jl. Raya Jonggol Cariu Ds. Tegal Panjang Kec. Cariu Kab. Bogor', 'Jl. Raya Jonggol Cariu Ds. Tegal Panjang Kec. Cari', 'Provinsi Jawa Barat'),
(9, '005', 'PT. SARANA PROTEINDO UTAMA', 'Kp. Babakan Cikaret Blok Sadang Baru Desa Cidahu, Kec. Pagaden Barat - Subang', 'Kp. Babakan Cikaret Blok Sadang Baru Desa Cidahu, ', 'Provinsi Jawa Barat'),
(13, '009', 'PT. SURYA LESTARI MANDIRI ', 'Kp. Wanakerta Tukmudal Kab. Cirebon, Jawa Barat', 'Kp. Wanakerta Tukmudal Kab. Cirebon, Jawa Barat', 'Jawa Barat'),
(14, '00A', 'PD. PASAR JAYA', 'Jl. Ciledug Raya No. 4 Cipulir', 'Jl. Ciledug Raya No. 4 Cipulir', ''),
(15, '00B', 'PT. KOBA PANGESTU', 'Jl. Babarsari No. 02, Tambakbayan Depok, Sleman, Yoyakarta', 'Jl. Babarsari No. 02, Tambakbayan Depok, Sleman, Y', 'Yogyakarta'),
(16, '00C', 'PT. TELKOMSEL INDONESIA qq PT. PLN (Persero) Wilayah Nusa Tenggara Timur', 'TELKOM Landmark Tower Jl. Jend. Gatot Subroto Kav. 52 Jakarta', 'Jl. Basuki Rahmat Rt. 02/02, Dusun II Desa Bera Do', 'Nusa Tenggara Timur'),
(17, '00D', 'PT. TELKOMSEL INDONESIA qq PT. PLN (Persero) Wilayah Nusa Tenggara Timur', 'TELKOM Landmark Tower Jl. Jend. Gatot Subroto Kav. 52 Jakarta', 'Jl. Palangata Km.6 Rt. 01/08, Kel. Dira Tana Kec. ', 'Nusa Tenggara Timur'),
(18, '00E', 'Sahid Garden Hotel', 'Jl. Babarsari No. 02, Tambakbayan Depok, Sleman, Yoyakarta', 'Jl. Babarsari No. 02, Tambakbayan Depok, Sleman, Y', 'PT. PLN (Persero) Area Yogyakarta'),
(19, '00F', 'PT. Charoen Pokphand Jaya Farm', 'Desa Neglasari Kec. Bojong Kab. Purwakarta', 'Desa Neglasari Kec. Bojong Kab. Purwakarta', 'Provinsi Jawa Barat'),
(20, '00G', 'UNDANA', 'Jl. Adi Soecipto No. 30, Penfui Kupang Nusa Tenggara Timur', 'Jl. Adi Soecipto No. 30, Penfui Kupang Nusa Tengga', 'Nusa Tenggara Timur'),
(21, '00H', 'PT. PUPUK INDONESIA PANGAN ', 'Jl. Raya Kertawinangun Desa Sukahaji Kec. Patrol, Kab. Indramayu ', 'Jl. Raya Kertawinangun Desa Sukahaji Kec. Patrol, ', 'Jawa Barat'),
(22, '00I', 'PT. PROSPECT MOTOR BLOK G7', 'DK. Jl. Mitra Barat I Blok G NO 7 No. 7  KIM Karawang – Jawa Barat', 'DK. Jl. Mitra Barat I Blok G NO 7 No. 7  KIM Karaw', 'Jawa Barat'),
(23, '00J', 'YAYASAN AL FITYAN', 'Dusun Cipicung Desa Mekarsari Kecamatan Cileungsi Kab. Bogor', 'Dusun Cipicung Desa Mekarsari Kecamatan Cileungsi ', 'Jawa Barat'),
(24, '00K', 'TEDDY GUNAWAN', 'Kp. Haseum Sumur Rt. 0/0 Cigorondon', 'Kp. Haseum Sumur Rt. 0/0 Cigorondon', 'Jawa Barat'),
(25, '00L', 'IR. JAMAL ABDUL NASSER', 'Kp. Cipining Kecamatan Sumur Tunggal Jaya', 'Kp. Cipining Kecamatan Sumur Tunggal Jaya', 'Provinsi Banten'),
(26, '00M', 'PT. GRAMEDIA ASRI MEDIA', 'Jl. Matraman Raya No. 46-50 Jakarta Timur', 'Jl. Matraman Raya No. 46-50 Jakarta Timur', 'DKI Jakarta'),
(27, '00N', 'PT. MAHKOTA INTI CITRA', 'Jl. Raya Jatinangor No. 150 Ds. Cikeruh Kec. Jatinangor, Sumedang', 'Jl. Raya Jatinangor No. 150 Ds. Cikeruh Kec. Jatin', ''),
(28, '00O', 'PT. MAHKOTA INTI CITRA', 'Jl. Raya Jatinangor No. 150 Desa Cikeruh Kec. Jarinangor Sumedang Jawa Barat', 'Jl. Raya Jatinangor No. 150 Desa Cikeruh Kec. Jari', 'Jawa Barat'),
(29, '00P', 'PT. Dharma Electrindo Manfacturing', 'Jl wadas blok simaja desa gombong kec. plumbon kab. cirebon', 'Jl wadas blok simaja desa gombong kec. plumbon kab', 'ESDM Provinsi Jawa Barat'),
(30, '00Q', 'PT. TOWER BERSAMA ', 'Jl. Jend. Sudirman, Komp. Sudirman Point Blok B No. 8-10 Palembang', 'Desa Pasir Putih Rt. 14 Desa Candi Kecamatan Tanah', 'Sumatera Selatan'),
(31, '00R', 'RUMDIS UNIVERSITAS PERTAHANAN DAN SARANA PRASARANA', 'Kp. Malimping Desa Sukahati Kecamatan Citereup Kab. Bogor', 'Kp. Malimping Desa Sukahati Kecamatan Citereup Kab', 'Jawa Barat'),
(32, '00S', 'PT. SIDO SARI MULTIFARM', 'Blok Bongas Desa Sindangsari Kec. Luragung Kab. Kuningan Jawa Barat', 'Blok Bongas Desa Sindangsari Kec. Luragung Kab. Ku', 'Jawa Barat'),
(33, '00T', 'PUSLITBANG POLRI', 'Jl. Tonjong Raya Ds. Cimanggis Bj. Gede Rt. 0/0 Cimanggis', 'Jl. Tonjong Raya Ds. Cimanggis Bj. Gede Rt. 0/0 Ci', 'Jawa Barat'),
(34, '00U', 'Hj. MERRY WARTI, SE', 'Jl. Ruguk, Kec. Ketapang Prov. Lampung', 'Jl. Ruguk, Kec. Ketapang Prov. Lampung', 'Provinsi Bandar Lampung'),
(35, '00V', 'Ir. HEMRIZAL, M', 'Jl. H. Komaruddin Gg. Ismail No. 29 Bandar Lampung', 'Jl. H. Komaruddin Gg. Ismail No. 29 Bandar Lampung', 'Provinsi Bandar Lampung'),
(36, '00W', 'PT. INDOKOM SAMUDERA PERSADA', 'Jl. Sumber Nadi Kecamatan Ketapang Bandar Lampung', 'Jl. Sumber Nadi Kecamatan Ketapang Bandar Lampung', 'Provinsi Bandar Lampung'),
(37, '00X', 'PT. SAVERO INDOHOTEL JAYA NUSANTARA', 'Jl. Margonda Raya No. 230A, Rt. 04/01 Kemiri Muka/Beji Depok Jawa Barat', 'Jl. Margonda Raya No. 230A, Rt. 04/01 Kemiri Muka/', 'Jawa Barat'),
(38, '00Y', 'PT. TELKOMSEL INDONESIA', 'Telkom Landmark Tower, Jl. Jend. Gatot Subroto Kav. 52 Jakarta ', 'Jl. Watatuku Rt. 002/001, Kel. Walai Timur, Kec. T', 'Nusa Tenggara Timur'),
(39, '00Z', 'PT. TELKOMSEL INDONESIA', 'Telkom Landmark Tower, Jl. Jend. Gatot Subroto Kav. 52 Jakarta ', 'Jl. Watatuku Rt. 002/001, Kel. Walai Timur, Kec. T', 'Nusa Tenggara Timur'),
(40, '010', 'PT. TELKOMSEL BALI NUSRA', 'Graha Telkomsel, Jl. Gunung Agung No. 10-12, Denpasar Bali', 'Kelurahan Moru, Kec. Alor Barat Daya Kab. Alor, Pr', 'Wilayah Nusa Tenggara Timur'),
(41, '011', 'PT. TELKOMSEL BALI NUSRA', 'Graha Telkomsel, Jl. Gunung Agung No. 10-12, Denpasar Bali', 'Kelurahan Moru, Kec. Alor Barat Daya Kab. Alor, Pr', 'Wilayah Nusa Tenggara Timur'),
(42, '012', 'PT. TOWER BERSAMA qq PT. PLN (Persero) Area Lahat', 'The Convergence Indonesia, Jl. Epicentrum Boulevard Barat Karet Kuningan Jakarta Selatan', 'Jl. Air Mendidih No. 0 Rt. 3/3, Kel. Sukaraja, Kec', 'Wilayah Sumatera Selatan'),
(43, '013', 'PT. TOWER BERSAMA qq PT. PLN (Persero) Area Lahat', 'The Convergence Indonesia, Jl. Epicentrum Boulevard Barat Karet Kuningan Jakarta Selatan', 'Jl. SMPN 9, Dusun V Desa Tanjung Telang, Kec. Prab', 'Wilayah Sumatera Selatan'),
(44, '014', 'PT. CIPTA DWI BUSANA', 'Jl. Raya Cidahu Km. 2 Ds. Pondokkaso Tonggoh Kec. Cidahu Sukabumi', 'Jl. Raya Cidahu Km. 2 Ds. Pondokkaso Tonggoh Kec. ', 'Wilayah Jawa Barat'),
(45, '015', 'HPC LIQUIDE', 'Jl. Jababeka Raya Blok O, Cikarang Bekasi Jawa Barat', 'Jl. Jababeka Raya Blok O, Cikarang Bekasi Jawa Bar', ''),
(46, '016', 'PT. BANDAR GADANG JAYA', 'Jl. Melawai I No. 20, Rt. 01/01 Melawai Jakarta Selatan', 'Jl. Melawai I No. 20, Rt. 01/01 Melawai Jakarta Se', 'DKI Jakarta'),
(47, '017', 'CV. JAYA AGRO MANDIRI', 'Jl. Lintas Tengah Sumatera, Ds. Bumi Raya Rt. 01, Lampung', 'Jl. Lintas Tengah Sumatera, Ds. Bumi Raya Rt. 01, ', 'Kotabumi Rayon Bumi Abung'),
(48, '018', 'GEDUNG KEMENTRIAN BUMN', 'Jl. Medan Merdeka Selatan No. 13, Jakarta Pusat', 'Jl. Medan Merdeka Selatan No. 13, Jakarta Pusat', 'DKI Jakarta'),
(49, '019', 'PT. SOLUSI PRIMA PACKAGING', 'Jl. Pangkalan 1 Bantar Gebang Bekasi Jawa Barat ', 'Jl. Pangkalan 1 Bantar Gebang Bekasi Jawa Barat', 'Jawa Barat'),
(50, '01A', 'PT. MULTI SAKA ABADI', 'Jl. Pangkalan III No. 8 Kel. Cikiwul, Bantar Gebang Bekasi Jawa Barat', 'Jl. Pangkalan III No. 8 Kel. Cikiwul, Bantar Geban', 'Jawa Barat'),
(51, '01B', 'PT. SIMBA INDOSNACK MAKMUR', 'Jl. Pancasila IV No. 9 Rt. 02/Rw. 13 Cicadas Gn. Putri Bogor', 'Jl. Pancasila IV No. 9 Rt. 02/Rw. 13 Cicadas Gn. P', 'Jawa Barat'),
(52, '01C', 'BAMBANG WIBOWO', 'Jl. Asmin Rt. 8/Rw. 3 Susukan - Ciracas', 'Jl. Asmin Rt. 8/Rw. 3 Susukan - Ciracas', 'Jawa Barat'),
(53, '01D', 'KAI SUDIRMAN', 'Jl. Kendal, Menteng - Jakarta Pusat', 'Jl. Kendal, Menteng - Jakarta Pusat', 'DKI Jakarta'),
(54, '01E', 'PT. ASTARI NIAGARA INTERNASIONAL', 'Jl. Mitramas Raya No. 10 Tangerang', 'Jl. Mitramas Raya No. 10 Tangerang', 'Jawa Barat'),
(55, '01F', 'RSU. BrigJend. HASAN BASRY', 'Jl. Jendral Sudirman No. 29, Kandangan Banjarmasin Kalimantan Selatan', 'Jl. Jendral Sudirman No. 29, Kandangan Banjarmasin', 'Kalimantan Selatan'),
(56, '01G', 'HIGH SPEED RAILWAY CONTRAKTOR (Proyek Kereta Cepat Bandung - Jakarata)', 'Jl. Raya Baros Cimahi Jawa Barat', 'Jl. Raya Baros Cimahi Jawa Barat', 'Jawa Barat'),
(57, '01H', 'RSUD PESISIR BARAT qq. PT. PLN (Persero) Area Kota Bumi', 'Desa Seray Waikujir No. 12, Kec. Krui Selatan, Kab. Lampung Barat - Prov. Lampung', 'Desa Seray Waikujir No. 12, Kec. Krui Selatan, Kab', 'Provinsi Lamppung'),
(58, '01I', 'PT. LUXINDO INTERNUSA', 'Jl. Raya Narogong Km. 14, Kel. Cikiwul Kec. Bantar Gebang Kota Bekasi - Jawa Barat', 'Jl. Raya Narogong Km. 14, Kel. Cikiwul Kec. Bantar', 'Jawa Barat'),
(59, '01J', 'PT. UNIVERSAL AGRI BISNISINDO', 'Jl. Raya Narogong Km. 13,5 Kel. Cikiwul Kec. Bantar Gebang Kota Bekasi - Jawa Barat', 'Jl. Raya Narogong Km. 13,5 Kel. Cikiwul Kec. Banta', 'Jawa Barat'),
(60, '01K', 'PT. DAMAI INDAH KACA TIPIS', 'Jl. Moh. Toha, Kawasan Industri Mekar Jaya Kav. 7 Ps. Baru , Kec. Tangerang Kota - Tangerang', 'Jl. Moh. Toha, Kawasan Industri Mekar Jaya Kav. 7 ', 'Banten'),
(61, '01L', 'PT. ANUGRAH NUSANTARA SEJAHTERA', 'Oemanu/Oefatu Rt. 004/Rw. 002, Oemanu Biboki Anleu, Timor Tengan Utara - Nusa Tenggara Timur', 'Oemanu/Oefatu Rt. 004/Rw. 002, Oemanu Biboki Anleu', 'Nusa Tenggara Timur'),
(62, '01M', 'PT. GRESHINDO AROMA', 'Kp. Kembang Kuning 0 Rt. 000/Rw. 00 Cileungsi Bogor - Jawa Barat', 'Kp. Kembang Kuning 0 Rt. 000/Rw. 00 Cileungsi Bogo', 'Jawa Barat'),
(64, '01O', 'PT. WOO SHIN GARMENT INDONESIA', 'Kp. Banteng Rt/Rw. 04/004, Ds. Kutajaya, Kec. Cicurug Kab. Sukabumi - Jawa Barat ', 'Kp. Banteng Rt/Rw. 04/004, Ds. Kutajaya, Kec. Cicu', 'Jawa Barat'),
(63, '01N', 'RUMAH SAKIT IZZA', 'Jl. Raya Ciselang, Cikampek Utara    Kec. Kota Baru Kab. Karawang  ', 'Jl. Raya Ciselang, Cikampek Utara    Kec. Kota Bar', ''),
(65, '01P', 'PT. ALFA RETAILINDO', 'Jl. Cipto Mangunkusumo No. 234 - Cirebon   ', 'Jl. Cipto Mangunkusumo No. 234 - Cirebon   ', 'Jawa Barat'),
(66, '01Q', 'PT. SINAR MAS AGRO RESOURCES AND TECHNOLOGY, Tbk', 'Jl. M.H Thamrin No. 51 Jakarta Pusat 10350', 'Proyek Labortorium Tissue Culture    Tahap II – Se', ''),
(67, '01R', 'PT. INDESSO AROMA', 'Jl. Alternatif Cibubur Km. 9 No. 29 Cileungsi - Bogor', 'Jl. Alternatif Cibubur Km. 9 No. 29 Cileungsi - Bo', 'Jawa Barat'),
(68, '01S', 'PT. TEODORE PAN GARMINDO', 'Jl. Raya Batujajar Kp. Ciampel Rt/Rw. 009/003 Laksana Mekar Padalarang - Jawa Barat', 'Jl. Raya Batujajar Kp. Ciampel Rt/Rw. 009/003 Laks', 'Jawa Barat'),
(69, '01T', 'PT. NOHARA ALTA INDONESIA / LIE ARIF MULYO', 'Jl. Raya Serang Cibarusah No. 15 Ds. Serang    Kec. Cikarang Selatan Bekasi Jawa Barat', 'Jl. Raya Serang Cibarusah No. 15 Ds. Serang    Kec', 'PT. PLN (PERSERO) AREA BEKASI'),
(70, '01U', 'HOTEL HORISON', 'Jl. Anggut Bawah Ratu Samban - Bengkulu', 'Jl. Anggut Bawah Ratu Samban - Bengkulu', ''),
(71, '01V', 'PT. INTALAN WORKS', 'KP. Cikuda Wanaherang Kabupaten Bogor', 'KP. Cikuda Wanaherang Kabupaten Bogor', ''),
(72, '01W', 'PT. DASAN PAN PACIFIC INDONESIA', 'Jl. Desa Bojonglongok Parakansalak Rt. 002/001, Sukabumi - Jawa Barat', 'Jl. Desa Bojonglongok Parakansalak Rt. 002/001, Su', 'Jawa Barat'),
(73, '01X', 'PT. SEMANGAT MEKAR JAYA', 'Kp. Pasir Lemu Bonceret Rt. 3/3 Mekarjaya Cianjur - Jawa Barat', 'Kp. Pasir Lemu Bonceret Rt. 3/3 Mekarjaya Cianjur ', 'Jawa Barat'),
(74, '01Y', 'PT. TOWER BERSAMA qq PT. PLN (Persero) Area Lahat', 'The Convergence Indonesia, Jl. Epicentrum Boulevard Barat Karet Kuningan Jakarta Selatan', 'Jl. Pertamina Talang Jimar Kota Prabumulih Provins', 'Provinsi Sumatera Selatan'),
(75, '01Z', 'PT. INDONESIA MULTI COLOUR PRINTING ', 'Jl. Rungkut Raya I No. 07 Surabaya', 'Jl. Rungkut Raya I No. 07 Surabaya', 'BANDUNG'),
(76, '020', 'PT. INDONESIA MULTI COLOUR PRINTING', 'Jl. Rungkut Industri I No. 10 Surabaya', 'Jl. Rungkut Industri I No. 10 Surabaya', 'PLN SURABAYA'),
(77, '021', 'THE MAJESTY HOTEL & APARTMENT', '', '', ''),
(78, '022', 'PT. BIOTIS PRIMA AGRISINDO', 'Jl. Pemuda Rt. 04/02, Ds. Cicurug Kec. Gn. Sindur, Kab. Bogor - Jawa Barat', 'Jl. Pemuda Rt. 04/02, Ds. Cicurug Kec. Gn. Sindur,', 'Jawa Barat'),
(79, '023', 'PT. SINAR JAYA MEGAH LANGGENG', 'Jl. INSP Kali Malang Rt. 000/00 Sukadanau Bekasi - Jawa Barat', 'Jl. INSP Kali Malang Rt. 000/00 Sukadanau Bekasi -', 'Jawa Barat'),
(80, '024', 'AGUS SALIM', 'Ds. Pinang Rt/Rw. 0/0 Tarana, Provinsi Nusa Tenggara Barat', 'Ds. Pinang Rt/Rw. 0/0 Tarana, Provinsi Nusa Tengga', 'Nusa Tenggara Barat'),
(81, '025', 'KANTOR BERSAMA SAMSAT', 'Jl. A. Yani Rt/Rw. 0/0, Karawang Wetan, Karawang - Jawa Barat', 'Jl. A. Yani Rt/Rw. 0/0, Karawang Wetan, Karawang -', 'Jawa Barat'),
(82, '026', 'HERMAN WIBISONO', 'Ds. Pidang Rt/Rw. 0/0, Tarano - Nusa Tenggara Barat', 'Ds. Pidang Rt/Rw. 0/0, Tarano - Nusa Tenggara Bara', 'Provinsi Nusa Tenggara Barat'),
(83, '027', 'Grand Setiabudi Hotel & Apartment', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', ''),
(84, '028', 'BALAI KESEHATAN MATA MASYARAKAT CIKAMPEK', 'Jl. IR. Juanda No. 10 Sukaseuri, Cikampek - Jawa Barat', 'Jl. IR. Juanda No. 10 Sukaseuri, Cikampek - Jawa B', 'Jawa Barat'),
(85, '029', 'RSU. MAUMERE', 'Jl. Wairklau, Maumere - Nusa Tenggara Timur', 'Jl. Wairklau, Maumere - Nusa Tenggara Timur', 'Nusa Tenggara Timur'),
(86, '02A', 'PT. TRANS LEMBATA', 'Ds. Belang Rt. 0/0 Belang Provinsi Nusa Tenggara Timur', 'Ds. Belang Rt. 0/0 Belang Provinsi Nusa Tenggara T', 'Nusa Tenggara Timur'),
(87, '02B', 'PT. NINA VENUS INDONUSA', 'Jl. PLN Angkrong Ds. Sundawenang, Kec. Parungkuda Sukabumi - Jawa Barat', 'Jl. PLN Angkrong Ds. Sundawenang, Kec. Parungkuda ', 'Jawa Barat'),
(88, '02C', 'PT. NINA VENUS INDONUSA II', 'Kp. Baru Rt. 01/ Rw. 02 Ds. Parungkuda Kec. Parungkuda Sukabumi - Jawa Barat', 'Kp. Baru Rt. 01/ Rw. 02 Ds. Parungkuda Kec. Parung', 'Jawa Barat'),
(89, '02D', 'IRWAN LAKSADIEN ', 'Dusun Sukadamai Desa Labuan Badas Nusa Tenggara Barat ', 'Dusun Sukadamai Desa Labuan Badas Nusa Tenggara Ba', 'Nusa Tenggara Barat '),
(90, '02E', 'PEMKAB KARAWANG 2 TOWER 1', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Jawa Barat', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Ja', 'Jawa Barat'),
(91, '02F', 'MALL 21 AVENUE', 'Jl. Jend. Sudirman Lot 21 No. SCBD Jakarta Pusat', 'Jl. Jend. Sudirman Lot 21 No. SCBD Jakarta Pusat', 'DKI Jakarta'),
(92, '02G', 'PEMKAB KARAWANG 2 TOWER 1', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Jawa Barat', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Ja', 'Jawa Barat'),
(93, '02H', 'PEMKAB KARAWANG 2 TOWER 1', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Jawa Barat', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Ja', 'Jawa Barat'),
(94, '02I', 'PEMKAB KARAWANG 2 TOWER 1', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Jawa Barat', 'DK. Kp. Lubangsari, Kel. Wetan Karawang Timur - Ja', 'Jawa Barat'),
(95, '02J', 'INSTALASI AIR MINUM', 'Jl. Desa Bojong Renged Teluk Naga, Banten ', 'Jl. Desa Bojong Renged Teluk Naga, Banten  ', 'Banten '),
(96, '02K', 'PT. XYLO INDAH PRATAMA ', 'Desa Talang Cempedak Jejawi OKI Palembang', 'Desa Talang Cempedak Jejawi OKI Palembang', 'Sumatera Selatan '),
(97, '02L', 'PT. XYLO INDAH PRATAMA ', 'Desa Talang Cempedak Jejawi OKI Palembang', 'Desa Talang Cempedak Jejawi OKI Palembang', 'Sumatera Selatan '),
(98, '02M', 'PT. XYLO INDAH PRATAMA', 'Desa Talang Cempedak Jejawi OKI Palembang ', 'Desa Talang Cempedak Jejawi OKI Palembang  ', 'Sumatera Selatan '),
(99, '02N', 'PT. XYLO INDAH PRATAMA', 'Desa Talang Cempedak Jejawi OKI Palembang ', 'Desa Talang Cempedak Jejawi OKI Palembang  ', 'Sumatera Selatan '),
(100, '02O', 'PT. XYLO INDAH PRATAMA', 'Desa Talang Cempedak Jejawi OKI Palembang ', 'Desa Talang Cempedak Jejawi OKI Palembang  ', 'Sumatera Selatan '),
(101, '02P', 'PT. ENTEK SEPARINDO ASIA', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor', 'Jawa Barat '),
(102, '02Q', 'PT. ENTEK SEPARINDO ASIA', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor', 'Jawa Barat '),
(103, '02R', 'PT. WINN APLIANCE 1', 'Kawasan Industri Modern Desa Cikande kab. Serang Provinsi Banten', 'Kawasan Industri Modern Desa Cikande kab. Serang P', 'Banten '),
(104, '02S', 'PT. WINN APLIANCE 1 ', 'Kawasan Industri Modern Desa Cikande kab. Serang Provinsi Banten ', 'Kawasan Industri Modern Desa Cikande kab. Serang P', 'Banten '),
(105, '02T', 'CV. AGRO BUMI', 'Ds. Blok Nyomot Rt. 20/2, Cimanglio Subang - Jawa Barat', 'Ds. Blok Nyomot Rt. 20/2, Cimanglio Subang - Jawa ', 'Jawa Barat '),
(106, '02U', 'sdsdss', 'sdsdddsd', 'Ds. Blok Nyomot Rt. 20/2, Cimanglio Subang - Jawa ', 'sddsds'),
(107, '02V', 'PT. ENTEK SEPARINDO ASIA', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor ', 'Jl. Raya Narogong Km. 14, Kel. Cikiwul Kec. Bantar', 'Jawa Barat '),
(108, '02W', 'PT. ENTEK SEPARINDO ASIA', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor ', 'Jl. Raya Narogong Km. 26 Cileungsi Bogor ', 'Jawa Barat '),
(109, '02X', 'PT. WINN APPLIANCE 1', 'Kawasan Industri Modern Desa Cikande kab. Serang Provinsi Banten ', 'Kawasan Industri Modern Desa Cikande kab. Serang P', 'Banten  '),
(110, '02Y', 'CV. AGRO BUMI', 'Ds. Blok Nyomot Rt. 20/2, Cimanglio Subang - Jawa Barat ', 'Ds. Blok Nyomot Rt. 20/2, Cimanglio Subang - Jawa ', 'Jawa Barat '),
(111, '02Z', 'tes', 'tes', 'tes', 'tes'),
(112, '030', 'tes3', 'tes', 'tes', 'tes'),
(113, '031', 'MUJI MULYOADI WIBOWO, ST', 'Jl. Raya Hankam Rt/Rw. 3/2, Bambu Apus Jakarta Timur', 'Jl. Raya Hankam Rt/Rw. 3/2, Bambu Apus Jakarta Tim', 'DKI Jakarta '),
(114, '032', 'RSIA. YAYASAN HERMINA', 'Jl. Kemakmuran No. 39, Margajaya Bekasi Selatan - Bekasi', 'Jl. Kemakmuran No. 39, Margajaya Bekasi Selatan - ', 'Jawa Barat '),
(115, '033', 'dr. Surahman Hakim, SpOG (K)', 'Jl. Diponegoro No. 71 Jakarta', 'Jl. Diponegoro No. 71 Jakarta', 'DKI Jakarta'),
(116, '034', 'PT. RODA MAS LOGAM UTAMA', 'Jl. Raya Mauk Km. 5,5 Desa Priuk Tangerang', 'Jl. Raya Mauk Km. 5,5 Desa Priuk Tangerang', 'Banten '),
(117, '035', 'GOR RAWAMANGUN', 'Jl. Pemuda No. 6 Jakarta Timur', 'Jl. Pemuda No. 6 Jakarta Timur', 'DKI Jakarta'),
(118, '036', 'RSUPN. Dr. Cipto Mangunkusumo', 'Jl. Diponegoro No. 71 Jakarta', 'Jl. Diponegoro No. 71 Jakarta', 'DKI Jakarta '),
(119, '037', 'PT. ANTARTIKA INDO SAMUDRA', 'Jl. Mawar No. 5 Rt. 002/01 Kel. Kamboja Kec. Tanjung Pinang Barat Kepulauan Riau', 'Jl. Mawar No. 5 Rt. 002/01 Kel. Kamboja Kec. Tanju', 'Kepulauan Riau'),
(120, '038', 'PT. KPM OIL & GAS', 'Jl. Pangeran Antasari No. 75 Rt. 0/0 Cilandak', 'Jl. Pangeran Antasari No. 75 Rt. 0/0 Cilandak', 'DKI Jakarta'),
(121, '039', 'PT. SYNCRUM LOGISTICS', 'Jl. Selayar Blok B-2 Kawasan MM2100, Cibitung Bekasi', 'Jl. Selayar Blok B-2 Kawasan MM2100, Cibitung Beka', 'Jawa Barat'),
(122, '03A', 'KOPKAR TBINA', 'Kp. Telajung Rt. 2/9 Cikarang Barat Bekasi', 'Kp. Telajung Rt. 2/9 Cikarang Barat Bekasi', 'Jawa Barat'),
(123, '03B', 'DINAS PERHUBUNGAN KOTA BANDUNG', 'Jl. SOR. GBLA Rt. 0/0 Rancabolang Gedebage - Bandung', 'Jl. SOR. GBLA Rt. 0/0 Rancabolang Gedebage - Bandu', 'Jawa Barat'),
(124, '03C', 'DINAS PERHUBUNGAN KOTA BANDUNG', 'Jl. SOR. GBLA Rt. 0/0 Rancabolang Gedebage - Bandung', 'Jl. SOR. GBLA Rt. 0/0 Rancabolang Gedebage - Bandu', 'Jawa Barat'),
(125, '03D', 'tes', 'tes', 'tes', 'tes'),
(126, '03E', 'tes', 'tes', 'tes', 'tes'),
(127, '03F', 'PT. GEMA INDAH NUSANTARA', 'Jl. Pasir Kaliki No. 25 Kebonjati Bandung', 'Jl. Pasir Kaliki No. 25 Kebonjati Bandung', 'Jawa Barat'),
(128, '03G', 'PT. GEMA INDAH NUSANTARA', 'Jl. Pasir Kaliki No. 25 Kebonjati Bandung', 'Jl. Pasir Kaliki No. 25 Kebonjati Bandung', 'Jawa Barat'),
(129, '03H', 'PT. CIPTA ORION METAL', 'Kp. Tambun Bulak Rt. 004/007 Sriamur Tambun Utara - Bekasi 17510', 'Kp. Tambun Bulak Rt. 004/007 Sriamur Tambun Utara ', 'Jawa Barat '),
(130, '03I', 'PT. CIPTA ORION METAL', 'Kp. Tambun Bulak Rt. 004/007 Sriamur Tambun Utara - Bekasi 17510', 'Kp. Tambun Bulak Rt. 004/007 Sriamur Tambun Utara ', 'Jawa Barat '),
(131, '03J', 'PT. KALDU SARI NABATI INDO ', 'Jl. Bandung Cirebon Km. 24 Rt. 0/0 Kel. Banjaran, Kec. Sumber Jaya, Kab. Majalengka Jawa Barat', 'Jl. Bandung Cirebon Km. 24 Rt. 0/0 Kel. Banjaran, ', 'Jawa Barat'),
(132, '03K', 'PT. KALDU SARI NABATI INDO ', 'Jl. Bandung Cirebon Km. 24 Rt. 0/0 Kel. Banjaran, Kec. Sumber Jaya, Kab. Majalengka Jawa Barat', 'Jl. Bandung Cirebon Km. 24 Rt. 0/0 Kel. Banjaran, ', 'Jawa Barat'),
(133, '03L', 'RSU. CIMAHI', 'Jl. Jendral H. Amir Mahmud No. 140 Rt. 0/0 Cimahi - Jawa Barat', 'Jl. Jendral H. Amir Mahmud No. 140 Rt. 0/0 Cimahi ', 'Jawa Barat'),
(134, '03M', 'RSU. CIMAHI', 'Jl. Jendral H. Amir Mahmud No. 140 Rt. 0/0 Cimahi - Jawa Barat', 'Jl. Jendral H. Amir Mahmud No. 140 Rt. 0/0 Cimahi ', 'Jawa Barat'),
(135, '03N', 'PT. SUVARNA LAND', 'Mega Kuningan, Jl. HR. Rasuna Said Kav. C-3, Jakarta', 'Rw. 4 Halim Perdanakusuma, Makasar Jakarta Timur', 'DKI Jakarta'),
(136, '03O', 'PT. SUVARNA LAND', 'Mega Kuningan, Jl. HR. Rasuna Said Kav. C-3, Jakarta', 'Rw. 4 Halim Perdanakusuma, Makasar Jakarta Timur', 'DKI Jakarta'),
(137, '03P', 'GRAND SETIABUDI HOTEL & APARTMENT', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'Jawa Barat'),
(138, '03Q', 'GRAND SETIABUDI HOTEL & APARTMENT', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'Jawa Barat'),
(139, '03R', 'PT. SMCC UTAMA INDONESIA', 'Jl. Teuku Umar Km. 44 Desa Tegal Asih Kec. Cikarang, Cikarang - Bekasi', 'Jl. Teuku Umar Km. 44 Desa Tegal Asih Kec. Cikaran', 'Jawa Barat '),
(140, '03S', 'PT. SMCC UTAMA INDONESIA', 'Jl. Teuku Umar Km. 44 Desa Tegal Asih Kec. Cikarang, Cikarang - Bekasi', 'Jl. Teuku Umar Km. 44 Desa Tegal Asih Kec. Cikaran', 'Jawa Barat '),
(141, '03T', 'PT. RUKUM JAYA SOLINDO', 'Jl. Jenderal H. Amir Mahmud No. 140 Rt. 0/0, Cimahi Jawa Barat ', 'Jl. Jenderal H. Amir Mahmud No. 140 Rt. 0/0, Cimah', 'Jawa Barat'),
(142, '03U', 'PT. RUKUN JAYA SOLINDO', 'Jl. Jenderal H. Amir Mahmud No. 140 Rt. 0/0, Cimahi Jawa Barat ', 'Jl. Jenderal H. Amir Mahmud No. 140 Rt. 0/0, Cimah', 'Jawa Barat'),
(143, '03V', 'PT. YAMAHA INDONESIA MOTOR MANUFACTURING', 'Kawasan Industri K-IIC Lot. BB-1,2,5,6,AA-3 Sukaluyu Telukjambe Timur Karawang - Jawa Barat', 'Kawasan Industri K-IIC Lot. BB-1,2,5,6,AA-3 Sukalu', 'Jawa Barat'),
(144, '03W', 'THE MAJESTY HOTEL & APARTEMENT', 'Jl. Prof. Dr. Surya Sumantri No. 91 Bandung - Jawa Barat', 'Jl. Prof. Dr. Surya Sumantri No. 91 Bandung - Jawa', 'Jawa Barat'),
(145, '03X', 'PT. PROSPECT MOTOR', 'Jl. MH. Husni Thamrin CBD Bintaro Jaya No. A2 KetNo. 1 Rt.0/0 Pondok Jaya ', 'Jl. MH. Husni Thamrin CBD Bintaro Jaya No. A2 KetN', 'DKI Jakarta'),
(146, '03Y', 'CSCEC. SAJR JO (Division 3)', 'Jl. Orange Country Boulevard Utara, Lippo Cikarang', 'Jl. Orange Country Boulevard Utara, Lippo Cikarang', 'Jawa Barat'),
(147, '03Z', 'PT. CHUNETSU INDONESIA', 'DK, Jl. Maligi III Lot. 5C, No. 5C Karawang ', 'DK, Jl. Maligi III Lot. 5C, No. 5C Karawang ', 'Jawa Barat'),
(148, '040', 'PT. SUPER UNGGAS JAYA', 'Project RPAK, Desa Mandiriacan, Kec. Mandiriacan, Kab. Kuningan - Jawa Barat', 'Project RPAK, Desa Mandiriacan, Kec. Mandiriacan, ', 'Jawa Barat'),
(149, '041', 'PT. SUMMARECON AGUNG, Tbk (Springlake View)', 'Komplek Perumahan Summarecon Bekasi', 'Komplek Perumahan Summarecon Bekasi', 'Jawa Barat'),
(150, '042', 'PT. ANDHIKA MAKMUR PERSADA', 'Jl. Anggrek No. 7 Rt. 03/09 Wanaherang ', 'Jl. Anggrek No. 7 Rt. 03/09 Wanaherang', 'Jawa Barat'),
(151, '043', 'PT. BUKAKA TEKNIK UTAMA, Tbk', 'Jl. Tol Jakarta - Cikampek Km. 42-B, Desa Wanasari Telukjambe Barat, Karawang', 'Jl. Tol Jakarta - Cikampek Km. 42-B, Desa Wanasari', 'Jawa Barat'),
(152, '044', 'PT. SILTEC MAJU PERKASA', 'Jl. Raya Koper Cikande Km. 1, Kp. Cidahu, Desa Parigi, Kec. Cikande, Kab. Serang,  Banten', 'Jl. Raya Koper Cikande Km. 1, Kp. Cidahu, Desa Par', 'Banten '),
(153, '045', 'PT. SILTEC MAJU PERKASA ', 'Jl. Raya Koper Cikande Km. 1 Kp. Dahu Desa Parigi Kec. Cikande Kab. Serang Banten', 'Jl. Raya Koper Cikande Km. 1 Kp. Dahu Desa Parigi ', 'Banten'),
(154, '046', 'PT. GOLDEN FORTUNE STELL', 'Kawasan Industri Modern Cikande, Jl. Modern Industri X Kav. Q7-Q8 Nambo Ilir Kibin, Serang - Banten', 'Kawasan Industri Modern Cikande, Jl. Modern Indust', 'Banten '),
(155, '047', 'PT. CITRA BARU STELL', 'Kawasan Industri Modern Cikande, Jl. Modern Industri X Kav. Q7-Q8 Nambo Ilir Kibin, Serang - Banten', 'Kawasan Industri Modern Cikande, Jl. Modern Indust', 'Banten '),
(156, '048', 'APARTEMEN TAMANSARI ISWARA', 'Jl. Cut Mutia No.2 Sepanjang Jaya, Rawalumbu Bekasi', 'Jl. Cut Mutia No.2 Sepanjang Jaya, Rawalumbu Bekas', 'Jawa Barat'),
(157, '049', 'CV. TEXCO', 'Jl. Industri No. 9, Rt. 001/001 Desa Tegalluar, Kec. Bojongsoang, Majalaya Kab. Bandung - Jawa Barat', 'Jl. Industri No. 9, Rt. 001/001 Desa Tegalluar, Ke', 'Jawa Barat'),
(158, '04A', 'PT. BUMI GAMPING SRIWIJAYA', 'Desa Linggarsari, Kec. Plered, Kab. Purwakarta, Purwakarta - Jawa Barat', 'Desa Linggarsari, Kec. Plered, Kab. Purwakarta, Pu', 'Jawa Barat'),
(159, '04B', 'PT. MASTERINA GRAFIKA ESPRINTA', 'Jl. Cukanggalih No. 18, Desa Cukanggalih, Kel. Curug Tangerang - Banten', 'Jl. Cukanggalih No. 18, Desa Cukanggalih, Kel. Cur', 'Banten '),
(160, '04C', 'YAYASAN PENDIDIKAN GUNADARMA', 'Jl. Raya Cikunir No. 100, Rt. 006/001, Jakamulya Bekasi', 'Jl. Raya Cikunir No. 100, Rt. 006/001, Jakamulya B', 'Jawa Barat'),
(161, '04D', 'GUDANG BEKU TERINTEGRASI', 'Arah Larantika Maumere, Ds. Oka, Kec. Ile Mandiri, Kab. Flores Timut - Nusa Tenggara Timur', 'Arah Larantika Maumere, Ds. Oka, Kec. Ile Mandiri,', 'Nusa Tenggara Timur'),
(162, '04E', 'PT. KHARISMA PRINTEX', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Bandung', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Band', 'Jawa Barat'),
(163, '04E', 'PT. KHARISMA PRINTEX', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Bandung', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Band', 'Jawa Barat'),
(164, '04E', 'PT. KHARISMA PRINTEX', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Bandung', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Band', 'Jawa Barat'),
(165, '04E', 'PT. KHARISMA PRINTEX', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Bandung', 'Jl. Holis No. 451, Rt. 00/00, Babakan Ciparay Band', 'Jawa Barat'),
(166, '04F', 'HSRCC (High Speed Railway Contractor Consortium)', 'Kp. Cikuda Walini, Cikalong, Kab. Bandung - Jawa Barat', 'Kp. Cikuda Walini, Cikalong, Kab. Bandung - Jawa B', 'Jawa Barat'),
(167, '04G', 'PT. KHARISMA PRINTEX', 'Jl. Holis No. 461, Rt. 00/00, Babakan Ciparay Bandung', 'Jl. Holis No. 461, Rt. 00/00, Babakan Ciparay Band', 'Jawa Barat'),
(168, '04H', 'PT. THOMPSON', 'Jl. Raya Narogong Pangkalan 5, Rt. 00/00 Bekasi', 'Jl. Raya Narogong Pangkalan 5, Rt. 00/00 Bekasi', 'Jawa Barat'),
(169, '04I', 'PT. SHINO HIDRO', 'Kawasan Gemalapik Cikarang Barat Rt. 00/00, Bekasi', 'Kawasan Gemalapik Cikarang Barat Rt. 00/00, Bekasi', 'Jawa Barat'),
(170, '04J', 'tes', 'tes', 'tes', 'tes'),
(171, '04K', 'PT. COTEXI INAS', 'Jl. Rawa Gelam I/6, Kawasan Industri Pulo Gadung, Jakarta', 'Jl. Rawa Gelam I/6, Kawasan Industri Pulo Gadung, ', 'DKI Jakarta'),
(172, '04L', 'KAMPUS AKPAR NHI BANDUNG', 'Jl. Gudang Kahuripan, Lembang Bandung', 'Jl. Gudang Kahuripan, Lembang Bandung', 'Jawa Barat'),
(173, '04M', 'KAMPUS AKPAR NHI BANDUNG', 'Jl. Gudang Kahuripan, Lembang Bandung', 'Jl. Gudang Kahuripan, Lembang Bandung', 'Jawa Barat'),
(174, '04N', 'HOTEL SARINAH BRAGA BANDUNG', 'Jl. Braga No. 10, Rt. 004/006 Sumur Bandung', 'Jl. Braga No. 10, Rt. 004/006 Sumur Bandung', 'Jawa Barat'),
(175, '04O', 'PT. KEMANG SUAR ARTHA', 'Jl. Bangka Raya No. 3 Pela Mampang, Jakarta Selatan', 'Jl. Bangka Raya No. 3 Pela Mampang, Jakarta Selata', 'DKI Jakarta'),
(176, '04P', 'CV. DEBORA DAN LAURUS', 'Jl. Margamukti Licin Kec. Cimalaka Kab. Sumedang ', 'Jl. Margamukti Licin Kec. Cimalaka Kab. Sumedang', 'DKI Jakarta'),
(177, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'DKI Jakarta'),
(178, '04R', 'PDAM TEGAL DANAS', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt. 2/5 Lemahabang', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt.', 'DKI Jakarta'),
(179, '04P', 'CV. DEBORA DAN LAURUS', 'Jl. Margamukti Licin Kec. Cimalaka Kab. Sumedang ', 'Jl. Margamukti Licin Kec. Cimalaka Kab. Sumedang', 'Jawa Barat'),
(180, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'Jawa Barat'),
(181, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'Jawa Barat'),
(182, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'Jawa Barat'),
(183, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'Jawa Barat'),
(184, '04Q', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Cicurug Sukabumi ', 'Jl. Raya Siliwangi Km. 24 RT. 004/002 Ds. Benda Ci', 'Jawa Barat'),
(185, '04R', 'PDAM TEGAL DANAS', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt. 2/5 Lemahabang', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt.', 'Jawa Barat '),
(186, '04R', 'PDAM TEGAL DANAS', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt. 2/5 Lemahabang', 'Jl. Kalimalang DBT, Ds. Hegar Mukti KetNo. 26, Rt.', 'Jawa Barat'),
(187, '04S', 'PT. ASIA BOTTLE CYCLE', 'Jl. Blue Jean Kawasan Industi Mekar Jaya No. 4 Sepatan Tangerang', 'Jl. Blue Jean Kawasan Industi Mekar Jaya No. 4 Sep', 'Banten '),
(188, '04T', 'PT. SEOILINDO PRIMATAMA', 'Kp. Cijoged Rt.16/5 Lengkong Kab. Subang Jawa Barat', 'Kp. Cijoged Rt.16/5 Lengkong Kab. Subang Jawa Bara', 'Jawa Barat'),
(189, '04U', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km, 24 Rt. 004/002, Ds. Benda Cicurug Sukabumi', 'Jl. Raya Siliwangi Km, 24 Rt. 004/002, Ds. Benda C', 'Jawa Barat'),
(190, '04V', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', 'Jl. Raya Siliwangi Km, 24 Rt. 004/002, Ds. Benda Cicurug Sukabumi', 'Jl. Raya Siliwangi Km, 24 Rt. 004/002, Ds. Benda C', 'Jawa Barat'),
(191, '04V', 'PT. TELKOMSEL qq PT. PLN (Persero) Wilayah S2JB Area Palembang ', '', 'Jl. Dusun II Kelapa Dua Rt. 005/002, Kel. Kelapa D', 'Provinsi Sumatera Selatan'),
(192, '04W', 'PT. TELKOMSEL qq PT. PLN (Persero) Wilayah S2JB Area Palembang ', 'Jl. Dusun II Kelapa Dua Rt.005/002 Kel. Kelapa Dua, Kec. Pulau Rimau, Kab. Banyuasin Prov. Sumatera Selatan', 'Jl. Dusun II Kelapa Dua Rt.005/002 Kel. Kelapa Dua', 'Provinsi Sumatera Selatan'),
(193, '04X', 'CV. Panorama Lintas Timur 2', 'Jl. Lintas Timur Desa Rebo Kepulauan    Bangka Belitung', 'Jl. Lintas Timur Desa Rebo Kepulauan    Bangka Bel', 'Bangka Belitung'),
(194, '04Y', 'PT. HATIRE', 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blok C5 No. 5 Cikarang Bekasi', 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blo', 'Jawa Barat'),
(195, '04Z', 'PT. HATIRE', 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blok C5 No. 5 Cikarang Bekasi', 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blo', 'Jawa Barat'),
(196, '050', 'PT. RAJEHAN ARIQ', 'Jl. Air Mawar Dalam Rt. 001, Air Mawar Bukit Intan Kota Pangkalpinang Kepulauan Bangka Belitung ', 'Jl. Air Mawar Dalam Rt. 001, Air Mawar Bukit Intan', 'Kepulauan Bangka Belitung'),
(197, '051', 'RS BHAKTI HUSADA', 'Jl. RE. Martadinata Cikarang Utara Bekasi Jawa Barat', 'Jl. RE. Martadinata Cikarang Utara Bekasi Jawa Bar', 'Jawa Barat'),
(198, '052', 'HIGH SPEED RAILWAY CC', 'Kawasan Gemalapik Kampung Tegal Luhur Cibatu, Cikarang Selatan Bekasi', 'Kawasan Gemalapik Kampung Tegal Luhur Cibatu, Cika', 'Jawa Barat'),
(199, '053', 'PT. TELKOMSEL qq PT. PLN (Persero) Distribusi Lampung Area Kota Bumi', 'Telkom Landmark Tower, Jl. Gatot Subroto Kav. 52 Jakarta', 'Desa Negara Batin Rt. 08/02 Kec. Negara Batin Kab.', 'Povonsi Lampung'),
(200, '054', 'PT. TELKOMSEL qq PT. PLN (Persero) Distribusi Lampung Area Kota Bumi', 'Telkom Landmark Tower, Jl. Gatot Subroto Kav. 52 Jakarta', 'Desa Negara Batin Rt. 08/02 Kec. Negara Batin Kab.', 'Povonsi Lampung'),
(201, '055', 'test', 'test', 'test', 'PROVINSI JAWA BARAT'),
(202, '056', 'test', 'test', 'test', 'test'),
(203, '057', 'PT. CIBADAK INDAH SARI - F2', 'DK. Cijolang, Sunter Sanca Gantar Haurgeulis Indramayu Jawa Barat', 'DK. Cijolang, Sunter Sanca Gantar Haurgeulis Indra', 'Jawa Barat'),
(204, '058', 'PT. CIBADAK INDAH SARI F2', 'DK. Cijolang, Sunter Sanca Gantar Haurgeulis Indramayu Jawa Barat', 'DK. Cijolang, Sunter Sanca Gantar Haurgeulis Indra', 'Jawa Barat'),
(205, '059', 'PT. YOUNG WON INDONESIA ', 'Desa Karangmukti Kec. Cipenduey Kab. Subang Jawa Barat', 'Desa Karangmukti Kec. Cipenduey Kab. Subang Jawa B', 'Jawa Barat'),
(206, '05A', 'PT. WIKA GEDUNG (Grand Zamzam Tower)', 'Jl. Margonda Raya No 12 Depok', 'Jl. Margonda Raya No 12 Depok', 'Jawa Barat'),
(207, '05A', 'PT. WIKA GEDUNG (Grand Zamzam Tower)', 'Jl. Margonda Raya No 12 Depok', 'Jl. Margonda Raya No 12 Depok', 'Jawa Barat'),
(208, '05B', 'YAYASAN BINA NUSANTARA', 'Jl. Bulevar Utara Summarecon Bekasi Kav. Al-Ikhlas Marga Mulya Kota Bekasi', 'Jl. Bulevar Utara Summarecon Bekasi Kav. Al-Ikhlas', 'Jawa Barat'),
(209, '05C', 'PT. GEORG FISCHER INDONESIA', 'Dusun Sukamulya Rt. 19/006, Anggadita Klari 41371 Karawang', 'Dusun Sukamulya Rt. 19/006, Anggadita Klari 41371 ', 'Jawa Barat'),
(210, '05C', 'PT. GEORG FISCHER INDONESIA', 'Dusun Sukamulya Rt. 19/006, Anggadita Klari 41371 Karawang', 'Dusun Sukamulya Rt. 19/006, Anggadita Klari 41371 ', 'Jawa Barat'),
(211, '05D', 'DEPO LRT', 'Kp. OPI Jakabaring No. 1 Palembang', 'Kp. OPI Jakabaring No. 1 Palembang', 'Sumatera Selatan '),
(212, '05E', 'DEPO LRT', 'Kp. OPI Jakabaring No. 1 Palembang', 'Kp. OPI Jakabaring No. 1 Palembang', 'Sumatera Selatan '),
(213, '05F', 'PT. KARTONINDO TIRTAMAS UTAMA', 'Jl. Raya Sapan Km. 1 No. 1 Tegalluar Majalaya', 'Jl. Raya Sapan Km. 1 No. 1 Tegalluar Majalaya', 'Jawa Barat'),
(214, '05G', 'PT. KARTONINDO MEGA JAYA', 'Jl. Raya Sapan Km. 1 No. 1 Tegalluar Majalaya', 'Jl. Raya Sapan Km. 1 No. 1 Tegalluar Majalaya', 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `t_instalasi_jenis`
--

CREATE TABLE `t_instalasi_jenis` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_jenis_instalasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_instalasi_jenis`
--

INSERT INTO `t_instalasi_jenis` (`id`, `nama`, `id_jenis_instalasi`) VALUES
(311, 'Jaringan distribusi tenaga listrik tegangan menengah', 2),
(321, 'Jaringan distribusi tenaga listrik tegangan rendah', 2),
(411, 'Bangunan perkantoran: perkantoran pemerintah, niaga, laboratorium dan sejenisnya', 3),
(412, 'Bangunan perdagangan: pasar, pertokoan, pusat perbelanjaan, mal, dan sejenisnya', 3),
(413, 'Bangunan kesehatan dan keagamaan: puskesmas, poliklinik, rumah sakit, mesjid, gereja, pura, wihara, bangunan klenteng dan sejenisnya', 3),
(414, 'Bangunan pendidikan dan kebudayaan: sekolah, perguruan tinggi, museum, gedung kesenian dan sejenisnya', 3),
(415, 'Bangunan perhotelan: hotel, motel, hostel, penginapan, dan sejenisnya', 3),
(416, 'Bangunan terminal: stasiun kereta, terminal bus, terminal udara, pelabuhan laut, SPBU dan sejenisnya', 3),
(417, 'Bangunan hunian: hunian tunggal, jamak, campuran, sedang', 3),
(418, 'Bangunan Perindustrian: industri kecil, industri sedang, industri besar/berat', 3),
(419, 'Bangunan lainnya: stadion/hall, bangunan militer, bangunan reaktor, dan sejenisnya', 3),
(421, 'Bangunan perkantoran: perkantoran pemerintah, niaga, laboratorium dan sejenisnya', 4),
(422, 'Bangunan perdagangan: pasar, pertokoan, pusat perbelanjaan, mal, dan sejenisnya', 4),
(423, 'Bangunan kesehatan dan keagamaan: puskesmas, poliklinik, rumah sakit, mesjid, gereja, pura, wihara, bangunan klenteng dan sejenisnya', 4),
(424, 'Bangunan pendidikan dan kebudayaan: sekolah, perguruan tinggi, museum, gedung kesenian dan sejenisnya', 4),
(425, 'Bangunan perhotelan: hotel, motel, hostel, penginapan, dan sejenisnya', 4),
(426, 'Bangunan terminal: stasiun kereta, terminal bus, terminal udara, pelabuhan laut, SPBU dan sejenisnya', 4),
(427, 'Bangunan hunian: hunian tunggal, jamak, campuran, sedang', 4),
(428, 'Bangunan Perindustrian: industri kecil, industri sedang, industri besar/berat', 4),
(429, 'Bangunan lainnya: stadion/hall, bangunan militer, bangunan reaktor, dan sejenisnya', 4);

-- --------------------------------------------------------

--
-- Table structure for table `t_instalasi_pemanfaatan`
--

CREATE TABLE `t_instalasi_pemanfaatan` (
  `id` int(11) NOT NULL,
  `instalasi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_instalasi_pemanfaatan`
--

INSERT INTO `t_instalasi_pemanfaatan` (`id`, `instalasi`) VALUES
(1, 'Untuk instalasi di wilayah Sumatera'),
(2, 'Untuk instalasi di Jawa Madura Bali'),
(3, 'Untuk instalasi di Kalimantan'),
(4, 'Untuk instalasi di Sulawesi'),
(5, 'Untuk instalasi di Nusa Tenggara'),
(6, 'Untuk instalasi di Maluku dan Maluku Utara'),
(7, 'Untuk instalasi di Papua dan Papua Barat');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_instalasi`
--

CREATE TABLE `t_jenis_instalasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_instalasi`
--

INSERT INTO `t_jenis_instalasi` (`id`, `nama`) VALUES
(1, 'Pembangkit'),
(2, 'Distribusi'),
(3, 'Pemanfaatan TT'),
(4, 'Pemanfaatan TM'),
(5, 'Transmisi');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_pembangkit`
--

CREATE TABLE `t_jenis_pembangkit` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_pembangkit`
--

INSERT INTO `t_jenis_pembangkit` (`id`, `nama`) VALUES
(111, 'Pembangkit listrik tenaga uap'),
(121, 'Pembangkit listrik tenaga gas'),
(131, 'Pembangkit listrik tenaga gas-uap'),
(141, 'Pembangkit listrik tenaga panas bumi'),
(151, 'Pembangkit listrik tenaga air'),
(161, 'Pembangkit listrik tenaga air skala kecil'),
(162, 'Pembangkit listrik tenaga air skala menengah '),
(171, 'Pembangkit listrik tenaga diesel'),
(172, 'Pembangkit listrik tenaga mesin gas'),
(181, 'Pembangkit listrik tenaga nuklir'),
(191, 'Pembangkit listrik tenaga sampah'),
(192, 'Pembangkit listrik tenaga bayu'),
(193, 'Pembangkit listrik tenaga surya'),
(194, 'Pembangkit listrik tenaga arus laut'),
(195, 'Pembangkit listrik tenaga perbedaan suhu air laut'),
(196, 'Pembangkit listrik tenaga biomassa');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_usaha`
--

CREATE TABLE `t_jenis_usaha` (
  `id` varchar(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_usaha`
--

INSERT INTO `t_jenis_usaha` (`id`, `nama`) VALUES
('IO', 'IO'),
('Pelanggan', 'Pelanggan'),
('PIUPTL', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_kepemilikan_sistem_jaringan`
--

CREATE TABLE `t_kepemilikan_sistem_jaringan` (
  `id` int(11) NOT NULL,
  `pemilik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kepemilikan_sistem_jaringan`
--

INSERT INTO `t_kepemilikan_sistem_jaringan` (`id`, `pemilik`) VALUES
(1, 'Milik BUMN'),
(2, 'Milik Swasta'),
(3, 'Menyewa Jaringan BUMN'),
(4, 'Menyewa Jaringan Swasta');

-- --------------------------------------------------------

--
-- Table structure for table `t_kwitansi`
--

CREATE TABLE `t_kwitansi` (
  `Id_kwitansi` int(12) NOT NULL,
  `nokwitansi` varchar(50) DEFAULT NULL,
  `tanggalsurat` date DEFAULT NULL,
  `namaperusahaan` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kwitansi`
--

INSERT INTO `t_kwitansi` (`Id_kwitansi`, `nokwitansi`, `tanggalsurat`, `namaperusahaan`) VALUES
(35, '4/KW/SDE/III/2018', '2018-03-26', 'PT. SUMBER MITRA GASUTRI'),
(34, '3/KW/SDE/III/2018', '2018-03-22', 'PT. SELARAS CITRA NUSANTARA PERKASA'),
(28, '1/KW/SDE/III/2018', '2018-03-09', 'PT. YAMAHA INDONESIA MOTOR MANUFACTURING'),
(33, '2/KW/SDE/III/2018', '2018-03-14', 'PT. PRATAMA TUNAS NUSANTARA'),
(36, '5/KW/SDE/III/2018', '2018-04-03', 'AUSTIN GLOBAL PRIMA, PT'),
(37, '6/KW/SDE/IV2018', '2018-04-05', 'PT. SAPTAINDRA SEJATI'),
(38, '7/KW/SDE/IV/2018', '2018-04-06', 'PT. CITRA BARU STEEL'),
(39, '8/KW/SDE/IV/2018', '2018-04-06', 'PT. GOLDEN FORTUNE STEEL'),
(50, '9/KW/SDE/V/2018', '2018-05-25', 'PT. CIPTA DWI BUSANA'),
(51, '10/KW/SDE/V/2018', '2018-05-25', 'PT. SELARAS CITRA NUSANTARA PERKASA'),
(52, '11/KW/SDE/V/2018', '2018-05-30', 'DP PASAR RUMPUT 20%'),
(53, '12/KW/SDE/V/2018', '2018-05-30', 'PT. SEOLINDO (LUNAS)'),
(54, '13/KW/SDE/V/2018', '2018-05-31', 'DP PT. Rizki Banten Mulia'),
(55, '14/KW/SDE/V/2018', '2018-05-31', 'Pelunasan PT. PRATAMA TUNAS (Mansur)'),
(56, '15/KW/SDE/VI/2018', '2018-06-01', 'Tagihan SLO TR Majesty Hotel'),
(57, '16/KW/SDE/VI/2018', '2018-06-02', 'PT. Garuda Kartika Multindo'),
(58, '17/KW/SDE/VI/2018', '2018-06-04', 'SLO TR The Majesty Hotel'),
(59, '18/KW/SDE/VI/2018', '2018-06-06', 'Pelunasan Bintaro & Taruma krw'),
(60, '19/KW/SDE/VI/2018', '2018-06-07', 'pelunasan wika depok Zam zam'),
(61, '20/KW/SDE/VI/2018', '2018-06-08', 'pelunasan Hatire'),
(62, '21/KW/SDE/VI/2018', '2018-06-20', ''),
(63, '22/KW/SDE/VI/2018', '2018-06-20', '9'),
(64, '23/KW/SDE/VI/2018', '2018-06-22', 'PT. YAMAHA INDONESIA MOTOR MFG'),
(65, '2/KW/SDE/VI/2018', '2018-06-25', 'DP PT. Yung Won (Pak Mansur)'),
(66, '24/KW/SDE/VII/2018', '2018-07-03', 'DP BNI TOWER');

-- --------------------------------------------------------

--
-- Table structure for table `t_lampiran`
--

CREATE TABLE `t_lampiran` (
  `id_lampiran` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `nolhpp` varchar(255) DEFAULT NULL,
  `lhpp` varchar(255) DEFAULT NULL,
  `slo_salinan` varchar(255) DEFAULT NULL,
  `sertifikat` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_pemanfaatan`
--

CREATE TABLE `t_pemanfaatan` (
  `id_pemanfaatan` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `kode_provinsi` varchar(50) DEFAULT NULL,
  `kode_kota` varchar(50) DEFAULT NULL,
  `kode_jip` varchar(50) DEFAULT NULL,
  `kode_pjup` varchar(50) DEFAULT NULL,
  `instalasi_pemanfaatan` int(11) NOT NULL,
  `tegangan_pemanfaatan` int(11) NOT NULL,
  `daya_tersambung` varchar(50) DEFAULT NULL,
  `kapasitas_trafo` varchar(100) DEFAULT NULL,
  `peyedia_tegangan_listik` varchar(100) DEFAULT NULL,
  `phbtm` varchar(100) NOT NULL,
  `phbtr` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pemanfaatan`
--

INSERT INTO `t_pemanfaatan` (`id_pemanfaatan`, `id_pemohon`, `kode_provinsi`, `kode_kota`, `kode_jip`, `kode_pjup`, `instalasi_pemanfaatan`, `tegangan_pemanfaatan`, `daya_tersambung`, `kapasitas_trafo`, `peyedia_tegangan_listik`, `phbtm`, `phbtr`) VALUES
(9, '007', '32', '3201', '428', 'Pelanggan', 0, 0, '1785', '2500', 'PT. PLN (Persero) Area Gunung Putri', '3', '2'),
(2, '004', '33', '3324', '428', 'Pelanggan', 0, 0, '555 kVA', '630 kVA', 'PT. PLN (PERSERO) AREA SEMARANG', '2 Unit', '1 Unit'),
(8, '006', '32', '3201', '421', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Gunung Putri', '2', '1'),
(7, '005', '32', '3214', '428', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Purwakarta', '2', '1'),
(10, '008', '36', '3672', '421', 'Pelanggan', 0, 0, '5190', '1x4000, 1x200', 'PT. PLN (Persero) Area Banten Utara', '4', '2'),
(11, '009', '32', '3209', '422', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Cirebon', '2', '1'),
(12, '00A', '31', '3174', '422', 'Pelanggan', 0, 0, '630', '800', 'PT. PLN (Persero) Area Kebayoran Baru', '3', '1'),
(13, '00B', '34', '3404', '425', 'Pelanggan', 0, 0, '4330', '2x2500, 1x1600, 1x630, 1x500', 'PT. PLN (Persero) Area Yogyakarta', '8', '5'),
(14, '00E', '34', '3404', '425', 'Pelanggan', 0, 0, '4330', '2x2500, 1x1600, 1x630, 1x500', 'PT. PLN (Persero) Area Yogyakarta', '8', '5'),
(15, '00F', '32', '3214', '428', 'Pelanggan', 0, 0, '1385', '2x630', 'PT. PLN (Persero) Area Purwakarta', '4', '2'),
(16, '00G', '53', '5301', '424', 'Pelanggan', 0, 0, '1550', '2x400, 1x630', 'PT. PLN (Persero) Area Kupang', '4', '3'),
(17, '00H', '32', '3212', '428', 'Pelanggan', 0, 0, '555', '630 kVA', 'PLN (Persero) Area Cirebon', '2', '1'),
(18, '00I', '32', '3215', '428', 'Pelanggan', 0, 0, '210 kVA', '1x400 kVA', 'PT. PLN (Persero) Area Karawang', '2', '1'),
(19, '00J', '32', '3201', '424', 'Pelanggan', 0, 0, '412 kVA', '1x630 kVA', 'PT. PLN (Persero) Area Gn. Putri', '2', '1'),
(20, '00K', '36', '3601', '428', 'Pelanggan', 0, 0, '345', '400 kVA', 'PT. PLN (Persero) Area Banten Selatan', '2', '1'),
(21, '00L', '36', '3601', '428', 'Pelanggan', 0, 0, '555 kVA', '1x630 kVA', 'PT. PLN (Persero) Area Banten Selatan', '2', '1'),
(22, '00M', '31', '3175', '422', 'Pelanggan', 0, 0, '1210 ', '1600 ', 'PT. PLN (Persero) Area Jatinegara', '3', '1'),
(23, '00N', '32', '3211', '422', 'Pelanggan', 0, 0, '1730', '1x1600 , 1x630', 'PT. PLN (Persero) Area Sumedang', '3', '2'),
(24, '00O', '32', '3211', '422', 'P', 0, 0, '1730', '1x630, 1x1600', 'PT. PLN (Persero) Area Sumedang', '2', '1'),
(25, '00R', '32', '3201', '421', 'Pelanggan', 0, 0, '414', '500', 'PT. PLN (Persero) Area Gn. Putri', '2', '1'),
(26, '00S', '32', '3208', '428', 'Pelanggan', 0, 0, '345', '630', 'PT. PLN (Persero) Area Cirebon', '2', '1'),
(27, '00T', '32', '3276', '421', 'Pelanggan', 0, 0, '1245', '1250', 'PT. PLN (Persero) Area Bogor', '3', '1'),
(28, '00U', '18', '1871', '428', 'Pelanggan', 0, 0, '865', '1000', 'PT. PLN (Persero) Area Tanjung Karang', '2', '4'),
(29, '00V', '18', '1801', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Metro', '2', '1'),
(30, '00W', '18', '1871', '428', 'Pelanggan', 0, 0, '1730', '2x630, 1x400, 1x160', 'PT. PLN (Persero) Area Tanjung Karang', '1', '4'),
(31, '00X', '32', '3276', '425', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Depok', '2', '1'),
(32, '014', '32', '3202', '428', 'Pelanggan', 0, 0, '1730', '2000', 'PT. PLN (Persero) Area Sukabumi', '2', '1'),
(33, '015', '32', '3216', '428', 'Pelanggan', 0, 0, '865', '1000', 'PT. PLN (Persero) Area Bekasi', '3', '1'),
(34, '016', '31', '3174', '425', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bulungan', '2', '1'),
(35, '017', '18', '1803', '428', 'Pelanggan', 0, 0, '345 kVA', '400 kVA', 'PLN Area Kotabumi', '2', '1'),
(36, '018', '31', '3171', '421', 'Pelanggan', 0, 0, '3150', '2 x 2000', 'PT. PLN (Persero) Area Menteng', '4', '2'),
(37, '019', '32', '3216', '428', 'Pelanggan', 0, 0, '1110', '2500', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(38, '01A', '32', '3216', '428', 'Pelanggan', 0, 0, '865', '1250', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(39, '01B', '32', '3201', '428', 'Pelanggan', 0, 0, '555', '1250', 'PT. PLN (Persero) Area Gn. Putri', '2', '1'),
(40, '01C', '32', '3276', '428', 'Pelanggan', 0, 0, '415', '630', 'PT. PLN (Persero) Area Ciracas', '2', '1'),
(41, '01D', '31', '3171', '426', 'Pelanggan', 0, 0, '1110', '1600 ', 'PT. PLN (Persero) Area Menteng', '2', '1'),
(42, '01E', '36', '3603', '428', 'Pelanggan', 0, 0, '1110', '1600 ', 'PT. PLN (Persero) Area Cikupa', '2', '1'),
(43, '01F', '63', '6371', '423', 'Pelanggan', 0, 0, '1385', '1600', 'PT. PLN (Persero) Area Barabai', '2', '1'),
(44, '01G', '32', '3277', '426', 'Pelanggan', 0, 0, '1110', '1250', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(45, '01I', '32', '3216', '428', 'Pelanggan', 0, 0, '2180', '2500', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(46, '01J', '32', '3216', '428', 'Pelanggan', 0, 0, '2770', '3 x 1250', 'PT. PLN (Persero) Area Bekasi', '4', '2'),
(47, '01K', '36', '3603', '428', 'Pelanggan', 0, 0, '1200', '1250', 'PT. PLN (Persero) Area Tangerang', '2', '1'),
(48, '01L', '53', '5301', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Kupang', '2', '1'),
(49, '01M', '32', '3201', '428', 'Pelanggan', 0, 0, '555', '1250', 'PT. PLN (Persero) Area Gunung Putri', '2', '1'),
(50, '01N', '32', '3215', '423', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Karawang', '2', '1'),
(51, '01O', '32', '3202', '428', 'Pelanggan', 0, 0, '690', '1000', 'PT. PLN (Persero) Area Sukabumi', '2', '1'),
(52, '01P', '32', '3209', '422', 'Pelanggan', 0, 0, '3465', '2 x 2000', 'PT. PLN (Persero) Area Cirebon', '4', '2'),
(53, '01Q', '32', '3201', '421', 'Pelanggan', 0, 0, '6.055 ', '1x1600, 2x2500', 'PT. PLN (Persero) Area Bogor', '8', '3'),
(54, '01R', '32', '3201', '428', 'Pelanggan', 0, 0, '3258', '3 x 1250', 'PT. PLN (Persero) Area Gn. Putri', '6', '3'),
(55, '01S', '32', '3204', '428', 'Pelanggan', 0, 0, '345', '630', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(56, '01T', '32', '3216', '428', 'Pelanggan', 0, 0, '315', '400', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(57, '01U', '17', '1771', '425', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bengkulu', '2', '1'),
(58, '01V', '32', '3201', '428', 'Pelanggan', 0, 0, '2258 ', '1 x 1.250, 1 x 2.500 ', 'PT. PLN (Persero) Area Gunung Putri', '5', '2'),
(59, '01W', '32', '3202', '428', 'Pelanggan', 0, 0, '865', '1250', 'PT. PLN (Persero) Area Sukabumi', '2', '1'),
(60, '01X', '32', '3203', '428', 'Pelanggan', 0, 0, '865', '1250', 'PT. PLN (Persero) Area Cianjur', '2', '1'),
(61, '01Z', '35', '3578', '428', 'Pelanggan', 0, 0, '865', '2000', 'PT. PLN (Persero) Area SIER Surabaya ', '2', '1'),
(62, '020', '35', '3578', '428', 'Pelanggan', 0, 0, '1110', '2000', 'PT. PLN (Persero) Area SIER Surabaya', '2', '1'),
(63, '021', '32', '3273', '425', 'P', 0, 0, '', '', '', '', ''),
(64, '022', '32', '3201', '428', 'Pelanggan', 0, 0, '2180', '2 x 2000', 'PT. PLN (Persero) Area Depok', '5', '1'),
(65, '023', '32', '3216', '428', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(66, '024', '52', '5204', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Sumbawa', '2', '1'),
(67, '025', '32', '3215', '421', 'Pelanggan', 0, 0, '555', '400', 'PT. PLN (Persero)  Area Karawang', '2', '1'),
(68, '026', '52', '5207', '428', 'Pelanggan', 0, 0, '240', '315', 'PT. PLN (Persero) Area Sumbawa', '2', '1'),
(69, '027', '32', '3273', '425', 'Pelanggan', 0, 0, '1385', '2 x 1000', 'PT. PLN (Persero) Area Bandung ', '3 ', '2 '),
(70, '028', '32', '3215', '423', 'Pelanggan', 0, 0, '630', '1000', 'PT/ PLN (Persero) Area Karawang', '2', '1'),
(71, '029', '53', '5306', '423', 'Pelanggan', 0, 0, '485', '500', 'PT. PLN (Persero) Area Flores Bagian Timur', '3 ', '1'),
(72, '02A', '53', '5306', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Flores Bagian Timur', '2', '1'),
(73, '02B', '32', '3202', '428', 'Pelanggan', 0, 0, '555', '1000', 'PT. PLN (Area) Sukabumi', '2', '1'),
(74, '02C', '32', '3272', '428', 'Pelanggan', 0, 0, '415', '630', 'PT. PLN (Persero) Area Sukabumi', '2', '1'),
(75, '02D', '52', '5204', '428', 'Pelanggan', 0, 0, '555 ', '630', 'PT. PLN (Persero) Area Sumbawa ', '2 ', '1 '),
(76, '02E', '32', '3215', '421', 'Pelanggan', 0, 0, '345', '630 ', 'PT. PLN (Persero) Area Karawang', '2  ', '1  '),
(77, '02F', '31', '3171', '422', 'Pelanggan', 0, 0, '690 ', '2000', 'PT. PLN (Persero) Area Bulungan', '2 ', '1 '),
(78, '02G', '32', '3215', '421', 'Pelanggan', 0, 0, '345', '630  ', 'PT. PLN (Persero) Area Karawang ', '2 ', '1 '),
(79, '02H', '32', NULL, '421', 'P', 0, 0, '345', '630  ', 'PT. PLN (Persero) Area Karawang ', '2 ', '1 '),
(80, '02I', '32', '', '421', 'P', 0, 0, '345', '630  ', 'PT. PLN (Persero) Area Karawang ', '2 ', '1 '),
(81, '02J', '36', '3603', '421', 'Pelanggan', 0, 0, '555 ', '800 ', 'PT. PLN (Persero) Area Teluk Naga', '2 ', '1  '),
(82, '02K', '16', '1671', '428', 'P', 0, 0, '345', '800', 'PT. PLN (Persero) Area Palembang', '2  ', '1 '),
(83, '02L', '16', '1671', '428', 'P', 0, 0, '345', '800', 'PT. PLN (Persero) Area Palembang', '2  ', '1 '),
(84, '02M', '16', '1671', '428', 'P', 0, 0, '345', '800', 'PT. PLN (Persero) Area Palembang', '2   ', '1 '),
(85, '02N', '16', '1671', '428', 'Pelanggan', 0, 0, '345', '800', 'PT. PLN (Persero) Area Palembang', '2   ', '1 '),
(86, '02O', '16', '1602', '428', 'Pelanggan', 0, 0, '345', '800', 'PT. PLN (Persero) Area Palembang', '2   ', '1 '),
(87, '02P', '32', '3201', '428', 'Pelanggan', 0, 0, '4330', '1 x 1500, 1x 3000', 'PT. PLN (Persero) Area Gn. Putri', '3', '2'),
(88, '02Q', '32', NULL, '428', 'P', 0, 0, '4330', '1 x 1500, 1x 3000', 'PT. PLN (Persero) Area Gn. Putri', '3', '2'),
(89, '02R', '36', '3673', '428', 'P', 0, 0, '865', '1000', 'PT. PLN (Persero) Area Banten Utara', '2', '1'),
(90, '02S', '36', '3604', '428', 'Pelanggan', 0, 0, '865', '1000', 'PT. PLN (Persero) Area Banten Utara ', '2  ', '1 '),
(91, '02T', '32', '3213', '428', 'Pelanggan', 0, 0, '345', '630   ', 'PT. PLN (Persero) Area Purwakarta', '2    ', '1  '),
(92, '02U', '32', '3213', '411', '', 0, 0, '345', '639', 'pt PLN', '2', '1'),
(93, '02V', '32', '3201', '428', 'P', 0, 0, '4330 ', '1x500, 1x3000', 'PT. PLN (Persero)Area Gn. Putri', '3 ', '2 '),
(94, '02W', '32', '3201', '428', 'Pelanggan', 0, 0, '4330 ', '1x500, 1x3000', 'PT. PLN (Persero)Area Gn. Putri', '3 ', '2 '),
(95, '02X', '36', '3604', '428', 'Pelanggan', 0, 0, '865', '1000 ', 'PT. PLN (Persero) Area Banten Utara', '2    ', '1 '),
(96, '02Y', '32', '3213', '428', 'Pelanggan', 0, 0, '345', '630', 'PT. PLN (Persero) Area Purwakarta', '2', '1 '),
(97, '02Z', '32', '3201', '421', 'P', 0, 0, '22', '22', 'tes', '22', '22'),
(98, '030', '11', '1101', '421', '', 0, 0, '22', '22', '22', '22', '22'),
(99, '031', '31', '3175', '424', 'Pelanggan', 0, 0, '690', '800', 'PT. PLN (Persero) Area Pondok Gede', '2 ', '1 '),
(100, '032', '32', '3216', '423', 'Pelanggan', 0, 0, '1200', '1600', 'PT. PLN (Area) Bekasi', '2    ', '1'),
(101, '033', '31', '3171', '423', 'Pelanggan', 0, 0, '8660', '8x2500, 18x630, 1x160, 1x1000', 'PT. PLN (Persero) Area Menteng', '84', '26'),
(102, '034', '36', '3603', '428', 'Pelanggan', 0, 0, '3600', '1x1000, 2x1600', 'PT. PLN (Area) Teluk Naga', '4', '3'),
(103, '035', '31', '3175', '424', 'Pelanggan', 0, 0, '4330', '2x2500', 'PT. PLN (Persero) Area Cempaka Putih', '5', '2'),
(104, '036', '31', '3171', '423', 'Pelanggan', 0, 0, '8660', '6x2500, 18x630, 2x1250, 1x160', 'PT. PLN (Persero) Area Menteng', '84', '25'),
(105, '037', '21', '2103', '428', 'Pelanggan', 0, 0, '1110', '1250', 'PT. PLN (Persero) Area Tanjung Pinang', '2 ', '1'),
(106, '038', '31', '3174', '428', 'Pelanggan', 0, 0, '555', '1000', 'PT. PLN (Persero) Area Bulungan', '2 ', '1  '),
(107, '039', '32', '3216', '428', 'Pelanggan', 0, 0, '415', '630', 'PT. PLN (Persero) Area Bekasi', '3', '1'),
(108, '03A', '32', '3216', '427', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(109, '03B', '32', '3204', '421', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung ', '2    ', '1'),
(110, '03C', '32', '3204', '421', 'P', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung ', '2    ', '1'),
(111, '03F', '32', '3273', '428', 'Pelanggan', 0, 0, '555', '630 ', 'PT. PLN (Area) Bandung', '2', '1'),
(112, '03G', '32', NULL, '428', 'P', 0, 0, '555', '630 ', 'PT. PLN (Area) Bandung', '2', '1'),
(113, '03H', '32', '3216', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(114, '03I', '32', '3216', '428', 'P', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(115, '03J', '32', '3210', '428', 'Pelanggan', 0, 0, '3465', '2 x 2500', 'PT. PLN (Persero) Area Sumedang', '6', '2'),
(116, '03K', '32', '3210', '428', 'P', 0, 0, '3465', '2 x 2500', 'PT. PLN (Persero) Area Sumedang', '6', '2'),
(117, '03L', '32', '3277', '423', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(118, '03M', '32', '3277', '423', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(119, '03N', '31', '3175', '429', 'Pelanggan', 0, 0, '1110', '1x400, 1x800, 1x1000', 'PT. PLN (Persero) Area Kramat Jati', '6', '3'),
(120, '03O', '31', '3175', '429', 'P', 0, 0, '1110', '1x400, 1x800, 1x1000', 'PT. PLN (Persero) Area Kramat Jati', '6', '3'),
(121, '03P', '32', '3273', '425', 'Pelanggan', 0, 0, '1385', '2x1000', 'PT. PLN (Persero) Area Bandung', '3', '2 '),
(122, '03Q', '32', '3273', '425', 'Pelanggan', 0, 0, '1385', '2x1000', 'PT. PLN (Persero) Area Bandung', '3', '2 '),
(123, '03R', '32', '3216', '428', 'Pelanggan', 0, 0, '240', '1600', 'PT. PLN (Perero) Area Bekasi', '2   ', '1'),
(124, '03S', '32', '3216', '428', 'P', 0, 0, '240', '1600', 'PT. PLN (Perero) Area Bekasi', '2   ', '1'),
(125, '03T', '32', '3277', '428', 'P', 0, 0, '1210 ', '1600', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(126, '03U', '32', '3277', '428', 'Pelanggan', 0, 0, '1210 ', '1600', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(127, '03V', '32', '3215', '428', 'Pelanggan', 0, 0, '7500', '2x500,1x750,2x1000,1x1500,2x1600,4x2000,2x2500,1x3', 'PT. PLN (Persero) Area Karawang', '50', '15'),
(128, '03W', '32', '3273', '425', 'Pelanggan', 0, 0, '865', '2x1000', 'PT. PLN (Persero) Area Bandung', '3', '2'),
(129, '03X', '31', '3174', '428', 'Pelanggan', 0, 0, '800', '800', 'PT. PLN (Persero) Area Bintaro', '2', '1 '),
(130, '03Y', '32', '3216', '427', 'Pelanggan', 0, 0, '3465', '6x400, 1x630', 'PT. PLN (Persero) Area Bekasi', '3 ', '4'),
(131, '03Z', '32', '3215', '428', 'Pelanggan', 0, 0, '210', '800', 'PT. PLN (Persero) Area Karawang', '2', '1'),
(132, '040', '32', '3208', '428', 'Pelanggan', 0, 0, '690', '1000', 'PT. PLN (Persero) Area Cirebon', '2', '1'),
(133, '041', '32', '3275', '427', 'Pelanggan', 0, 0, '1560', '2x1600, 2x1250', 'PT. PLN (Persero) Area Bekasi', '7', '4'),
(134, '042', '32', '3201', '428', 'Pelanggan', 0, 0, '250', '400', 'PT. PLN (Persero) Area Gunung Putri', '2', '1'),
(135, '043', '32', '3215', '428', 'Pelanggan', 0, 0, '1730', '2000', 'PT. PLN (Area) Karawang', '2', '1'),
(136, '045', '36', '3601', '428', 'Pelanggan', 0, 0, '865', '1250', 'PT. PLN (Persero) Area Banten Utara', '2', '1'),
(137, '046', '36', '3604', '428', 'Pelanggan', 0, 0, '29900', '800,1600,2x3150,3500,3750,2x4500,2x8000,10000', 'PT. PLN (Persero) Area Banten Utara', '13', '11'),
(138, '047', '36', '3673', '428', 'Pelanggan', 0, 0, '29900', '1x1000, 1x1500, 6x8000', 'PT. PLN (Persero) Area Banten Utara', '10', '8'),
(139, '048', '32', '3216', '427', 'Pelanggan', 0, 0, '350', '800', 'PT. PLN 9Persero) Area Bekasi', '2', '1'),
(140, '049', '32', '3204', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Majalaya', '2', '1'),
(141, '04A', '32', '3214', '428', 'Pelanggan', 0, 0, '2180', '2500', 'PT. PLN (Persero) Area Purwakarta', '2', '1 '),
(142, '04B', '36', '3603', '428', 'Pelanggan', 0, 0, '264', '400', 'PT. PLN (Persero) Area Serpong', '2', '1'),
(143, '04C', '32', '3216', '424', 'Pelanggan', 0, 0, '625', '630 ', 'PT. PLN (Persero) Area Pondok Gede', '2', '1'),
(144, '04D', '53', '5301', '428', 'Pelanggan', 0, 0, '240', '250', 'PT. PLN (Persero) Area Flores Timur', '0', '1'),
(145, '04E', '32', '3273', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung', '2', '1'),
(146, '04E', '32', '3273', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung', '2', '1'),
(147, '04E', '32', '3273', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung', '2', '1'),
(148, '04E', '32', '3273', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung', '2', '1'),
(149, '04F', '32', '3217', '426', 'Pelanggan', 0, 0, '690', '800', 'PT. PLN (Psero) Area Cimahi', '2', '1'),
(150, '04G', '32', '3204', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Area Bandung', '2 ', '1'),
(151, '04H', '32', '3275', '428', 'Pelanggan', 0, 0, '1210 ', '2500', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Prima Bekasi', '2', '1'),
(152, '04I', '32', '3275', '428', 'Pelanggan', 0, 0, '865', '1000 ', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(153, '04J', '32', '3275', '428', 'Pelanggan', 0, 0, '865', '1000 ', 'PT. PLN (Persero) Area Bekasi', '2', '1'),
(154, '04K', '31', '3175', '428', 'Pelanggan', 0, 0, '233', '400', 'PT. PLN (Persero) Distribusi Jakarta Raya Area Cempaka Putih Rayon Cempaka Putih', '2', '1'),
(155, '04L', '32', '3273', '424', 'P', 0, 0, '345', '400', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(156, '04M', '32', '3273', '424', 'Pelanggan', 0, 0, '345', '400', 'PT. PLN (Persero) Area Cimahi', '2', '1'),
(157, '04N', '32', '3273', '425', 'Pelanggan', 0, 0, '690', '1000', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bandung Rayon Prima Priangan', '2 ', '1'),
(158, '04O', '31', '3174', '425', 'Pelanggan', 0, 0, '415', '500', 'PT. PLN (Persero) Distribusi Jakarta Raya Area Bulungan Rayon Bulungan', '0', '1 '),
(159, '04P', '32', '3211', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Distribusi jawa Barat Area Sumedang', '2', '1'),
(160, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(161, '04R', '32', '3275', '421', 'Pelanggan', 0, 0, '795', '1x400, 1x630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Prima Bekasi', '3 ', '2'),
(162, '04P', '32', '3211', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Distribusi jawa Barat Area Sumedang', '2', '1'),
(163, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(164, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(165, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(166, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(167, '04Q', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) DisJabar Area Sukabumi', '2', '1'),
(168, '04R', '32', '3275', '421', 'Pelanggan', 0, 0, '795', '1x400, 1x630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Prima Bekasi', '3 ', '2'),
(169, '04R', '32', '3275', '421', 'Pelanggan', 0, 0, '795', '1x400, 1x630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Prima Bekasi', '3 ', '2'),
(170, '04S', '36', '3603', '428', 'Pelanggan', 0, 0, '630', '1600', 'PT. PLN (Persero) Distribusi Banten Area Teluk Naga Rayon Teluk Naga', '2', '1'),
(171, '04T', '32', '3213', '428', 'Pelanggan', 0, 0, '1730', '2000', 'PT. PLN (Persero) Distribusi Jawa Barat Area Purwakarta', '3', '1'),
(172, '04U', '32', '3272', '428', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Sukabumi Rayon Cicurug', '2', '1'),
(173, '04V', '32', NULL, '428', 'P', 0, 0, '555', '630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Sukabumi Rayon Cicurug', '2', '1'),
(174, '04X', '19', '1901', '428', 'Pelanggan', 0, 0, '345', '1000', 'PT. PLN (Persero) Wilayah Bangka Belitung Area Bangka Rayon Sungai Liat', '2', '1'),
(175, '04Y', '32', '3275', '428', 'P', 0, 0, '2300', '5000', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi rayon Prima Bekasi', '2', '1'),
(176, '04Z', '32', '3275', '428', 'Pelanggan', 0, 0, '2300', '5000', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi rayon Prima Bekasi', '2', '1'),
(177, '050', '19', '1971', '428', 'Pelanggan', 0, 0, '2180', '1x2000, 1x1000', 'PT. PLN (Persero) Wilayah Bangka Belitung Area Bangka Rayon Pangkalpinang ', '3', '2'),
(178, '051', '32', '3275', '423', 'Pelanggan', 0, 0, '415', '630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Cibitung', '2', '1'),
(179, '052', '32', '3275', '426', 'Pelanggan', 0, 0, '865', '1000', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi Rayon Prima Bekasi', '2', '1'),
(180, '055', '32', '', '421', '', 0, 0, '555', '630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi', '2', '1'),
(181, '057', '32', '', '428', 'P', 0, 0, '865', '1250', 'PT. PLN (Persero) Distribusi Jawa Barat Area Cirebon Rayon Haurgeulis', '2', '1'),
(182, '058', '32', '3212', '428', 'Pelanggan', 0, 0, '865', '1250', 'PT. PLN (Persero) Distribusi Jawa Barat Area Cirebon Rayon Haurgeulis', '2', '1'),
(183, '059', '32', '3213', '428', 'Pelanggan', 0, 0, '1110', '1250', 'PT. PLN (Persero) Distribusi Jawa Barat Area Subang', '2', '1'),
(184, '05A', '32', '3276', '425', 'Pelanggan', 0, 0, '2500', '2500', 'PT. PLN (Persero) Distribusi Jawa Barat Area Depok ', '5', '1'),
(185, '05A', '32', '3276', '425', 'Pelanggan', 0, 0, '2500', '2500', 'PT. PLN (Persero) Distribusi Jawa Barat Area Depok ', '5', '1'),
(186, '05B', '32', '3275', '424', 'Pelanggan', 0, 0, '555', '1250', 'PT. PLN (Persero) Distribusi Jawa Barat Area Bekasi', '3', '1'),
(187, '05C', '32', '3215', '428', 'Pelanggan', 0, 0, '1870', '2500', 'PT. PLN (Persero) Distribusi Jawa Barat Area Karawang', '3', '1'),
(188, '05C', '32', '3215', '428', 'Pelanggan', 0, 0, '1870', '2500', 'PT. PLN (Persero) Distribusi Jawa Barat Area Karawang', '3', '1'),
(189, '05E', '16', '1607', '426', 'Pelanggan', 0, 0, '555', '630', 'PT. PLN (Persero) WS2JB Area Palembang', '2', '1'),
(190, '05F', '32', '3204', '428', 'Pelanggan', 0, 0, '240', '630', 'PT. PLN (Persero) Distribusi Jawa Barat Area Majalaya Rayon Prima Majalaya', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_pemasang_instalasi`
--

CREATE TABLE `t_pemasang_instalasi` (
  `id_pemasang_instalasi` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `kode_badan_usaha` varchar(50) DEFAULT NULL,
  `nama_badan_usaha` varchar(50) DEFAULT NULL,
  `tlp` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nomor_sbu` varchar(50) DEFAULT NULL,
  `file_sbu` varchar(200) DEFAULT NULL,
  `tgl_sbu` varchar(50) DEFAULT NULL,
  `nomor_siujk` varchar(50) DEFAULT NULL,
  `file_siujk` varchar(200) DEFAULT NULL,
  `tgl_siujk` varchar(50) DEFAULT NULL,
  `pj_badan_usaha` varchar(50) DEFAULT NULL,
  `pj_teknik` varchar(50) DEFAULT NULL,
  `pj_lit` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pemasang_instalasi`
--

INSERT INTO `t_pemasang_instalasi` (`id_pemasang_instalasi`, `id_pemohon`, `kode_badan_usaha`, `nama_badan_usaha`, `tlp`, `alamat`, `nomor_sbu`, `file_sbu`, `tgl_sbu`, `nomor_siujk`, `file_siujk`, `tgl_siujk`, `pj_badan_usaha`, `pj_teknik`, `pj_lit`) VALUES
(4, '003', 'JA34', 'PT. Gridtech Indonesia', NULL, 'JL. TENGGIRI 5', NULL, 'repository/slo/instalasi/filesbub894f9a41815b97f03c8180129046e22', NULL, NULL, 'repository/slo/instalasi/filesiujkb894f9a41815b97f03c8180129046e22', NULL, 'MUTHIA', 'MUTHIA', 'BAMBANG'),
(2, '001', 'UW05', 'PT. SABRINA JAYA ELEKTRIKAL', NULL, 'JL. PONGTIKU NO.25, KELURAHAN RIMUKU, KECAMATAN MA', NULL, 'repository/slo/instalasi/filesbu8fa8207a3c78dfed84c4f7f43cc7a24d', NULL, NULL, 'repository/slo/instalasi/filesiujk8fa8207a3c78dfed84c4f7f43cc7a24d', NULL, 'VERAWATI', 'H. ARIEF AZHARI, ST', NULL),
(3, '002', 'JEBT', 'PT. ANUGRAH JAYA ENJENERING', NULL, 'JL. SETIABUDI', NULL, 'repository/slo/instalasi/filesbue28d932d21cc9101441473f996b582c1', NULL, NULL, 'repository/slo/instalasi/filesiujke28d932d21cc9101441473f996b582c1', NULL, 'HANA', 'MIRZA', 'YUDA'),
(5, '004', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perumnas Bumi Teluk Jambe Blok I / 32 Ds. Sukaluyu', NULL, 'repository/slo/instalasi/filesbu5af613d6fe698f54010ca12a2c77d587', NULL, NULL, 'repository/slo/instalasi/filesiujk5af613d6fe698f54010ca12a2c77d587', NULL, 'Edy Suyatno', 'Oke Hemawan', 'H. Arief Azhari, ST'),
(6, '005', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perumnas Bumi Teluk Jambe Blok I / 32  Ds. Sukaluy', NULL, 'repository/slo/instalasi/filesbu6b8fcf1aa6c0b73234f1a35febe93e2f', NULL, NULL, 'repository/slo/instalasi/filesiujk6b8fcf1aa6c0b73234f1a35febe93e2f', NULL, 'Edi Suyatno', 'Oke Hermawan', 'H. Arief Azhari, ST'),
(7, '006', 'GESZ', 'PT. NUSA ADI DAYA', NULL, 'Perumnas Bumi Teluk Jambe Blok I / 32  Ds. Sukaluy', NULL, 'repository/slo/instalasi/filesbu2e021efc3f39d92849dee2d654278585', NULL, NULL, 'repository/slo/instalasi/filesiujk2e021efc3f39d92849dee2d654278585', NULL, 'Ir. Heri Agus Pratisto', 'Dodi Kodri', 'H. Arief Azhari, ST'),
(8, '007', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'PERUM.METLAND CLUSTER EBONI NO.3 RT006/003 KEL.CIL', NULL, 'repository/slo/instalasi/filesbua84fb627e2a037497f002d674e6a5c42', NULL, NULL, 'repository/slo/instalasi/filesiujka84fb627e2a037497f002d674e6a5c42', NULL, 'DJONED EDIKARYA', 'SUSILO ANGGORO', 'H. Arief Azhari, ST'),
(9, '008', 'JA14', 'PT. CITRA TEKNIK ANDALAS', NULL, 'Jl. Usman Effendi sepang Tanjak No. 40 Rt. 005/Rw.', NULL, 'repository/slo/instalasi/filesbu77ffc6aab77209172bc73b40850c6286', NULL, NULL, 'repository/slo/instalasi/filesiujk77ffc6aab77209172bc73b40850c6286', NULL, 'Suparyanto', 'Mohamad Maskur', 'H. Arief Azhari, ST'),
(10, '005', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perumnas Bumi Teluk Jambe Blok I / 32  Ds. Sukaluy', NULL, 'repository/slo/instalasi/filesbu11aa5a1e449abf979491c74fb653e6bb', NULL, NULL, 'repository/slo/instalasi/filesiujk11aa5a1e449abf979491c74fb653e6bb', NULL, 'Edi Suyatno', 'Oke Hermawan', 'H. Arief Azhari, ST'),
(11, '006', 'GESZ', 'PT. NUSA ADI DAYA', NULL, 'Perumnas Bumi Teluk Jambe Blok I / 32  Ds. Sukaluy', NULL, 'repository/slo/instalasi/filesbuf33a63ed11678a5be9a3cb88576b3b21', NULL, NULL, 'repository/slo/instalasi/filesiujkf33a63ed11678a5be9a3cb88576b3b21', NULL, 'Ir. Heri Agus Pratisto', 'Dodi Kodri', 'H. Arief Azhari, ST'),
(12, '007', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'PERUM.METLAND CLUSTER EBONI NO.3 RT006/003 KEL.CIL', NULL, 'repository/slo/instalasi/filesbu42090b0315999889f14ee39add47fb0a', NULL, NULL, 'repository/slo/instalasi/filesiujk42090b0315999889f14ee39add47fb0a', NULL, 'DJONED EDIKARYA', 'SUSILO ANGGORO', 'H. Arief Azhari, ST'),
(13, '008', 'JA14', 'PT. CITRA TEKNIK ANDALAS', NULL, 'Jl. Usman Effendi sepang Tanjak No. 40 Rt. 005/Rw.', NULL, 'repository/slo/instalasi/filesbu04fe424172b3fccd9fc3065baae7e69d', NULL, NULL, 'repository/slo/instalasi/filesiujk04fe424172b3fccd9fc3065baae7e69d', NULL, 'Suparyanto', 'Mohamad Maskur', 'H. Arief Azhari, ST'),
(14, '009', 'JEBM', 'PT. TERUNA JAYA TEKNIK', NULL, 'Jl. Permata Raya III Blok D.2 No. 42 Permata Harja', NULL, 'repository/slo/instalasi/filesbu1838a8d549eb211872d3aa43caae8b4e', NULL, NULL, 'repository/slo/instalasi/filesiujk1838a8d549eb211872d3aa43caae8b4e', NULL, 'Ilham Dhany Siregar', 'Ilham Dhany Siregar', 'H. Arief Azhari, ST'),
(15, '00A', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV/No. 03, Rt. 03/16 Bantarjati Bogo', NULL, 'repository/slo/instalasi/filesbue84ddca84df4346549ba30b0f98dd568', NULL, NULL, 'repository/slo/instalasi/filesiujke84ddca84df4346549ba30b0f98dd568', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(16, '00B', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt/Rw. 03/02 Iwul Parung, Bogo', NULL, 'repository/slo/instalasi/filesbud8c9152bdf4cd746b56be99c9d4feda3', NULL, NULL, 'repository/slo/instalasi/filesiujkd8c9152bdf4cd746b56be99c9d4feda3', NULL, 'Asmat', 'Ir. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(17, '00C', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV/No. 03, Rt. 03/16 Bantarjati Bogo', NULL, 'repository/slo/instalasi/filesbua121ad16cb23c6c7569f14ae186d35b7', NULL, NULL, 'repository/slo/instalasi/filesiujka121ad16cb23c6c7569f14ae186d35b7', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(18, '00D', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV/ No. 03, Rt. 03/16 Bantarjati Bog', NULL, 'repository/slo/instalasi/filesbu22d7f125d4fd3d466c95fc147df34f6d', NULL, NULL, 'repository/slo/instalasi/filesiujk22d7f125d4fd3d466c95fc147df34f6d', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(19, '00E', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Jl. Kp. Lengkong Barang Rt/Rw. 03/02 Iwul Parung B', NULL, 'repository/slo/instalasi/filesbue2cdfc705fc7f9f2dd19b54777dcc2ba', NULL, NULL, 'repository/slo/instalasi/filesiujke2cdfc705fc7f9f2dd19b54777dcc2ba', NULL, 'Asmat', 'Ir. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(20, '00F', 'JE79', 'PT. BUMI BANGKIT BERSAMA', NULL, 'Kp. Mangkalaya Rt. 005/005, Ds. Cibolang Kec. Gunu', NULL, 'repository/slo/instalasi/filesbu4c7c6b5348b3380c02c4d79782e80dce', NULL, NULL, 'repository/slo/instalasi/filesiujk4c7c6b5348b3380c02c4d79782e80dce', NULL, 'Saepul Handa', 'Wawan Abdu Shomad', 'Arief Azhari, ST'),
(21, '00G', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV/ No. 03 Rt. 03/16 Bantarjati, Bog', NULL, 'repository/slo/instalasi/filesbu549eecd60d761f338dbca9e82854a7c4', NULL, NULL, 'repository/slo/instalasi/filesiujk549eecd60d761f338dbca9e82854a7c4', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. Arief Azhari, ST'),
(22, '00H', 'GERY', 'PT. JAPA MELINDO PRATAMA', NULL, 'Jl. Setia I No. 69 Rt.04/08, Kel. Jaticempaka   Ke', NULL, 'repository/slo/instalasi/filesbu914d21f9947968cc2f4d04b9044650c6', NULL, NULL, 'repository/slo/instalasi/filesiujk914d21f9947968cc2f4d04b9044650c6', NULL, 'Ir. Eddy Fitra', 'Ir. Koderi', 'H. ARIEF AZHARI, ST'),
(23, '00I', 'JEAB', 'PT. BANDUNG ISCO', NULL, 'Jl. Andromeda Blok L IIA No. 42 Margahayu Raya - B', NULL, 'repository/slo/instalasi/filesbu55d51d550d5944bf5a84f93b1f2dceff', NULL, NULL, 'repository/slo/instalasi/filesiujk55d51d550d5944bf5a84f93b1f2dceff', NULL, 'Robin Goeltom', 'Posmas Anastas Simanjuntak', 'H. ARIEF AZHARI, ST'),
(24, '00J', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, ', NULL, 'repository/slo/instalasi/filesbu971703aa4234d02af56a8599781e8c0f', NULL, NULL, 'repository/slo/instalasi/filesiujk971703aa4234d02af56a8599781e8c0f', NULL, 'Djoned Edikarya', 'Susilo Anggoro', 'H. ARIEF AZHARI, ST'),
(25, '00K', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV/No. 03, Rt. 03/16 Bantarjati Bogo', NULL, 'repository/slo/instalasi/filesbuad17dd1a85a02e65644f6118d6bc8eb6', NULL, NULL, 'repository/slo/instalasi/filesiujkad17dd1a85a02e65644f6118d6bc8eb6', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(26, '00L', 'GEWB', 'PT. VOLTASE AMPERINDO PERKAS', NULL, 'Jl. Sutiragen IV/ No. 03, Rt. 03/16 Bantarjati Bog', NULL, 'repository/slo/instalasi/filesbu6f98ff0fb397661ef885765a76a42110', NULL, NULL, 'repository/slo/instalasi/filesiujk6f98ff0fb397661ef885765a76a42110', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(27, '00M', '0000', '-', NULL, 'Terlampir Surat Pernyataan Non Instalatir dari Kon', NULL, 'repository/slo/instalasi/filesbu262ba6dfc61ac576acd1f5b1c38071c7', NULL, NULL, 'repository/slo/instalasi/filesiujk262ba6dfc61ac576acd1f5b1c38071c7', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(28, '00N', '0000', 'Tidak memiliki data instalatir', NULL, 'Terlampir Surat Pernyataan, dikarenakan instalasi ', NULL, 'repository/slo/instalasi/filesbu092075c236afb4bd721e6c245ee6eee4', NULL, NULL, 'repository/slo/instalasi/filesiujk092075c236afb4bd721e6c245ee6eee4', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(29, '00O', '0000', 'Tidak Ada Pembangunan', NULL, 'Terlampir Surat Pernyataan Konsumen ', NULL, 'repository/slo/instalasi/filesbu7e23ff71f9791fe3348e32ff5ecbbeb7', NULL, NULL, 'repository/slo/instalasi/filesiujk7e23ff71f9791fe3348e32ff5ecbbeb7', NULL, '', '', NULL),
(30, '00P', '-', '', NULL, '-', NULL, 'repository/slo/instalasi/filesbubf96758dfdeafa33733c907c410e5c60', NULL, NULL, 'repository/slo/instalasi/filesiujkbf96758dfdeafa33733c907c410e5c60', NULL, '-', '-', NULL),
(31, '00Q', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer', NULL, 'repository/slo/instalasi/filesbu151645781e028e93f81395127fdeea12', NULL, NULL, 'repository/slo/instalasi/filesiujk151645781e028e93f81395127fdeea12', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(32, '00R', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung', NULL, 'repository/slo/instalasi/filesbu73f809b91fcf30e73ad9047eab7827fe', NULL, NULL, 'repository/slo/instalasi/filesiujk73f809b91fcf30e73ad9047eab7827fe', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(33, '00S', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/Rw. 02, Iwul Parung', NULL, 'repository/slo/instalasi/filesbub46b2f977089d7964de870188dd2cc36', NULL, NULL, 'repository/slo/instalasi/filesiujkb46b2f977089d7964de870188dd2cc36', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(34, '00T', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/Rw. 02 Iwul Parung', NULL, 'repository/slo/instalasi/filesbu5f9fe7903d7ec915b75a539e11c96f0e', NULL, NULL, 'repository/slo/instalasi/filesiujk5f9fe7903d7ec915b75a539e11c96f0e', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(35, '00U', 'AXCN', 'PT. MULIA MAKMUR KENCANA', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B Kab. Kota Ban', NULL, 'repository/slo/instalasi/filesbu2649722b9589ac087676e4682380f288', NULL, NULL, 'repository/slo/instalasi/filesiujk2649722b9589ac087676e4682380f288', NULL, 'Joni Tri, SH', 'Sapto Isnaintoro, ST', 'H. ARIEF AZHARI, ST'),
(36, '00V', 'AXCN', 'PT. MULIA MAKMUR KENCANA', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B Kab. Kota Ban', NULL, 'repository/slo/instalasi/filesbu187530c726166d24e8f2bc788039a68e', NULL, NULL, 'repository/slo/instalasi/filesiujk187530c726166d24e8f2bc788039a68e', NULL, 'Joni Tri, SH', 'Sapto Isnaintoro, ST', 'H. ARIEF AZHARI, ST'),
(37, '00W', 'AXCN', 'PT. MULIA MAKMUR KENCANA', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B, Kab. Kota Ba', NULL, 'repository/slo/instalasi/filesbu2be453296e2c6d62da5d7da68a0be4dc', NULL, NULL, 'repository/slo/instalasi/filesiujk2be453296e2c6d62da5d7da68a0be4dc', NULL, 'Joni Tri, SH', 'Sapto Isnaintoro, ST', 'H. ARIEF AZHARI, ST'),
(38, '00X', 'JECM', 'PT. HEN JAYA ', NULL, 'Jl. H. Kurdi No. 14 Moh. Toha Bandung Jawa Barat', NULL, 'repository/slo/instalasi/filesbuea8c6a30403ccc7d4e33e5ec5c1d0f81', NULL, NULL, 'repository/slo/instalasi/filesiujkea8c6a30403ccc7d4e33e5ec5c1d0f81', NULL, 'H. Henhen Bestari, Ir, MM', 'Yudi Bernadi, ST, MT', 'H. ARIEF AZHARI, ST'),
(39, '00Y', 'XF22', 'CV. Sukses Perdana', NULL, 'BTN Kolhua Blok V No. 20 Kota Kupang Provinsi Nusa', NULL, 'repository/slo/instalasi/filesbu9e473a0bf2e4328042240d8e01c79641', NULL, NULL, 'repository/slo/instalasi/filesiujk9e473a0bf2e4328042240d8e01c79641', NULL, 'Tri Hartono', 'Tri hartono', NULL),
(40, '00Z', 'XF22', 'CV. Sukses Perdana', NULL, 'BTN Kolhua Blok V No. 20 Kota Kupang Provinsi Nusa', NULL, 'repository/slo/instalasi/filesbu44435ae84c8125d45ebe78cbcdab31bd', NULL, NULL, 'repository/slo/instalasi/filesiujk44435ae84c8125d45ebe78cbcdab31bd', NULL, 'Tri Hartono', 'Tri hartono', 'H. ARIEF AZHARI, ST'),
(41, '010', 'XF41', 'CV. Ariston', NULL, 'Jl. Gereja Moria, Kel. Lilibia Kota Kupang Prov. N', NULL, 'repository/slo/instalasi/filesbud9cae64a0789c1903cfeea8aa0db0bc2', NULL, NULL, 'repository/slo/instalasi/filesiujkd9cae64a0789c1903cfeea8aa0db0bc2', NULL, 'Gabriel Odja', '-', 'H. ARIEF AZHARI, ST'),
(42, '011', 'XF41', 'CV. Ariston', NULL, 'Jl. Gereja Moria, Kel. Lilibia Kota Kupang Prov. N', NULL, 'repository/slo/instalasi/filesbu2892036c5314c23b1223ed711daa5875', NULL, NULL, 'repository/slo/instalasi/filesiujk2892036c5314c23b1223ed711daa5875', NULL, 'Gabriel Odja', '-', ''),
(43, '012', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Jl. KH. Noer Ali Rt. 07/03, Kel. Pekayon Jaya', NULL, 'repository/slo/instalasi/filesbu83605df6406ed3faa74a35c5863ed5d6', NULL, NULL, 'repository/slo/instalasi/filesiujk83605df6406ed3faa74a35c5863ed5d6', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(44, '013', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Jl. KH. Noer Ali Rt. 07/03, Kel. Pekayon Jaya', NULL, 'repository/slo/instalasi/filesbuebb7785328b850153acbeb440ad54341', NULL, NULL, 'repository/slo/instalasi/filesiujkebb7785328b850153acbeb440ad54341', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(45, '014', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung', NULL, 'repository/slo/instalasi/filesbuad40b38b59b2f09fa76fb6b25aff1165', NULL, NULL, 'repository/slo/instalasi/filesiujkad40b38b59b2f09fa76fb6b25aff1165', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. Arief Azhari, ST'),
(46, '015', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Kp. Kalijambe Rt. 002/004, Ds. Lambangsari, Kec. T', NULL, 'repository/slo/instalasi/filesbu4a3824d9524ddf5b4d547cf5ddb737d0', NULL, NULL, 'repository/slo/instalasi/filesiujk4a3824d9524ddf5b4d547cf5ddb737d0', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(47, '016', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32 Ds. Sukalu', NULL, 'repository/slo/instalasi/filesbu602e974dfee248c41befaba3cb158457', NULL, NULL, 'repository/slo/instalasi/filesiujk602e974dfee248c41befaba3cb158457', NULL, 'Edi Suyanto', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(48, '017', 'AXCN', 'PT. MULIA MAKMUR KENCANA', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B', NULL, 'repository/slo/instalasi/filesbu1c3461163ab3d746e3c9985e0a88b835', NULL, NULL, 'repository/slo/instalasi/filesiujk1c3461163ab3d746e3c9985e0a88b835', NULL, 'JONI TRI, SH', 'Sapto Isnaintoro, ST', 'H. ARIEF AZHARI, ST'),
(49, '018', 'GIEZ', 'PT. BAYU SUKSES PRATAMA', NULL, 'Jl. Raya Kalibata No. 11-12 Blok C-D Rt. 001/07 Ra', NULL, 'repository/slo/instalasi/filesbu62b11e063df26a5043abbb8a20a08526', NULL, NULL, 'repository/slo/instalasi/filesiujk62b11e063df26a5043abbb8a20a08526', NULL, 'Ir. Mulyono', 'Ir. Mulyono', 'H. ARIEF AZHARI, ST'),
(50, '019', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kalijambe Rt. 002/004, Desa Lambangsari Kec. T', NULL, 'repository/slo/instalasi/filesbub79dc17418cf7ebc2590faddf8064076', NULL, NULL, 'repository/slo/instalasi/filesiujkb79dc17418cf7ebc2590faddf8064076', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(51, '01A', 'GESZ', 'PT. NUSA ADI DAYA', NULL, 'Perum Cijahe Legacy Blok C-3 Rt. 002/001 Kel. Curu', NULL, 'repository/slo/instalasi/filesbu428630e8dbee9fa1d34764ef462e677f', NULL, NULL, 'repository/slo/instalasi/filesiujk428630e8dbee9fa1d34764ef462e677f', NULL, 'Ir. Heri Agus Pratisto', 'Dodi Kodri', 'H. ARIEF AZHARI, ST'),
(52, '01B', '0000', 'Terlampir Surat Pernyataan Non Instalatir', NULL, '', NULL, 'repository/slo/instalasi/filesbu87ecdd719358c00f03eeacfa16ceb402', NULL, NULL, 'repository/slo/instalasi/filesiujk87ecdd719358c00f03eeacfa16ceb402', NULL, '', '', 'H. ARIEF AZHARI, ST'),
(53, '01C', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Kp. Kalijambe Rt. 002/ Rw. 004 Ds. Lambang Sari Ke', NULL, 'repository/slo/instalasi/filesbufb8dbc4a5d09ac189cc72a8f90b08d38', NULL, NULL, 'repository/slo/instalasi/filesiujkfb8dbc4a5d09ac189cc72a8f90b08d38', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(54, '01D', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu507b755615eea064dc43c25dfd8b8f0e', NULL, NULL, 'repository/slo/instalasi/filesiujk507b755615eea064dc43c25dfd8b8f0e', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(55, '01E', 'JA14', 'PT. CITRA TEKNIK ANDALAS', NULL, 'Jl. Usman Efendi No. 40 Rt. 05/ Rw. 06 Sepang Tanj', NULL, 'repository/slo/instalasi/filesbu25a8509b5c15c694e61b182a3a676448', NULL, NULL, 'repository/slo/instalasi/filesiujk25a8509b5c15c694e61b182a3a676448', NULL, 'Suparyanto', 'Mohamad maskur', 'H. ARIEF AZHARI, ST'),
(56, '01F', 'JEAB', 'PT. BANDUNG ISCO', NULL, 'Jl. Andromeda Blok L-II No. 42, Margahayu Raya Ban', NULL, 'repository/slo/instalasi/filesbu61c78869e750afb7270f132d6a4c2939', NULL, NULL, 'repository/slo/instalasi/filesiujk61c78869e750afb7270f132d6a4c2939', NULL, 'Robin Goeltom', 'Posman Anastas Simanjuntak', 'H. ARIEF AZHARI, ST'),
(57, '01G', 'JE75', 'CV. PRIMA JAYA TEKNIK', NULL, 'Kp. Sukawangi Rt. 001/09, Kel. Situwangi Kec. Ciha', NULL, 'repository/slo/instalasi/filesbua69d9f959d5e2e0b74212eff134e9417', NULL, NULL, 'repository/slo/instalasi/filesiujka69d9f959d5e2e0b74212eff134e9417', NULL, 'Subandi', 'Deni Parsito', 'H. ARIEF AZHARI, ST'),
(58, '01H', 'AXCN', 'PT. MULIA MAKMUR KENCANA', NULL, 'Jl. Edro Suratmin Gg. Waru No. 45-B Kota Bandarlam', NULL, 'repository/slo/instalasi/filesbu63992462fbec383029e70a3160644c1f', NULL, NULL, 'repository/slo/instalasi/filesiujk63992462fbec383029e70a3160644c1f', NULL, 'Joni Tri, SH', 'Sapto Isnaintoro, ST', 'H. ARIEF AZHARI, ST'),
(59, '01I', '0000', 'Tidak Ada Pembangunan', NULL, '-', NULL, 'repository/slo/instalasi/filesbu5552824ecc3a6f768a91671dd54b2679', NULL, NULL, 'repository/slo/instalasi/filesiujk5552824ecc3a6f768a91671dd54b2679', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(60, '01J', '0000', 'Tidak Ada Pembangunan', NULL, '-', NULL, 'repository/slo/instalasi/filesbu16382ccd2618c2c3d7bbaafa67bd4fc0', NULL, NULL, 'repository/slo/instalasi/filesiujk16382ccd2618c2c3d7bbaafa67bd4fc0', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(61, '01K', 'JA24', 'PT. ERA JAYA SAKTI BERSAMA', NULL, 'Jl. Pagedangan Kp. Cicayur I No. 2, Rt. 01 / Rw. 0', NULL, 'repository/slo/instalasi/filesbu03d533ce8d1ed5e32605997ca97e5e72', NULL, NULL, 'repository/slo/instalasi/filesiujk03d533ce8d1ed5e32605997ca97e5e72', NULL, 'Indra Sakti, ST', 'Indra Sakti, ST', 'H. ARIEF AZHARI, ST'),
(62, '01L', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu798d14075556ce6e8411d1cb0b86e942', NULL, NULL, 'repository/slo/instalasi/filesiujk798d14075556ce6e8411d1cb0b86e942', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(63, '01M', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Cluster Eboni No. 3 Rt. 006/ Rw. 00', NULL, 'repository/slo/instalasi/filesbu476263945f378a3fef42ceb7f93714b9', NULL, NULL, 'repository/slo/instalasi/filesiujk476263945f378a3fef42ceb7f93714b9', NULL, 'Djoned Edikarya', 'Susilo Anggoro', 'H. ARIEF AZHARI, ST'),
(64, '01N', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32 Ds. Sukalu', NULL, 'repository/slo/instalasi/filesbua8014b1fdfecc072b884ca495ac3fe9d', NULL, NULL, 'repository/slo/instalasi/filesiujka8014b1fdfecc072b884ca495ac3fe9d', NULL, 'Edi Suyanto', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(65, '01O', '0000', 'Tidak Ada Pembangunan', NULL, 'Surat Pernyataan Non Instalatir Terlampir', NULL, 'repository/slo/instalasi/filesbu9b066a876be17eece4f78b18b85783d3', NULL, NULL, 'repository/slo/instalasi/filesiujk9b066a876be17eece4f78b18b85783d3', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(66, '01P', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Ka', NULL, 'repository/slo/instalasi/filesbu21a13c911fef784219b9dfec89733f68', NULL, NULL, 'repository/slo/instalasi/filesiujk21a13c911fef784219b9dfec89733f68', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(67, '01Q', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Mathland Cluster Eboni No. 3 Rt. 006/003, Ke', NULL, 'repository/slo/instalasi/filesbu016eec61c292bfc8917d578a552cfcb5', NULL, NULL, 'repository/slo/instalasi/filesiujk016eec61c292bfc8917d578a552cfcb5', NULL, 'Djoned Edikarya', 'Susilo Anggoro', 'H.Arief Azhari, ST'),
(68, '01R', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu987303caf5698d83eb2a5caab7c2c099', NULL, NULL, 'repository/slo/instalasi/filesiujk987303caf5698d83eb2a5caab7c2c099', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(69, '01S', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM Gg. Mukti No. 261 Kel. Kebon Jayanti Kec. ', NULL, 'repository/slo/instalasi/filesbu5e4e52f45643b95c3dce331ff00a8d66', NULL, NULL, 'repository/slo/instalasi/filesiujk5e4e52f45643b95c3dce331ff00a8d66', NULL, 'Wiwi Susilowati, ST', 'Wiwi Susilowati, ST', 'H. ARIEF AZHARI, ST'),
(70, '01T', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung, Kab. Bo', NULL, 'repository/slo/instalasi/filesbuc5f9312d5a3bf212ce25830f5e5de75e', NULL, NULL, 'repository/slo/instalasi/filesiujkc5f9312d5a3bf212ce25830f5e5de75e', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H.Arief Azhari, ST'),
(71, '01U', 'CS17', 'PT. ASTA SARANA RAYA', NULL, 'Jl. Bintan No. 427 RT/RW. 14/04 Kel. Lorok    Pakj', NULL, 'repository/slo/instalasi/filesbu0e5b85e97c99d63db7df0868125968e8', NULL, NULL, 'repository/slo/instalasi/filesiujk0e5b85e97c99d63db7df0868125968e8', NULL, 'Binson Johari', 'Ari Rahdian Saleh', 'H.Arief Azhari, ST'),
(72, '01V', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Mathland Cluster Eboni No. 3 Rt. 006/003, Ke', NULL, 'repository/slo/instalasi/filesbu12972a7700986dc578f4bd7979f765f2', NULL, NULL, 'repository/slo/instalasi/filesiujk12972a7700986dc578f4bd7979f765f2', NULL, 'Djoned Edikarya', 'Susilo Anggoro', 'H.Arief Azhari, ST'),
(73, '01W', '0000', 'Tidak Ada Pembangunan', NULL, 'Terlampir Surat Pernyataan Non Instalatir dari Kon', NULL, 'repository/slo/instalasi/filesbu8419977d9587756ef59311156fd18d29', NULL, NULL, 'repository/slo/instalasi/filesiujk8419977d9587756ef59311156fd18d29', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(74, '01X', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl.Sutiragen IV No. 3 Bantarjati Bogor Utara - Jaw', NULL, 'repository/slo/instalasi/filesbu5f167222b1b516c1750742b9dda071b8', NULL, NULL, 'repository/slo/instalasi/filesiujk5f167222b1b516c1750742b9dda071b8', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(75, '01Y', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer', NULL, 'repository/slo/instalasi/filesbu4b2cfb35ebf54bcde429d338652f9470', NULL, NULL, 'repository/slo/instalasi/filesiujk4b2cfb35ebf54bcde429d338652f9470', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(76, '01Z', '0000', 'Non Instalatir', NULL, '-', NULL, 'repository/slo/instalasi/filesbufceb502d7be66bff40f3fc0cc31281dc', NULL, NULL, 'repository/slo/instalasi/filesiujkfceb502d7be66bff40f3fc0cc31281dc', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(77, '020', '0000', 'Tidak Ada Pembangunan', NULL, 'NON INSTALATIR', NULL, 'repository/slo/instalasi/filesbu075167f832db4a419074f39b6a2dcf69', NULL, NULL, 'repository/slo/instalasi/filesiujk075167f832db4a419074f39b6a2dcf69', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(78, '021', '0000', 'Tidak Ada Pembangunan', NULL, 'Non Instalatir', NULL, 'repository/slo/instalasi/filesbud0a15c80ef12091e7a76aac548793efe', NULL, NULL, 'repository/slo/instalasi/filesiujkd0a15c80ef12091e7a76aac548793efe', NULL, '', '', NULL),
(79, '022', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu51b027e3031b3476a500ec9eb8cfb536', NULL, NULL, 'repository/slo/instalasi/filesiujk51b027e3031b3476a500ec9eb8cfb536', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(80, '023', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/32 Ds. Sukaluyu Telu', NULL, 'repository/slo/instalasi/filesbub403ffff3b0355c4769a0be8f636ecc0', NULL, NULL, 'repository/slo/instalasi/filesiujkb403ffff3b0355c4769a0be8f636ecc0', NULL, 'Edi Suyatno', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(81, '024', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbuc703197f77ebbaf1af09e5c81e5f8186', NULL, NULL, 'repository/slo/instalasi/filesiujkc703197f77ebbaf1af09e5c81e5f8186', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(82, '025', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I / 33 Karawang Jawa B', NULL, 'repository/slo/instalasi/filesbue5680659910ebbf2300e1908efc38987', NULL, NULL, 'repository/slo/instalasi/filesiujke5680659910ebbf2300e1908efc38987', NULL, 'Edy Suyanto', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(83, '026', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu358bc7b4ab8e6e93a4a86d1e578b8d27', NULL, NULL, 'repository/slo/instalasi/filesiujk358bc7b4ab8e6e93a4a86d1e578b8d27', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(84, '027', '0000', 'Tidak Ada Pembangunan', NULL, 'Non Instalatir', NULL, 'repository/slo/instalasi/filesbu77b79b4a3848fbcc266e79f9e4629cc2', NULL, NULL, 'repository/slo/instalasi/filesiujk77b79b4a3848fbcc266e79f9e4629cc2', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(85, '028', 'GETW', 'PT. gadino sejahtera abadi', NULL, 'Jl. Mashudi No. 26 Kp. Cariu Kota Baru Karawang - ', NULL, 'repository/slo/instalasi/filesbuc185ae5db47923bcfb9c09fd7af8b0ae', NULL, NULL, 'repository/slo/instalasi/filesiujkc185ae5db47923bcfb9c09fd7af8b0ae', NULL, 'Ai Purwanti', 'Hidayat', 'H. ARIEF AZHARI, ST'),
(86, '029', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu0319191020c6abe398e629e48d536bc7', NULL, NULL, 'repository/slo/instalasi/filesiujk0319191020c6abe398e629e48d536bc7', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(87, '02A', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu03a85e8757e81829aeb2385b26594703', NULL, NULL, 'repository/slo/instalasi/filesiujk03a85e8757e81829aeb2385b26594703', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(88, '02B', '0000', 'Tidak Ada Pembangunan', NULL, 'Non Instalatir', NULL, 'repository/slo/instalasi/filesbud19c9920eb66eb8e927729b78ecb4edb', NULL, NULL, 'repository/slo/instalasi/filesiujkd19c9920eb66eb8e927729b78ecb4edb', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(89, '02C', '0000', 'Tidak Ada Pembangunan', NULL, 'Non Instalatir', NULL, 'repository/slo/instalasi/filesbu32a82ca2e7d9699afb6154138edaf7a6', NULL, NULL, 'repository/slo/instalasi/filesiujk32a82ca2e7d9699afb6154138edaf7a6', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(90, '02D', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu41499c2791727aa635dee5caadee168d', NULL, NULL, 'repository/slo/instalasi/filesiujk41499c2791727aa635dee5caadee168d', NULL, 'Asmat', 'IR. Nursamsu Iman ', 'H. ARIEF AZHARI, ST'),
(91, '02E', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa B', NULL, 'repository/slo/instalasi/filesbu4fc88d254823f4f7a5349a66f0ef917e', NULL, NULL, 'repository/slo/instalasi/filesiujk4fc88d254823f4f7a5349a66f0ef917e', NULL, 'Edy Suyatno', 'Oke Hermawan ', 'H. ARIEF AZHARI, ST'),
(92, '02F', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu0c0a10afd14e441503b1a3a7b700eb49', NULL, NULL, 'repository/slo/instalasi/filesiujk0c0a10afd14e441503b1a3a7b700eb49', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(93, '02G', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa B', NULL, 'repository/slo/instalasi/filesbu2310eb9daaef6ca65682e3f710a5dfb2', NULL, NULL, 'repository/slo/instalasi/filesiujk2310eb9daaef6ca65682e3f710a5dfb2', NULL, 'Edy Suyatno', 'Oke Hermawan  ', 'H. ARIEF AZHARI, ST'),
(94, '02H', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa B', NULL, 'repository/slo/instalasi/filesbu25487adf717b88ce343739dad444b18f', NULL, NULL, 'repository/slo/instalasi/filesiujk25487adf717b88ce343739dad444b18f', NULL, 'Edy Suyatno', 'Oke Hermawan  ', NULL),
(95, '02I', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa B', NULL, 'repository/slo/instalasi/filesbua5361e7cb22487a6326b8ce5f832ef92', NULL, NULL, 'repository/slo/instalasi/filesiujka5361e7cb22487a6326b8ce5f832ef92', NULL, 'Edy Suyatno', 'Oke Hermawan  ', NULL),
(96, '02J', 'JA24', 'PT. ERA JAYA SAKTI BERSAMA', NULL, 'Jl. Raya Pagedangan Kp. Cicayur I Rt. 01/02 No. 2,', NULL, 'repository/slo/instalasi/filesbue4a3e0ea1681c198e26ce5d8968543af', NULL, NULL, 'repository/slo/instalasi/filesiujke4a3e0ea1681c198e26ce5d8968543af', NULL, 'Indra Sakti, ST', 'Indra Sakti, ST', 'H. ARIEF AZHARI, ST'),
(97, '02K', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbuebb01ac1bad3e07e546d23298794bcb5', NULL, NULL, 'repository/slo/instalasi/filesiujkebb01ac1bad3e07e546d23298794bcb5', NULL, 'Asmat', 'IR. Nursamsu Iman ', NULL),
(98, '02L', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbude77dd0236a5c36451fa973ae1800e9b', NULL, NULL, 'repository/slo/instalasi/filesiujkde77dd0236a5c36451fa973ae1800e9b', NULL, 'Asmat', 'IR. Nursamsu Iman ', NULL),
(99, '02M', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu5e1f2c20a49e0541899b4ca0fbd361f7', NULL, NULL, 'repository/slo/instalasi/filesiujk5e1f2c20a49e0541899b4ca0fbd361f7', NULL, 'Asmat', 'IR. Nursamsu Iman  ', NULL),
(100, '02N', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9282e66e408fb0537660986d0112dffc', NULL, NULL, 'repository/slo/instalasi/filesiujk9282e66e408fb0537660986d0112dffc', NULL, 'Asmat', 'IR. Nursamsu Iman  ', 'H. ARIEF AZHARI, ST '),
(101, '02O', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9f8e24e492b9531d7ae9095db0b71806', NULL, NULL, 'repository/slo/instalasi/filesiujk9f8e24e492b9531d7ae9095db0b71806', NULL, 'Asmat', 'IR. Nursamsu Iman  ', 'H. ARIEF AZHARI, ST '),
(102, '02P', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Cluster Eboni No. 3 Rt. 006/003, Ke', NULL, 'repository/slo/instalasi/filesbuc93b1657445fc30d375b01be6a55ae9f', NULL, NULL, 'repository/slo/instalasi/filesiujkc93b1657445fc30d375b01be6a55ae9f', NULL, 'Djoned Edikarya', 'Susilo Anggoro ', 'H. ARIEF AZHARI, ST '),
(103, '02Q', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Cluster Eboni No. 3 Rt. 006/003, Ke', NULL, 'repository/slo/instalasi/filesbufac7af3cc8dc3576a724e94cbad098ac', NULL, NULL, 'repository/slo/instalasi/filesiujkfac7af3cc8dc3576a724e94cbad098ac', NULL, 'Djoned Edikarya', 'Susilo Anggoro ', NULL),
(104, '02R', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Jl. Lengkong Barang Rt. 03/03, Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbua361ec82678d6409cc85b028246d4995', NULL, NULL, 'repository/slo/instalasi/filesiujka361ec82678d6409cc85b028246d4995', NULL, 'Asmat', 'IR. Nursamsu Iman  ', NULL),
(105, '02S', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03, Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbub03f2f75986342e3682e52c2d46b9007', NULL, NULL, 'repository/slo/instalasi/filesiujkb03f2f75986342e3682e52c2d46b9007', NULL, 'Asmat', 'IR. Nursamsu Iman   ', 'H. ARIEF AZHARI, ST'),
(106, '02T', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbufe553da6f2636058f6e7a7cb94080e3f', NULL, NULL, 'repository/slo/instalasi/filesiujkfe553da6f2636058f6e7a7cb94080e3f', NULL, 'Asmat', 'IR. Nursamsu Iman ', 'H. ARIEF AZHARI, ST'),
(107, '02U', 'JA34', 'PT. Gridtech Indonesia', NULL, 'jl tenggiri 5', NULL, 'repository/slo/instalasi/filesbud7f65f375d99a5d361e470801aa0e727', NULL, NULL, 'repository/slo/instalasi/filesiujkd7f65f375d99a5d361e470801aa0e727', NULL, 'dsdsds', 'sdsdsds', ''),
(108, '02V', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Cluster Eboni No. 3 Rt. 006/003 Kel', NULL, 'repository/slo/instalasi/filesbu350b48bb23338d27728aa92d88992e3c', NULL, NULL, 'repository/slo/instalasi/filesiujk350b48bb23338d27728aa92d88992e3c', NULL, 'Djoned Edikarya', 'Susilo Anggoro  ', NULL),
(109, '02W', 'JE96', 'PT. MOLKISS SAKTI', NULL, 'Perum Methland Cluster Eboni No. 3 Rt. 006/003 Kel', NULL, 'repository/slo/instalasi/filesbubce063da12b5c64685df70ac1d53c6d4', NULL, NULL, 'repository/slo/instalasi/filesiujkbce063da12b5c64685df70ac1d53c6d4', NULL, 'Djoned Edikarya', 'Susilo Anggoro  ', 'H. ARIEF AZHARI, ST '),
(110, '02X', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV No. 3 Bantar Jati Bogor Utara Jaw', NULL, 'repository/slo/instalasi/filesbu6231fe527e32fbaa8c05186a0d950da0', NULL, NULL, 'repository/slo/instalasi/filesiujk6231fe527e32fbaa8c05186a0d950da0', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST '),
(111, '02Y', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9d03b310867b77279368c4dfb5925011', NULL, NULL, 'repository/slo/instalasi/filesiujk9d03b310867b77279368c4dfb5925011', NULL, 'Asmat', 'IR. Nursamsu Iman ', 'H. ARIEF AZHARI, ST  '),
(112, '02Z', 'JA34', 'PT. Gridtech Indonesia', NULL, 'dadada', NULL, 'repository/slo/instalasi/filesbu91d1b4368badbc98a44edc5db2ab1f7d', NULL, NULL, 'repository/slo/instalasi/filesiujk91d1b4368badbc98a44edc5db2ab1f7d', NULL, 'tes', 'tes', NULL),
(113, '030', 'JA34', 'PT. Gridtech Indonesia', NULL, 'sdasdas', NULL, 'repository/slo/instalasi/filesbu931af2410301cbcda05e01c15a83153a', NULL, NULL, 'repository/slo/instalasi/filesiujk931af2410301cbcda05e01c15a83153a', NULL, 'tes', 'tes', ''),
(114, '031', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu3a8dd1d552d711df9c135e2968623222', NULL, NULL, 'repository/slo/instalasi/filesiujk3a8dd1d552d711df9c135e2968623222', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(115, '032', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu8a973720a2571f392367282194d8f588', NULL, NULL, 'repository/slo/instalasi/filesiujk8a973720a2571f392367282194d8f588', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(116, '033', '0000', 'Tidak Ada Pembangunan', NULL, 'Surat Pernyataan Terlampir', NULL, 'repository/slo/instalasi/filesbu172898d48a06b877a01fe3df56c11e8e', NULL, NULL, 'repository/slo/instalasi/filesiujk172898d48a06b877a01fe3df56c11e8e', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(117, '034', 'JA24', 'PT. ERA JAYA SAKTI BERSAMA', NULL, 'Jl. Raya Pagedangan Kp. Cicayur I Rt. 01/02 Ds. Pr', NULL, 'repository/slo/instalasi/filesbu3d9a29f57644757aba9a207a7d9832ee', NULL, NULL, 'repository/slo/instalasi/filesiujk3d9a29f57644757aba9a207a7d9832ee', NULL, 'Indra Sakti, ST', 'Indra Sakti, ST', 'H. ARIEF AZHARI, ST '),
(118, '035', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Jl. Lengkong Barang Rt.03/03 Iwul Parung Kab. Bogo', NULL, 'repository/slo/instalasi/filesbu4c4c92dafb87bf05190b793e4e5b2099', NULL, NULL, 'repository/slo/instalasi/filesiujk4c4c92dafb87bf05190b793e4e5b2099', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(119, '036', '0000', 'Tidak Ada Pembangunan', NULL, 'Surat Keterangan Non Instalatir Terlampir', NULL, 'repository/slo/instalasi/filesbu16c0e3a40f02bb0f3b0d5e5c062684b4', NULL, NULL, 'repository/slo/instalasi/filesiujk16c0e3a40f02bb0f3b0d5e5c062684b4', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(120, '037', 'CL21', 'PT. MARIO  PRATAMA MANDIRI', NULL, 'Jl. Patimura Pering Rt. 001/006, Kel. Bandarsyah, ', NULL, 'repository/slo/instalasi/filesbuc67fbf3d56498266b378f2642ebb98d1', NULL, NULL, 'repository/slo/instalasi/filesiujkc67fbf3d56498266b378f2642ebb98d1', NULL, 'Syamsul Hidayat Siagian', 'Syamsul Hidayat Siagian', 'H. ARIEF AZHARI, ST'),
(121, '038', 'JI05', 'PT. RAHMAYUTI SARANA MANDIRI', NULL, 'Jl. Sultan Iskandar Muda No. 30 Lt. 18 Kebayoran L', NULL, 'repository/slo/instalasi/filesbue5fbb1b71f8e2681f2afb24f6811b86c', NULL, NULL, 'repository/slo/instalasi/filesiujke5fbb1b71f8e2681f2afb24f6811b86c', NULL, 'Adi Darmawan', 'Joko Winarno', 'H. ARIEF AZHARI, ST'),
(122, '039', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbubf66c0acd7893cc487f0346ca8ae6976', NULL, NULL, 'repository/slo/instalasi/filesiujkbf66c0acd7893cc487f0346ca8ae6976', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(123, '03A', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbuab6a9b128ca17b6a5d9192c35924509d', NULL, NULL, 'repository/slo/instalasi/filesiujkab6a9b128ca17b6a5d9192c35924509d', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(124, '03B', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk jambe Blok I/33 Karawang Jawa Bar', NULL, 'repository/slo/instalasi/filesbub0b9fd6025564a2ea51fb87a1be4baa0', NULL, NULL, 'repository/slo/instalasi/filesiujkb0b9fd6025564a2ea51fb87a1be4baa0', NULL, 'Edy Suyatno', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(125, '03C', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk jambe Blok I/33 Karawang Jawa Bar', NULL, 'repository/slo/instalasi/filesbua61443cda942e59614ecd9dc8df40b35', NULL, NULL, 'repository/slo/instalasi/filesiujka61443cda942e59614ecd9dc8df40b35', NULL, 'Edy Suyatno', 'Oke Hermawan', NULL),
(126, '03D', 'JA34', 'PT. Gridtech Indonesia', NULL, 'tes', NULL, 'repository/slo/instalasi/filesbub4cf9d7567099f55d5930f3f5c80c928', NULL, NULL, 'repository/slo/instalasi/filesiujkb4cf9d7567099f55d5930f3f5c80c928', NULL, 'asep', 'bambang', ''),
(127, '03E', 'JA34', 'PT. Gridtech Indonesia', NULL, 'tess', NULL, 'repository/slo/instalasi/filesbu82cf8d84223e8a87611cc72efad2844d', NULL, NULL, 'repository/slo/instalasi/filesiujk82cf8d84223e8a87611cc72efad2844d', NULL, 'tes', 'tes', NULL),
(128, '03F', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03, Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbuab7764fde04f59ffbdcb61b77abc586d', NULL, NULL, 'repository/slo/instalasi/filesiujkab7764fde04f59ffbdcb61b77abc586d', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(129, '03G', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03, Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbuc0c2e2f958c7513268732ba47f4c774f', NULL, NULL, 'repository/slo/instalasi/filesiujkc0c2e2f958c7513268732ba47f4c774f', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(130, '03H', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kalijambe Rt. 002/004 Desa Lambangsari Kec. Ta', NULL, 'repository/slo/instalasi/filesbua9a0261b68b01409ec16cc9e857a9c2f', NULL, NULL, 'repository/slo/instalasi/filesiujka9a0261b68b01409ec16cc9e857a9c2f', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(131, '03I', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kalijambe Rt. 002/004 Desa Lambangsari Kec. ta', NULL, 'repository/slo/instalasi/filesbua32ac5959032f0eb327cb2d61deb1795', NULL, NULL, 'repository/slo/instalasi/filesiujka32ac5959032f0eb327cb2d61deb1795', NULL, '', '', NULL),
(132, '03J', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbudffc194ec86997906e997e757f27ab90', NULL, NULL, 'repository/slo/instalasi/filesiujkdffc194ec86997906e997e757f27ab90', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(133, '03K', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbua914e98cf31359459cb6a39a1bdda54e', NULL, NULL, 'repository/slo/instalasi/filesiujka914e98cf31359459cb6a39a1bdda54e', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(134, '03L', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu56fe6c47e9e6c80887dd81624cd8924d', NULL, NULL, 'repository/slo/instalasi/filesiujk56fe6c47e9e6c80887dd81624cd8924d', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(135, '03M', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu6344f55377d4ba90a124a144c17dbbc9', NULL, NULL, 'repository/slo/instalasi/filesiujk6344f55377d4ba90a124a144c17dbbc9', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(136, '03N', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9bae35e57f5bfc4b3da5df9a827cc7c3', NULL, NULL, 'repository/slo/instalasi/filesiujk9bae35e57f5bfc4b3da5df9a827cc7c3', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(137, '03O', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu2cb2dd0477d21642e77ab41657f33f92', NULL, NULL, 'repository/slo/instalasi/filesiujk2cb2dd0477d21642e77ab41657f33f92', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(138, '03P', '0000', 'Tidak Ada Pembangunan', NULL, 'Dilampirkan Surat Keterangan dari Konsumen ', NULL, 'repository/slo/instalasi/filesbuf72e23deac10a2a8fd487ec27d7c68f6', NULL, NULL, 'repository/slo/instalasi/filesiujkf72e23deac10a2a8fd487ec27d7c68f6', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(139, '03Q', '0000', 'Tidak Ada Pembangunan', NULL, 'Dilampirkan Surat Keterangan dari Konsumen ', NULL, 'repository/slo/instalasi/filesbu290d86d1f76716d0494c271939c17bca', NULL, NULL, 'repository/slo/instalasi/filesiujk290d86d1f76716d0494c271939c17bca', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(140, '03R', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung, Kab. Bo', NULL, 'repository/slo/instalasi/filesbu421c64f8b0301b305882f4aab8a084d0', NULL, NULL, 'repository/slo/instalasi/filesiujk421c64f8b0301b305882f4aab8a084d0', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(141, '03S', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung, Kab. Bo', NULL, 'repository/slo/instalasi/filesbu390ee79c552acf94c5871f5ca32bc28b', NULL, NULL, 'repository/slo/instalasi/filesiujk390ee79c552acf94c5871f5ca32bc28b', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(142, '03T', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu20da9a657a486ffec4af228c177f1221', NULL, NULL, 'repository/slo/instalasi/filesiujk20da9a657a486ffec4af228c177f1221', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(143, '03U', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9917ee7350284f66ed354d0877d615ed', NULL, NULL, 'repository/slo/instalasi/filesiujk9917ee7350284f66ed354d0877d615ed', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(144, '03V', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu16a97e6759a72d9e8b0b3b5570b73e8e', NULL, NULL, 'repository/slo/instalasi/filesiujk16a97e6759a72d9e8b0b3b5570b73e8e', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(145, '03W', '0000', 'Tidak Ada Pembangunan', NULL, 'Surat Keterangan Non Instalatir Terlampir', NULL, 'repository/slo/instalasi/filesbu82c330d7c7b1fc9bba79ed32a9106125', NULL, NULL, 'repository/slo/instalasi/filesiujk82c330d7c7b1fc9bba79ed32a9106125', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(146, '03X', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu811239563ad50a75ef6af9286086039c', NULL, NULL, 'repository/slo/instalasi/filesiujk811239563ad50a75ef6af9286086039c', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(147, '03Y', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu20c6abe782947a66bafcc6c0f838626c', NULL, NULL, 'repository/slo/instalasi/filesiujk20c6abe782947a66bafcc6c0f838626c', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(148, '03Z', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Teluk Jambe Timur', NULL, 'repository/slo/instalasi/filesbub4794f6ac6e4c506ac8c45c7ee2a9e4b', NULL, NULL, 'repository/slo/instalasi/filesiujkb4794f6ac6e4c506ac8c45c7ee2a9e4b', NULL, 'Edy Suyatno', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(149, '040', 'JEBM', 'PT. TERUNA JAYA TEKNIK', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti', NULL, 'repository/slo/instalasi/filesbua013182da2708cadda060f4d5e069df5', NULL, NULL, 'repository/slo/instalasi/filesiujka013182da2708cadda060f4d5e069df5', NULL, 'Ilham Dhany Siregar', 'Ilham Dhany Siregar', 'H. ARIEF AZHARI, ST'),
(150, '041', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbudb19580998d382645a00f29dbc695e18', NULL, NULL, 'repository/slo/instalasi/filesiujkdb19580998d382645a00f29dbc695e18', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(151, '042', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbue3d97d78d0919044f10e744a19592991', NULL, NULL, 'repository/slo/instalasi/filesiujke3d97d78d0919044f10e744a19592991', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(152, '043', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu02efe5a1411fefdece349e27abfa44a0', NULL, NULL, 'repository/slo/instalasi/filesiujk02efe5a1411fefdece349e27abfa44a0', NULL, 'Asmat', 'IR. Nursamsu Iman ', 'H. ARIEF AZHARI, ST'),
(153, '044', 'GIB6', '', NULL, 'Jl. Tebet Timur Raya No. 42 Jakarta Selatan', NULL, 'repository/slo/instalasi/filesbu8b876bb71c17b7c6e84e1ec4c5756a07', NULL, NULL, 'repository/slo/instalasi/filesiujk8b876bb71c17b7c6e84e1ec4c5756a07', NULL, 'Ir. Hari Kukuh Budihardjo', 'A. Kadim Basyari', NULL),
(154, '045', 'GIB6', 'PT. HARDI AGUNG PERKASA', NULL, 'Jl. Tebet Timur Raya No. 42 Jakarta Selatan', NULL, 'repository/slo/instalasi/filesbu59bf57e4a94a98acfc43cbb197df1c2f', NULL, NULL, 'repository/slo/instalasi/filesiujk59bf57e4a94a98acfc43cbb197df1c2f', NULL, 'Ir. Hari Kukuh Budihardjo', 'A. Kadim Basyari', 'H. ARIEF AZHARI, ST'),
(155, '046', '00000', '-', NULL, 'Surat Keterangan Non Instalatir Terlampir', NULL, 'repository/slo/instalasi/filesbu0af5400960d07525b1756ea65585ed21', NULL, NULL, 'repository/slo/instalasi/filesiujk0af5400960d07525b1756ea65585ed21', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(156, '047', '00000', '-', NULL, 'Terlampir Surat Keterangan Non Instalatir', NULL, 'repository/slo/instalasi/filesbu08af1188b99767a77dc4284f972eed92', NULL, NULL, 'repository/slo/instalasi/filesiujk08af1188b99767a77dc4284f972eed92', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(157, '048', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu96a466fd041b5ec0eab1f98c74240649', NULL, NULL, 'repository/slo/instalasi/filesiujk96a466fd041b5ec0eab1f98c74240649', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(158, '049', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu5600042162063fdb06d67478d456fabc', NULL, NULL, 'repository/slo/instalasi/filesiujk5600042162063fdb06d67478d456fabc', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(159, '04A', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu39bc211e2b01d1d19a7da1bbe0553783', NULL, NULL, 'repository/slo/instalasi/filesiujk39bc211e2b01d1d19a7da1bbe0553783', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(160, '04B', 'JI05', 'PT. RAHMAYUTI SARANA MANDIRI', NULL, 'Jl. Sultan Iskandar Muda No. 30, Lt. 18 Kebayoran ', NULL, 'repository/slo/instalasi/filesbud15a58a9fed09e397a731f308148250e', NULL, NULL, 'repository/slo/instalasi/filesiujkd15a58a9fed09e397a731f308148250e', NULL, 'Adi Darmawan', 'Joko Winarno', 'H. ARIEF AZHARI, ST');
INSERT INTO `t_pemasang_instalasi` (`id_pemasang_instalasi`, `id_pemohon`, `kode_badan_usaha`, `nama_badan_usaha`, `tlp`, `alamat`, `nomor_sbu`, `file_sbu`, `tgl_sbu`, `nomor_siujk`, `file_siujk`, `tgl_siujk`, `pj_badan_usaha`, `pj_teknik`, `pj_lit`) VALUES
(161, '04C', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barat Rt. 03/03, Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu3d34cb4b41a8c9f2af7d1b9d1060dd89', NULL, NULL, 'repository/slo/instalasi/filesiujk3d34cb4b41a8c9f2af7d1b9d1060dd89', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(162, '04D', 'YF14', 'PT. DUTHA TERANG TEKNIK', NULL, 'Jl. Damai No. 01, Kel. Oebobo, Kota Kupang, Nusa T', NULL, 'repository/slo/instalasi/filesbua43dc07fc377d453266da7f2ff7aca8a', NULL, NULL, 'repository/slo/instalasi/filesiujka43dc07fc377d453266da7f2ff7aca8a', NULL, 'Mathilda M, Taku Bessi', 'David A. Logo, Amd', 'H. ARIEF AZHARI, ST'),
(163, '04E', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM, Gang Mukti No. 3, Kiaracondong Bandung', NULL, 'repository/slo/instalasi/filesbu9e5ed84bc7480bee81caf20d96cb9694', NULL, NULL, 'repository/slo/instalasi/filesiujk9e5ed84bc7480bee81caf20d96cb9694', NULL, 'Wiwi Susilowati', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(164, '04E', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM, Gang Mukti No. 3, Kiaracondong Bandung', NULL, 'repository/slo/instalasi/filesbu3d184b285c270b843201239a7d12a52f', NULL, NULL, 'repository/slo/instalasi/filesiujk3d184b285c270b843201239a7d12a52f', NULL, 'Wiwi Susilowati', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(165, '04E', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM, Gang Mukti No. 3, Kiaracondong Bandung', NULL, 'repository/slo/instalasi/filesbuc0eec9dcc38a9e5fea02154918ec8d83', NULL, NULL, 'repository/slo/instalasi/filesiujkc0eec9dcc38a9e5fea02154918ec8d83', NULL, 'Wiwi Susilowati', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(166, '04E', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM, Gang Mukti No. 3, Kiaracondong Bandung', NULL, 'repository/slo/instalasi/filesbu449b76253510e97c073fc8be577d853d', NULL, NULL, 'repository/slo/instalasi/filesiujk449b76253510e97c073fc8be577d853d', NULL, 'Wiwi Susilowati', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(167, '04F', 'GEWB', 'PT. VOLTASE AMPERINDO PERKASA', NULL, 'Jl. Sutiragen IV, No. 3 Bantarjati, Bogor Utara', NULL, 'repository/slo/instalasi/filesbu3d5820c7d3e15dae27ce7437ca08d3ae', NULL, NULL, 'repository/slo/instalasi/filesiujk3d5820c7d3e15dae27ce7437ca08d3ae', NULL, 'Bambang Sungkowo', 'Sungkowo', 'H. ARIEF AZHARI, ST'),
(168, '04G', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. PSM, Gang Mukti No. 3 Kiaracondong Bandung - J', NULL, 'repository/slo/instalasi/filesbu9c08e50412546ba1524421791b0c6189', NULL, NULL, 'repository/slo/instalasi/filesiujk9c08e50412546ba1524421791b0c6189', NULL, 'Sisi Susilowati, ST', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(169, '04H', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kali Jambe No. 50, Rt. 03/04 Lambangsari Tambu', NULL, 'repository/slo/instalasi/filesbu3e7fc51297e4477d10ace88cfd84af4b', NULL, NULL, 'repository/slo/instalasi/filesiujk3e7fc51297e4477d10ace88cfd84af4b', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(170, '04I', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kali Jambe No. 50, Rt. 03/04, Lambangsari, Tam', NULL, 'repository/slo/instalasi/filesbu6ef52d041bb01cfeb6cbebab2dc25ad9', NULL, NULL, 'repository/slo/instalasi/filesiujk6ef52d041bb01cfeb6cbebab2dc25ad9', NULL, 'Hadrodi', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(171, '04J', 'GE30', '', NULL, 'dsdsdsds', NULL, 'repository/slo/instalasi/filesbu577bf90994cc9c39e27f897515ebe6d8', NULL, NULL, 'repository/slo/instalasi/filesiujk577bf90994cc9c39e27f897515ebe6d8', NULL, 'tess', 'tesss', 'H. ARIEF AZHARI, ST'),
(172, '04K', 'JECM', 'PT. HEN JAYA', NULL, 'Jl. H. Kurdi No. 14, Moh. Toha Bandung - Jawa Bara', NULL, 'repository/slo/instalasi/filesbu1a502f54202d584f9b162f836e4f1b52', NULL, NULL, 'repository/slo/instalasi/filesiujk1a502f54202d584f9b162f836e4f1b52', NULL, 'H. Henhen Bestari, Ir, MM', 'Yudi Bernadi, ST, MT', 'H. ARIEF AZHARI, ST'),
(173, '04L', 'GEWI', '', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu020f4225d386b731359cdb884fc2529b', NULL, NULL, 'repository/slo/instalasi/filesiujk020f4225d386b731359cdb884fc2529b', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(174, '04M', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbuaae7e127b09acbe4bd2adb6796c4b89e', NULL, NULL, 'repository/slo/instalasi/filesiujkaae7e127b09acbe4bd2adb6796c4b89e', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(175, '04N', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang, Rt. 03/03 Kab. Bogor Jawa Bar', NULL, 'repository/slo/instalasi/filesbu2e001324fa870903997fcd46ed7dfec1', NULL, NULL, 'repository/slo/instalasi/filesiujk2e001324fa870903997fcd46ed7dfec1', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(176, '04O', 'GEWE', 'PT. PULO DAMAR ABADI', NULL, 'Perum Bumi Teluk Jambe Blok I / 33 Teluk Jambe Tim', NULL, 'repository/slo/instalasi/filesbu6f68fbe5a96e2c0d26c6e81ab33b4ef2', NULL, NULL, 'repository/slo/instalasi/filesiujk6f68fbe5a96e2c0d26c6e81ab33b4ef2', NULL, 'Edy Suyatno', 'Oke Hermawan', 'H. ARIEF AZHARI, ST'),
(177, '04P', 'JE45', 'PT. OPIK ONLINE MANDIRI', NULL, 'Dusun Cipicung Rt. 01/01, Ds. Darmajaya Kec. Darma', NULL, 'repository/slo/instalasi/filesbuce6f591118970a7ba9f9589045a5e426', NULL, NULL, 'repository/slo/instalasi/filesiujkce6f591118970a7ba9f9589045a5e426', NULL, 'Solihin', 'Solihin', 'H. ARIEF AZHARI, ST'),
(178, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbu4f2468916e1a4b5ed477cfa721cdac95', NULL, NULL, 'repository/slo/instalasi/filesiujk4f2468916e1a4b5ed477cfa721cdac95', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(184, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbu7d79a306f54abeba771ec8822ccb2025', NULL, NULL, 'repository/slo/instalasi/filesiujk7d79a306f54abeba771ec8822ccb2025', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(179, '04R', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kali Jambe No. 50, Rt.03/04 Lambangsari', NULL, 'repository/slo/instalasi/filesbub59e37bc201d76184e56d6cc476bf64b', NULL, NULL, 'repository/slo/instalasi/filesiujkb59e37bc201d76184e56d6cc476bf64b', NULL, 'Hadroti', 'Goppar', 'H. ARIEF AZHARI, ST'),
(180, '04P', 'JE45', 'PT. OPIK ONLINE MANDIRI', NULL, 'Dusun Cipicung Rt. 01/01, Ds. Darmajaya Kec. Darma', NULL, 'repository/slo/instalasi/filesbub16d75635cfe86c3b6da1fadb281ff04', NULL, NULL, 'repository/slo/instalasi/filesiujkb16d75635cfe86c3b6da1fadb281ff04', NULL, 'Solihin', 'Solihin', 'H. ARIEF AZHARI, ST'),
(181, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbu80cd7b5e08917176f991f3e798049c0a', NULL, NULL, 'repository/slo/instalasi/filesiujk80cd7b5e08917176f991f3e798049c0a', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(182, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbubdb257f70c1a6069ca206379b369eaef', NULL, NULL, 'repository/slo/instalasi/filesiujkbdb257f70c1a6069ca206379b369eaef', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(183, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbua023bf0af8c48489e0da8a4b1387fec5', NULL, NULL, 'repository/slo/instalasi/filesiujka023bf0af8c48489e0da8a4b1387fec5', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(185, '04Q', '0000', '-', NULL, '-', NULL, 'repository/slo/instalasi/filesbuecde38193c2e8cb1f1740af5d5c193a2', NULL, NULL, 'repository/slo/instalasi/filesiujkecde38193c2e8cb1f1740af5d5c193a2', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(186, '04R', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kali Jambe No. 50, Rt.03/04 Lambangsari', NULL, 'repository/slo/instalasi/filesbua2bb71513aef8718f6c0264d0667b8ca', NULL, NULL, 'repository/slo/instalasi/filesiujka2bb71513aef8718f6c0264d0667b8ca', NULL, 'Hadroti', 'Goppar', 'H. ARIEF AZHARI, ST'),
(187, '04R', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kali Jambe No. 50, Rt.03/04 Lambangsari', NULL, 'repository/slo/instalasi/filesbu9926aaf26244b708e9829ef2ee5d9d2d', NULL, NULL, 'repository/slo/instalasi/filesiujk9926aaf26244b708e9829ef2ee5d9d2d', NULL, 'Hadroti', 'Goppar', 'H. ARIEF AZHARI, ST'),
(188, '04S', 'JA24', 'PT. ERA JAYA SAKTI BERSAMA', NULL, 'Jl. Raya Pagedangan Kp. Cicayur I Rt.01/02 No. 2 D', NULL, 'repository/slo/instalasi/filesbubb7827a8f36556ffbeafb3caeedfdf03', NULL, NULL, 'repository/slo/instalasi/filesiujkbb7827a8f36556ffbeafb3caeedfdf03', NULL, 'Indra Sakti, ST', 'Indra Sakti, ST', 'H. ARIEF AZHARI, ST'),
(189, '04T', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu8bbd29572d2b9cb128b1ab25e8da9261', NULL, NULL, 'repository/slo/instalasi/filesiujk8bbd29572d2b9cb128b1ab25e8da9261', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(190, '04U', '0000', '-', NULL, 'Surat Keterangan Non Instalatir', NULL, 'repository/slo/instalasi/filesbub25a6c82f44cd8cdc411e9b877dd555c', NULL, NULL, 'repository/slo/instalasi/filesiujkb25a6c82f44cd8cdc411e9b877dd555c', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(191, '04V', '0000', '', NULL, 'Surat Keterangan Non Instalatir', NULL, 'repository/slo/instalasi/filesbu6ca6263be9e4ed950341a70f72f1a25c', NULL, NULL, 'repository/slo/instalasi/filesiujk6ca6263be9e4ed950341a70f72f1a25c', NULL, '-', '-', NULL),
(192, '04V', 'GEEE', '', NULL, 'Graha Aulia Kalimalang Square Blok G Pekayon Jaya ', NULL, 'repository/slo/instalasi/filesbuc75a77b26ad0a11106e444c181cc3a7b', NULL, NULL, 'repository/slo/instalasi/filesiujkc75a77b26ad0a11106e444c181cc3a7b', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', NULL),
(193, '04W', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Graha Aulia Kalimalang Square Blok G Pekayon Jaya ', NULL, 'repository/slo/instalasi/filesbu3c551fda88885a6e4f9a2f180e81cfc0', NULL, NULL, 'repository/slo/instalasi/filesiujk3c551fda88885a6e4f9a2f180e81cfc0', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(194, '04X', 'CV05', 'PT. VALVIO INTI PRIMA', NULL, 'Jl. KH. Hasan Basri RT.01/02 Ds. Rawa Bangun Kec. ', NULL, 'repository/slo/instalasi/filesbud46ec3c8c61e430ea9a9a6f9bfe30a88', NULL, NULL, 'repository/slo/instalasi/filesiujkd46ec3c8c61e430ea9a9a6f9bfe30a88', NULL, 'Mintaria', 'Mintaria', 'H. Arief Azhari, ST'),
(195, '04Y', 'GEWI', '', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbub1ccd4ee3e3390d28cdda58224247f53', NULL, NULL, 'repository/slo/instalasi/filesiujkb1ccd4ee3e3390d28cdda58224247f53', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(196, '04Z', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9a4b5f1667b443b08e46e98b9f51b7f1', NULL, NULL, 'repository/slo/instalasi/filesiujk9a4b5f1667b443b08e46e98b9f51b7f1', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(197, '050', 'CV05', 'PT. VALVIO INTI PRIMA', NULL, 'Jl. KH. Hasan Basri Rt. 01/02, Ds. Rawa Bangun Kec', NULL, 'repository/slo/instalasi/filesbua469544bdcd9809e32e0094a01a51fde', NULL, NULL, 'repository/slo/instalasi/filesiujka469544bdcd9809e32e0094a01a51fde', NULL, 'Mintaria', 'Mintaria', 'H. ARIEF AZHARI, ST'),
(198, '051', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kalijambe No. 50 Rt. 03/04 Lambangsari Tambun ', NULL, 'repository/slo/instalasi/filesbu97b2b52c04100661295359ecc0a8ddf6', NULL, NULL, 'repository/slo/instalasi/filesiujk97b2b52c04100661295359ecc0a8ddf6', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(199, '052', 'JEBA', 'PT. SINAR ANISA MANDIRI', NULL, 'Jl. Kalijambe No. 50 Rt. 03/04 Lambangsari Tambun ', NULL, 'repository/slo/instalasi/filesbu54f9b0bf7a18ebb4944480c5f1452f86', NULL, NULL, 'repository/slo/instalasi/filesiujk54f9b0bf7a18ebb4944480c5f1452f86', NULL, 'Hadroti', 'Goppar Antoni Damanik', 'H. ARIEF AZHARI, ST'),
(200, '053', 'GEEE', '', NULL, 'Graha Aulia Kalimalang Square Blok G Pekayon Jaya ', NULL, 'repository/slo/instalasi/filesbu522cf594cc6c10be8ea5278e8ee5bfd1', NULL, NULL, 'repository/slo/instalasi/filesiujk522cf594cc6c10be8ea5278e8ee5bfd1', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', NULL),
(201, '054', 'GEEE', 'PT. AULIA DANARDANA', NULL, 'Graha Aulia Kalimalang Square Blok G Pekayon Jaya ', NULL, 'repository/slo/instalasi/filesbu913a6ceef2d095b9f4ffceefc7e3ad90', NULL, NULL, 'repository/slo/instalasi/filesiujk913a6ceef2d095b9f4ffceefc7e3ad90', NULL, 'Ir. Woro Supeni', 'Retno Sutanti Yusman', 'H. ARIEF AZHARI, ST'),
(202, '055', '', '', NULL, 'test', NULL, 'repository/slo/instalasi/filesbu1cd44a7b94ae6e106ef90085bb5fcf93', NULL, NULL, 'repository/slo/instalasi/filesiujk1cd44a7b94ae6e106ef90085bb5fcf93', NULL, '', '', NULL),
(203, '056', 'AAA', '', NULL, 'test', NULL, 'repository/slo/instalasi/filesbu90a69266e2a22daf9e8e2e062391d499', NULL, NULL, 'repository/slo/instalasi/filesiujk90a69266e2a22daf9e8e2e062391d499', NULL, 'test', 'test', 'test'),
(204, '057', 'JEBM', '', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti', NULL, 'repository/slo/instalasi/filesbuf222901fa5e0eeeed308ad3a40787db5', NULL, NULL, 'repository/slo/instalasi/filesiujkf222901fa5e0eeeed308ad3a40787db5', NULL, 'Ilham Dhany Siregar', 'Ilham Dhany Siregar', NULL),
(205, '058', 'JEBM', 'PT. TERUNA JAYA TEKNIK', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti', NULL, 'repository/slo/instalasi/filesbu36a86015323250b6d6f9449bdf72ce38', NULL, NULL, 'repository/slo/instalasi/filesiujk36a86015323250b6d6f9449bdf72ce38', NULL, 'Ilham Dhany Siregar', 'Ilham Dhany Siregar', 'H. ARIEF AZHARI, ST'),
(206, '059', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu25a94e830a2b5a91e47099fc3dd39d2a', NULL, NULL, 'repository/slo/instalasi/filesiujk25a94e830a2b5a91e47099fc3dd39d2a', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(207, '05A', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 003/03 Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbu2747157b9b0fef5e0f6c6667b0f48d41', NULL, NULL, 'repository/slo/instalasi/filesiujk2747157b9b0fef5e0f6c6667b0f48d41', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(208, '05A', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 003/03 Iwul Parung Kab. Bo', NULL, 'repository/slo/instalasi/filesbu708be72bbde2b50a74df5e2757b44cbc', NULL, NULL, 'repository/slo/instalasi/filesiujk708be72bbde2b50a74df5e2757b44cbc', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(209, '05B', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbuecbdafa713ab0f5659238610b8cb5c3b', NULL, NULL, 'repository/slo/instalasi/filesiujkecbdafa713ab0f5659238610b8cb5c3b', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(210, '05C', '0000', 'Surat Pernyataan Non Instalatir ', NULL, '-', NULL, 'repository/slo/instalasi/filesbu21dd314e7936293d90f8495038f16e3d', NULL, NULL, 'repository/slo/instalasi/filesiujk21dd314e7936293d90f8495038f16e3d', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(211, '05C', '0000', 'Surat Pernyataan Non Instalatir ', NULL, '-', NULL, 'repository/slo/instalasi/filesbu3a2486647a5b2b3755ec19ddca78e06d', NULL, NULL, 'repository/slo/instalasi/filesiujk3a2486647a5b2b3755ec19ddca78e06d', NULL, '-', '-', 'H. ARIEF AZHARI, ST'),
(212, '05D', 'GEWI', '', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu9ca6f50734b4f0672b3a8e7be262bcd4', NULL, NULL, 'repository/slo/instalasi/filesiujk9ca6f50734b4f0672b3a8e7be262bcd4', NULL, 'Asmat', 'IR. Nursamsu Iman', NULL),
(213, '05E', 'GEWI', 'PT. LITA MEKANIKAL ELEKTRIKAL', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bog', NULL, 'repository/slo/instalasi/filesbu44dcf90b249a6d0ca0c53ed50c69a8ce', NULL, NULL, 'repository/slo/instalasi/filesiujk44dcf90b249a6d0ca0c53ed50c69a8ce', NULL, 'Asmat', 'IR. Nursamsu Iman', 'H. ARIEF AZHARI, ST'),
(214, '05F', 'GE03', 'PT. CAHAYA TIRTAMAS UTAMA', NULL, 'Jl. Sukaati No. 43 Mengger Bandung ', NULL, 'repository/slo/instalasi/filesbu0d1d742041a93859ef945058270360ee', NULL, NULL, 'repository/slo/instalasi/filesiujk0d1d742041a93859ef945058270360ee', NULL, 'Wiwi susilowati', 'Eko Kundarto', 'H. ARIEF AZHARI, ST'),
(215, '05G', 'GE03', '', NULL, 'Jl. Sukaati No. 43 Mengger bandung', NULL, 'repository/slo/instalasi/filesbuddbe8639c8ace176d2119f6eb68bbd0d', NULL, NULL, 'repository/slo/instalasi/filesiujkddbe8639c8ace176d2119f6eb68bbd0d', NULL, 'Wiwi susilowati', 'Eko Kundarto', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_pembangkit`
--

CREATE TABLE `t_pembangkit` (
  `id_pembangkit` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `kode_provinsi` varchar(50) DEFAULT NULL,
  `kode_kota_kab` varchar(50) DEFAULT NULL,
  `lokasi_pembangkit` varchar(50) DEFAULT NULL,
  `kode_jenis_pembangkit` int(11) DEFAULT NULL,
  `kode_jenis_usaha` int(11) DEFAULT NULL,
  `kode_bahan_bakar` int(11) DEFAULT NULL,
  `kapasitas` varchar(50) DEFAULT NULL,
  `satuan_kapasitas` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pembangkit`
--

INSERT INTO `t_pembangkit` (`id_pembangkit`, `id_pemohon`, `kode_provinsi`, `kode_kota_kab`, `lokasi_pembangkit`, `kode_jenis_pembangkit`, `kode_jenis_usaha`, `kode_bahan_bakar`, `kapasitas`, `satuan_kapasitas`) VALUES
(1, '001', '76', 'Mamuju', 'Jl. Trans Sulawesi Kecamatan Topoyo, Mamuju Tengah', 171, 0, 4, '1096', 'Sulawesi Barat'),
(2, '00P', '32', 'Cirebon', 'Jl. Wadas blok simaja desa gombong kec. plumbon ka', 171, 0, 7, '150', 'ESDM Provinsi Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `t_pemohon`
--

CREATE TABLE `t_pemohon` (
  `id_pemohon` varchar(4) NOT NULL,
  `no_register` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `tlp` varchar(50) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `file_permohonan` varchar(255) DEFAULT NULL,
  `api_nopermohonan` varchar(255) DEFAULT NULL,
  `api_no_agenda` varchar(255) DEFAULT NULL,
  `api_noregistrasi` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `published_at` varchar(100) DEFAULT NULL,
  `id_user` varchar(100) DEFAULT NULL,
  `tgl_pemohon` date DEFAULT NULL,
  `map` varchar(100) DEFAULT NULL,
  `foto1` varchar(100) DEFAULT NULL,
  `foto2` varchar(100) DEFAULT NULL,
  `foto3` varchar(100) DEFAULT NULL,
  `foto4` varchar(100) DEFAULT NULL,
  `foto5` varchar(100) DEFAULT NULL,
  `noLHPP` varchar(100) DEFAULT NULL,
  `lhpp` varchar(100) DEFAULT NULL,
  `noSLO` varchar(100) NOT NULL,
  `salinanslo` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id_tt_1` int(11) DEFAULT NULL,
  `nama_tt_1` varchar(100) NOT NULL,
  `sub_bidang_tt_1` varchar(100) NOT NULL,
  `no_sertifikat_tt_1` varchar(100) NOT NULL,
  `kode_unit_tt_1` varchar(100) NOT NULL,
  `foto_tt_1` varchar(500) DEFAULT NULL,
  `user_id_tt_2` int(11) DEFAULT NULL,
  `nama_tt_2` varchar(100) NOT NULL,
  `sub_bidang_tt_2` varchar(100) NOT NULL,
  `no_sertifikat_tt_2` varchar(100) NOT NULL,
  `kode_unit_tt_2` varchar(100) NOT NULL,
  `foto_tt_2` varchar(500) DEFAULT NULL,
  `notif` int(11) NOT NULL,
  `id_pemohon_lama` varchar(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pemohon`
--

INSERT INTO `t_pemohon` (`id_pemohon`, `no_register`, `nama`, `jabatan`, `tlp`, `alamat`, `file_permohonan`, `api_nopermohonan`, `api_no_agenda`, `api_noregistrasi`, `created_at`, `published_at`, `id_user`, `tgl_pemohon`, `map`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `noLHPP`, `lhpp`, `noSLO`, `salinanslo`, `status`, `user_id_tt_1`, `nama_tt_1`, `sub_bidang_tt_1`, `no_sertifikat_tt_1`, `kode_unit_tt_1`, `foto_tt_1`, `user_id_tt_2`, `nama_tt_2`, `sub_bidang_tt_2`, `no_sertifikat_tt_2`, `kode_unit_tt_2`, `foto_tt_2`, `notif`, `id_pemohon_lama`) VALUES
('007', 'SDE-2006176177', 'PT. MOLKISS SAKTI', '355/SK/MKS/V/2017', NULL, 'Perum. Metland Cluster Eboni No. 3 Cileungsi', 'repository/slo/permohonan/42090b0315999889f14ee39add47fb0a.pdf', '1738193833889', '0', 'FBT2.17', '2017-06-20 16:07:52', NULL, '1', '2017-05-08', '-6.4347730,106.9461700', 'repository/lampiran/permohonan/foto/foto1eabdc13d078def6174659725fa0216a2.jpg', 'repository/lampiran/permohonan/foto/foto2eabdc13d078def6174659725fa0216a2.jpg', NULL, 'repository/lampiran/permohonan/foto/foto4eabdc13d078def6174659725fa0216a2.jpg', 'repository/lampiran/permohonan/foto/foto5eabdc13d078def6174659725fa0216a2.jpg', '195/LHPP/SDE/VI/2017', 'repository/lampiran/permohonan/lhppeabdc13d078def6174659725fa0216a2.pdf', '007.P.20.428.3201.JE96.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('006', 'SDE-1606176176', 'PT. NUSA ADI DAYA', '29.2/SLO-NAD/V/2017', NULL, 'Perum Cijahe Legacy Block C3, Rt. 002/001 Kel. Curug Mekar Kec. Bogor Barat', 'repository/slo/permohonan/f33a63ed11678a5be9a3cb88576b3b21.pdf', '1916062968743', '0', 'FBN7.17', '2017-06-16 14:23:03', NULL, '1', '2017-05-24', '-6.4908570,107.1129170', 'repository/lampiran/permohonan/foto/foto196b488eb2c47b7f2cab9400dcbcd6f0d.jpg', 'repository/lampiran/permohonan/foto/foto209e43b57eade0dfeed432e0cd7886da5.jpg', 'repository/lampiran/permohonan/foto/foto3161055975e2ee77ac1c0a0d8183e8e33.jpg', 'repository/lampiran/permohonan/foto/foto42de7cc6ba0670a64b344e716c32cf4b6.jpg', 'repository/lampiran/permohonan/foto/foto52de7cc6ba0670a64b344e716c32cf4b6.jpg', '196/LHPP/VI/2017', 'repository/lampiran/permohonan/lhppedffb0086376953af95f2e751c994b0e.pdf', '006.P.20.421.3201.GESZ.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('004', 'SDE-1406176174', 'PT. PULO DAMAR ABADI', '019/SLO-PDA/VI/2017', NULL, 'Perumnas Bumi Teluk Jambe Ruko Blok I/33 Karawang 41361', 'repository/slo/permohonan/46e75100a75bdf7b4701a96cd90d2750.pdf', '2274091321233', '0', 'FBG4.17', '2017-06-14 14:37:17', NULL, '1', '2017-06-05', '-6.9518340,110.0706870', 'repository/lampiran/permohonan/foto/foto1fdad94d0e4dcc86670523c7ab109ffe8.jpg', 'repository/lampiran/permohonan/foto/foto2fdad94d0e4dcc86670523c7ab109ffe8.jpg', 'repository/lampiran/permohonan/foto/foto3fdad94d0e4dcc86670523c7ab109ffe8.jpg', 'repository/lampiran/permohonan/foto/foto4fdad94d0e4dcc86670523c7ab109ffe8.jpg', 'repository/lampiran/permohonan/foto/foto5fdad94d0e4dcc86670523c7ab109ffe8.jpg', '191/LHPP/SDE/VI/2017', 'repository/lampiran/permohonan/lhppfdad94d0e4dcc86670523c7ab109ffe8.pdf', '004.P.20.428.3324.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('005', 'SDE-1506176175', 'PT. VOLTASE AMPERINDO PERKASA ', '013/SP-VAP/V/2017', NULL, 'Jl. Sutiragen IV/ No.03, Rt. 03/16  Bantar jati Bogor', 'repository/slo/permohonan/11aa5a1e449abf979491c74fb653e6bb.pdf', '2234761324621', '0', 'FBG9.17', '2017-06-15 15:23:04', NULL, '1', '2017-05-20', '-6.5319050,107.7584080', 'repository/lampiran/permohonan/foto/foto118a4733f5ac28a260c06e54f6265705d.jpg', 'repository/lampiran/permohonan/foto/foto218a4733f5ac28a260c06e54f6265705d.jpg', 'repository/lampiran/permohonan/foto/foto318a4733f5ac28a260c06e54f6265705d.jpg', 'repository/lampiran/permohonan/foto/foto418a4733f5ac28a260c06e54f6265705d.jpg', 'repository/lampiran/permohonan/foto/foto518a4733f5ac28a260c06e54f6265705d.jpg', '194/LHPP/SDE/VI/2017', 'repository/lampiran/permohonan/lhpp18a4733f5ac28a260c06e54f6265705d.pdf', '005.P.20.428.3214.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('008', 'SDE-2106176178', 'PT. CITRA TEKNIK ANDALAS', '051/CTA/PRM/IV/2017', NULL, 'Jl. Usman Effendi Sepang Tanjak No. 40 Rt. 005/Rw. 006, Serang Banten', 'repository/slo/permohonan/04fe424172b3fccd9fc3065baae7e69d.pdf', '1151154859813', '0', 'HDD8.17', '2017-06-21 10:58:29', NULL, '1', '2017-04-28', '-6.2271583,105.8376650', 'repository/lampiran/permohonan/foto/foto10d37d3314d8472b2e31399c4a1fbf040.jpg', 'repository/lampiran/permohonan/foto/foto20d37d3314d8472b2e31399c4a1fbf040.jpg', 'repository/lampiran/permohonan/foto/foto30d37d3314d8472b2e31399c4a1fbf040.jpg', 'repository/lampiran/permohonan/foto/foto40d37d3314d8472b2e31399c4a1fbf040.jpg', 'repository/lampiran/permohonan/foto/foto5384e4d6a922dba1fc453ca5f7937c3a5.jpg', '184/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp77069c850b1dd1d1bfe7bd62f98af5c3.pdf', '008.P.20.421.3672.JA14.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('009', 'SDE-0307176179', 'PT. TERUNA JAYA TEKNIK', '020/SLO-SDE/TJT/VI/2017', NULL, 'Jl. Permata Raya III Blok D.2 No. 42 Permata Harjamukti Kel. Kalijaga - Cirebon', 'repository/slo/permohonan/1838a8d549eb211872d3aa43caae8b4e.pdf', '7200099785115', '0', 'GBU7.17', '2017-07-03 16:04:40', NULL, '1', '2017-06-07', '-6.7586982,108.4698255', 'repository/lampiran/permohonan/foto/foto1901cf03cf810254caa41856600143525.jpg', 'repository/lampiran/permohonan/foto/foto232357f18be63763f9d9fa332e540ff62.jpg', 'repository/lampiran/permohonan/foto/foto3901cf03cf810254caa41856600143525.jpg', 'repository/lampiran/permohonan/foto/foto4901cf03cf810254caa41856600143525.jpg', 'repository/lampiran/permohonan/foto/foto5901cf03cf810254caa41856600143525.jpg', '197/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp901cf03cf810254caa41856600143525.pdf', '009.P.20.422.3209.JEBM.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00A', 'SDE-0407176180', 'PT. VOLTASE AMPERINDO PERKASA ', '015/VAP/I/2017', NULL, 'Jl. Sutiragen IV/ No.03, Rt. 03/16  Bantar jati Bogor', 'repository/slo/permohonan/01790869f595ec17f50162c32048789d.pdf', '8182848979185', '0', 'GC30.17', '2017-07-04 09:29:01', NULL, '1', '2017-01-12', '-6.2387510,106.7647590', 'repository/lampiran/permohonan/foto/foto1ede3f14855ed00d8301df21fc53ad4af.jpg', 'repository/lampiran/permohonan/foto/foto2ede3f14855ed00d8301df21fc53ad4af.jpg', 'repository/lampiran/permohonan/foto/foto3ede3f14855ed00d8301df21fc53ad4af.jpg', 'repository/lampiran/permohonan/foto/foto4ede3f14855ed00d8301df21fc53ad4af.jpg', 'repository/lampiran/permohonan/foto/foto5ede3f14855ed00d8301df21fc53ad4af.jpg', '199/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhppede3f14855ed00d8301df21fc53ad4af.pdf', '00A.P.20.422.3174.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00B', 'SDE-0407176181', 'PT. LITA MEKANIKAL ELEKTRIKAL', '25/LME/SLO/V/2017', NULL, 'Kp. Lengkong Barang Rt/Rw. 03/02 Iwul Parung, Bogor', 'repository/slo/permohonan/d8c9152bdf4cd746b56be99c9d4feda3.pdf', '1843718586374', '0', 'GC58.17', '2017-07-04 13:04:22', NULL, '1', '2017-05-12', '-7.779835,110.414167', 'repository/lampiran/permohonan/foto/foto1c47e715d55c449a93ed58ee340cd8eea.JPG', 'repository/lampiran/permohonan/foto/foto215235d978b81bbe5c88e93ca19b2ce93.jpg', 'repository/lampiran/permohonan/foto/foto339c197140590ba7db7576638a7798d8a.JPG', 'repository/lampiran/permohonan/foto/foto4483fce5f5fab093d7fde73e880ac2e32.JPG', 'repository/lampiran/permohonan/foto/foto515235d978b81bbe5c88e93ca19b2ce93.jpg', '198/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp367abe607f89adfb17e0d2c1f6867ea2.pdf', '00B.P.20.425.3404.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00C', 'SDE-0407176182', 'PT. VOLTASE AMPERINDO PERKASA ', '012/VAP/VI/2017', NULL, 'Jl. Sutiragen IV/ No.03, Rt. 03/16  Bantar jati Bogor', 'repository/slo/permohonan/d3db1cc6977d0efcceadcd95886dfd5a.pdf', '1171328133635', '0', 'GCD5.17', '2017-07-04 14:52:13', NULL, '1', '2017-05-23', '-9.623405,119.465723', 'repository/lampiran/permohonan/foto/foto1ce627d9570b2782b1b48d6cb0efed536.jpg', 'repository/lampiran/permohonan/foto/foto2ce627d9570b2782b1b48d6cb0efed536.jpg', 'repository/lampiran/permohonan/foto/foto3ce627d9570b2782b1b48d6cb0efed536.JPG', 'repository/lampiran/permohonan/foto/foto4ce627d9570b2782b1b48d6cb0efed536.jpg', 'repository/lampiran/permohonan/foto/foto5ce627d9570b2782b1b48d6cb0efed536.JPG', '201/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp9a52222e37da10eb8ac821973dcefb7c.pdf', '00C.U.20.311.1N15.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00D', 'SDE-0407176183', 'PT. VOLTASE AMPERINDO PERKASA ', '013/VAP/VI/2017', NULL, 'Jl. Sutiragen IV/ No.03, Rt. 03/16  Bantar jati Bogor', 'repository/slo/permohonan/aea6df5742fb62e0af5e7c84c7130810.pdf', '6985008717889', '0', 'GCD4.17', '2017-07-04 16:52:22', NULL, '1', '2017-05-23', '-9.663708,119.381697', 'repository/lampiran/permohonan/foto/foto18db737c5b3cab56e8ed3fbfc68c499c5.jpg', 'repository/lampiran/permohonan/foto/foto2f7501aa1d73e7945e431fd9fd205f780.JPG', 'repository/lampiran/permohonan/foto/foto306f9815e4a5a4132d26064f1f825e594.JPG', 'repository/lampiran/permohonan/foto/foto44b1bb1c8642113d9d8643e56a7b0320e.JPG', 'repository/lampiran/permohonan/foto/foto506f9815e4a5a4132d26064f1f825e594.jpg', '201/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp06f9815e4a5a4132d26064f1f825e594.pdf', '00D.U.20.311.1N15.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00E', 'SDE-1407176184', 'PT. LITA MEKANIKAL ELEKTRIKAL', '25/LME/SLO/V/2017', NULL, 'Kp. Lengkong Barang Rt/Rw. 03/02 Iwul Parung, Bogor', 'repository/slo/permohonan/e2cdfc705fc7f9f2dd19b54777dcc2ba.pdf', '2582402811227', '0', 'GCE2.17', '2017-07-14 08:41:26', NULL, '1', '2017-05-12', '-7.779835,110.414167', 'repository/lampiran/permohonan/foto/foto100b4d740b27489ae9ac987c9925a7bb9.JPG', 'repository/lampiran/permohonan/foto/foto200b4d740b27489ae9ac987c9925a7bb9.jpg', 'repository/lampiran/permohonan/foto/foto300b4d740b27489ae9ac987c9925a7bb9.JPG', 'repository/lampiran/permohonan/foto/foto400b4d740b27489ae9ac987c9925a7bb9.JPG', 'repository/lampiran/permohonan/foto/foto500b4d740b27489ae9ac987c9925a7bb9.jpg', '198/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp1714735c34648cddc7d6654afcd70665.pdf', '00E.P.20.425.3404.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00F', 'SDE-1807176185', 'PT. BUMI BANGKIT BERSAMA', '26/SKI/2017', NULL, 'Desa Neglasasri Kec. Bojong Kab. Purwakarta', 'repository/slo/permohonan/1123461a912291128162d4bea213633f.pdf', '4432161926238', '0', 'GCY6.17', '2017-07-18 14:00:21', NULL, '1', '2017-05-10', '-6.7099440,107.4894060', 'repository/lampiran/permohonan/foto/foto127037c0f47f657ba231ef2b633e375c2.jpg', 'repository/lampiran/permohonan/foto/foto227037c0f47f657ba231ef2b633e375c2.jpg', 'repository/lampiran/permohonan/foto/foto327037c0f47f657ba231ef2b633e375c2.jpg', 'repository/lampiran/permohonan/foto/foto427037c0f47f657ba231ef2b633e375c2.jpg', 'repository/lampiran/permohonan/foto/foto527037c0f47f657ba231ef2b633e375c2.jpg', '203/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp22d2027bb6b90603625ae8a944cac044.pdf', '00F.P.20.428.3214.JE79.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00G', 'SDE-2407176186', 'PT. VOLTASE AMPERINDO PERKASA ', '016/VAP/VII/2017', NULL, 'Jl. Sutiragen IV/ No.03, Rt. 03/16  Bantar jati Bogor', 'repository/slo/permohonan/549eecd60d761f338dbca9e82854a7c4.pdf', '1207774191025', '0', 'HDD7.17', '2017-07-24 11:10:41', NULL, '1', '2017-07-10', '-10.152657,123.658861', 'repository/lampiran/permohonan/foto/foto1d00a1ae651f5c9061c239ad0ec91b376.jpg', 'repository/lampiran/permohonan/foto/foto2d00a1ae651f5c9061c239ad0ec91b376.jpg', 'repository/lampiran/permohonan/foto/foto3d00a1ae651f5c9061c239ad0ec91b376.jpg', 'repository/lampiran/permohonan/foto/foto4d00a1ae651f5c9061c239ad0ec91b376.jpg', 'repository/lampiran/permohonan/foto/foto5d00a1ae651f5c9061c239ad0ec91b376.jpg', '202/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp1b9e04bc59f677c6efa434c17bd2bd82.pdf', '00G.P.20.424.5301.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00H', 'SDE-2607176187', 'PT. JAPA MELINDO PRATAMA', '10/SLO/JMP/VII/2017', NULL, 'Jl. Setia I No. 69 Rt. 04/08 Kel. Jaticempaka Ke. Pondok Gede, kota Bekasi', 'repository/slo/permohonan/fc10ca9f635ba3bca016f304bf6345c2.pdf', '9574100548939', '0', 'HDD6.17', '2017-07-26 12:50:20', NULL, '1', '2017-07-21', '-6.3142100,108,0337900', 'repository/lampiran/permohonan/foto/foto11c0e8c962d5693f37995d2112cf4bcfc.jpg', 'repository/lampiran/permohonan/foto/foto21c0e8c962d5693f37995d2112cf4bcfc.jpg', 'repository/lampiran/permohonan/foto/foto31c0e8c962d5693f37995d2112cf4bcfc.jpg', 'repository/lampiran/permohonan/foto/foto41c0e8c962d5693f37995d2112cf4bcfc.jpg', 'repository/lampiran/permohonan/foto/foto51c0e8c962d5693f37995d2112cf4bcfc.jpg', '206/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp4d1f30a6bdfab63671056d9a2810d802.pdf', '00H.P.20.428.3212.GERY.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00I', 'SDE-2607176188', 'PT. BANDUNG ISCO', '011/SP-BI/VII/2017', NULL, 'Jl. Andromeda Blok L IIA No. 42 Margahayu Raya - Bandung', 'repository/slo/permohonan/ad36170bea740d08eef33ef1a4917711.pdf', '2337819518151', '0', 'HDD5.17', '2017-07-26 14:35:13', NULL, '1', '2017-07-21', '-6.3764010,107.3081430', 'repository/lampiran/permohonan/foto/foto1bf3342fc66342189ff25b1d4088146ee.jpg', 'repository/lampiran/permohonan/foto/foto2bf3342fc66342189ff25b1d4088146ee.jpg', 'repository/lampiran/permohonan/foto/foto3bf3342fc66342189ff25b1d4088146ee.jpg', 'repository/lampiran/permohonan/foto/foto4bf3342fc66342189ff25b1d4088146ee.jpg', 'repository/lampiran/permohonan/foto/foto5a1e526bec68c5b857793376853c1d445.jpg', '205/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhpp6c771e0ce9ae32c4f31e81e1360afe6f.pdf', '00I.P.20.428.3215.JEAB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00J', 'SDE-2807176189', 'PT. MOLKISS SAKTI', '400/SK/MKS/VII/2017', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, Kel. Cileungsi Kidul, Kec. Cileungsi', 'repository/slo/permohonan/68e8b13b01a49eec394b69120827a96d.pdf', '2200181185715', '0', 'HDD4.17', '2017-07-28 11:29:25', NULL, '1', '2017-07-24', '-6.4013510,106.9982700', 'repository/lampiran/permohonan/foto/foto1fc0eaa562fff5f9306c52357774e93ad.jpg', 'repository/lampiran/permohonan/foto/foto2fc0eaa562fff5f9306c52357774e93ad.jpg', 'repository/lampiran/permohonan/foto/foto3fc0eaa562fff5f9306c52357774e93ad.jpg', 'repository/lampiran/permohonan/foto/foto4fc0eaa562fff5f9306c52357774e93ad.jpg', 'repository/lampiran/permohonan/foto/foto5fc0eaa562fff5f9306c52357774e93ad.jpg', '204/LHPP/SDE/VII/2017', 'repository/lampiran/permohonan/lhppfc0eaa562fff5f9306c52357774e93ad.pdf', '00J.P.20.424.3201.JE96.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00K', 'SDE-0708176190', 'PT. VOLTASE AMPERINDA PERKASA', '012/SP/VII/2017', NULL, 'Jl. Sutiragen IV No. 3 Bantarjati Bogor Utara', 'repository/slo/permohonan/67bfa8f35580d282fb5a5c2715769dda.pdf', '2886548885215', '0', 'HDQ9.17', '2017-08-07 13:39:53', NULL, '1', '2017-07-26', '-6.7385290,105.5111050', 'repository/lampiran/permohonan/foto/foto14d93631c06f64e13c7a33020224e910d.jpg', 'repository/lampiran/permohonan/foto/foto24d93631c06f64e13c7a33020224e910d.jpg', 'repository/lampiran/permohonan/foto/foto34d93631c06f64e13c7a33020224e910d.jpg', 'repository/lampiran/permohonan/foto/foto44d93631c06f64e13c7a33020224e910d.jpg', 'repository/lampiran/permohonan/foto/foto54d93631c06f64e13c7a33020224e910d.jpg', '208/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp67bfa8f35580d282fb5a5c2715769dda.pdf', '00K.P.20.428.3601.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00L', 'SDE-0708176191', 'PT. VOLTASE AMPERINDO PERKASA', '011/SP/VII/2017', NULL, 'Kp. Cipining Kecamatan Sumur Tunggal Jaya', 'repository/slo/permohonan/3f3803a570b5d53247c0ae5f9a202336.pdf', '2894652552897', '0', 'HDR1.17', '2017-08-07 16:46:59', NULL, '1', '2017-07-26', '-6.727502,105.522306', 'repository/lampiran/permohonan/foto/foto1ac570d7aeb37c9a33f7f1983a68e3345.jpg', 'repository/lampiran/permohonan/foto/foto2ac570d7aeb37c9a33f7f1983a68e3345.jpg', 'repository/lampiran/permohonan/foto/foto3ac570d7aeb37c9a33f7f1983a68e3345.jpg', 'repository/lampiran/permohonan/foto/foto4ac570d7aeb37c9a33f7f1983a68e3345.jpg', 'repository/lampiran/permohonan/foto/foto5ac570d7aeb37c9a33f7f1983a68e3345.jpg', '208/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhppf1af1ad31d801339e4267083cf059d04.pdf', '00L.P.20.428.3601.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00M', 'SDE-0708176192', 'PT. GRAMEDIA ASRI MEDIA', '006/SP/G-VII/2017', NULL, 'Jl. Matraman Raya No. 46-50 Matraman Jakarta Timur', 'repository/slo/permohonan/a579cdc5aca2dead4d8ff850afb52eac.pdf', '1812268895268', '0', 'HEB4.17', '2017-08-07 18:04:21', NULL, '1', '0000-00-00', '-6.2030600,106.8559670', 'repository/lampiran/permohonan/foto/foto1d0e38870ada722eb4f48b9f4fd6753a7.jpg', 'repository/lampiran/permohonan/foto/foto2d0e38870ada722eb4f48b9f4fd6753a7.jpg', 'repository/lampiran/permohonan/foto/foto3d0e38870ada722eb4f48b9f4fd6753a7.jpg', 'repository/lampiran/permohonan/foto/foto4d0e38870ada722eb4f48b9f4fd6753a7.jpg', 'repository/lampiran/permohonan/foto/foto5d0e38870ada722eb4f48b9f4fd6753a7.jpg', '209/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhppa579cdc5aca2dead4d8ff850afb52eac.pdf', '00M.P.20.422.3175.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00N', 'SDE-1208176193', 'PT. MAHKOTA INTI CITRA', '071/Jts/Oprs/SK/HRDGA/VII/2017', NULL, 'Jl. Raya Jatinangor No. 150 Ds. Cikeruh Kec. Jatinangor, Sumedang', 'repository/slo/permohonan/2915ac79e07551d6c35148c5829e5eb0.pdf', '2741796428254', '0', 'HE85.17', '2017-08-12 13:05:22', NULL, '1', '2017-07-24', '-6.93486731,107.7696241', 'repository/lampiran/permohonan/foto/foto124afdc17b66e01f683a44ef02d6cae8f.jpg', 'repository/lampiran/permohonan/foto/foto224afdc17b66e01f683a44ef02d6cae8f.JPG', 'repository/lampiran/permohonan/foto/foto324afdc17b66e01f683a44ef02d6cae8f.JPG', 'repository/lampiran/permohonan/foto/foto424afdc17b66e01f683a44ef02d6cae8f.JPG', 'repository/lampiran/permohonan/foto/foto5f5b861aec8447f901d85f54942101e09.JPG', '210/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp48bca6422e077bc117df187c84cb1e57.pdf', '00N.P.20.422.3211.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00O', 'SDE-1508176194', 'PT. MAHKOTA INTI CITRA', '071/JTS-Oprs/SK/HRDGA/VIII/2017', NULL, 'Jl. Raya Jatinangor No. 150 Desa Cikeruh Kec. Jatinangor Sumedang Jawa Barat', 'repository/slo/permohonan/7e23ff71f9791fe3348e32ff5ecbbeb7.pdf', NULL, 'A18T2000231', '', '2017-08-15 08:36:50', NULL, '1', '2017-07-24', '-6.9518340,110.0706870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('00P', 'SDE-1508176195', 'PT. Dharma Electrindo Manufacturing', '23/SHE/DEM/VIII/2017', NULL, 'Jl wadas blok simaja desa gombong kecamatan plumbon kab. cirebon', 'repository/slo/permohonan/bf96758dfdeafa33733c907c410e5c60.pdf', NULL, '0', '', '2017-08-15 15:25:51', NULL, '1', '2017-08-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('00Q', 'SDE-1808176196', 'PT. AULIA DANARDANA', '0017/AD/VIII/2017', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/4386f0fdc50250a261395e2401449553.pdf', '2924610884619', '0', 'HEJ7.17', '2017-08-18 09:57:00', NULL, '1', '2017-08-11', '-1.42723,101.90547', 'repository/lampiran/permohonan/foto/foto18953532388aae5ac19e9e563da45e4f2.jpg', 'repository/lampiran/permohonan/foto/foto24386f0fdc50250a261395e2401449553.jpg', 'repository/lampiran/permohonan/foto/foto38953532388aae5ac19e9e563da45e4f2.JPG', NULL, 'repository/lampiran/permohonan/foto/foto58953532388aae5ac19e9e563da45e4f2.jpg', '215/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp0d736f18ed63f7d2d3359d6b7bd579fe.pdf', '00Q.U.20.311.1F15.GEEE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00R', 'SDE-1808176197', 'PT. LITA MEKANIKAL ELEKTRIKAL', '25/LME/SLO/VIII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung', 'repository/slo/permohonan/03b0ec3d0cf8929274655f38fd9e2dc3.pdf', '1033357288192', '0', 'HEB3.17', '2017-08-18 12:19:32', NULL, '1', '2017-08-10', '-6.5173530,106.8898210', 'repository/lampiran/permohonan/foto/foto1f3a98023732a44ba356721993c06c72e.jpg', 'repository/lampiran/permohonan/foto/foto2f3a98023732a44ba356721993c06c72e.jpg', 'repository/lampiran/permohonan/foto/foto3f3a98023732a44ba356721993c06c72e.jpg', 'repository/lampiran/permohonan/foto/foto4f3a98023732a44ba356721993c06c72e.jpg', NULL, '214/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp03b0ec3d0cf8929274655f38fd9e2dc3.pdf', '00R.P.20.421.3201.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00S', 'SDE-3108176198', 'PT. LITA MEKANIKAL ELEKTRIKAL', '28/LME/SLO/VIII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/Rw. 02, Iwul Parung', 'repository/slo/permohonan/2c382bef6073fcd0ee487e5a75a0c62e.pdf', '2181911704177', '0', 'IFB7.17', '2017-08-31 08:15:59', NULL, '1', '2017-08-18', '-7.0288040,108.6157590', 'repository/lampiran/permohonan/foto/foto17beb23cd86c9bae2bce547f6612a524e.jpg', 'repository/lampiran/permohonan/foto/foto2c5b6e80e53f8fad866795dd3fed1ebf7.jpg', 'repository/lampiran/permohonan/foto/foto3c5b6e80e53f8fad866795dd3fed1ebf7.jpg', 'repository/lampiran/permohonan/foto/foto4c5b6e80e53f8fad866795dd3fed1ebf7.jpg', NULL, '216/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp739837c99c8c9a7c38db956fb8737503.pdf', '00S.P.20.428.3208.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00T', 'SDE-3108176199', 'PT. LITA MEKANIKAL ELEKTRIKAL', '29/LME/SLO/VIII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/Rw. 02, Iwul Parung', 'repository/slo/permohonan/5f9fe7903d7ec915b75a539e11c96f0e.pdf', '1042617855803', '0', 'IFB8.17', '2017-08-31 10:27:23', NULL, '1', '2017-08-21', '-6.5069670,106.7756450', 'repository/lampiran/permohonan/foto/foto12518df2ce2b4504049d9321f85c36a85.jpg', 'repository/lampiran/permohonan/foto/foto22518df2ce2b4504049d9321f85c36a85.jpg', 'repository/lampiran/permohonan/foto/foto32518df2ce2b4504049d9321f85c36a85.jpg', 'repository/lampiran/permohonan/foto/foto42518df2ce2b4504049d9321f85c36a85.jpg', NULL, '217/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhppf267251470c2c0bf0d55f2b6d5433baf.pdf', '00T.P.20.421.3276.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00U', 'SDE-0409176200', 'PT. MULIA MAKMUR KENCANA', '037/PT.MMK-BDL/VIII/2017', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B, Kab. Kota Bandarlampung Prov. Lampung', 'repository/slo/permohonan/2649722b9589ac087676e4682380f288.pdf', '2498527393901', '0', 'IFB9.17', '2017-09-04 12:44:48', NULL, '1', '2017-08-02', '-5.632643,104.84037', 'repository/lampiran/permohonan/foto/foto1fbc120e36cee5d68a0f88547ee77f108.jpeg', 'repository/lampiran/permohonan/foto/foto2fbc120e36cee5d68a0f88547ee77f108.jpg', 'repository/lampiran/permohonan/foto/foto3fbc120e36cee5d68a0f88547ee77f108.jpeg', 'repository/lampiran/permohonan/foto/foto4fbc120e36cee5d68a0f88547ee77f108.jpeg', 'repository/lampiran/permohonan/foto/foto5302bd066ced82e18b863b8aad015a0f1.jpeg', '213/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhppde6b9f286cf729271ec9c629db8ee859.pdf', '00U.P.20.428.1871.AXCN.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00V', 'SDE-0409176201', 'PT. MULIA MAKMUR KENCANA', '035/PT.MMK-BDL/VIII/2017', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B, Kab. Kota Bandarlampung Prov. Lampung', 'repository/slo/permohonan/187530c726166d24e8f2bc788039a68e.pdf', '6581122051548', '0', 'IFC1.17', '2017-09-04 13:06:09', NULL, '1', '2017-08-02', '-5.612478,104.809642', 'repository/lampiran/permohonan/foto/foto1b28060b99d6359b0f8cb9a05fc534a48.jpeg', NULL, 'repository/lampiran/permohonan/foto/foto31f7f73bb62c8996d7c1d02e24006b1de.JPG', 'repository/lampiran/permohonan/foto/foto40a87b61aa6ff729d8e457b0f6ad8456f.jpeg', 'repository/lampiran/permohonan/foto/foto503725b49d2a2c3c2e2c98d15f5f9b93e.jpeg', '211/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhpp77e137ca321eb94a57ecf4d8afa392f6.pdf', '00V.P.20.428.1801.AXCN.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00W', 'SDE-0409176202', 'PT. MULIA MAKMUR KENCANA', '036/PT.MMK-BDL/VIII/2017', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B, Kab. Kota Bandarlampung Prov. Lampung', 'repository/slo/permohonan/2be453296e2c6d62da5d7da68a0be4dc.pdf', '2906934502565', '0', 'IF98.17', '2017-09-04 17:54:56', NULL, '1', '2017-08-02', '-5.710814,105.785', 'repository/lampiran/permohonan/foto/foto1f7505814cca96a7f3df12f38171d4647.jpg', 'repository/lampiran/permohonan/foto/foto2f7505814cca96a7f3df12f38171d4647.jpeg', 'repository/lampiran/permohonan/foto/foto3f7505814cca96a7f3df12f38171d4647.jpg', 'repository/lampiran/permohonan/foto/foto4f7505814cca96a7f3df12f38171d4647.JPG', 'repository/lampiran/permohonan/foto/foto56e5f1ddb9d76129bfb350343d8f8750e.jpeg', '212/LHPP/SDE/VIII/2017', 'repository/lampiran/permohonan/lhppaf6166b8e2e7ab1bb7ea35852dc04ce9.pdf', '00W.P.20.428.1871.AXCN.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00X', 'SDE-0809176203', 'PT. HEN JAYA ', '132/PPSLO/PTHJ/IX/2017', NULL, 'Jl. Margonda Raya No. 230A, Rt. 04/Rw. 01 Kemiri Muka/Beji Depok Jawa Barat', 'repository/slo/permohonan/228928fcec7983d2b14e8250a2a0d55b.pdf', '1566117381761', '0', 'IFS1.17', '2017-09-08 09:25:55', NULL, '1', '2017-09-04', '-6.3821080,106.8305750', 'repository/lampiran/permohonan/foto/foto160ebc39237e51b7ad63b66cfd2b7aae6.jpg', 'repository/lampiran/permohonan/foto/foto260ebc39237e51b7ad63b66cfd2b7aae6.jpg', 'repository/lampiran/permohonan/foto/foto360ebc39237e51b7ad63b66cfd2b7aae6.jpg', 'repository/lampiran/permohonan/foto/foto460ebc39237e51b7ad63b66cfd2b7aae6.jpg', 'repository/lampiran/permohonan/foto/foto560ebc39237e51b7ad63b66cfd2b7aae6.jpg', '224/BA/LIT-SDE/IX/2017', 'repository/lampiran/permohonan/lhppa8424cd3fdaf852aaa48edc6d1ea5206.pdf', '00X.P.20.425.3276.JECM.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('00Y', 'SDE-2609176204', 'CV. SUKSES PERDANA', '028/SP-KPG/VIII/2017', NULL, 'BTN Kolhua Blok V No. 20, Kota Kupang Prov. Nusa tenggara Timur', 'repository/slo/permohonan/9e473a0bf2e4328042240d8e01c79641.pdf', NULL, '0', '', '2017-09-26 11:38:18', NULL, '1', '2017-08-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('00Z', 'SDE-2609176205', 'CV. SUKSES PERDANA', '028/SP-KPG/VIII/2017', NULL, 'BTN Kolhua Blok V No. 20, Kota Kupang Prov. Nusa Tenggara Timur', 'repository/slo/permohonan/44435ae84c8125d45ebe78cbcdab31bd.pdf', '1128975671637', '0', 'IGA2.17', '2017-09-26 11:42:07', NULL, '1', '2017-08-18', '-8.212393,124.556947', 'repository/lampiran/permohonan/foto/foto11834e92eeaeb7fd57c6e3a2b50e4f4eb.jpeg', 'repository/lampiran/permohonan/foto/foto21834e92eeaeb7fd57c6e3a2b50e4f4eb.jpeg', 'repository/lampiran/permohonan/foto/foto31834e92eeaeb7fd57c6e3a2b50e4f4eb.jpeg', 'repository/lampiran/permohonan/foto/foto41834e92eeaeb7fd57c6e3a2b50e4f4eb.jpeg', 'repository/lampiran/permohonan/foto/foto5a1b91abcffa91f5e099d53d5636e4d2b.JPG', '221/LHPP/SDE/IX/2017', 'repository/lampiran/permohonan/lhpp1834e92eeaeb7fd57c6e3a2b50e4f4eb.pdf', '00Z.U.20.311.1N15.XF22.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('010', 'SDE-2709176206', 'CV. ARISTON', '04/PSLO/VI/2017', NULL, 'Jl. Gereja Moria Kel. Lilibia Kota Kupang Prov. Nusa Tenggara Timur', 'repository/slo/permohonan/d9cae64a0789c1903cfeea8aa0db0bc2.jpg', '2811382599819', '0', 'IGA9.17', '2017-09-27 10:14:43', NULL, '1', '2017-08-22', '-8.2577556,124.5157656', 'repository/lampiran/permohonan/foto/foto184f93dc9b89b570a94e3c6b0e2ccd437.JPG', 'repository/lampiran/permohonan/foto/foto284f93dc9b89b570a94e3c6b0e2ccd437.jpeg', 'repository/lampiran/permohonan/foto/foto384f93dc9b89b570a94e3c6b0e2ccd437.jpeg', 'repository/lampiran/permohonan/foto/foto484f93dc9b89b570a94e3c6b0e2ccd437.JPG', 'repository/lampiran/permohonan/foto/foto584f93dc9b89b570a94e3c6b0e2ccd437.jpeg', '223/LHPP/SDE/IX/2017', 'repository/lampiran/permohonan/lhpp6a245dee83bfbf72d6b2cc18ed8f87d6.pdf', '010.U.20.311.1N15.XF41.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('011', 'SDE-2709176207', 'CV. ARISTON', '04/PSLO/VI/2017', NULL, 'Jl. Gereja Moria Kel. Lilibia Kota Kupang Prov. Nusa Tenggara Timur', 'repository/slo/permohonan/2892036c5314c23b1223ed711daa5875.jpg', NULL, '0', '', '2017-09-27 10:15:52', NULL, '1', '2017-08-22', '', NULL, NULL, NULL, NULL, NULL, 'tes/tes/tes', NULL, '011.U.20.311.1N15.XF41.18', NULL, 0, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('012', 'SDE-2709176208', 'PT. AULIA DANARDANA', '0024/AD/IX/2017', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/789d12cd7844cf9c75886a7457fcfd91.pdf', '2455951504232', '0', '', '2017-09-27 11:32:30', NULL, '1', '2017-09-15', '-3.38563,104.07096', 'repository/lampiran/permohonan/foto/foto1fe4cc071a17472e866a27a3daa105dfe.jpg', 'repository/lampiran/permohonan/foto/foto2cd1e6d1d0f01b832b040231dfb49dd57.jpg', 'repository/lampiran/permohonan/foto/foto3cd1e6d1d0f01b832b040231dfb49dd57.JPG', 'repository/lampiran/permohonan/foto/foto4cd1e6d1d0f01b832b040231dfb49dd57.jpg', 'repository/lampiran/permohonan/foto/foto5cd1e6d1d0f01b832b040231dfb49dd57.jpg', '228/LHPP/SDE/IX/2017', 'repository/lampiran/permohonan/lhpp789d12cd7844cf9c75886a7457fcfd91.pdf', '012.U.20.311.1F15.GEEE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('013', 'SDE-2709176209', 'AULIA DANARDANA', '0024/AD/IX/2017', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/ebb7785328b850153acbeb440ad54341.pdf', '1147772558479', '0', 'JH54.17', '2017-09-27 13:06:13', NULL, '1', '2017-09-15', '-3.38563,104.07096', 'repository/lampiran/permohonan/foto/foto1dc8a8037fca65fac99db099d3b1897f1.jpg', 'repository/lampiran/permohonan/foto/foto27458a30974494024dc086a574d2d1fd2.jpg', 'repository/lampiran/permohonan/foto/foto3dc8a8037fca65fac99db099d3b1897f1.jpg', 'repository/lampiran/permohonan/foto/foto4dc8a8037fca65fac99db099d3b1897f1.JPG', 'repository/lampiran/permohonan/foto/foto5cbd09b5f5c147a22a918895ca5c8bc35.jpg', '228/LHPP/SDE/IX/2017', 'repository/lampiran/permohonan/lhpp0b74d7e968463f80a95cd1987c2e47b9.pdf', '013.U.20.311.1F15.GEEE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('014', 'SDE-0510176210', 'PT. LITA MEKANIKAL ELEKTRIKAL', '33/LME/SLO/IX/2017', NULL, 'Kp. Lengkong Barang Rt. 03/02, Iwul Parung', 'repository/slo/permohonan/ad40b38b59b2f09fa76fb6b25aff1165.pdf', '1789576751616', '0', 'JGX6.17', '2017-10-05 13:01:56', NULL, '1', '2017-09-13', '-6.7986680,106.7607530', 'repository/lampiran/permohonan/foto/foto17d5214bf5a4825bfd56c49ef670e5433.jpg', 'repository/lampiran/permohonan/foto/foto27d5214bf5a4825bfd56c49ef670e5433.jpg', 'repository/lampiran/permohonan/foto/foto37d5214bf5a4825bfd56c49ef670e5433.jpg', 'repository/lampiran/permohonan/foto/foto47d5214bf5a4825bfd56c49ef670e5433.jpg', 'repository/lampiran/permohonan/foto/foto5b745c85c43e3dadfa1850133f908c95a.jpg', '222/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp5bb404e2cde405baa953383bebc4c55d.pdf', '014.P.20.428.3202.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('015', 'SDE-0610176211', 'PT. SINAR ANISA MANDIRI', '103/SAM/IX/2017', NULL, 'Kp. Kalijambe Rt. 002/004, Ds. Lambangsari, Kec. Tambun Bekasi - Jawa Barat  ', 'repository/slo/permohonan/4a3824d9524ddf5b4d547cf5ddb737d0.pdf', '1167880465908', '0', 'JGX9.17', '2017-10-06 09:04:25', NULL, '1', '2017-09-29', '-6.2893970,107.1258810', 'repository/lampiran/permohonan/foto/foto1f8ab57572e77e41114e971eaf087edcb.jpg', 'repository/lampiran/permohonan/foto/foto2f8ab57572e77e41114e971eaf087edcb.jpg', 'repository/lampiran/permohonan/foto/foto3f8ab57572e77e41114e971eaf087edcb.jpg', 'repository/lampiran/permohonan/foto/foto4f8ab57572e77e41114e971eaf087edcb.jpg', 'repository/lampiran/permohonan/foto/foto5f8ab57572e77e41114e971eaf087edcb.jpg', '231/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp22fed0cf37b1a74c29bdc1d489124a44.pdf', '015.P.20.428.3216.JEBA.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('016', 'SDE-0610176212', 'PT. PULO DAMAR ABADI', '021/SLO-PDA/IX/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32, Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/602e974dfee248c41befaba3cb158457.pdf', '1725077108660', '0', 'JGY1.17', '2017-10-06 11:07:33', NULL, '1', '2017-08-25', '-6.2438630,106.7995460', 'repository/lampiran/permohonan/foto/foto1782ade225506bcddb3d701071b4430c0.jpg', 'repository/lampiran/permohonan/foto/foto2782ade225506bcddb3d701071b4430c0.jpg', 'repository/lampiran/permohonan/foto/foto3782ade225506bcddb3d701071b4430c0.jpg', 'repository/lampiran/permohonan/foto/foto4782ade225506bcddb3d701071b4430c0.jpg', 'repository/lampiran/permohonan/foto/foto5782ade225506bcddb3d701071b4430c0.jpg', '232/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhppc59d0b7d04cce588c80afc6f522d4991.pdf', '016.P.20.425.3174.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('017', 'SDE-0910176213', 'PT. MULIA MAKMUR KENCANA', '040/PT.MMK-BDL/IX/2017', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B Lampung', 'repository/slo/permohonan/1c3461163ab3d746e3c9985e0a88b835.pdf', '1030609807005', '0', 'JHK6.17', '2017-10-09 11:46:52', NULL, '1', '2017-09-26', '-4.8614060,104.9403550', 'repository/lampiran/permohonan/foto/foto184c555424d2796c93dd9831e4076c6df.jpg', 'repository/lampiran/permohonan/foto/foto284c555424d2796c93dd9831e4076c6df.jpg', 'repository/lampiran/permohonan/foto/foto384c555424d2796c93dd9831e4076c6df.jpg', 'repository/lampiran/permohonan/foto/foto484c555424d2796c93dd9831e4076c6df.jpg', 'repository/lampiran/permohonan/foto/foto584c555424d2796c93dd9831e4076c6df.jpg', '233/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp41ec9ab9454760a833aabbd78ddf3549.pdf', '017.P.20.428.1803.AXCN.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('018', 'SDE-1010176214', 'PT. BAYU SUKSES PRATAMA', '002/BSP.TRF/IX/2017', NULL, 'Jl. Raya Kalibata No. 11-12 Blok C-D Jakarta selatan', 'repository/slo/permohonan/e27369e0070adc298f6dd660c591c185.pdf', '4113079654905', '0', 'JHK7.17', '2017-10-10 16:02:04', NULL, '1', '2017-09-23', '-6.1819260,106.8248320', 'repository/lampiran/permohonan/foto/foto1da7f6ab8e62db74fc0effc3029cdd405.jpg', 'repository/lampiran/permohonan/foto/foto2da7f6ab8e62db74fc0effc3029cdd405.jpg', 'repository/lampiran/permohonan/foto/foto3da7f6ab8e62db74fc0effc3029cdd405.jpg', 'repository/lampiran/permohonan/foto/foto4da7f6ab8e62db74fc0effc3029cdd405.jpg', 'repository/lampiran/permohonan/foto/foto5da7f6ab8e62db74fc0effc3029cdd405.jpg', '230/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhppbc28df275f842fcea6f96bc1fa755f01.pdf', '018.P.20.421.3171.GIEZ.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('019', 'SDE-1110176215', 'PT. SINAR ANISA MANDIRI', '104/SAM/X/2017', NULL, 'Jl. Kalijambe Rt. 002/004, Desa Lambangsari, Kec. Tambun Kab. Bekasi - Jawa Barat', 'repository/slo/permohonan/b2cf5a4f37b90b5520941274acb22cbe.pdf', '2249913744878', '0', 'JH76.17', '2017-10-11 09:40:37', NULL, '1', '2017-10-06', '-6.326539,106.978734', 'repository/lampiran/permohonan/foto/foto1064d7b65d9e7bb92db43997a84805f1f.jpg', 'repository/lampiran/permohonan/foto/foto2064d7b65d9e7bb92db43997a84805f1f.jpg', 'repository/lampiran/permohonan/foto/foto3064d7b65d9e7bb92db43997a84805f1f.jpg', 'repository/lampiran/permohonan/foto/foto4064d7b65d9e7bb92db43997a84805f1f.jpg', 'repository/lampiran/permohonan/foto/foto5064d7b65d9e7bb92db43997a84805f1f.jpg', '234/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp43feaf3a330efa1a34f010776ba00821.pdf', '019.P.20.428.3216.JEBA.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01A', 'SDE-1110176216', 'PT. NUSA ADI DAYA', '032/SLO-NAD/X/2017', NULL, 'Perum Cijahe Legacy Blok C-3 Rt. 002/001 Kel. Curug Mekar Kec. Bogor Barat', 'repository/slo/permohonan/22eea2fb93c72c1f5fea79981626fa47.pdf', '8828113739642', '0', 'JH75.17', '2017-10-11 14:04:27', NULL, '1', '2017-10-02', '-6.333320,106.97781', 'repository/lampiran/permohonan/foto/foto1898ac33341b0ca945bd8e3f7260e607f.jpg', 'repository/lampiran/permohonan/foto/foto277ac3211b4306d8128b9fc84fb9db9d4.jpg', 'repository/lampiran/permohonan/foto/foto37eb71dd0d9dc097491e27bb9c3c5899e.jpg', 'repository/lampiran/permohonan/foto/foto47eb71dd0d9dc097491e27bb9c3c5899e.jpg', 'repository/lampiran/permohonan/foto/foto57eb71dd0d9dc097491e27bb9c3c5899e.jpg', '235/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp5d3ac171a99cf4deed2ee4e071058a34.pdf', '01A.P.20.428.3216.GESZ.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01B', 'SDE-1710176217', 'PT. SIMBA INDOSNACK MAKMUR', '0618/SIM/SLO/X/2017', NULL, 'Jl. Pancasila IV No. 9 Rt. 02/Rw. 13 Cicadas Gn. Putri Bogor', 'repository/slo/permohonan/d46e953526313168be95ba17d70972c9.pdf', '1525103390946', '0', 'JHK5.17', '2017-10-17 11:31:24', NULL, '1', '2017-10-09', '-6.437986,106.928686', 'repository/lampiran/permohonan/foto/foto13ee6513d78164bdb076ef582692f3e48.jpg', 'repository/lampiran/permohonan/foto/foto23ee6513d78164bdb076ef582692f3e48.jpg', 'repository/lampiran/permohonan/foto/foto33ee6513d78164bdb076ef582692f3e48.jpg', 'repository/lampiran/permohonan/foto/foto43ee6513d78164bdb076ef582692f3e48.jpg', 'repository/lampiran/permohonan/foto/foto53ee6513d78164bdb076ef582692f3e48.jpg', '243/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp3f55698ee9ea6c5b0d1b3f7bcda4929f.pdf', '01B.P.20.428.3201.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL);
INSERT INTO `t_pemohon` (`id_pemohon`, `no_register`, `nama`, `jabatan`, `tlp`, `alamat`, `file_permohonan`, `api_nopermohonan`, `api_no_agenda`, `api_noregistrasi`, `created_at`, `published_at`, `id_user`, `tgl_pemohon`, `map`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `noLHPP`, `lhpp`, `noSLO`, `salinanslo`, `status`, `user_id_tt_1`, `nama_tt_1`, `sub_bidang_tt_1`, `no_sertifikat_tt_1`, `kode_unit_tt_1`, `foto_tt_1`, `user_id_tt_2`, `nama_tt_2`, `sub_bidang_tt_2`, `no_sertifikat_tt_2`, `kode_unit_tt_2`, `foto_tt_2`, `notif`, `id_pemohon_lama`) VALUES
('01C', 'SDE-1710176218', 'PT. SINAR ANISA MANDIRI', '108/SAM/X/2017', NULL, 'Kp. Kalijambe Rt. 002/004 Ds. Lambang Sari, Kec. Tambun Kab. Bekasi Jawa Barat', 'repository/slo/permohonan/fb8dbc4a5d09ac189cc72a8f90b08d38.jpg', '1247364926219', '0', 'JHK3.17', '2017-10-17 12:43:30', NULL, '1', '2017-10-13', '-6.3092872,106.8694497', 'repository/lampiran/permohonan/foto/foto1170e04a6bffc579f0fe71ea289b7ed72.jpg', 'repository/lampiran/permohonan/foto/foto2170e04a6bffc579f0fe71ea289b7ed72.jpg', 'repository/lampiran/permohonan/foto/foto3170e04a6bffc579f0fe71ea289b7ed72.jpg', 'repository/lampiran/permohonan/foto/foto4170e04a6bffc579f0fe71ea289b7ed72.jpg', 'repository/lampiran/permohonan/foto/foto5170e04a6bffc579f0fe71ea289b7ed72.jpg', '239/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp170e04a6bffc579f0fe71ea289b7ed72.pdf', '01C.P.20.428.3276.JEBA.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01D', 'SDE-1710176219', 'PT. LITA MEKANIKAL ELEKTRIKAL', '040/LME/SLO/X/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/d2f842b3b0def70fa219d0fba349fa0d.pdf', '4403979045174', '0', 'JHK2.17', '2017-10-17 15:01:18', NULL, '1', '2017-10-10', '-6.201113,106.823313', NULL, 'repository/lampiran/permohonan/foto/foto2fb2b0570a1965126415d8bce2dffaad0.jpg', 'repository/lampiran/permohonan/foto/foto3fb2b0570a1965126415d8bce2dffaad0.jpg', 'repository/lampiran/permohonan/foto/foto4fb2b0570a1965126415d8bce2dffaad0.jpg', 'repository/lampiran/permohonan/foto/foto5fb2b0570a1965126415d8bce2dffaad0.jpg', '236/LAP-ULO/SDE/X/2017', 'repository/lampiran/permohonan/lhppd2f842b3b0def70fa219d0fba349fa0d.pdf', '01D.P.20.426.3171.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01E', 'SDE-2010176220', 'PT. CITRA TEKNIK ANDALAS', '128/CTA/PRM/X/2017', NULL, 'Jl. Usman Efendi No. 40 Rt. 05/ Rw. 06 Sepang Tanjak Serang Banten', 'repository/slo/permohonan/25a8509b5c15c694e61b182a3a676448.jpg', '1283335063336', '0', 'JHV8.17', '2017-10-20 10:20:04', NULL, '1', '2017-10-09', '-6.2092150,106.5156530', 'repository/lampiran/permohonan/foto/foto12ff14d97dc709e59937344c50a15c175.jpg', 'repository/lampiran/permohonan/foto/foto22ff14d97dc709e59937344c50a15c175.jpg', 'repository/lampiran/permohonan/foto/foto32ff14d97dc709e59937344c50a15c175.jpg', 'repository/lampiran/permohonan/foto/foto42ff14d97dc709e59937344c50a15c175.jpg', 'repository/lampiran/permohonan/foto/foto52ff14d97dc709e59937344c50a15c175.jpg', '244/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp21ada7cc0d77ddecaea74f3154c3b9fe.pdf', '01E.P.20.428.3603.JA14.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01F', 'SDE-2010176221', 'CV. PRIMA JAYA TEKNIK', '014/SP-PJT/X/2017', NULL, 'Kp. Sukawangi Rt. 001/ Rw. 09, Kel. Situwangi Kec. Cihampelas - Bandung ', 'repository/slo/permohonan/74beb95b69e8bb759b8f109fdd4f1a81.pdf', '2500748256574', '0', 'KIQ4.17', '2017-10-20 16:17:59', NULL, '1', '2017-10-10', '-2.800610,115.259619', 'repository/lampiran/permohonan/foto/foto145d12458393ab897128af1d5cabebcd4.jpg', 'repository/lampiran/permohonan/foto/foto245d12458393ab897128af1d5cabebcd4.jpg', 'repository/lampiran/permohonan/foto/foto345d12458393ab897128af1d5cabebcd4.jpg', 'repository/lampiran/permohonan/foto/foto445d12458393ab897128af1d5cabebcd4.jpg', 'repository/lampiran/permohonan/foto/foto545d12458393ab897128af1d5cabebcd4.jpg', '240/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp31290b5d07460850eca18070a4ad28bc.pdf', '01F.P.20.423.6371.JEAB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01G', 'SDE-2010176222', 'CV. PRIMA JAYA TEKNIK', '012/SP-PJT/X/2017', NULL, 'Kp. Sukawangi Rt. 001/ Rw. 09, Kel. Situwangi Kec. Cihampelas - Bandung ', 'repository/slo/permohonan/a69d9f959d5e2e0b74212eff134e9417.pdf', '9867267942435', '0', 'KIQ2.17', '2017-10-20 16:44:56', NULL, '1', '2017-10-09', '-6.894560,107.544156', 'repository/lampiran/permohonan/foto/foto17cfc09553eb2108207d6f3e748de4e91.jpg', 'repository/lampiran/permohonan/foto/foto27cfc09553eb2108207d6f3e748de4e91.jpg', 'repository/lampiran/permohonan/foto/foto3e44e4526912e49c9323e0639b1190acc.jpg', 'repository/lampiran/permohonan/foto/foto47cfc09553eb2108207d6f3e748de4e91.jpg', 'repository/lampiran/permohonan/foto/foto57cfc09553eb2108207d6f3e748de4e91.JPG', '236/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp632905ffd080b6b140e765a09076e9bb.pdf', '01G.P.20.426.3277.JE75.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01H', 'SDE-2710176223', 'PT. MULIA MAKMUR KENCANA', '045/PT.MMK-BDL/X/2017', NULL, 'Jl. Endro Suratmin Gg. Waru No. 45-B Kota Bandarlampung - Prov. Bandarlampung', 'repository/slo/permohonan/63992462fbec383029e70a3160644c1f.pdf', '2627316210991', '0', 'JI97.17', '2017-10-27 15:53:54', NULL, '1', '2017-10-07', '-5.2151767,103.9728227', 'repository/lampiran/permohonan/foto/foto1e538ad16a756ceb7344e3360fbdb7ed2.jpg', 'repository/lampiran/permohonan/foto/foto2e538ad16a756ceb7344e3360fbdb7ed2.jpg', 'repository/lampiran/permohonan/foto/foto3e538ad16a756ceb7344e3360fbdb7ed2.jpg', 'repository/lampiran/permohonan/foto/foto4e538ad16a756ceb7344e3360fbdb7ed2.jpg', 'repository/lampiran/permohonan/foto/foto5e538ad16a756ceb7344e3360fbdb7ed2.jpg', '237/LHPP/SDE/IX/2017', 'repository/lampiran/permohonan/lhpp0e252fa2938cfcc5be22b2bafe1ed81c.pdf', '01H.U.20.311.1U15.AXCN.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01I', 'SDE-3010176224', 'PT. LUXINDO INTERNUSA', '025/LI-DIR/II/2017', NULL, 'Jl. Raya Narogong Km. 14 Kel. Cikiwul, Kec. Bantar Gebang Kota Bekasi - Jawa Barat', 'repository/slo/permohonan/5552824ecc3a6f768a91671dd54b2679.pdf', '1330470812490', '0', 'KI98.17', '2017-10-30 15:40:31', NULL, '1', '2017-02-01', '-6.343408,106.9772013', 'repository/lampiran/permohonan/foto/foto1c4a7218bec9de815cc0be1c06e02d366.jpg', 'repository/lampiran/permohonan/foto/foto2c4a7218bec9de815cc0be1c06e02d366.jpg', 'repository/lampiran/permohonan/foto/foto3c4a7218bec9de815cc0be1c06e02d366.jpg', 'repository/lampiran/permohonan/foto/foto4c4a7218bec9de815cc0be1c06e02d366.jpg', 'repository/lampiran/permohonan/foto/foto5c4a7218bec9de815cc0be1c06e02d366.jpg', '241/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhpp3067762424f869acef888147f263f47c.pdf', '01I.P.20.428.3216.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01J', 'SDE-3010176225', 'PT. UNIVERSAL AGRI BISNISINDO', '030/UAB-DIR/II/2017', NULL, 'Jl. Raya Narogong Km. 13,5 Kel. Cikiwul, Kec. Bantar Gebang Kota Bekasi - Jawa Barat', 'repository/slo/permohonan/16382ccd2618c2c3d7bbaafa67bd4fc0.pdf', '1792368813312', '0', 'KI97.17', '2017-10-30 17:44:22', NULL, '1', '2017-02-01', '-6.346020,106.977081', 'repository/lampiran/permohonan/foto/foto1b5c75666427a72a87868e265445ea216.jpg', 'repository/lampiran/permohonan/foto/foto2b5c75666427a72a87868e265445ea216.jpg', 'repository/lampiran/permohonan/foto/foto3b5c75666427a72a87868e265445ea216.jpg', 'repository/lampiran/permohonan/foto/foto4b5c75666427a72a87868e265445ea216.jpg', 'repository/lampiran/permohonan/foto/foto51e3cf6c795624b7fd15936540c2201c1.jpg', '242/LHPP/SDE/X/2017', 'repository/lampiran/permohonan/lhppb5c75666427a72a87868e265445ea216.pdf', '01J.P.20.428.3216.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01K', 'SDE-0611176226', 'PT. ERA JAYA SAKTI BERSAMA', '013/PER-SLO/EJB-SDE/31/X/17', NULL, 'Jl. Pagedangan Kp. Cicayur I No. 2, Rt. 01/02, Ds. Pagedangan Kec. Pagedangan - Tangerang', 'repository/slo/permohonan/03d533ce8d1ed5e32605997ca97e5e72.pdf', '1425669816695', '0', 'KII7.17', '2017-11-06 13:19:59', NULL, '1', '2017-10-31', '-6.1404990,106.5756210', 'repository/lampiran/permohonan/foto/foto100d62860c20e8e9603c515ad50b50340.jpg', 'repository/lampiran/permohonan/foto/foto200d62860c20e8e9603c515ad50b50340.jpg', 'repository/lampiran/permohonan/foto/foto300d62860c20e8e9603c515ad50b50340.jpg', 'repository/lampiran/permohonan/foto/foto400d62860c20e8e9603c515ad50b50340.jpg', 'repository/lampiran/permohonan/foto/foto500d62860c20e8e9603c515ad50b50340.jpg', '245/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp00d62860c20e8e9603c515ad50b50340.pdf', '01K.P.20.428.3603.JA24.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01L', 'SDE-0711176227', 'PT. LITA MEKANIKAL ELEKTRIKAL', '46/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor - Jawa Barat', 'repository/slo/permohonan/cbfdcfba4423373be7e9876d33a354c4.pdf', '1892475876295', '0', 'LLC1.17', '2017-11-07 11:30:51', NULL, '1', '2017-11-03', '-9.138422,124.685131', 'repository/lampiran/permohonan/foto/foto104bc4e689d5026099a01a65eb3ae5131.jpg', 'repository/lampiran/permohonan/foto/foto204bc4e689d5026099a01a65eb3ae5131.jpg', 'repository/lampiran/permohonan/foto/foto304bc4e689d5026099a01a65eb3ae5131.jpg', 'repository/lampiran/permohonan/foto/foto404bc4e689d5026099a01a65eb3ae5131.jpg', 'repository/lampiran/permohonan/foto/foto504bc4e689d5026099a01a65eb3ae5131.jpg', '253/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppcbfdcfba4423373be7e9876d33a354c4.pdf', '01L.P.20.428.5301.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01M', 'SDE-0711176228', 'PT. MOLKISS SAKTI', '433/SK/MKS/XI/2017', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, Kel. Cileungsi Kidul, Kec. Cileungsi', 'repository/slo/permohonan/4be6db00e37a5b9afd6d23603e264bd2.pdf', '2884519648657', '0', 'KIU4.17', '2017-11-07 17:33:52', NULL, '1', '2017-11-06', '-6.447578,106.941903', 'repository/lampiran/permohonan/foto/foto178d6e8a5eabe9fa71afd959a4f7488f1.jpg', 'repository/lampiran/permohonan/foto/foto2a587796480bcba44ad3f3f9596be0d1d.jpg', 'repository/lampiran/permohonan/foto/foto378d6e8a5eabe9fa71afd959a4f7488f1.jpg', 'repository/lampiran/permohonan/foto/foto478d6e8a5eabe9fa71afd959a4f7488f1.jpg', 'repository/lampiran/permohonan/foto/foto5aa249f41f69e20f0de8173e5cce93e56.jpg', '255/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp6559c2ef0fea463e495be6536f616bb8.pdf', '01M.P.20.428.3201.JE96.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01N', 'SDE-0911176229', 'PT. PULO DAMAR ABADI', '016/SLO-PD/111/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32 Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/a8014b1fdfecc072b884ca495ac3fe9d.pdf', '2911417989155', '0', 'KIP7.17', '2017-11-09 10:27:22', NULL, '1', '2017-11-03', '-6.389777,107.466491', 'repository/lampiran/permohonan/foto/foto153650ebadc0e19968e89aeea3ad4615a.jpg', 'repository/lampiran/permohonan/foto/foto253650ebadc0e19968e89aeea3ad4615a.jpg', 'repository/lampiran/permohonan/foto/foto353650ebadc0e19968e89aeea3ad4615a.jpg', 'repository/lampiran/permohonan/foto/foto453650ebadc0e19968e89aeea3ad4615a.jpg', 'repository/lampiran/permohonan/foto/foto553650ebadc0e19968e89aeea3ad4615a.jpg', '257/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp630bafe192c5d94f0461cb2e300fd807.pdf', '01N.P.20.423.3215.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01O', 'SDE-1011176230', 'PT. WOO SHIN GARMENT INDONESIA', '053/Per/ACC/XI/2017', NULL, 'Kp. Benteng Rt/Rw. 04/004, Ds. Kutajaya, Kec. Cicurug Kab. Sukabumi - Jawa Barat', 'repository/slo/permohonan/9b066a876be17eece4f78b18b85783d3.pdf', '7673622482735', '0', 'KIU5.17', '2017-11-10 10:34:49', NULL, '1', '2017-11-03', '-6.758362,106.785535', 'repository/lampiran/permohonan/foto/foto119e750634c3b6d5f2bc966b3b9cf00cb.jpg', 'repository/lampiran/permohonan/foto/foto249661f89496326cf794d80900d1774ac.jpg', 'repository/lampiran/permohonan/foto/foto349661f89496326cf794d80900d1774ac.jpg', 'repository/lampiran/permohonan/foto/foto40138f2f715a8d5797d611d806a4a2774.jpg', 'repository/lampiran/permohonan/foto/foto50138f2f715a8d5797d611d806a4a2774.jpg', '258/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp49661f89496326cf794d80900d1774ac.pdf', '01O.P.20.428.3202.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01P', 'SDE-1011176231', 'PT. LITA MEKANIKAL ELEKTRIKAL', '43/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/64e3942b1587f1da4d31010496e143c0.pdf', '2263904723880', '0', 'KJ14.17', '2017-11-10 12:51:56', NULL, '1', '2017-11-06', '-6.721119,108.549922', 'repository/lampiran/permohonan/foto/foto126910fa7722da6a0eb7a2bee2c04d041.jpg', 'repository/lampiran/permohonan/foto/foto226910fa7722da6a0eb7a2bee2c04d041.jpg', 'repository/lampiran/permohonan/foto/foto326910fa7722da6a0eb7a2bee2c04d041.jpg', 'repository/lampiran/permohonan/foto/foto426910fa7722da6a0eb7a2bee2c04d041.jpg', 'repository/lampiran/permohonan/foto/foto526910fa7722da6a0eb7a2bee2c04d041.jpg', '259/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppba4b725249b602302b7983960dd3d678.pdf', '01P.P.20.422.3209.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01Q', 'SDE-1411176232', 'PT. MOLKISS SAKTI', '427/SK/MKS/XI/2017', NULL, 'Perum Mathland Cluster Eboni No. 3 Rt. 006/003, Kel. Cileungsi Kidul, Kec.   Cileungsi - Bogor', 'repository/slo/permohonan/016eec61c292bfc8917d578a552cfcb5.pdf', '2351073439887', '0', 'KJ10.17', '2017-11-14 12:47:26', NULL, '1', '2017-11-01', '-6.5956640,106.8605440', 'repository/lampiran/permohonan/foto/foto118c5d27ed829af5f362c9ff8999597ab.jpg', 'repository/lampiran/permohonan/foto/foto218c5d27ed829af5f362c9ff8999597ab.jpg', 'repository/lampiran/permohonan/foto/foto318c5d27ed829af5f362c9ff8999597ab.jpg', 'repository/lampiran/permohonan/foto/foto418c5d27ed829af5f362c9ff8999597ab.jpg', 'repository/lampiran/permohonan/foto/foto518c5d27ed829af5f362c9ff8999597ab.jpg', '261/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp35d35e2324dd53b26bcdd3e072de672d.pdf', '01Q.P.20.421.3201.JE96.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01R', 'SDE-1511176233', 'PT. LITA MEKANIKAL ELEKTRIKAL', '42/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/987303caf5698d83eb2a5caab7c2c099.pdf', '1131519790791', '0', 'KJ96.17', '2017-11-15 10:25:26', NULL, '1', '2017-11-06', '-6.390114,106.955085', 'repository/lampiran/permohonan/foto/foto19e2b505b3827424e9aaf26df2c073fea.jpg', 'repository/lampiran/permohonan/foto/foto28a09604e46ace0fb52416e3b5fcc0fc6.jpg', 'repository/lampiran/permohonan/foto/foto38a09604e46ace0fb52416e3b5fcc0fc6.jpg', 'repository/lampiran/permohonan/foto/foto48a09604e46ace0fb52416e3b5fcc0fc6.jpg', 'repository/lampiran/permohonan/foto/foto58a09604e46ace0fb52416e3b5fcc0fc6.jpg', '256/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppb524a00b697c178d9001e016fa9eab2d.pdf', '01R.P.20.428.3201.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01S', 'SDE-1511176234', 'PT. CAHAYA TIRTAMAS UTAMA', '1/TPG-K/XI/2017', NULL, 'Jl. PSM Gg. Mukti No. 261 Kel. Kebon Jayanti Kec. Kiaracondong - Bandung', 'repository/slo/permohonan/c617dbc8e0f82c37e69a46b1946871af.jpg', '2800634426988', '0', 'KJ95.17', '2017-11-15 16:37:18', NULL, '1', '2017-11-02', '-6.877442,107.504620', 'repository/lampiran/permohonan/foto/foto1f3c9390b76bd5aae4cb622f572afd1b1.jpg', 'repository/lampiran/permohonan/foto/foto2f3c9390b76bd5aae4cb622f572afd1b1.jpg', 'repository/lampiran/permohonan/foto/foto3f3c9390b76bd5aae4cb622f572afd1b1.jpg', 'repository/lampiran/permohonan/foto/foto4f3c9390b76bd5aae4cb622f572afd1b1.jpg', 'repository/lampiran/permohonan/foto/foto5f3c9390b76bd5aae4cb622f572afd1b1.jpg', '254/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppf3c9390b76bd5aae4cb622f572afd1b1.pdf', '01S.P.20.428.3204.GE03.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01T', 'SDE-2211176235', 'PT. LITA MEKANIKAL ELEKTRIKAL', '44/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/02 Iwul Parung, Kab. Bogor', 'repository/slo/permohonan/c5f9312d5a3bf212ce25830f5e5de75e.pdf', '9284032607125', '0', 'KJL5.17', '2017-11-22 09:47:09', NULL, '1', '2017-11-07', '-6.344971,107.121518', 'repository/lampiran/permohonan/foto/foto1add58c1bd7f092e7eb563bd99cf811ff.jpg', 'repository/lampiran/permohonan/foto/foto2add58c1bd7f092e7eb563bd99cf811ff.jpg', 'repository/lampiran/permohonan/foto/foto3add58c1bd7f092e7eb563bd99cf811ff.jpg', 'repository/lampiran/permohonan/foto/foto4add58c1bd7f092e7eb563bd99cf811ff.jpg', 'repository/lampiran/permohonan/foto/foto5add58c1bd7f092e7eb563bd99cf811ff.jpg', '262/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppe217055b0a3455c7991809cfa5c914ee.pdf', '01T.P.20.428.3216.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01U', 'SDE-2211176236', 'PT. ASTA SARANA RAYA', '127/ASR-SP/X/2017', NULL, 'Jl. Bintan No. 427 RT/RW. 14/04 Kel. Lorok    Pakjo Kec. Ilir Barat I – Palembang ', 'repository/slo/permohonan/0e5b85e97c99d63db7df0868125968e8.pdf', '9507943939113', '0', 'LKA7.17', '2017-11-22 10:29:12', NULL, '1', '2017-10-30', '-3.803680,102.259962', 'repository/lampiran/permohonan/foto/foto1d41568e37a67ca3aa525c4456f5b4bce.jpg', 'repository/lampiran/permohonan/foto/foto2d41568e37a67ca3aa525c4456f5b4bce.jpg', 'repository/lampiran/permohonan/foto/foto3d41568e37a67ca3aa525c4456f5b4bce.jpg', 'repository/lampiran/permohonan/foto/foto4d41568e37a67ca3aa525c4456f5b4bce.jpg', 'repository/lampiran/permohonan/foto/foto5efd592ad692de37ceed74647cb7b90cd.jpg', '260/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp29617504465842388c49878779a57a9d.pdf', '01U.P.20.425.1771.CS17.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01V', 'SDE-2211176237', 'PT.MOLKISS SAKTI', '434/SK/MKS/XI/2017', NULL, 'Perum Mathland Cluster Eboni No. 3 Rt. 006/003, Kel. Cileungsi Kidul, Kec.   Cileungsi - Bogor', 'repository/slo/permohonan/5556e420612cedb3d2ead07ccffb169e.pdf', '6540623593950', '0', 'KJM2.17', '2017-11-22 11:32:35', NULL, '1', '2017-11-14', '-6.412118,106.945180', 'repository/lampiran/permohonan/foto/foto1781bb4a1e25e13d8ddf36128757ea4c8.jpg', 'repository/lampiran/permohonan/foto/foto2781bb4a1e25e13d8ddf36128757ea4c8.jpg', 'repository/lampiran/permohonan/foto/foto3781bb4a1e25e13d8ddf36128757ea4c8.jpg', 'repository/lampiran/permohonan/foto/foto415e680af45726d1ace9448b614a63972.jpg', 'repository/lampiran/permohonan/foto/foto515e680af45726d1ace9448b614a63972.jpg', '263/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp5556e420612cedb3d2ead07ccffb169e.pdf', '01V.P.20.428.3201.JE96.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01W', 'SDE-2211176238', 'PT. DASAN PAN PACIFIC INDONESIA', '20/DPPI/XI/2017', NULL, 'Jl. Desa Bojonglongok Parakansalak Rt. 002/001 Sukabumi - Jawa Barat  ', 'repository/slo/permohonan/8419977d9587756ef59311156fd18d29.pdf', '1010427705257', '0', 'KJN1.17', '2017-11-22 15:44:58', NULL, '1', '2017-11-11', '-6.826456,106.736122', 'repository/lampiran/permohonan/foto/foto17362ac156773a5807cabf26ce3ec5cc5.jpg', 'repository/lampiran/permohonan/foto/foto27362ac156773a5807cabf26ce3ec5cc5.jpg', 'repository/lampiran/permohonan/foto/foto37362ac156773a5807cabf26ce3ec5cc5.jpg', 'repository/lampiran/permohonan/foto/foto47362ac156773a5807cabf26ce3ec5cc5.jpg', 'repository/lampiran/permohonan/foto/foto57362ac156773a5807cabf26ce3ec5cc5.jpg', '264/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp7362ac156773a5807cabf26ce3ec5cc5.pdf', '01W.P.20.428.3202.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01X', 'SDE-2711176239', 'PT. VOLTASE AMPERINDO PERKASA', '0112/PT. VAP/X/2017', NULL, 'Jl. Sutiragen IV No. 3 Bantar Jati Bogor Utara - Jawa Barat', 'repository/slo/permohonan/d30edf0a485f7ceeadfbb48d9b415892.jpg', '3235486412274', '0', 'LKF4.17', '2017-11-27 10:00:22', NULL, '1', '2017-10-23', '-6.3995210,106.7163730', 'repository/lampiran/permohonan/foto/foto1ca92dc892d5604436087b492be0f9003.jpg', 'repository/lampiran/permohonan/foto/foto2ca92dc892d5604436087b492be0f9003.jpg', 'repository/lampiran/permohonan/foto/foto3ca92dc892d5604436087b492be0f9003.jpg', 'repository/lampiran/permohonan/foto/foto4ca92dc892d5604436087b492be0f9003.jpg', 'repository/lampiran/permohonan/foto/foto5ca92dc892d5604436087b492be0f9003.jpg', '265/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppeba3420cd8d7c54a33b5af34cadcc466.pdf', '01X.P.20.428.3203.GEWB.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01Y', 'SDE-2711176240', 'PT. AULIA DANARDANA', '0023/AD/IX/2017', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/4b2cfb35ebf54bcde429d338652f9470.pdf', '2844842243127', '0', 'KJX3.17', '2017-11-27 11:12:45', NULL, '1', '2017-09-15', '-3.45059,104.24605', 'repository/lampiran/permohonan/foto/foto15fe16cd69c09781809b8dc6993fdfa75.jpg', 'repository/lampiran/permohonan/foto/foto25fe16cd69c09781809b8dc6993fdfa75.jpg', 'repository/lampiran/permohonan/foto/foto35fe16cd69c09781809b8dc6993fdfa75.jpg', 'repository/lampiran/permohonan/foto/foto4980a044c22366531e1adb80ecc3267de.jpg', 'repository/lampiran/permohonan/foto/foto55fe16cd69c09781809b8dc6993fdfa75.jpg', '227/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp7d28a6765cc6831526a30d887d7a4a6a.pdf', '01Y.U.20.311.1F15.GEEE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('01Z', 'SDE-2911176241', 'PT. INDONESIA MULTI COLOUR PRINTING ', '493/PRN/X/2017', NULL, 'Jl. Rungkut Raya I No. 07 Surabaya', 'repository/slo/permohonan/e20f5827b4da719be1a909a323e438a5.pdf', '3068683355900', '0', 'LKE5.17', '2017-11-29 09:24:46', NULL, '1', '2017-11-01', '-7.326746,112.754675', 'repository/lampiran/permohonan/foto/foto1e20f5827b4da719be1a909a323e438a5.jpg', 'repository/lampiran/permohonan/foto/foto2e20f5827b4da719be1a909a323e438a5.jpg', 'repository/lampiran/permohonan/foto/foto3e20f5827b4da719be1a909a323e438a5.jpg', 'repository/lampiran/permohonan/foto/foto4e20f5827b4da719be1a909a323e438a5.jpg', 'repository/lampiran/permohonan/foto/foto5b841059aea128f2d6c84877be5182f8a.JPG', '268/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhpp013ebc69220f6ca83cdce78ac783c8b9.pdf', '01Z.P.20.428.3578.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('020', 'SDE-2911176242', 'PT. INDONESIA MULTI COLOUR PRINTING', '492/PRN/X/2017', NULL, 'Jl. Rungkut Industri I No. 10 Surabaya', 'repository/slo/permohonan/fb00ea26a5690bba8c55d9736164092e.pdf', '8379278451361', '0', 'LLB9.17', '2017-11-29 11:23:17', NULL, '1', '2017-11-01', '-7.327033,112.754643', 'repository/lampiran/permohonan/foto/foto12fd6db515e583e6cd80fd56ae193615a.jpg', 'repository/lampiran/permohonan/foto/foto22fd6db515e583e6cd80fd56ae193615a.jpg', 'repository/lampiran/permohonan/foto/foto32fd6db515e583e6cd80fd56ae193615a.jpg', 'repository/lampiran/permohonan/foto/foto42fd6db515e583e6cd80fd56ae193615a.jpg', 'repository/lampiran/permohonan/foto/foto52fd6db515e583e6cd80fd56ae193615a.jpg', '267/LHPP/SDE/XI/2017', 'repository/lampiran/permohonan/lhppdcb971daf53df9cf82330ab7aa60fd8a.pdf', '020.P.20.428.3578.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('022', 'SDE-0412176244', 'PT. LITA MEKANIKAL ELEKTRIKAL', '47/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/fe9c1e47c00e784044e14ed59b02f7d3.pdf', '1305649773528', '0', '', '2017-12-04 10:44:06', NULL, '1', '2017-11-16', '-6.3995210,106.7163730', 'repository/lampiran/permohonan/foto/foto19fab54fc0489d8d667a7c9533ce36678.jpg', 'repository/lampiran/permohonan/foto/foto29fab54fc0489d8d667a7c9533ce36678.jpg', 'repository/lampiran/permohonan/foto/foto378079c16f44ce9bc15a3e1e3eecd7b11.jpg', 'repository/lampiran/permohonan/foto/foto478079c16f44ce9bc15a3e1e3eecd7b11.jpg', 'repository/lampiran/permohonan/foto/foto578079c16f44ce9bc15a3e1e3eecd7b11.jpg', '266/LHPP/SDE/XII/2017', NULL, '022.P.20.428.3201.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('023', 'SDE-0412176245', 'PT. PULO DAMAR ABADI', '021/SLO-PDA/111/2017', NULL, 'Perum Bumi Teluk Jambe Blok I/32, Ds. Sukaluyu Teluk Jambe Timur Karawang - Jawa Barat', 'repository/slo/permohonan/19ff73741d357b320589166073d767ff.pdf', '2626074298978', '0', 'LKX5.17', '2017-12-04 16:08:00', NULL, '1', '2017-11-29', '-6.281308,107.098744', 'repository/lampiran/permohonan/foto/foto123ff67ae7325fdf875bab2a8cda8e0a9.jpg', 'repository/lampiran/permohonan/foto/foto223ff67ae7325fdf875bab2a8cda8e0a9.jpg', 'repository/lampiran/permohonan/foto/foto323ff67ae7325fdf875bab2a8cda8e0a9.jpg', 'repository/lampiran/permohonan/foto/foto423ff67ae7325fdf875bab2a8cda8e0a9.jpg', 'repository/lampiran/permohonan/foto/foto523ff67ae7325fdf875bab2a8cda8e0a9.jpg', '269/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppaa83059682da6cbab84bcd65209d1c99.pdf', '023.P.20.428.3216.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('024', 'SDE-1212176246', 'PT. LITA MEKANIKAL ELEKTRIKAL', '48/LME/SLO/XI/2017', NULL, 'Ds. Pinang Rt/Rw. 0/0 Tarano Provinsi Nusa Tenggara Barat', 'repository/slo/permohonan/c703197f77ebbaf1af09e5c81e5f8186.pdf', '2106778039865', '0', 'LLF3.17', '2017-12-12 11:31:07', NULL, '1', '2017-11-21', '-8.653365,118.133102', 'repository/lampiran/permohonan/foto/foto175c3d3e8b5f09e122867ae4f24d88139.jpg', 'repository/lampiran/permohonan/foto/foto275c3d3e8b5f09e122867ae4f24d88139.jpg', 'repository/lampiran/permohonan/foto/foto375c3d3e8b5f09e122867ae4f24d88139.jpg', 'repository/lampiran/permohonan/foto/foto475c3d3e8b5f09e122867ae4f24d88139.jpg', 'repository/lampiran/permohonan/foto/foto575c3d3e8b5f09e122867ae4f24d88139.jpg', '270/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp75c3d3e8b5f09e122867ae4f24d88139.pdf', '024.P.20.428.5204.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('025', 'SDE-1212176247', 'PT. PULO DAMAR ABADI', '027-A/SLO-PDA/XII/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32, Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/1d4dc6b6477be29b76172df1d6a1c751.pdf', '1698696661081', '0', 'LLF2.17', '2017-12-12 13:51:01', NULL, '1', '2017-12-07', '-6.303564,107.305541', 'repository/lampiran/permohonan/foto/foto16f6d37faf99b7e606e52a49a92238ed6.jpg', 'repository/lampiran/permohonan/foto/foto26f6d37faf99b7e606e52a49a92238ed6.jpg', 'repository/lampiran/permohonan/foto/foto36f6d37faf99b7e606e52a49a92238ed6.jpg', 'repository/lampiran/permohonan/foto/foto46f6d37faf99b7e606e52a49a92238ed6.jpg', 'repository/lampiran/permohonan/foto/foto56f6d37faf99b7e606e52a49a92238ed6.jpg', '272/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp6f6d37faf99b7e606e52a49a92238ed6.pdf', '025.P.20.421.3215.GEWE.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('026', 'SDE-1312176248', 'PT. LITA MEKANIKAL ELEKTRIKAL', '49/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/7b09bfaac236942e4b655c71f4992a3e.pdf', '8553270648620', '0', 'LLH9.17', '2017-12-13 10:51:46', NULL, '1', '2017-11-22', '-8.651800,118.127166', 'repository/lampiran/permohonan/foto/foto12db25140c305b1f273f4fbc2d512de85.jpg', 'repository/lampiran/permohonan/foto/foto22db25140c305b1f273f4fbc2d512de85.jpg', 'repository/lampiran/permohonan/foto/foto32db25140c305b1f273f4fbc2d512de85.jpg', 'repository/lampiran/permohonan/foto/foto466ff12a4a542bd09106a6fd436def6e5.jpg', 'repository/lampiran/permohonan/foto/foto52db25140c305b1f273f4fbc2d512de85.jpg', '271/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp22fdd4eeac82cf658b8ed65264a19ff0.pdf', '026.P.20.428.5207.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('027', 'SDE-1312176249', 'Grand Setiabudi Hotel & Apartment', '007/GSA-ENG/XI/2017 ', NULL, 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat ', 'repository/slo/permohonan/0d6f6a5fb7649bddd7d877eee8817fa0.pdf', '2724224069696', '0', '', '2017-12-13 15:42:22', NULL, '1', '0000-00-00', '-6.874861,107.597222', 'repository/lampiran/permohonan/foto/foto1773b69e80994d7822d517ea2b417616d.jpg', 'repository/lampiran/permohonan/foto/foto2773b69e80994d7822d517ea2b417616d.jpg', 'repository/lampiran/permohonan/foto/foto3773b69e80994d7822d517ea2b417616d.jpg', 'repository/lampiran/permohonan/foto/foto4773b69e80994d7822d517ea2b417616d.jpg', 'repository/lampiran/permohonan/foto/foto5773b69e80994d7822d517ea2b417616d.jpg', '274/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp773b69e80994d7822d517ea2b417616d.pdf', '027.P.20.425.3273.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('028', 'SDE-1912176250', 'PT. GARDINO SEJAHTERA ABADI', '01/11/GSA/PSRD/KRW/2017', NULL, 'Jl. Mashudi No. 26 Kp. Cariu Kota Baru Karawang - Jawa Barat', 'repository/slo/permohonan/c185ae5db47923bcfb9c09fd7af8b0ae.jpg', '5308335386191', '0', 'LM73.17', '2017-12-19 10:08:26', NULL, '1', '2017-11-20', '-6.41766,107.468419', 'repository/lampiran/permohonan/foto/foto175bbb244e2aa0526610ae342ccc9b121.jpg', 'repository/lampiran/permohonan/foto/foto275bbb244e2aa0526610ae342ccc9b121.jpg', 'repository/lampiran/permohonan/foto/foto375bbb244e2aa0526610ae342ccc9b121.jpg', 'repository/lampiran/permohonan/foto/foto475bbb244e2aa0526610ae342ccc9b121.jpg', 'repository/lampiran/permohonan/foto/foto575bbb244e2aa0526610ae342ccc9b121.jpg', '277/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp75bbb244e2aa0526610ae342ccc9b121.pdf', '028.P.20.423.3215.GETW.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('029', 'SDE-1912176251', 'PT. LITA MEKANIKAL ELEKTRIKAL', '51/LME/SLO/XII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/83944037609f9196a8a17d480aabe841.pdf', '2617610019504', '0', 'LM82.17', '2017-12-19 11:48:56', NULL, '1', '2017-12-12', '-8.622408,122.204211', 'repository/lampiran/permohonan/foto/foto12109b6335e440069f6a912768f73a880.jpg', 'repository/lampiran/permohonan/foto/foto22109b6335e440069f6a912768f73a880.jpg', 'repository/lampiran/permohonan/foto/foto32109b6335e440069f6a912768f73a880.jpg', 'repository/lampiran/permohonan/foto/foto42109b6335e440069f6a912768f73a880.jpg', 'repository/lampiran/permohonan/foto/foto52109b6335e440069f6a912768f73a880.jpg', '276/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppb51030d0f3b487599de0867fd9553153.pdf', '029.P.20.423.5306.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02A', 'SDE-1912176252', 'PT. LITA MEKANIKAL ELEKTRIKAL', '50/LME/SLO/XI/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/e3aac76a56c366d3bfcf1d69e38413c9.pdf', '2555058998199', '0', 'A130.18', '2017-12-19 13:32:25', NULL, '1', '2017-11-23', '-8.406657,123.389401', 'repository/lampiran/permohonan/foto/foto187c5d166bf66a8757edeb249e53f7893.jpg', 'repository/lampiran/permohonan/foto/foto287c5d166bf66a8757edeb249e53f7893.jpg', 'repository/lampiran/permohonan/foto/foto387c5d166bf66a8757edeb249e53f7893.jpg', 'repository/lampiran/permohonan/foto/foto487c5d166bf66a8757edeb249e53f7893.JPG', 'repository/lampiran/permohonan/foto/foto587c5d166bf66a8757edeb249e53f7893.jpg', '273/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppa9aafdfb3571cf12864ec6f4167d9666.pdf', '02A.P.20.428.5306.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02B', 'SDE-1912176253', 'PT. NINA VENUS INDONUSA', '001/Per/ACC/XII/2017', NULL, 'Jl. PLN Angkrong Ds. Sundawenang Kec. Parungkuda Sukabumi - Jawa Barat', 'repository/slo/permohonan/b42b9e93da3ebf85da29dbdb3d259158.pdf', '3232722411028', '0', 'LM88.17', '2017-12-19 16:48:12', NULL, '1', '2017-12-06', '-6.8431926,106.7429386', 'repository/lampiran/permohonan/foto/foto1153d9ecc30c07018e01f891c2c79c17a.jpg', 'repository/lampiran/permohonan/foto/foto2153d9ecc30c07018e01f891c2c79c17a.jpg', 'repository/lampiran/permohonan/foto/foto3153d9ecc30c07018e01f891c2c79c17a.jpg', 'repository/lampiran/permohonan/foto/foto4153d9ecc30c07018e01f891c2c79c17a.jpg', 'repository/lampiran/permohonan/foto/foto5153d9ecc30c07018e01f891c2c79c17a.jpg', '278/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp17c70998f02f9a36713c05cf2ad667bd.pdf', '02B.P.20.428.3202.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02C', 'SDE-1912176254', 'PT. NINA VENUS INDONUSA II', '002/Per/acc/xii/2017', NULL, 'Kp. Baru Rt. 01/Rw. 02 Ds. Parungkuda Kec. Sukabumi - Jawa Barat', 'repository/slo/permohonan/b0c97ad6500e2cedb7100072d40be0b1.pdf', '1878775743319', '0', 'LM92.17', '2017-12-19 18:04:33', NULL, '1', '2017-12-06', '-6.843172,106.760436', 'repository/lampiran/permohonan/foto/foto18aafc7a8733cd3a318662595a01e0cfb.jpg', 'repository/lampiran/permohonan/foto/foto28aafc7a8733cd3a318662595a01e0cfb.jpg', 'repository/lampiran/permohonan/foto/foto38aafc7a8733cd3a318662595a01e0cfb.jpg', 'repository/lampiran/permohonan/foto/foto48aafc7a8733cd3a318662595a01e0cfb.jpg', 'repository/lampiran/permohonan/foto/foto58aafc7a8733cd3a318662595a01e0cfb.jpg', '279/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppae542e8d8a398ce0d8d6a3ec8c4ec589.pdf', '02C.P.20.428.3272.0000.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02D', 'SDE-2112176255', 'PT. LITA MEKANIKAL ELEKTRIKAL', '52/LME/SLO/XII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/ca05b64292d14d3534a07ed591fe5b82.pdf', '1076781983443', '0', 'LMA5.17', '2017-12-21 10:27:46', NULL, '1', '2017-12-12', '-8.9182450,117.7111810', 'repository/lampiran/permohonan/foto/foto19aa69a2b6b16cbc9687e71844e9c5dd8.jpg', 'repository/lampiran/permohonan/foto/foto29aa69a2b6b16cbc9687e71844e9c5dd8.jpg', 'repository/lampiran/permohonan/foto/foto39aa69a2b6b16cbc9687e71844e9c5dd8.jpg', 'repository/lampiran/permohonan/foto/foto49aa69a2b6b16cbc9687e71844e9c5dd8.jpg', 'repository/lampiran/permohonan/foto/foto547eab9059796d08ad903bab4a856152f.jpg', '280/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppd797100314216a10ff123598f03ba259.pdf', '02D.P.20.428.5204.GEWI.17', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02E', 'SDE-0201186256', 'PT. PULO DAMAR ABADI', '033/SLO-PDA/111/2017', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa Barat', 'repository/slo/permohonan/62a1b1d3b9985652035945465789cd57.pdf', '1752504593727', '0', 'A129.18', '2018-01-02 08:10:03', NULL, '1', '2017-12-23', '-6.294722,107.311643', 'repository/lampiran/permohonan/foto/foto1caa5784aa25053c18c46ba5cd6c7e4ca.jpg', 'repository/lampiran/permohonan/foto/foto2bd8ccde5fd5121c5331beaab0008ebd3.jpg', 'repository/lampiran/permohonan/foto/foto3bd8ccde5fd5121c5331beaab0008ebd3.jpg', 'repository/lampiran/permohonan/foto/foto4bd8ccde5fd5121c5331beaab0008ebd3.jpg', 'repository/lampiran/permohonan/foto/foto5bd8ccde5fd5121c5331beaab0008ebd3.jpg', '281/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhppbd8ccde5fd5121c5331beaab0008ebd3.pdf', '02E.P.20.421.3215.GEWE.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02F', 'SDE-0201186257', 'PT. LITA MEKANIKAL ELEKTRIKAL', '53/LME/SLO/XII/2017', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/0c0a10afd14e441503b1a3a7b700eb49.pdf', '1473502959960', '0', 'A128.18', '2018-01-02 15:26:48', NULL, '1', '2017-12-23', '-6.2260510,106.8129640', 'repository/lampiran/permohonan/foto/foto12089f24ecc41aa425ab85c47eaddc671.jpg', 'repository/lampiran/permohonan/foto/foto22089f24ecc41aa425ab85c47eaddc671.jpg', 'repository/lampiran/permohonan/foto/foto32089f24ecc41aa425ab85c47eaddc671.jpg', 'repository/lampiran/permohonan/foto/foto42089f24ecc41aa425ab85c47eaddc671.jpg', 'repository/lampiran/permohonan/foto/foto52089f24ecc41aa425ab85c47eaddc671.jpg', '282/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp7a5004d1a6cae7cea14e8442f06fa12c.pdf', '02F.P.20.422.3171.GEWI.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02G', 'SDE-0901186258', 'PT. PULO DAMAR ABADI', '033/SLO-PDA/111/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32, Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/3461c0b4bbfd987331a2206eaa2086f2.pdf', '8705238640086', '0', 'A146.18', '2018-01-09 16:12:47', NULL, '1', '2017-12-23', '-6.294722,107.311643', 'repository/lampiran/permohonan/foto/foto139f25ab0996f20144e8e8ceb6ad0c96b.jpg', 'repository/lampiran/permohonan/foto/foto239f25ab0996f20144e8e8ceb6ad0c96b.jpg', 'repository/lampiran/permohonan/foto/foto339f25ab0996f20144e8e8ceb6ad0c96b.jpg', 'repository/lampiran/permohonan/foto/foto439f25ab0996f20144e8e8ceb6ad0c96b.jpg', 'repository/lampiran/permohonan/foto/foto539f25ab0996f20144e8e8ceb6ad0c96b.jpg', '281/LHPP/SDE/XII/2017', 'repository/lampiran/permohonan/lhpp39f25ab0996f20144e8e8ceb6ad0c96b.pdf', '02G.P.20.421.3215.GEWE.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02H', 'SDE-0901186259', 'PT. PULO DAMAR ABADI', '033/SLO-PDA/111/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32, Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/25487adf717b88ce343739dad444b18f.pdf', NULL, NULL, '', '2018-01-09 16:17:27', NULL, '1', '2017-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02I', 'SDE-0901186260', 'PT. PULO DAMAR ABADI', '033/SLO-PDA/111/2017', NULL, 'Perumnas Bumi Teluk Jambe Blok I No. 32, Ds. Sukaluyu Teluk Jambe Timur', 'repository/slo/permohonan/a5361e7cb22487a6326b8ce5f832ef92.pdf', NULL, NULL, '', '2018-01-09 16:34:07', NULL, '1', '2017-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02J', 'SDE-0901186261', 'PT. ERA JAYA SAKTI BERSAMA', '018/PER-SLO/EJSB-SDE/18', NULL, 'Jl. Raya Pagedangan Kp. Cicayur I Rt.01/02 No. 2 Ds. Pegedangan Kec. Pagedangan Kab. Tangerang Banten', 'repository/slo/permohonan/e4a3e0ea1681c198e26ce5d8968543af.pdf', '3948784861854', '0', 'A151.18', '2018-01-09 17:08:44', NULL, '1', '2018-01-09', '-6.1050650,106.6384160', 'repository/lampiran/permohonan/foto/foto152deefe637ea65216fc5969d5fb701b1.jpg', 'repository/lampiran/permohonan/foto/foto252deefe637ea65216fc5969d5fb701b1.jpg', 'repository/lampiran/permohonan/foto/foto352deefe637ea65216fc5969d5fb701b1.jpg', 'repository/lampiran/permohonan/foto/foto452deefe637ea65216fc5969d5fb701b1.jpg', 'repository/lampiran/permohonan/foto/foto552deefe637ea65216fc5969d5fb701b1.jpg', '283/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp52deefe637ea65216fc5969d5fb701b1.pdf', '02J.P.20.421.3603.JA24.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL);
INSERT INTO `t_pemohon` (`id_pemohon`, `no_register`, `nama`, `jabatan`, `tlp`, `alamat`, `file_permohonan`, `api_nopermohonan`, `api_no_agenda`, `api_noregistrasi`, `created_at`, `published_at`, `id_user`, `tgl_pemohon`, `map`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `noLHPP`, `lhpp`, `noSLO`, `salinanslo`, `status`, `user_id_tt_1`, `nama_tt_1`, `sub_bidang_tt_1`, `no_sertifikat_tt_1`, `kode_unit_tt_1`, `foto_tt_1`, `user_id_tt_2`, `nama_tt_2`, `sub_bidang_tt_2`, `no_sertifikat_tt_2`, `kode_unit_tt_2`, `foto_tt_2`, `notif`, `id_pemohon_lama`) VALUES
('02L', 'SDE-1101186263', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '55/LME/LHPP/SDE/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/de77dd0236a5c36451fa973ae1800e9b.pdf', NULL, NULL, '', '2018-01-11 12:58:20', NULL, '1', '2018-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02M', 'SDE-1101186264', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '55/LME/LHPP/SDE/I/2018 ', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/5e1f2c20a49e0541899b4ca0fbd361f7.pdf', NULL, NULL, '', '2018-01-11 13:10:51', NULL, '1', '2018-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02N', 'SDE-1101186265', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '55/LME/LHPP/SDE/I/2018 ', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/9282e66e408fb0537660986d0112dffc.pdf', '1905856331933', '0', '', '2018-01-11 13:14:09', NULL, '1', '2018-01-03', '-3.1637300,104.8887570', 'repository/lampiran/permohonan/foto/foto130e8b036cf32ab18f59ca66178666b7b.jpg', 'repository/lampiran/permohonan/foto/foto230e8b036cf32ab18f59ca66178666b7b.jpg', 'repository/lampiran/permohonan/foto/foto330e8b036cf32ab18f59ca66178666b7b.jpg', 'repository/lampiran/permohonan/foto/foto430e8b036cf32ab18f59ca66178666b7b.jpg', 'repository/lampiran/permohonan/foto/foto530e8b036cf32ab18f59ca66178666b7b.jpg', '284/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp30e8b036cf32ab18f59ca66178666b7b.pdf', '02N.P.20.428.1671.GEWI.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('02O', 'SDE-1101186266', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '55/LME/LHPP/SDE/I/2018 ', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/9f8e24e492b9531d7ae9095db0b71806.pdf', NULL, NULL, '', '2018-01-11 13:40:15', NULL, '1', '2018-01-03', '-3.1637300,104.8887570 ', 'repository/lampiran/permohonan/foto/foto10fbfe8875c08d631e8846b0c07541503.jpg', 'repository/lampiran/permohonan/foto/foto20fbfe8875c08d631e8846b0c07541503.jpg', 'repository/lampiran/permohonan/foto/foto30fbfe8875c08d631e8846b0c07541503.jpg', 'repository/lampiran/permohonan/foto/foto40fbfe8875c08d631e8846b0c07541503.jpg', 'repository/lampiran/permohonan/foto/foto50fbfe8875c08d631e8846b0c07541503.jpg', '284/LHPP/SDE/I/2018 ', 'repository/lampiran/permohonan/lhpp0fbfe8875c08d631e8846b0c07541503.pdf', '02O.P.20.428.1602.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('02P', 'SDE-1101186267', 'PT. MOLKISS SAKTI ', '003/SK/MKS/XII/2017', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, Kel. Cileungsi Kidul, Kec. Cileungsi ', 'repository/slo/permohonan/f3f0c7ac9a3c5e640f864c35da7f7174.pdf', '6921183497239', NULL, '', '2018-01-11 14:27:27', NULL, '1', '2017-12-28', '-6.4267792,106.952825', 'repository/lampiran/permohonan/foto/foto112ac7eb798a380733420cf364f947c41.jpg', 'repository/lampiran/permohonan/foto/foto212ac7eb798a380733420cf364f947c41.jpg', 'repository/lampiran/permohonan/foto/foto312ac7eb798a380733420cf364f947c41.jpg', 'repository/lampiran/permohonan/foto/foto412ac7eb798a380733420cf364f947c41.jpg', 'repository/lampiran/permohonan/foto/foto5c80ec1c41f402b594c1eef2316815f9d.jpg', '285/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp12ac7eb798a380733420cf364f947c41.pdf', '02P.P.20.428.3201.JE96.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02Q', 'SDE-1101186268', 'PT. MOLKISS SAKTI ', '003/SK/MKS/XII/2017', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, Kel. Cileungsi Kidul, Kec. Cileungsi ', 'repository/slo/permohonan/fac7af3cc8dc3576a724e94cbad098ac.pdf', NULL, NULL, '', '2018-01-11 14:32:14', NULL, '1', '2017-12-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02R', 'SDE-1801186269', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '57/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/a361ec82678d6409cc85b028246d4995.pdf', NULL, NULL, '', '2018-01-18 17:06:13', NULL, '1', '2018-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 4, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('02S', 'SDE-1801186270', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '57/LME/SLO/I/2018 ', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/4e5b5d7b1a5debc5f6809b640b1de12b.pdf', NULL, NULL, '', '2018-01-18 17:10:02', NULL, '1', '2018-01-05', '-6.186164,106.339127', 'repository/lampiran/permohonan/foto/foto123aebbe49fb7acc2504c26d543d5f1c7.jpg', 'repository/lampiran/permohonan/foto/foto223aebbe49fb7acc2504c26d543d5f1c7.jpg', 'repository/lampiran/permohonan/foto/foto323aebbe49fb7acc2504c26d543d5f1c7.jpg', 'repository/lampiran/permohonan/foto/foto423aebbe49fb7acc2504c26d543d5f1c7.jpg', 'repository/lampiran/permohonan/foto/foto523aebbe49fb7acc2504c26d543d5f1c7.jpg', '287/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp23aebbe49fb7acc2504c26d543d5f1c7.pdf', '02S.P.20.428.3604.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('02T', 'SDE-1801186271', 'PT. LITA MEKANIKAL ELEKTRIKAL', '56/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/96f62801e62193ae755e3d3e92121401.pdf', NULL, NULL, '', '2018-01-18 18:00:37', NULL, '1', '2018-01-03', '-6.689814,107.708843', 'repository/lampiran/permohonan/foto/foto1cff2107dc1b6920e50ab33fa8d647ef8.jpg', 'repository/lampiran/permohonan/foto/foto2cff2107dc1b6920e50ab33fa8d647ef8.jpg', 'repository/lampiran/permohonan/foto/foto3cff2107dc1b6920e50ab33fa8d647ef8.jpg', 'repository/lampiran/permohonan/foto/foto4cff2107dc1b6920e50ab33fa8d647ef8.jpg', 'repository/lampiran/permohonan/foto/foto5cff2107dc1b6920e50ab33fa8d647ef8.jpg', '288/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp53ad31c2365d9e4c80de0d8da5693064.pdf', '02T.P.20.428.3213.GEWI.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02U', 'SDE-1801186272', 'ssdsds', '3232323', NULL, '23232', 'repository/slo/permohonan/d7f65f375d99a5d361e470801aa0e727.pdf', NULL, 'A18T2000229', '', '2018-01-18 23:12:35', NULL, '1', '2018-01-20', '', NULL, NULL, NULL, NULL, NULL, '195/LHPP/SDE/VI/2017', NULL, '02U.P.20.411.3213.JA34.18', NULL, 5, 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02W', 'SDE-2201186274', 'PT. MOLKISS SAKTI', '003/SK/MKS/XII/2017 ', NULL, 'Perum Methland Clusster Ebony No. 3, Rt. 006/003, Kel. Cileungsi Kidul, Kec. Cileungsi ', 'repository/slo/permohonan/bce063da12b5c64685df70ac1d53c6d4.pdf', NULL, NULL, '', '2018-01-22 13:19:43', NULL, '1', '2017-12-28', '-6.4267792,106.952825 ', 'repository/lampiran/permohonan/foto/foto1cbcf08ea8a6b8829816f4285d6149599.jpg', 'repository/lampiran/permohonan/foto/foto2cbcf08ea8a6b8829816f4285d6149599.jpg', 'repository/lampiran/permohonan/foto/foto3cbcf08ea8a6b8829816f4285d6149599.jpg', 'repository/lampiran/permohonan/foto/foto4cbcf08ea8a6b8829816f4285d6149599.jpg', 'repository/lampiran/permohonan/foto/foto5cbcf08ea8a6b8829816f4285d6149599.jpg', '285/LHPP/SDE/I/2018 ', 'repository/lampiran/permohonan/lhppcbcf08ea8a6b8829816f4285d6149599.pdf', '02W.P.20.428.3201.JE96.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('02X', 'SDE-2301186275', 'PT. VOLTASE AMPERINDO PERKASA', '023/VAP/I/2018', NULL, 'Jl. Sutiragen IV No. 3, Bantar Jati Bogor Utara - Jawa Barat', 'repository/slo/permohonan/6231fe527e32fbaa8c05186a0d950da0.pdf', NULL, NULL, '', '2018-01-23 13:09:58', NULL, '1', '2018-01-10', '-6.186164,106.339127', 'repository/lampiran/permohonan/foto/foto167b28040e1e20640fc804c68f43b2066.jpg', 'repository/lampiran/permohonan/foto/foto267b28040e1e20640fc804c68f43b2066.jpg', 'repository/lampiran/permohonan/foto/foto367b28040e1e20640fc804c68f43b2066.jpg', 'repository/lampiran/permohonan/foto/foto467b28040e1e20640fc804c68f43b2066.jpg', 'repository/lampiran/permohonan/foto/foto567b28040e1e20640fc804c68f43b2066.jpg', '287/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhppb82064a9e7cb485acacaa029ae6123fb.pdf', '02X.P.20.428.3604.GEWB.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('02Y', 'SDE-2301186276', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '56/LME/SLO/I/2018 ', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/00076342b51b046414cd3e1cac5b6781.pdf', NULL, NULL, '', '2018-01-23 15:19:33', NULL, '1', '2018-01-03', '-6.689814,107.708843 ', 'repository/lampiran/permohonan/foto/foto13cb40c75d72ce6a38d142273bc36d710.jpg', 'repository/lampiran/permohonan/foto/foto23cb40c75d72ce6a38d142273bc36d710.jpg', 'repository/lampiran/permohonan/foto/foto33cb40c75d72ce6a38d142273bc36d710.jpg', 'repository/lampiran/permohonan/foto/foto43cb40c75d72ce6a38d142273bc36d710.jpg', 'repository/lampiran/permohonan/foto/foto53cb40c75d72ce6a38d142273bc36d710.jpg', '288/LHPP/SDE/I/2018 ', 'repository/lampiran/permohonan/lhpp3cb40c75d72ce6a38d142273bc36d710.pdf', '02Y.P.20.428.3213.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('030', 'SDE-2501186278', 'tes2', '123', NULL, 'tes', 'repository/slo/permohonan/931af2410301cbcda05e01c15a83153a.pdf', '1639700718283', 'B18T2000003', '', '2018-01-25 10:15:00', NULL, '1', '2018-01-26', '-6.689814,107.708843 ', 'repository/lampiran/permohonan/foto/foto13cb40c75d72ce6a38d142273bc36d710.jpg', NULL, NULL, NULL, NULL, 'tes/LHPP/SDE/I/2018 ', NULL, 'tes.P.20.421.1101.JA34.18', NULL, 4, 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('031', 'SDE-2601186279', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '58/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/3a8dd1d552d711df9c135e2968623222.pdf', NULL, NULL, '', '2018-01-26 10:26:35', NULL, '1', '2018-01-16', '-6.306926,106.896650', 'repository/lampiran/permohonan/foto/foto109220ad7d8adf3c600878d7d36730427.jpg', 'repository/lampiran/permohonan/foto/foto209220ad7d8adf3c600878d7d36730427.jpg', 'repository/lampiran/permohonan/foto/foto309220ad7d8adf3c600878d7d36730427.jpg', 'repository/lampiran/permohonan/foto/foto409220ad7d8adf3c600878d7d36730427.jpg', 'repository/lampiran/permohonan/foto/foto509220ad7d8adf3c600878d7d36730427.jpg', '289/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhppbbe23948aedb1681621c3242263575e6.pdf', '031.P.20.424.3175.GEWI.18', NULL, 5, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('032', 'SDE-2601186280', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '59/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/8a973720a2571f392367282194d8f588.pdf', NULL, NULL, '', '2018-01-26 11:26:03', NULL, '1', '2018-01-16', '-6.240731,106.994691', 'repository/lampiran/permohonan/foto/foto1da1136e198fb6b4ca4f281fae33ce1f4.jpg', 'repository/lampiran/permohonan/foto/foto2da1136e198fb6b4ca4f281fae33ce1f4.jpg', 'repository/lampiran/permohonan/foto/foto3da1136e198fb6b4ca4f281fae33ce1f4.jpg', 'repository/lampiran/permohonan/foto/foto4da1136e198fb6b4ca4f281fae33ce1f4.jpg', 'repository/lampiran/permohonan/foto/foto5da1136e198fb6b4ca4f281fae33ce1f4.jpg', '290/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp70fcf54fcd49df20c2542e9a64a51663.pdf', '032.P.20.423.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', 'KTL.P1.20.307.02', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('033', 'SDE-2901186281', 'RUMAH SAKIT CIPTO MANGUN KUSUMO', 'KR.03.02/VII.5/0638/2018', NULL, 'Jl. Diponegoro No. 71 Jakarta', 'repository/slo/permohonan/172898d48a06b877a01fe3df56c11e8e.pdf', '2640287321024', 'B18T2000004', '', '2018-01-29 10:51:34', NULL, '1', '2018-01-08', '-6.196903,106.846881', 'repository/lampiran/permohonan/foto/foto1f0a9b6e1b70a99bbabe6d16140a70e68.jpg', 'repository/lampiran/permohonan/foto/foto2f0a9b6e1b70a99bbabe6d16140a70e68.jpg', 'repository/lampiran/permohonan/foto/foto3f0a9b6e1b70a99bbabe6d16140a70e68.jpg', 'repository/lampiran/permohonan/foto/foto4f0a9b6e1b70a99bbabe6d16140a70e68.jpg', 'repository/lampiran/permohonan/foto/foto5f0a9b6e1b70a99bbabe6d16140a70e68.jpg', '291/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhppca061f81c8a721093babe7f6c626ddd0.pdf', '033.P.20.423.3171.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('034', 'SDE-3101186282', 'PT. ERA JAYA SAKTI BERSAMA ', '022/PER-SLO/EJSB/18', NULL, 'Jl. Raya Pegadengan Kp. Cicayur I Rt. 01/02 No. 2 Ds. Pagedangan Kec. Pagedangan Kab, Tangerang Banten', 'repository/slo/permohonan/3d9a29f57644757aba9a207a7d9832ee.pdf', '4474524366324', 'B18T2000001', '', '2018-01-31 16:06:00', NULL, '1', '2018-01-12', '-6.154119,106.592434', 'repository/lampiran/permohonan/foto/foto1c396729ee59d1920e0e14dbf133d8a91.jpg', 'repository/lampiran/permohonan/foto/foto2c396729ee59d1920e0e14dbf133d8a91.jpg', 'repository/lampiran/permohonan/foto/foto3c396729ee59d1920e0e14dbf133d8a91.jpg', 'repository/lampiran/permohonan/foto/foto4c396729ee59d1920e0e14dbf133d8a91.jpg', 'repository/lampiran/permohonan/foto/foto5c396729ee59d1920e0e14dbf133d8a91.jpg', '286/LHPP/SDE/I/2018, tanggal 29 Januari 2018', 'repository/lampiran/permohonan/lhpp66e95602027d0eeae37cd3eeafdd202b.pdf', '034.P.20.428.3603.JA24.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('035', 'SDE-0202186283', 'PT. LITA MEKANIKAL ELEKTRIKAL', '60/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/ Rw. 02, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/4c4c92dafb87bf05190b793e4e5b2099.pdf', '8155473437882', 'B18T2000002', '', '2018-02-02 09:46:33', NULL, '1', '2018-01-19', '-6.1900560,106.8902640', 'repository/lampiran/permohonan/foto/foto1a1c0998dd0aa0d8d46dc742d6a7dab27.jpg', 'repository/lampiran/permohonan/foto/foto2a1c0998dd0aa0d8d46dc742d6a7dab27.jpg', 'repository/lampiran/permohonan/foto/foto3a1c0998dd0aa0d8d46dc742d6a7dab27.jpg', 'repository/lampiran/permohonan/foto/foto4a1c0998dd0aa0d8d46dc742d6a7dab27.jpg', 'repository/lampiran/permohonan/foto/foto5770977b521457ca8268d7fcc37909a9e.jpg', '292/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhpp82464058ddde063d2e189e4814449957.pdf', '035.P.20.424.3175.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('036', 'SDE-0502186284', 'dr. Surahman Hakim, SPOG (K)', 'KR.03.02/VII.5/0638/2018', NULL, 'Jl. Diponegoro No. 71 Jakarta', 'repository/slo/permohonan/16c0e3a40f02bb0f3b0d5e5c062684b4.pdf', '1761713567128', 'B18T2000005', '', '2018-02-05 13:01:49', NULL, '1', '2018-01-08', '-6.196903,106.846881', 'repository/lampiran/permohonan/foto/foto1be611ea3555539f6f7c81a354ffabb23.jpg', 'repository/lampiran/permohonan/foto/foto2be611ea3555539f6f7c81a354ffabb23.jpg', 'repository/lampiran/permohonan/foto/foto3be611ea3555539f6f7c81a354ffabb23.jpg', 'repository/lampiran/permohonan/foto/foto4026100f5940ef644486a0f9922abdecf.jpg', 'repository/lampiran/permohonan/foto/foto5026100f5940ef644486a0f9922abdecf.jpg', '291/LHPP/SDE/I/2018', 'repository/lampiran/permohonan/lhppbe611ea3555539f6f7c81a354ffabb23.pdf', '036.P.20.423.3171.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', 'DIS.INS.005(3).', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', 'DIS.INS.015(2)B', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('037', 'SDE-0502186285', 'PT. MARIO PRATAMA MANDIRI', '011/PER_PT.MPM/I/2018', NULL, 'Jl. Pattimura Pering Rt. 001/Rw.006, Kel. Bandarsyah Kec. Bunguran Timur Kab. Natuna - Kepulauan Riau', 'repository/slo/permohonan/25808cf7f0efcde8ccbfc25158e071b4.pdf', '3004008135220', 'B18T2000006', '', '2018-02-05 13:25:25', NULL, '1', '2018-01-26', '3.673284,108.305583', 'repository/lampiran/permohonan/foto/foto13b487469268d433faecb3cfde65b064d.jpg', 'repository/lampiran/permohonan/foto/foto23b487469268d433faecb3cfde65b064d.jpg', 'repository/lampiran/permohonan/foto/foto33b487469268d433faecb3cfde65b064d.jpg', 'repository/lampiran/permohonan/foto/foto43b487469268d433faecb3cfde65b064d.jpg', 'repository/lampiran/permohonan/foto/foto53b487469268d433faecb3cfde65b064d.jpg', '293/LHPP/SDE/II/2018, tanggal 05 Februari 2018', 'repository/lampiran/permohonan/lhpp9f5b175cacb8f385aef06d9fc98c98cd.pdf', '037.P.20.428.2103.CL21.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('038', 'SDE-0702186286', 'PT. RAHMAYUTI SARANA MANDIRI', '001/RSM-DJK/II/2018', NULL, 'Jl. Sultan Iskandar Muda No. 30 Lt. 18 Kebayoran Lama Utara Jakarta Pusat', 'repository/slo/permohonan/e5fbb1b71f8e2681f2afb24f6811b86c.pdf', '7962621115049', 'B18T2020001', '', '2018-02-07 16:49:57', NULL, '1', '2018-02-02', '-6.284783,106.806905', 'repository/lampiran/permohonan/foto/foto1ac716708a5ab18b2be056f8afdddde25.jpg', 'repository/lampiran/permohonan/foto/foto2ac716708a5ab18b2be056f8afdddde25.jpg', 'repository/lampiran/permohonan/foto/foto3ac716708a5ab18b2be056f8afdddde25.jpg', 'repository/lampiran/permohonan/foto/foto4ac716708a5ab18b2be056f8afdddde25.jpg', 'repository/lampiran/permohonan/foto/foto5ac716708a5ab18b2be056f8afdddde25.jpg', '296/LHPP/SDE/II/2018, tanggal 07 Februari 2018', 'repository/lampiran/permohonan/lhppac716708a5ab18b2be056f8afdddde25.pdf', '038.P.20.428.3174.JI05.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('039', 'SDE-0802186287', 'PT. LITA MEKANIKAL ELEKTRIKAL', '62/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/bf66c0acd7893cc487f0346ca8ae6976.pdf', '3602002077726', 'B18T2020002', '', '2018-02-08 11:51:26', NULL, '1', '2018-01-29', '-6.3116580,107.0881980', 'repository/lampiran/permohonan/foto/foto1c03b1b6b9538106a84218287f4e3d3ee.jpg', 'repository/lampiran/permohonan/foto/foto2c03b1b6b9538106a84218287f4e3d3ee.jpg', 'repository/lampiran/permohonan/foto/foto3c03b1b6b9538106a84218287f4e3d3ee.jpg', 'repository/lampiran/permohonan/foto/foto4c03b1b6b9538106a84218287f4e3d3ee.jpg', 'repository/lampiran/permohonan/foto/foto5c03b1b6b9538106a84218287f4e3d3ee.jpg', '297/LHPP/SDE/II/2018, tanggal 08 Februari 2018', 'repository/lampiran/permohonan/lhppa4cbb1d4a3c91ee2ebe016b69f83bd13.pdf', '039.P.20.428.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03A', 'SDE-0802186288', 'PT. LITA MEKANIKAL ELEKTRIKAL', '61/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat ', 'repository/slo/permohonan/ab6a9b128ca17b6a5d9192c35924509d.pdf', '4344047568340', 'B18T2020003', '', '2018-02-08 16:16:09', NULL, '1', '2018-01-29', '-6.325464,107.064053', 'repository/lampiran/permohonan/foto/foto198f3775dfbc4e84d86f25f16dbfb2ca7.jpg', 'repository/lampiran/permohonan/foto/foto229313b1759bb9eb5f9cc2f49519200c4.jpg', 'repository/lampiran/permohonan/foto/foto398f3775dfbc4e84d86f25f16dbfb2ca7.jpg', 'repository/lampiran/permohonan/foto/foto498f3775dfbc4e84d86f25f16dbfb2ca7.jpg', 'repository/lampiran/permohonan/foto/foto598f3775dfbc4e84d86f25f16dbfb2ca7.jpg', '295/LHPP/SDE/II/2018, tanggal 08 Februari 2018', 'repository/lampiran/permohonan/lhpp98f3775dfbc4e84d86f25f16dbfb2ca7.pdf', '03A.P.20.427.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03B', 'SDE-1202186289', 'PT. PULO DAMAR ABADI', '015/SLO-PDA/111/2017', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa Barat ', 'repository/slo/permohonan/a8e1789dc3237aac9ea8aec0614a15df.pdf', '1183968110704', 'B18T2020004', '', '2018-02-12 12:08:13', NULL, '1', '2017-10-31', '-6.966445,107.697123', 'repository/lampiran/permohonan/foto/foto1ccdb9f789b426ef04974565deaf46f6a.jpg', 'repository/lampiran/permohonan/foto/foto2ccdb9f789b426ef04974565deaf46f6a.jpg', 'repository/lampiran/permohonan/foto/foto3ccdb9f789b426ef04974565deaf46f6a.jpg', 'repository/lampiran/permohonan/foto/foto4ccdb9f789b426ef04974565deaf46f6a.jpg', 'repository/lampiran/permohonan/foto/foto5ccdb9f789b426ef04974565deaf46f6a.jpg', '299/LHPP/SDE/II/2018, tanggal 12 Februari 2018', 'repository/lampiran/permohonan/lhppccdb9f789b426ef04974565deaf46f6a.pdf', '03B.P.20.421.3204.GEWE.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03D', 'SDE-1202186291', 'tess', 'tes/tes/2018', NULL, 'tes', 'repository/slo/permohonan/68d515df8bfa3200e2b0fdafbbd7d99a.pdf', NULL, NULL, '', '2018-02-12 12:39:13', NULL, '1', '2018-02-12', '', NULL, NULL, NULL, NULL, NULL, '', NULL, '03D.U.20.311.1A11.JA34.18', NULL, 2, 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('03E', 'SDE-1202186292', 'tes3', '1245', NULL, 'tes', 'repository/slo/permohonan/c6030fade3fcbb4848e25210c730ae26.pdf', NULL, 'B18T2020008', '', '2018-02-12 16:07:47', NULL, '1', '2018-02-12', NULL, NULL, NULL, NULL, NULL, NULL, 'tes/LHPP/SDE/II/2018, tanggal 12 Februari 2018', NULL, 'tes.U.20.311.1A11.JA34.18', NULL, 3, 71, 'ABDUL KHODIR', '', '', '3201022712880004', NULL, 71, 'ABDUL KHODIR', '', '', '3201022712880004', NULL, 0, NULL),
('03F', 'SDE-1302186293', 'PT. LITA MEKANIKAL ELEKTRIKAL', '64/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/ab7764fde04f59ffbdcb61b77abc586d.pdf', '9519633845471', 'B18T2020009', '', '2018-02-13 10:44:21', NULL, '1', '2018-01-30', '-6.913977,107.598079', 'repository/lampiran/permohonan/foto/foto10c3e83da69fc9a0ad2ecbdf19bdedbad.jpg', 'repository/lampiran/permohonan/foto/foto20c3e83da69fc9a0ad2ecbdf19bdedbad.jpg', 'repository/lampiran/permohonan/foto/foto30c3e83da69fc9a0ad2ecbdf19bdedbad.jpg', 'repository/lampiran/permohonan/foto/foto40c3e83da69fc9a0ad2ecbdf19bdedbad.jpg', 'repository/lampiran/permohonan/foto/foto50c3e83da69fc9a0ad2ecbdf19bdedbad.jpg', '298/LHPP/SDE/II/2018 tanggal 12 Februari 2018', 'repository/lampiran/permohonan/lhpp19bb2dd8f1e75a4a1e9ccd7f59e1daf2.pdf', '03F.P.20.428.3273.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03H', 'SDE-1402186295', 'PT. SINAR ANISA MANDIRI', '02/SAM-SP/II/2018', NULL, 'Kp. Kalijambe Rt. 002/004 Ds. Lambang Sari, Kec. Tambun Kab. Bekasi Jawa Barat', 'repository/slo/permohonan/a9a0261b68b01409ec16cc9e857a9c2f.jpg', '6383432847228', 'B18T2020010', '', '2018-02-14 10:09:05', NULL, '1', '2018-02-06', '-6.165857,107.055959', 'repository/lampiran/permohonan/foto/foto13461b39c9685c0dd140a20a7dad05d62.jpg', 'repository/lampiran/permohonan/foto/foto23461b39c9685c0dd140a20a7dad05d62.jpg', 'repository/lampiran/permohonan/foto/foto33461b39c9685c0dd140a20a7dad05d62.jpg', 'repository/lampiran/permohonan/foto/foto43461b39c9685c0dd140a20a7dad05d62.jpg', 'repository/lampiran/permohonan/foto/foto53461b39c9685c0dd140a20a7dad05d62.jpg', '301/LHPP/SDE/II/2018 Tanggal 14 Februari 2018', 'repository/lampiran/permohonan/lhpp9a2660b6f1ad3165e66e7c262f640470.pdf', '03H.P.20.428.3216.JEBA.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03I', 'SDE-1402186296', 'PT. SINAR ANISA MANDIRI', '02/SAM-SP/II/2018', NULL, 'Kp. Kalijambe Rt. 002/004 Ds. Lambang Sari, Kec. Tambun Kab. Bekasi Jawa Barat', 'repository/slo/permohonan/2c012e7a6f27c4e60457c19df26980f7.jpg', NULL, NULL, '', '2018-02-14 10:10:15', NULL, '1', '2018-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('03J', 'SDE-2002186297', 'PT. LITA MEKANIKAL ELEKTRIKAL', '65/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/dffc194ec86997906e997e757f27ab90.pdf', '3689810639943', 'B18T2020011', '', '2018-02-20 10:11:49', NULL, '1', '2018-02-12', '-6.702644,108.335766', 'repository/lampiran/permohonan/foto/foto1926f93e0eef92d72abe005c38eea3c65.jpg', 'repository/lampiran/permohonan/foto/foto2926f93e0eef92d72abe005c38eea3c65.jpg', 'repository/lampiran/permohonan/foto/foto3926f93e0eef92d72abe005c38eea3c65.jpg', 'repository/lampiran/permohonan/foto/foto4926f93e0eef92d72abe005c38eea3c65.jpg', 'repository/lampiran/permohonan/foto/foto5926f93e0eef92d72abe005c38eea3c65.jpg', '302/lhpp/sde/II/2018, tanggal 19 Februari 2018', 'repository/lampiran/permohonan/lhpp96876067fe9c7dd6b8a30246628b7350.pdf', '03J.P.20.428.3210.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('041', 'SDE-1303186315', 'PT. LITA MEKANIKAL ELEKTRIKAL', '61/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/215114b8cc1105c1085066a194395052.pdf', '2768256921010', 'C18T2000011', '', '2018-03-13 16:19:22', NULL, '1', '2018-02-01', '-6.2224281,107.000834', 'repository/lampiran/permohonan/foto/foto1c84b17c29ba9c8159e7239ce22fd29cc.jpg', 'repository/lampiran/permohonan/foto/foto2c84b17c29ba9c8159e7239ce22fd29cc.jpg', 'repository/lampiran/permohonan/foto/foto3c84b17c29ba9c8159e7239ce22fd29cc.jpg', 'repository/lampiran/permohonan/foto/foto4c84b17c29ba9c8159e7239ce22fd29cc.jpg', 'repository/lampiran/permohonan/foto/foto5c84b17c29ba9c8159e7239ce22fd29cc.jpg', '307/LHPP/SDE/III/2018, Tanggal 21 Maret 2018', 'repository/lampiran/permohonan/lhpp87fcba26b35b1b32c60f58b68e2f8f6b.pdf', '041.P.20.427.3275.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03L', 'SDE-2002186299', 'PT. LITA MEKANIKAL ELEKTRIKAL', '68/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/56fe6c47e9e6c80887dd81624cd8924d.pdf', '2853852982625', 'B18T2020012', '', '2018-02-20 16:47:55', NULL, '1', '2018-02-13', '-6.878088,107.552940', 'repository/lampiran/permohonan/foto/foto1192b7aa1786895f5734f8f4397d449a0.jpg', 'repository/lampiran/permohonan/foto/foto2587eca8150abdc5bda03600d3c119dd0.jpg', 'repository/lampiran/permohonan/foto/foto32eed693bae30d24fb3cc584d5d4b1033.jpg', 'repository/lampiran/permohonan/foto/foto42eed693bae30d24fb3cc584d5d4b1033.jpg', 'repository/lampiran/permohonan/foto/foto5192b7aa1786895f5734f8f4397d449a0.jpg', '305/LHPP/SDE/II/2018, Tanggal 20 Februari 2018', 'repository/lampiran/permohonan/lhppa968a88ce56729f3bd7fe0c189669283.pdf', '03L.P.20.423.3277.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03M', 'SDE-2002186300', 'PT. LITA MEKANIKAL ELEKTRIKAL', '68/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/6344f55377d4ba90a124a144c17dbbc9.pdf', '1704886203352', 'C18T2000001', '', '2018-02-20 16:49:01', NULL, '1', '2018-02-13', '-6.878088,107.552940', 'repository/lampiran/permohonan/foto/foto1b93f97929b14f3407f3c26610b7a4566.jpg', 'repository/lampiran/permohonan/foto/foto2b93f97929b14f3407f3c26610b7a4566.jpg', 'repository/lampiran/permohonan/foto/foto3b93f97929b14f3407f3c26610b7a4566.jpg', 'repository/lampiran/permohonan/foto/foto4b93f97929b14f3407f3c26610b7a4566.jpg', 'repository/lampiran/permohonan/foto/foto5b93f97929b14f3407f3c26610b7a4566.jpg', '305/LHPP/SDE/II/2018, Tanggal 20 Februari 2018', 'repository/lampiran/permohonan/lhppb93f97929b14f3407f3c26610b7a4566.pdf', '03M.P.20.423.3277.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03N', 'SDE-2202186301', 'PT/ LITA MEKANIKAL ELEKTRIKAL', '62/LME/SLO/I/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/9bae35e57f5bfc4b3da5df9a827cc7c3.pdf', '2227282217120', 'B18T2020013', '', '2018-02-22 12:10:37', NULL, '1', '2018-01-23', '-6.277645,106.895118', 'repository/lampiran/permohonan/foto/foto12cc7f0dc60fe37868d5ebdc80e551ca8.jpg', 'repository/lampiran/permohonan/foto/foto22cc7f0dc60fe37868d5ebdc80e551ca8.jpg', 'repository/lampiran/permohonan/foto/foto32cc7f0dc60fe37868d5ebdc80e551ca8.jpg', 'repository/lampiran/permohonan/foto/foto42cc7f0dc60fe37868d5ebdc80e551ca8.jpg', 'repository/lampiran/permohonan/foto/foto52cc7f0dc60fe37868d5ebdc80e551ca8.jpg', '294/LHPP/SDE/II/2018, tanggal 22 Februari 2018', 'repository/lampiran/permohonan/lhppd16d7d13c481d3bc98a1695e6d3a3354.pdf', '03N.P.20.429.3175.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('042', 'SDE-1903186316', 'PT. LITA MEKANIKAL ELEKTRIKAL', '70/LME/SLO/III/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/e3d97d78d0919044f10e744a19592991.pdf', '3250414356559', 'C18T2000009', '', '2018-03-19 12:40:50', NULL, '1', '2018-03-01', '-6.423656,106.950437', 'repository/lampiran/permohonan/foto/foto105cc7a63658c4f913def79c9083106fa.jpg', 'repository/lampiran/permohonan/foto/foto205cc7a63658c4f913def79c9083106fa.jpg', 'repository/lampiran/permohonan/foto/foto305cc7a63658c4f913def79c9083106fa.jpg', 'repository/lampiran/permohonan/foto/foto405cc7a63658c4f913def79c9083106fa.jpg', 'repository/lampiran/permohonan/foto/foto505cc7a63658c4f913def79c9083106fa.jpg', '312/LHPP/SDE/III/2018,  Tanggal 19 Maret 2018', 'repository/lampiran/permohonan/lhppa68aaa7d5ad542b4316f8c45b570936e.pdf', '042.P.20.428.3201.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('043', 'SDE-2103186317', 'PT. LITA MEKANIKAL ELEKTRIKAL', '71/LME/SLO/III/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/640d90e3cc3d97afc82ecc45fb430cc6.pdf', '2747463782444', 'C18T2000010', '', '2018-03-21 15:21:22', NULL, '1', '2018-03-05', '-6.3557030,107.2260980', 'repository/lampiran/permohonan/foto/foto1a44fde6c3cb6c054bc67dbc9d8f6449c.jpg', 'repository/lampiran/permohonan/foto/foto2a44fde6c3cb6c054bc67dbc9d8f6449c.jpg', 'repository/lampiran/permohonan/foto/foto3a44fde6c3cb6c054bc67dbc9d8f6449c.jpg', 'repository/lampiran/permohonan/foto/foto4a44fde6c3cb6c054bc67dbc9d8f6449c.jpg', 'repository/lampiran/permohonan/foto/foto5a44fde6c3cb6c054bc67dbc9d8f6449c.jpg', '314/LHPP/SDE/III/2018', 'repository/lampiran/permohonan/lhppc23b88a46fbf61f728b34fd0fdded0f1.pdf', '043.P.20.428.3215.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03Q', 'SDE-2202186304', 'GRAND SETIABUDI HOTEL & APARTMENT', '007/GSA-ENG/XI/2017 ', NULL, 'Jl. Dr. Setiabudi No. 130-134 Bandung - Jawa Barat', 'repository/slo/permohonan/13d4e335e34feb648e6ee33f5e62505f.pdf', '9970193238437', 'C18T2000005', '', '2018-02-22 14:54:36', NULL, '1', '2017-11-27', '-6.874861,107.597222', 'repository/lampiran/permohonan/foto/foto1c1614fe26a1ca8675c285cc69599ee2d.jpg', 'repository/lampiran/permohonan/foto/foto2c1614fe26a1ca8675c285cc69599ee2d.jpg', 'repository/lampiran/permohonan/foto/foto3c1614fe26a1ca8675c285cc69599ee2d.jpg', 'repository/lampiran/permohonan/foto/foto4c1614fe26a1ca8675c285cc69599ee2d.jpg', 'repository/lampiran/permohonan/foto/foto5c1614fe26a1ca8675c285cc69599ee2d.jpg', '274/LHPP/SDE/XII/2017, tanggal 13 Desember 2017', 'repository/lampiran/permohonan/lhppc1614fe26a1ca8675c285cc69599ee2d.pdf', '03Q.P.20.425.3273.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('03R', 'SDE-2602186305', 'PT. LITA MEKANIKAL ELEKTRIKAL', '66/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/421c64f8b0301b305882f4aab8a084d0.pdf', '4869606791772', 'B18T2020015', '', '2018-02-26 13:39:12', NULL, '1', '2018-02-12', '-6.268781,107.086487', 'repository/lampiran/permohonan/foto/foto1c2387be0dd295ba74845aeda6bcf2ea5.jpg', 'repository/lampiran/permohonan/foto/foto2c2387be0dd295ba74845aeda6bcf2ea5.jpg', 'repository/lampiran/permohonan/foto/foto3c2387be0dd295ba74845aeda6bcf2ea5.jpg', 'repository/lampiran/permohonan/foto/foto4c2387be0dd295ba74845aeda6bcf2ea5.jpg', 'repository/lampiran/permohonan/foto/foto5c2387be0dd295ba74845aeda6bcf2ea5.jpg', '303/LHPP/SLO/II/2018, Tanggal 26 Februari 2018', 'repository/lampiran/permohonan/lhpp7cb09a94a7b1ba10c044d16be34f25bc.pdf', '03R.P.20.428.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03U', 'SDE-2602186308', 'PT. LITA MEKANIKAL ELEKTRIKAL', '63/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/b0459ae3c927d6ec02166662e1ac6fc0.pdf', '1675178725344', 'B18T2020016', '', '2018-02-26 16:04:28', NULL, '1', '2018-02-05', '-6.166701,106.602305', 'repository/lampiran/permohonan/foto/foto1186ac285b3c85670f038bb483177d1f8.jpg', 'repository/lampiran/permohonan/foto/foto2186ac285b3c85670f038bb483177d1f8.jpg', 'repository/lampiran/permohonan/foto/foto3186ac285b3c85670f038bb483177d1f8.jpg', 'repository/lampiran/permohonan/foto/foto4186ac285b3c85670f038bb483177d1f8.jpg', 'repository/lampiran/permohonan/foto/foto5186ac285b3c85670f038bb483177d1f8.jpg', '300/LHPP/SDE/II/2018, tanggal 26 Februari 2018', 'repository/lampiran/permohonan/lhpp4d4db97baa1c9fdc5e06c9147987feec.pdf', '03U.P.20.428.3277.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03V', 'SDE-0503186309', 'PT. YAMAHA INDONESIA MOTOR MANUFACTURING', '10/QHSE-EXT/YIMMWJ/II/18', NULL, 'Kawasan Industri K-IIC Lot.BB - 1,2,5,6,AA-3 Sukaluyu Telukjambe Timur Karawang - Jawa Barat', 'repository/slo/permohonan/f2f6acd8f27699602787659712532ab6.pdf', '1662927988868', 'C18T2000003', '', '2018-03-05 10:12:44', NULL, '1', '2018-02-14', '-6.354078,107.2814670', 'repository/lampiran/permohonan/foto/foto180118f1268477ca6aa0afa47748ffda3.jpg', 'repository/lampiran/permohonan/foto/foto280118f1268477ca6aa0afa47748ffda3.jpg', 'repository/lampiran/permohonan/foto/foto380118f1268477ca6aa0afa47748ffda3.jpg', 'repository/lampiran/permohonan/foto/foto480118f1268477ca6aa0afa47748ffda3.jpg', 'repository/lampiran/permohonan/foto/foto580118f1268477ca6aa0afa47748ffda3.jpg', '306/LHPP/SDE/II/2018, Tanggal 28 Februari 2018', 'repository/lampiran/permohonan/lhpp5b0c74ab3e3ec41858b9247a699a35da.pdf', '03V.P.20.428.3215.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03W', 'SDE-0503186310', 'THE MAJESTY HOTEL & APARTEMENT', '02/ENG-MJT/II/2018', NULL, 'Jl. Prof. Dr. Surya Sumantri No. 91 Bandung - Jawa Barat', 'repository/slo/permohonan/3f471bad1c7cc7d91abb6e6a39e8f672.pdf', '1912376726984', 'C18T2000002', '', '2018-03-05 15:13:50', NULL, '1', '2018-02-05', '-6.883286,107.580803', 'repository/lampiran/permohonan/foto/foto13f471bad1c7cc7d91abb6e6a39e8f672.jpg', 'repository/lampiran/permohonan/foto/foto23f471bad1c7cc7d91abb6e6a39e8f672.jpg', 'repository/lampiran/permohonan/foto/foto33f471bad1c7cc7d91abb6e6a39e8f672.jpg', 'repository/lampiran/permohonan/foto/foto43f471bad1c7cc7d91abb6e6a39e8f672.jpg', 'repository/lampiran/permohonan/foto/foto53f471bad1c7cc7d91abb6e6a39e8f672.jpg', '275/LHPP/SDE/III/2018. 05 Maret 2018', 'repository/lampiran/permohonan/lhpp6ec6e74d5d1104123cb22b4b06197a1d.pdf', '03W.P.20.425.3273.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03X', 'SDE-0603186311', 'PT. LITA MEKANIKAL ELEKTRIKAL', '68/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03, Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/d17acfcb18c6d5a7bcebd33436fa3508.pdf', '8498617748592', 'C18T2000004', '', '2018-03-06 11:39:22', NULL, '1', '2018-02-23', '-6.276727,106.722062', 'repository/lampiran/permohonan/foto/foto1d84ce75676644820608e95f26b472625.jpg', 'repository/lampiran/permohonan/foto/foto2d84ce75676644820608e95f26b472625.jpg', 'repository/lampiran/permohonan/foto/foto3d84ce75676644820608e95f26b472625.jpg', 'repository/lampiran/permohonan/foto/foto4d84ce75676644820608e95f26b472625.jpg', 'repository/lampiran/permohonan/foto/foto5d84ce75676644820608e95f26b472625.jpg', '308/LHPP/SDE/III/2018, Tanggal 02 Maret 2018', 'repository/lampiran/permohonan/lhppd17acfcb18c6d5a7bcebd33436fa3508.pdf', '03X.P.20.428.3174.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03Y', 'SDE-0603186312', 'PT. LITA MEKANIKAL ELEKTRIKAL', '67/LME/SLO/II/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/503da583c648da9a5d53893fd1b6185f.pdf', '2209808914033', 'C18T2000006', '', '2018-03-06 15:39:47', NULL, '1', '2018-02-13', '-6.335602,107.153698', 'repository/lampiran/permohonan/foto/foto18a145dfe050df8cd1f0e796b9b104ea2.jpg', 'repository/lampiran/permohonan/foto/foto28a145dfe050df8cd1f0e796b9b104ea2.jpg', 'repository/lampiran/permohonan/foto/foto38a145dfe050df8cd1f0e796b9b104ea2.jpg', 'repository/lampiran/permohonan/foto/foto48a145dfe050df8cd1f0e796b9b104ea2.jpg', 'repository/lampiran/permohonan/foto/foto58a145dfe050df8cd1f0e796b9b104ea2.jpg', '304/LHPP/SLO/II/2018, tanggal 05 Maret 2018', 'repository/lampiran/permohonan/lhpp8a145dfe050df8cd1f0e796b9b104ea2.pdf', '03Y.P.20.427.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('03Z', 'SDE-1203186313', 'PT. PULO DAMAR ABADI', '006/SLO-PDA/III/2018', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa Barat', 'repository/slo/permohonan/d11ecf485bbf582a5e18e0cbb4a68cd2.pdf', '2085445466918', 'C18T2000008', '', '2018-03-12 11:10:45', NULL, '1', '2018-03-01', '-6.370734,107.269119', 'repository/lampiran/permohonan/foto/foto1aaf13bbc2cfaad8aad7a1f9a836c84a3.jpg', 'repository/lampiran/permohonan/foto/foto2aaf13bbc2cfaad8aad7a1f9a836c84a3.jpg', 'repository/lampiran/permohonan/foto/foto3aaf13bbc2cfaad8aad7a1f9a836c84a3.jpg', 'repository/lampiran/permohonan/foto/foto4aaf13bbc2cfaad8aad7a1f9a836c84a3.jpg', 'repository/lampiran/permohonan/foto/foto5aaf13bbc2cfaad8aad7a1f9a836c84a3.jpg', '309/LHPP/SDE/III/2018, Tanggal 12 Maret 2018', 'repository/lampiran/permohonan/lhpp9bda9bb9fe43140cbc4d031fe893a575.pdf', '03Z.P.20.428.3215.GEWE.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('040', 'SDE-1203186314', 'PT. TERUNA JAYA TEKNIK', '09/SLO-TM/TJT/II/2018', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti Cirebon', 'repository/slo/permohonan/75cb516ed376296e2de683ba4f98ece5.pdf', '2378294044480', 'C18T2000007', '', '2018-03-12 14:58:37', NULL, '1', '2018-02-23', '-6.49011,108.28556', 'repository/lampiran/permohonan/foto/foto1834b2ce3aec849998c6eff573963f2c2.jpg', 'repository/lampiran/permohonan/foto/foto2834b2ce3aec849998c6eff573963f2c2.jpg', 'repository/lampiran/permohonan/foto/foto3834b2ce3aec849998c6eff573963f2c2.jpg', 'repository/lampiran/permohonan/foto/foto4834b2ce3aec849998c6eff573963f2c2.jpg', 'repository/lampiran/permohonan/foto/foto5834b2ce3aec849998c6eff573963f2c2.jpg', '310/LHPP/SDE/III/2018, Tanggal 12 Maret 2018', 'repository/lampiran/permohonan/lhpp9c4f3f74bd44221159bffb783757d66a.pdf', '040.P.20.428.3208.JEBM.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('044', 'SDE-2703186318', 'PT. SILTEC MAJU PERKASA', '011/SMP/III/2018', NULL, 'Jl. Raya Koper Cikande Km. 1, Kp. Cidahu, Desa Parigi, Kec. Cikande, Kab. Serang Banten ', 'repository/slo/permohonan/8b876bb71c17b7c6e84e1ec4c5756a07.pdf', NULL, NULL, '', '2018-03-27 10:25:23', NULL, '1', '2018-03-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL);
INSERT INTO `t_pemohon` (`id_pemohon`, `no_register`, `nama`, `jabatan`, `tlp`, `alamat`, `file_permohonan`, `api_nopermohonan`, `api_no_agenda`, `api_noregistrasi`, `created_at`, `published_at`, `id_user`, `tgl_pemohon`, `map`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `noLHPP`, `lhpp`, `noSLO`, `salinanslo`, `status`, `user_id_tt_1`, `nama_tt_1`, `sub_bidang_tt_1`, `no_sertifikat_tt_1`, `kode_unit_tt_1`, `foto_tt_1`, `user_id_tt_2`, `nama_tt_2`, `sub_bidang_tt_2`, `no_sertifikat_tt_2`, `kode_unit_tt_2`, `foto_tt_2`, `notif`, `id_pemohon_lama`) VALUES
('045', 'SDE-2703186319', 'PT. SILTEC MAJU PERKASA ', '011/SMP/III/2018', NULL, 'Jl. Raya Koper Cikande Km. 1 Kp. Dahu Desa Parigi Kec. Cikande Kab Serang Banten', 'repository/slo/permohonan/1e5ddc8dc0d6ce1d2e7c65a5fbb0a421.pdf', '2155267869451', 'C18T2000012', '', '2018-03-27 17:10:29', NULL, '1', '2018-03-13', '-6.193597,106.372625', 'repository/lampiran/permohonan/foto/foto1b0aa2c35d63e7578de07d00979b263f3.jpg', 'repository/lampiran/permohonan/foto/foto2b0aa2c35d63e7578de07d00979b263f3.jpg', 'repository/lampiran/permohonan/foto/foto3b0aa2c35d63e7578de07d00979b263f3.jpg', 'repository/lampiran/permohonan/foto/foto4b0aa2c35d63e7578de07d00979b263f3.jpg', 'repository/lampiran/permohonan/foto/foto5b0aa2c35d63e7578de07d00979b263f3.jpg', '313/LHPP/SDE/III/2018, Tanggal 26 Maret 2018', 'repository/lampiran/permohonan/lhppb0aa2c35d63e7578de07d00979b263f3.pdf', '045.P.20.428.3601.GIB6.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('046', 'SDE-2903186320', 'PT. GOLDEN FORTUNE STELL', '005/DIR-GFS/L/III/2018', NULL, 'Kawasan Industri Modern Cikande, Jl. Modern Industri X Kav. Q7-Q8 Nambo Ilir Kibin, Serang - Banten', 'repository/slo/permohonan/0af5400960d07525b1756ea65585ed21.pdf', '5700924328167', 'C18T2000014', '', '2018-03-29 15:03:22', NULL, '1', '2018-03-05', '-6.188196,106.313026', 'repository/lampiran/permohonan/foto/foto191b64b4a8373e235a573d084878f5f0d.jpg', 'repository/lampiran/permohonan/foto/foto291b64b4a8373e235a573d084878f5f0d.jpg', 'repository/lampiran/permohonan/foto/foto391b64b4a8373e235a573d084878f5f0d.jpg', 'repository/lampiran/permohonan/foto/foto491b64b4a8373e235a573d084878f5f0d.jpg', 'repository/lampiran/permohonan/foto/foto591b64b4a8373e235a573d084878f5f0d.jpg', '315/LHPP/SDE/III/2018, Tanggal 28 Maret 2018', 'repository/lampiran/permohonan/lhpp76fb88123e142a610e0b897c878bde56.pdf', '046.P.20.428.3604.00000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('047', 'SDE-2903186321', 'PT. CITRA BARU STELL', '005/DIR-CBS/L/III/2018', NULL, 'Kawasan Industri Modern Cikande, Jl. Modern Industri X Kav. Q7-Q8 Nambo Ilir Kibin, Serang - Banten', 'repository/slo/permohonan/08af1188b99767a77dc4284f972eed92.pdf', '1588222367593', 'C18T2000013', '', '2018-03-29 17:00:56', NULL, '1', '2018-03-05', '-6.188196,106.3133026', 'repository/lampiran/permohonan/foto/foto1e3326efd6118c015d2d41c5e8b054f39.jpg', 'repository/lampiran/permohonan/foto/foto2e3326efd6118c015d2d41c5e8b054f39.jpg', 'repository/lampiran/permohonan/foto/foto3e3326efd6118c015d2d41c5e8b054f39.jpg', 'repository/lampiran/permohonan/foto/foto4e3326efd6118c015d2d41c5e8b054f39.jpg', 'repository/lampiran/permohonan/foto/foto5e3326efd6118c015d2d41c5e8b054f39.jpg', '311/LHPP/SDE/III/2018, Tanggal 28 Maret 2018', 'repository/lampiran/permohonan/lhppe3326efd6118c015d2d41c5e8b054f39.pdf', '047.P.20.428.3673.00000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('048', 'SDE-0204186322', 'PT. LITA MEKANIKAL ELEKTRIKAL', '75/LME/SLO/III/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/5eebc3e91107c0ce1c5769b610fcb46b.pdf', '2416235457128', 'D18T2000002', '', '2018-04-02 13:37:03', NULL, '1', '2018-03-12', '-6.260531,106.996300', 'repository/lampiran/permohonan/foto/foto1357658a02e2511cecab18208414d35dc.jpg', 'repository/lampiran/permohonan/foto/foto2357658a02e2511cecab18208414d35dc.jpg', 'repository/lampiran/permohonan/foto/foto3357658a02e2511cecab18208414d35dc.jpg', 'repository/lampiran/permohonan/foto/foto4357658a02e2511cecab18208414d35dc.jpg', 'repository/lampiran/permohonan/foto/foto5357658a02e2511cecab18208414d35dc.jpg', '317/LHPP/SDE/IV/2018', 'repository/lampiran/permohonan/lhpp95953678691170ecc3a1b5fc5f321d63.pdf', '048.P.20.427.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('049', 'SDE-0204186323', 'PT. LITA MEKANIKAL ELEKTRIKAL', '74/LME/SLO/III/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/69ba97535d6ab99a207b22d13e0f84c5.pdf', '3163489211957', 'D18T2000001', '', '2018-04-02 13:52:20', NULL, '1', '2018-03-23', '-6.9764360,107.690648', 'repository/lampiran/permohonan/foto/foto1d821ff4cc2959e1a264e4bc9c053b6be.jpg', 'repository/lampiran/permohonan/foto/foto2d821ff4cc2959e1a264e4bc9c053b6be.jpg', 'repository/lampiran/permohonan/foto/foto3d821ff4cc2959e1a264e4bc9c053b6be.jpg', 'repository/lampiran/permohonan/foto/foto4d821ff4cc2959e1a264e4bc9c053b6be.jpg', 'repository/lampiran/permohonan/foto/foto5d387cc478f632f70694c77731205b747.jpg', '316/LHPP/SDE/III/2018, Tanggal 29 Maret 2018', 'repository/lampiran/permohonan/lhppc4e89238d5ad7f2425d3783aba993a02.pdf', '049.P.20.428.3204.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04A', 'SDE-0504186324', 'PT. LITA MEKANIKAL ELEKTRIKAL', '77/LME/SLO/III/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/9ebcf1017b19d4b4b1321db372777971.pdf', '1533263314457', 'D18T2000007', '', '2018-04-05 11:40:47', NULL, '1', '2018-03-26', '-6.633721,107.376797', 'repository/lampiran/permohonan/foto/foto1514c39b963851aa22b78b97426287897.jpg', 'repository/lampiran/permohonan/foto/foto2e790330e9473ab47b7d7232cb4d28e8c.jpg', 'repository/lampiran/permohonan/foto/foto3e790330e9473ab47b7d7232cb4d28e8c.jpg', 'repository/lampiran/permohonan/foto/foto4e790330e9473ab47b7d7232cb4d28e8c.jpg', 'repository/lampiran/permohonan/foto/foto5e790330e9473ab47b7d7232cb4d28e8c.jpg', '320/LHPP/SDE/IV/2018, Tanggal 13 April 2018', 'repository/lampiran/permohonan/lhppe1f6e247c576d5a413370b8ee4888d31.pdf', '04A.P.20.428.3214.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04B', 'SDE-1004186325', 'PT. RAHMAYUTI SARANA MANDIRI', '-', NULL, 'Jl. Sultan Iskandar Muda No. 30 Lt. 18 Kebayoran Lama Utara Jakarta Selatan', 'repository/slo/permohonan/30ee26aa3a30126c4f5828d6ce2c143f.jpg', '3149916204704', 'D18T2000003', '', '2018-04-10 10:09:39', NULL, '1', '2018-03-29', '-6.250975,106.550084', 'repository/lampiran/permohonan/foto/foto12cf12cb9ee7c68ab4885859207170fa0.jpg', 'repository/lampiran/permohonan/foto/foto235aebefedaa6a5ddf43ff266c83fc51b.jpg', 'repository/lampiran/permohonan/foto/foto335aebefedaa6a5ddf43ff266c83fc51b.jpg', 'repository/lampiran/permohonan/foto/foto435aebefedaa6a5ddf43ff266c83fc51b.jpg', 'repository/lampiran/permohonan/foto/foto535aebefedaa6a5ddf43ff266c83fc51b.jpg', '319/LHPP/SDE/IV/2018, Tanggal 09 April 2018', 'repository/lampiran/permohonan/lhpp30ee26aa3a30126c4f5828d6ce2c143f.pdf', '04B.P.20.428.3603.JI05.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04C', 'SDE-1004186326', 'PT. LITA MEKANIKAL ELEKTRIKAL', '78/LME/SLO/IV/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/a8359d9f4af8bae4c9142b591beaddbc.pdf', '1698922148732', 'D18T2000004', '', '2018-04-10 15:59:09', NULL, '1', '2018-04-02', '-6.258865,106.959725', 'repository/lampiran/permohonan/foto/foto13e978e9fe5d90f35c22316e4493af14b.jpg', 'repository/lampiran/permohonan/foto/foto23e978e9fe5d90f35c22316e4493af14b.jpg', 'repository/lampiran/permohonan/foto/foto33e978e9fe5d90f35c22316e4493af14b.jpg', 'repository/lampiran/permohonan/foto/foto43e978e9fe5d90f35c22316e4493af14b.jpg', 'repository/lampiran/permohonan/foto/foto53e978e9fe5d90f35c22316e4493af14b.jpg', '321/LHPP/SDE/IV/2018, Tanggal 10 April 2018', 'repository/lampiran/permohonan/lhppf029dd35308cc11f116df1949f132366.pdf', '04C.P.20.424.3216.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04D', 'SDE-1304186327', 'PT. DUTHA TERANG TEHNIK', '012/P/SLO/TM/03/2018', NULL, 'Jl. Damai No. 01 Kel. Oebobo, Kota Kupang Nusa Tenggara Timur', 'repository/slo/permohonan/a43dc07fc377d453266da7f2ff7aca8a.pdf', NULL, 'D18T2000005', '', '2018-04-13 14:57:28', NULL, '1', '2018-03-22', '-8.32699,122.92446', 'repository/lampiran/permohonan/foto/foto1e9808409b89ce05083c5c755ee0586d1.jpg', 'repository/lampiran/permohonan/foto/foto2e9808409b89ce05083c5c755ee0586d1.jpg', 'repository/lampiran/permohonan/foto/foto3e9808409b89ce05083c5c755ee0586d1.jpg', 'repository/lampiran/permohonan/foto/foto4e9808409b89ce05083c5c755ee0586d1.jpg', 'repository/lampiran/permohonan/foto/foto5e9808409b89ce05083c5c755ee0586d1.jpg', '318/LHPP/SDE/IV/2018, Tanggal 12 April 2018', 'repository/lampiran/permohonan/lhpp96e886a35f9fdf18e66ef5e26109d61d.pdf', '04D.P.20.428.5301.YF14.18', NULL, 3, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04G', 'SDE-2304186330', 'PT. CAHAYA TIRTAMAS UTAMA', '3/KP-K/III/2018', NULL, 'Jl. PSM, Gang Mukti No. 3 Kiaracondong Bandung', 'repository/slo/permohonan/155320a78b58d038633d5fd3c1994783.pdf', '2631938898794', 'D18T2000011', '', '2018-04-23 13:37:23', NULL, '1', '2018-03-20', '-6.943465,107.566782', 'repository/lampiran/permohonan/foto/foto11e3b2be1f54255339c5a33d95930fe2e.jpg', 'repository/lampiran/permohonan/foto/foto21e3b2be1f54255339c5a33d95930fe2e.jpg', 'repository/lampiran/permohonan/foto/foto31e3b2be1f54255339c5a33d95930fe2e.jpg', 'repository/lampiran/permohonan/foto/foto41e3b2be1f54255339c5a33d95930fe2e.jpg', 'repository/lampiran/permohonan/foto/foto51e3b2be1f54255339c5a33d95930fe2e.jpg', '323/LHPP/SDE/IV/2018, Tanggal 17 April 2018', 'repository/lampiran/permohonan/lhpp1e3b2be1f54255339c5a33d95930fe2e.pdf', '04G.P.20.428.3204.GE03.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04F', 'SDE-1904186329', 'PT. VOTASE AMPERINDO PERKASA', '09/SP/IV/2018', NULL, 'Jl. Sutiragen IV No. 3, Bantar Jati Bogor Utara - Jawa Barat', 'repository/slo/permohonan/3d5820c7d3e15dae27ce7437ca08d3ae.jpg', '1022346568140', 'D18T2000009', '', '2018-04-19 14:06:04', NULL, '1', '2018-04-12', '-6.858801,107.492076', 'repository/lampiran/permohonan/foto/foto18e9a58ad2f2c7551e7beedcd579dc7f3.jpg', 'repository/lampiran/permohonan/foto/foto28e9a58ad2f2c7551e7beedcd579dc7f3.jpg', 'repository/lampiran/permohonan/foto/foto38e9a58ad2f2c7551e7beedcd579dc7f3.jpg', 'repository/lampiran/permohonan/foto/foto48e9a58ad2f2c7551e7beedcd579dc7f3.jpg', 'repository/lampiran/permohonan/foto/foto58e9a58ad2f2c7551e7beedcd579dc7f3.jpg', '322/LHPP/SDE/IV/2018, Tanggal 17 April 2018', 'repository/lampiran/permohonan/lhppfd1e5628c510246bf507c4914df85690.pdf', '04F.P.20.426.3217.GEWB.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04H', 'SDE-2604186331', 'PT. SINAR ANISA MANDIRI', '030/SAM/IV/2018', NULL, 'Jl. Kalijambe Rt. 002/004, Desa Lambangsari, Kec. Tambun Kab. Bekasi - Jawa Barat', 'repository/slo/permohonan/f0e2d24f4a26a32bbf2a34ba9087257a.pdf', '1659680984423', 'D18T2000012', '', '2018-04-26 08:40:46', NULL, '1', '2018-04-13', '-6.357562,106.999938', 'repository/lampiran/permohonan/foto/foto18dd8e4b36ca91032942e5e378e3df3e6.jpg', 'repository/lampiran/permohonan/foto/foto28dd8e4b36ca91032942e5e378e3df3e6.jpg', 'repository/lampiran/permohonan/foto/foto38dd8e4b36ca91032942e5e378e3df3e6.jpg', 'repository/lampiran/permohonan/foto/foto48dd8e4b36ca91032942e5e378e3df3e6.jpg', 'repository/lampiran/permohonan/foto/foto58dd8e4b36ca91032942e5e378e3df3e6.jpg', '325/LHPP/SDE/IV/20018, Tanggal 24 April 2018', 'repository/lampiran/permohonan/lhpp2dfa632a33c548f85e110ccdb30a8fa0.pdf', '04H.P.20.428.3275.JEBA.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04I', 'SDE-2604186332', 'PT. SINAR ANISA MANDIRI', '030/SAM/IV/2018', NULL, 'Jl. Kalijambe Rt. 002/004, Desa Lambangsari, Kec. Tambun Kab. Bekasi - Jawa Barat', 'repository/slo/permohonan/6ef52d041bb01cfeb6cbebab2dc25ad9.pdf', NULL, NULL, '', '2018-04-26 09:32:26', NULL, '1', '2018-04-13', '-6.3278190,107.1602160', 'repository/lampiran/permohonan/foto/foto1b68bde7dba78f926ecdaa8ff8d5afc54.jpg', 'repository/lampiran/permohonan/foto/foto2676e4b931cebd3453e4d0173ae1e4d2e.jpg', 'repository/lampiran/permohonan/foto/foto3b68bde7dba78f926ecdaa8ff8d5afc54.jpg', 'repository/lampiran/permohonan/foto/foto4b68bde7dba78f926ecdaa8ff8d5afc54.jpg', 'repository/lampiran/permohonan/foto/foto5b68bde7dba78f926ecdaa8ff8d5afc54.jpg', '326/LHPP/SDE/IV/2018, Tanggal 24 April 2018', NULL, '04I.P.20.428.3275.JEBA.18', NULL, 0, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04K', 'SDE-0305186334', 'PT. HEN JAYA', '034/PPSLO/PTHJ/IV/2018', NULL, 'Jl. H. Kurdi No. 14, Moh. Toha Bandung - Jawa Barat', 'repository/slo/permohonan/10f8a4432742d3e077d5aec0b9b43f45.pdf', '1707859881636', 'E18T2000001', '', '2018-05-03 17:11:14', NULL, '1', '2018-04-23', '-6.198617,106.9138642', 'repository/lampiran/permohonan/foto/foto12cbcc748f5ed60edde44e49a9f2b905d.jpg', 'repository/lampiran/permohonan/foto/foto22cbcc748f5ed60edde44e49a9f2b905d.jpg', 'repository/lampiran/permohonan/foto/foto32cbcc748f5ed60edde44e49a9f2b905d.jpg', 'repository/lampiran/permohonan/foto/foto42cbcc748f5ed60edde44e49a9f2b905d.jpg', 'repository/lampiran/permohonan/foto/foto52cbcc748f5ed60edde44e49a9f2b905d.jpg', '324/LHPP/SDE/V/2018, Tanggal 03 Mei 2018', 'repository/lampiran/permohonan/lhppc71ba910a3daf0801d08e9b3288e66be.pdf', '04K.P.20.428.3175.JECM.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04M', 'SDE-0705186336', 'PT. LITA MEKANIKAL ELEKTRIKAL', '78/LME/SLO/IV/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/aae7e127b09acbe4bd2adb6796c4b89e.pdf', '4521000069085', 'E18T2000003', '', '2018-05-07 10:30:36', NULL, '1', '2018-05-13', '-6.832096,107.606064', 'repository/lampiran/permohonan/foto/foto18b2292bf210b183ae62fe77b9dfb8a1b.jpg', 'repository/lampiran/permohonan/foto/foto28b2292bf210b183ae62fe77b9dfb8a1b.jpg', 'repository/lampiran/permohonan/foto/foto38b2292bf210b183ae62fe77b9dfb8a1b.jpg', 'repository/lampiran/permohonan/foto/foto48b2292bf210b183ae62fe77b9dfb8a1b.jpg', 'repository/lampiran/permohonan/foto/foto58b2292bf210b183ae62fe77b9dfb8a1b.jpg', '327/LHPP/SDE/V/2018, Tanggal 02 Mei 2018', 'repository/lampiran/permohonan/lhppd78bfb2baa160ca399546223adcfaca8.pdf', '04M.P.20.424.3273.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04N', 'SDE-0705186337', 'PT. LITA MEKANIKAL ELEKTRIKAL', '80/LME/SLO/IV/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/964674455f03a04a6083689de09858d5.pdf', '2936425836271', 'E18T2000002', '', '2018-05-07 15:39:02', NULL, '1', '2018-04-27', '-6.920470,107.609961', 'repository/lampiran/permohonan/foto/foto119add53b649d1946443228cd2df3a3f5.jpg', 'repository/lampiran/permohonan/foto/foto219add53b649d1946443228cd2df3a3f5.jpg', 'repository/lampiran/permohonan/foto/foto319add53b649d1946443228cd2df3a3f5.jpg', 'repository/lampiran/permohonan/foto/foto419add53b649d1946443228cd2df3a3f5.jpg', 'repository/lampiran/permohonan/foto/foto519add53b649d1946443228cd2df3a3f5.jpg', '330/LHPP/SDE/IV/2018, Tanggal 07 Mei 2018', 'repository/lampiran/permohonan/lhpp4d2ee0c3fe6990858c0e4d3434e11c15.pdf', '04N.P.20.425.3273.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04O', 'SDE-0705186338', 'PT. PULO DAMAR ABADI', '005/SLO-PDA/II/2018', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa Barat', 'repository/slo/permohonan/a859fac74c5725e8d955f80673ba9b4d.pdf', '1295857814459', 'E18T2000004', '', '2018-05-07 17:49:28', NULL, '1', '2018-02-21', '-6.254097,106.814322', 'repository/lampiran/permohonan/foto/foto1c4d921d0088aaa9bc1d265aefc330ed8.jpg', 'repository/lampiran/permohonan/foto/foto2c4d921d0088aaa9bc1d265aefc330ed8.jpg', 'repository/lampiran/permohonan/foto/foto3c4d921d0088aaa9bc1d265aefc330ed8.jpg', 'repository/lampiran/permohonan/foto/foto4c4d921d0088aaa9bc1d265aefc330ed8.jpg', 'repository/lampiran/permohonan/foto/foto5c4d921d0088aaa9bc1d265aefc330ed8.jpg', '329/LHPP/SDE/V/2018, Tanggal 03 Mei 2018', 'repository/lampiran/permohonan/lhppb3013406432fba2860ce80a67e6f57a8.pdf', '04O.P.20.425.3174.GEWE.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04P', 'SDE-1605186339', 'PT. OPIK ONLINE MANDIRI', '021/OOM/SLO/IV/2018', NULL, 'Dusun Cipicung Rt. 01/01, Ds. Darmajaya Kec. Darmaraja, Kab. Sumedang - Jawa Barat', 'repository/slo/permohonan/b16d75635cfe86c3b6da1fadb281ff04.pdf', '4804350536134', 'E18T2000005', '', '2018-05-16 09:45:15', NULL, '1', '2018-03-23', '-6.803243,107.949527', 'repository/lampiran/permohonan/foto/foto1214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/lampiran/permohonan/foto/foto2214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/lampiran/permohonan/foto/foto3214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/lampiran/permohonan/foto/foto4214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/lampiran/permohonan/foto/foto5214db63d1d570a472e1a7cb9a192316a.jpg', '328/LHPP/SDE/V/2018, Tanggal 09 Mei 2018', 'repository/lampiran/permohonan/lhpp5d6109fb5e49c16f834537b9e8f024f1.pdf', '04P.P.20.428.3211.JE45.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04S', 'SDE-2105186342', 'PT. ERA JAYA SAKTI BERSAMA', '028/PER-SLO/EJBS/18', NULL, 'Jl. Raya Pagedangan Kp. Cicayur I Rt.01/02 No. 2 Ds. Pegedangan Kec. Pagedangan Kab. Tangerang Banten', 'repository/slo/permohonan/bb7827a8f36556ffbeafb3caeedfdf03.pdf', '7603080884072', 'E18T2000008', '', '2018-05-21 10:12:46', NULL, '1', '2018-05-07', '-6.131863,106.568230', 'repository/lampiran/permohonan/foto/foto11a188874f35c36c1a5ee8db3dbf87524.jpg', 'repository/lampiran/permohonan/foto/foto2371c40b0302b5dfbf951a64bccb9f553.jpg', 'repository/lampiran/permohonan/foto/foto31a188874f35c36c1a5ee8db3dbf87524.jpg', 'repository/lampiran/permohonan/foto/foto41a188874f35c36c1a5ee8db3dbf87524.jpg', 'repository/lampiran/permohonan/foto/foto51a188874f35c36c1a5ee8db3dbf87524.jpg', '332/LHPP/SDE/V/2018, Tanggal 16 Mei 2018', 'repository/lampiran/permohonan/lhpp54b46f6664a5bbf9e73379140eb49fe6.pdf', '04S.P.20.428.3603.JA24.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04R', 'SDE-2105186341', 'PT. SINAR ANISA MANDIRI', '29/SP-SAM/V/2018', NULL, 'Jl. Kali Jambe NO. 50 Rt. 03/04 Lambang Sari Tambun Selatan Bekasi', 'repository/slo/permohonan/d248c9a578f6085fed07b6584d71a763.pdf', '2759046644304', 'E18T2000007', '', '2018-05-21 09:08:20', NULL, '1', '2018-05-07', '-6.332401,107.183924', 'repository/lampiran/permohonan/foto/foto1fb1d07318f6351b4dc4732f4883c1152.jpg', 'repository/lampiran/permohonan/foto/foto2fb1d07318f6351b4dc4732f4883c1152.jpg', 'repository/lampiran/permohonan/foto/foto3fb1d07318f6351b4dc4732f4883c1152.jpg', 'repository/lampiran/permohonan/foto/foto4fb1d07318f6351b4dc4732f4883c1152.jpg', 'repository/lampiran/permohonan/foto/foto5fb1d07318f6351b4dc4732f4883c1152.jpg', '333/LHPP/SDE/V/2018, Tanggal 18 Mei 2018', 'repository/lampiran/permohonan/lhpp9f26107ae1a8cd94556078a4ebc115d6.pdf', '04R.P.20.421.3275.JEBA.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04U', 'SDE-2205186344', 'PT. MULIA CEMERLANG ABADI MULTI INDUSTRY', '1043/SKBM-MCA/IV/2018', NULL, 'Jl. Raya Siliwangi Km. 24 Rt. 004/002, Ds. Benda Cicurug Sukabumi ', 'repository/slo/permohonan/b25a6c82f44cd8cdc411e9b877dd555c.pdf', '1202874140308', 'E18T2000010', '', '2018-05-22 10:59:18', NULL, '1', '2018-04-20', '-6.755395,106.798840', 'repository/lampiran/permohonan/foto/foto1fc01277135303c153fcc22ce6d2ddaec.jpg', 'repository/lampiran/permohonan/foto/foto2fc01277135303c153fcc22ce6d2ddaec.jpg', 'repository/lampiran/permohonan/foto/foto3fc01277135303c153fcc22ce6d2ddaec.jpg', 'repository/lampiran/permohonan/foto/foto4fc01277135303c153fcc22ce6d2ddaec.jpg', 'repository/lampiran/permohonan/foto/foto5fc01277135303c153fcc22ce6d2ddaec.jpg', '331/LHPP/SDE/V/2018, Tanggal 16 Mei 2018', 'repository/lampiran/permohonan/lhppb57b6b5ef4842a952349976e09449153.pdf', '04U.P.20.428.3272.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04T', 'SDE-2105186343', 'PT. LITA MEKANIKAL ELEKTRIKAL ', '81/LME/SLO/V/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/d7014e7c541b53096f79df7c032f400b.pdf', '7946531617658', 'E18T2000009', '', '2018-05-21 15:24:37', NULL, '1', '2018-05-14', '-6.5086690,107.6160830', 'repository/lampiran/permohonan/foto/foto164d8356e44da18515950646e090fc0a2.jpg', 'repository/lampiran/permohonan/foto/foto264d8356e44da18515950646e090fc0a2.jpg', 'repository/lampiran/permohonan/foto/foto364d8356e44da18515950646e090fc0a2.jpg', 'repository/lampiran/permohonan/foto/foto464d8356e44da18515950646e090fc0a2.jpg', 'repository/lampiran/permohonan/foto/foto564d8356e44da18515950646e090fc0a2.jpg', '335/LHPP/SDE/V/2018, Tanggal 21 Mei 2018', 'repository/lampiran/permohonan/lhppd7014e7c541b53096f79df7c032f400b.pdf', '04T.P.20.428.3213.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04Y', 'SDE-0406186348', 'PT. HATIRE', '017/PPM/HRD-HAT/IV/2018', NULL, 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blok C5 No. 5 Cikarang Bekasi', 'repository/slo/permohonan/bcb072dbfd32549596ee51cb36586152.pdf', NULL, 'G18T2000005', '', '2018-06-04 13:56:40', NULL, '1', '2018-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 3, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('04W', 'SDE-2305186346', 'PT. AULIA DANARDANA', '0112/AD/IV/2018', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/98948e5337730b0033c440a083bd471d.pdf', '1537793168724', 'F18T2000006', '', '2018-05-23 15:14:31', NULL, '1', '2018-04-24', '-2.506276,104.524320', 'repository/lampiran/permohonan/foto/foto128a877509e07044b261a1322fe0cf3a8.jpg', 'repository/lampiran/permohonan/foto/foto298948e5337730b0033c440a083bd471d.jpg', 'repository/lampiran/permohonan/foto/foto398948e5337730b0033c440a083bd471d.jpg', 'repository/lampiran/permohonan/foto/foto498948e5337730b0033c440a083bd471d.jpg', 'repository/lampiran/permohonan/foto/foto598948e5337730b0033c440a083bd471d.jpg', '335/LHPP/SDE/V/2018, Tanggal 21 Mei 2018', 'repository/lampiran/permohonan/lhpp98948e5337730b0033c440a083bd471d.pdf', '04W.U.20.311.1E15.GEEE.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04X', 'SDE-0106186347', 'PT. VALVIO INTI PRIMA', '216/VIP.PKP/V/2018', NULL, 'Jl. KH. Hasan Basri RT.01/02 Ds. Rawa    Bangun Kec. Taman, Sari Pangkal Pinang', 'repository/slo/permohonan/0f5ef5415372a14c345b9e6e8b7d1d07.pdf', '1724059671969', 'F18T2000001', '', '2018-06-01 15:25:55', NULL, '1', '2018-05-18', '-1.92571,106.16288', 'repository/lampiran/permohonan/foto/foto16fd0664dcd2e07cade11d4d183b92742.jpg', 'repository/lampiran/permohonan/foto/foto26fd0664dcd2e07cade11d4d183b92742.jpg', 'repository/lampiran/permohonan/foto/foto36fd0664dcd2e07cade11d4d183b92742.jpg', 'repository/lampiran/permohonan/foto/foto46fd0664dcd2e07cade11d4d183b92742.jpg', 'repository/lampiran/permohonan/foto/foto56fd0664dcd2e07cade11d4d183b92742.jpg', '337/LHPP/SDE/V/2018', 'repository/lampiran/permohonan/lhpp958adb134365bdb8cddbf6b36293dd3b.pdf', '04X.P.20.428.1901.CV05.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('04Z', 'SDE-0406186349', 'PT. HATIRE', '017/PPM/HRD-HAT/IV/2018', NULL, 'Hyundai Int\'l Industrial Estate, Jl. Inti Raya Blok C5 No. 5 Cikarang Bekasi', 'repository/slo/permohonan/9a4b5f1667b443b08e46e98b9f51b7f1.pdf', '6602127491591', 'F18T2000002', '', '2018-06-04 14:04:31', NULL, '1', '2018-04-27', '-6.286186,107.090352', 'repository/lampiran/permohonan/foto/foto1916dcabdd09a858a0434abe82bab5aab.jpg', 'repository/lampiran/permohonan/foto/foto2916dcabdd09a858a0434abe82bab5aab.jpg', 'repository/lampiran/permohonan/foto/foto3916dcabdd09a858a0434abe82bab5aab.jpg', 'repository/lampiran/permohonan/foto/foto4916dcabdd09a858a0434abe82bab5aab.jpg', 'repository/lampiran/permohonan/foto/foto5916dcabdd09a858a0434abe82bab5aab.jpg', '338/LHPP/SDE/VI/2018, Tanggal 02 Juni 2018 ', 'repository/lampiran/permohonan/lhpp08ad7da45ac51cae9b0cc90d25b9362f.pdf', '04Z.P.20.428.3275.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('050', 'SDE-0606186350', 'PT. VALVIO INTI PRIMA', '215/VIP.PKP/V/2018', NULL, 'KH. Hasan Basri Rt. 01/02, Ds. Rawa Bangun Kec. Taman Sari Pangkalpinang', 'repository/slo/permohonan/4a6b523b466128c31f34ccb144ca0579.pdf', '1461142090379', 'F18T2000003', '', '2018-06-06 08:43:10', NULL, '1', '2018-05-18', '-2.114739,106.141511', 'repository/lampiran/permohonan/foto/foto121e4eda8d1bc5737dd8efea685d0dd0b.jpg', 'repository/lampiran/permohonan/foto/foto221e4eda8d1bc5737dd8efea685d0dd0b.jpg', 'repository/lampiran/permohonan/foto/foto321e4eda8d1bc5737dd8efea685d0dd0b.jpg', 'repository/lampiran/permohonan/foto/foto421e4eda8d1bc5737dd8efea685d0dd0b.jpg', 'repository/lampiran/permohonan/foto/foto521e4eda8d1bc5737dd8efea685d0dd0b.jpg', '339/LHPP/VI/2018, Tanggal 05 Juni 2018', 'repository/lampiran/permohonan/lhpp21e4eda8d1bc5737dd8efea685d0dd0b.pdf', '050.P.20.428.1971.CV05.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('051', 'SDE-0606186351', ' PT. SINAR ANISA MANDIRI', '30/SP-SAM/V/2018', NULL, 'Jl. Kali Jambe No. 50 Rt. 03/04 Lambangsari Tambun Selatan Bekasi', 'repository/slo/permohonan/68abb33645364891168eafcc6dddf65e.pdf', '3508467792644', 'F18T2000004', '', '2018-06-06 15:46:51', NULL, '1', '2018-05-25', '-6.262750,107.140276', 'repository/lampiran/permohonan/foto/foto17921680a7e478d81e7a9139454cba32a.jpg', 'repository/lampiran/permohonan/foto/foto27921680a7e478d81e7a9139454cba32a.jpg', 'repository/lampiran/permohonan/foto/foto37921680a7e478d81e7a9139454cba32a.jpg', 'repository/lampiran/permohonan/foto/foto47921680a7e478d81e7a9139454cba32a.jpg', 'repository/lampiran/permohonan/foto/foto51fe8e20dad52da635694af791c1973cf.jpg', '340/LHPP/SDE/VI/2018, Tanggal 06 Juni 2018 ', 'repository/lampiran/permohonan/lhpp7921680a7e478d81e7a9139454cba32a.pdf', '051.P.20.423.3275.JEBA.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('052', 'SDE-0706186352', 'PT. SINAR ANISA MANDIRI', '030/SAM/IV/2018', NULL, 'Jl. Kalijambe Rt. 002/004, Desa Lambangsari, Kec. Tambun Kab. Bekasi - Jawa Barat', 'repository/slo/permohonan/213cca75d289bd9c9d1152c2a48e12ae.pdf', '3111912871281', 'F18T2000005', '', '2018-06-07 13:38:58', NULL, '1', '2018-05-28', '-6.3278190,107.1602160', 'repository/lampiran/permohonan/foto/foto1199a6513621224ff861cf2335a2d24b8.jpg', 'repository/lampiran/permohonan/foto/foto2199a6513621224ff861cf2335a2d24b8.jpg', 'repository/lampiran/permohonan/foto/foto3199a6513621224ff861cf2335a2d24b8.jpg', 'repository/lampiran/permohonan/foto/foto4199a6513621224ff861cf2335a2d24b8.jpg', 'repository/lampiran/permohonan/foto/foto5199a6513621224ff861cf2335a2d24b8.jpg', '342/LHPPSDE/VI/2018, Tanggal 07 Juni 2018', 'repository/lampiran/permohonan/lhpp199a6513621224ff861cf2335a2d24b8.pdf', '052.P.20.426.3275.JEBA.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('053', 'SDE-2206186353', 'PT. AULIA DANARDANA', '0132/AD/VI/2018', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/4c72230dceaa117ee7673ef3b0787962.pdf', NULL, NULL, '', '2018-06-22 09:54:56', NULL, '1', '2018-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('054', 'SDE-2206186354', 'PT. AULIA DANARDANA', '0132/AD/VI/2018', NULL, 'Graha Aulia Kalimalang Square Blok G, Jl. KH. Noer Ali Rt. 07/03 Kel. Pekayon Raya', 'repository/slo/permohonan/913a6ceef2d095b9f4ffceefc7e3ad90.pdf', '8016736059273', 'G18T2000002', '', '2018-06-22 10:03:43', NULL, '1', '2018-05-23', '-4.34131,104.837139', 'repository/lampiran/permohonan/foto/foto1cb48916423db52b8f0159d757b8b6280.jpg', 'repository/lampiran/permohonan/foto/foto2cb48916423db52b8f0159d757b8b6280.jpg', 'repository/lampiran/permohonan/foto/foto3cb48916423db52b8f0159d757b8b6280.jpg', 'repository/lampiran/permohonan/foto/foto4cb48916423db52b8f0159d757b8b6280.jpg', 'repository/lampiran/permohonan/foto/foto5cb48916423db52b8f0159d757b8b6280.jpg', '343/LHPP/SDE/VI/2018, Tanggal 04 Juni 2018', 'repository/lampiran/permohonan/lhppcb48916423db52b8f0159d757b8b6280.pdf', '054.U.20.311.1U15.GEEE.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('055', 'SDE-2906186355', 'PT. ABC', '222', NULL, 'little cina', 'repository/slo/permohonan/1cd44a7b94ae6e106ef90085bb5fcf93.jpg', NULL, NULL, '', '2018-06-29 10:55:30', NULL, '1', '2018-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('056', 'SDE-3006186356', 'testing', '2', NULL, 'test', 'repository/slo/permohonan/90a69266e2a22daf9e8e2e062391d499.jpg', NULL, 'G18T2000003', '', '2018-06-30 13:27:37', NULL, '1', '2018-06-30', '-2.506276,104.524320', NULL, NULL, NULL, NULL, NULL, '222', NULL, '056.U.20.311.1T11.AAA.18', NULL, 3, 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 71, 'ABDUL KHODIR', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 0, NULL),
('057', 'SDE-3006186357', 'PT. TERUNA JAYA TEKNIK', '034/SLO-TM/TJT/VI/2018', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti Cirebon', 'repository/slo/permohonan/f222901fa5e0eeeed308ad3a40787db5.pdf', NULL, NULL, '', '2018-06-30 14:16:35', NULL, '1', '2018-06-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('058', 'SDE-3006186358', 'PT. TERUNA JAYA TEKNIK', '034/SLO-TM/TJT/VI/2018', NULL, 'Jl. Permata Raya III D2 No. 42 Kalijaga Harjamukti Cirebon', 'repository/slo/permohonan/36a86015323250b6d6f9449bdf72ce38.pdf', '1677949439975', 'G18T2000001', '', '2018-06-30 14:21:32', NULL, '1', '2018-06-04', '-6.609173,107.955336', 'repository/lampiran/permohonan/foto/foto10f0d8ce086e6898565d24f1ebef053f8.jpg', 'repository/lampiran/permohonan/foto/foto20f0d8ce086e6898565d24f1ebef053f8.jpg', 'repository/lampiran/permohonan/foto/foto30f0d8ce086e6898565d24f1ebef053f8.jpg', 'repository/lampiran/permohonan/foto/foto40f0d8ce086e6898565d24f1ebef053f8.jpg', 'repository/lampiran/permohonan/foto/foto50f0d8ce086e6898565d24f1ebef053f8.jpg', '346/LHPP/SDE/VI/2018, 29 Juni 2018', 'repository/lampiran/permohonan/lhppfd38f6efe82479cd5fad34c2af6884e3.pdf', '058.P.20.428.3212.JEBM.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('059', 'SDE-0207186359', 'PT. PRATAMA TUNAS NUSANTARA', '021/PTN/PM/V/2018', NULL, 'Emerald Commercial, Jl. Bulevar Selatan Blok UA - 08 Summarecon Bekasi ', 'repository/slo/permohonan/89cf134d7b1ffbbbf1875c1bd3e2bce2.pdf', '2417766349939', 'G18T2000004', '', '2018-07-02 14:20:05', NULL, '1', '2018-05-30', '-6.474671,107.572152', 'repository/lampiran/permohonan/foto/foto1f9cc672bee0dd1fa26802f871ea02136.jpg', 'repository/lampiran/permohonan/foto/foto2f9cc672bee0dd1fa26802f871ea02136.jpg', 'repository/lampiran/permohonan/foto/foto3f9cc672bee0dd1fa26802f871ea02136.jpg', 'repository/lampiran/permohonan/foto/foto4f9cc672bee0dd1fa26802f871ea02136.jpg', 'repository/lampiran/permohonan/foto/foto5f9cc672bee0dd1fa26802f871ea02136.jpg', '341/LHPP/SDE/VI/2018, Tanggal 29 Juni 2018', 'repository/lampiran/permohonan/lhpp5e1885c5e40f6406d77a219d8054e874.pdf', '059.P.20.428.3213.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05A', 'SDE-0307186360', 'PT. LITA MEKANIKAL ELEKTRIKAL', '87/LME/SLO/VI/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/45bcd3599b36926c91a4edffb4b94cc6.pdf', '2785530898874', 'G18T2000006', '', '2018-07-03 10:52:53', NULL, '1', '2018-06-19', '-6.395687,106.822233', 'repository/lampiran/permohonan/foto/foto1603ba393c52fda85e7c8c2cc71ae8c57.jpg', 'repository/lampiran/permohonan/foto/foto2603ba393c52fda85e7c8c2cc71ae8c57.jpg', 'repository/lampiran/permohonan/foto/foto3603ba393c52fda85e7c8c2cc71ae8c57.jpg', 'repository/lampiran/permohonan/foto/foto4603ba393c52fda85e7c8c2cc71ae8c57.jpg', 'repository/lampiran/permohonan/foto/foto5603ba393c52fda85e7c8c2cc71ae8c57.jpg', '348/LHPP/SDE/VI/2018, Tanggal 29 Juni 2018', 'repository/lampiran/permohonan/lhpp603ba393c52fda85e7c8c2cc71ae8c57.pdf', '05A.P.20.425.3276.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05B', 'SDE-0407186361', 'PT. LITA MEKANIKAL ELEKTRIKAL', '83/LME/SLO/V/2018', NULL, 'Kp. Lengkong Barang Rt. 03/03 Iwul Parung Kab. Bogor Jawa Barat', 'repository/slo/permohonan/f11476f32b2188a2373851945de01f46.pdf', '1564768981041', 'G18T2000007', '', '2018-07-04 12:40:05', NULL, '1', '2018-05-31', '-6.226154,106.996488', 'repository/lampiran/permohonan/foto/foto1e939d37ec1a39b73a107c06eec80a775.jpg', 'repository/lampiran/permohonan/foto/foto2e939d37ec1a39b73a107c06eec80a775.jpg', 'repository/lampiran/permohonan/foto/foto3e939d37ec1a39b73a107c06eec80a775.jpg', 'repository/lampiran/permohonan/foto/foto4e939d37ec1a39b73a107c06eec80a775.jpg', 'repository/lampiran/permohonan/foto/foto5e939d37ec1a39b73a107c06eec80a775.jpg', '347/LHPP/SDE/VII/2018, Tanggal 02 Juli 2018', 'repository/lampiran/permohonan/lhpp49ae6de37725cef7a222eebef6e5bada.pdf', '05B.P.20.424.3275.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05C', 'SDE-0907186362', 'PT. PULO DAMAR ABADI', '011/SLO-PDA/VI/2018', NULL, 'Perum Bumi Teluk Jambe Blok I/33 Karawang - Jawa Barat', 'repository/slo/permohonan/3c5603ae7f675f75e52c63dc6b59ede0.pdf', '2781942793506', 'G18T2000008', '', '2018-07-09 10:03:31', NULL, '1', '2018-06-26', '-6.351407,107.336455', 'repository/lampiran/permohonan/foto/foto134a6f79572e201b39283d8b75704f74b.jpg', 'repository/lampiran/permohonan/foto/foto2f1e1b41cafaad7a1fa2cf4d7cb58d51e.jpg', 'repository/lampiran/permohonan/foto/foto3f1e1b41cafaad7a1fa2cf4d7cb58d51e.jpg', 'repository/lampiran/permohonan/foto/foto4f1e1b41cafaad7a1fa2cf4d7cb58d51e.jpg', 'repository/lampiran/permohonan/foto/foto5f1e1b41cafaad7a1fa2cf4d7cb58d51e.jpg', '350/LHPP/SDE/VII/2018, Tanggal 04 Juli 2018', 'repository/lampiran/permohonan/lhpp3c5603ae7f675f75e52c63dc6b59ede0.pdf', '05C.P.20.428.3215.0000.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05D', 'SDE-1007186363', 'LINKDATA CITRA MANDIRI', '002/LMS-PLMBG/ELK-VII/2018', NULL, 'Jl. Yahya Rt. 003/007 Kel. Sukabumi Utara Kec. Kebon Jeruk Jakarta', 'repository/slo/permohonan/9ca6f50734b4f0672b3a8e7be262bcd4.pdf', NULL, NULL, '', '2018-07-10 08:52:48', NULL, '1', '2018-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL),
('05E', 'SDE-1007186364', 'LINKDATA CITRA MANDIRI', '002/LMS-PLMBG/ELK-VII/2018', NULL, 'Jl. Yahya Rt. 003/007 Kel. Sukabumi Utara Kec. Kebon Jeruk Jakarta', 'repository/slo/permohonan/44dcf90b249a6d0ca0c53ed50c69a8ce.pdf', '2750955542697', 'G18T2000009', '', '2018-07-10 09:20:30', NULL, '1', '2018-06-28', '-3.0348480, 104.7949120', 'repository/lampiran/permohonan/foto/foto1d0f09d651d2f0dce9da877222d084d45.jpg', 'repository/lampiran/permohonan/foto/foto2d0f09d651d2f0dce9da877222d084d45.jpg', 'repository/lampiran/permohonan/foto/foto3d0f09d651d2f0dce9da877222d084d45.jpg', 'repository/lampiran/permohonan/foto/foto4d0f09d651d2f0dce9da877222d084d45.jpg', 'repository/lampiran/permohonan/foto/foto5d0f09d651d2f0dce9da877222d084d45.jpg', '351/LHPP/SDE/VII/2018, Tanggal 05 Juli 2018', 'repository/lampiran/permohonan/lhpp48643d3f30471174b7d5f736cbb32871.pdf', '05E.P.20.426.1607.GEWI.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05F', 'SDE-1007186365', 'PT. CAHAYA TIRTAMAS UTAMA', '5/KMJ-K/VI/2018', NULL, 'Jl. Sukaati No. 43 Mengger Bandung', 'repository/slo/permohonan/da04c7c185f0d75dbb6baf752f134371.pdf', '1122291064958', 'G18T2000010', '', '2018-07-10 10:30:10', NULL, '1', '2018-06-14', '-6.974667, 107.691556', 'repository/lampiran/permohonan/foto/foto18f0f4b34ef1ecee785f14fa3fffb8631.jpg', 'repository/lampiran/permohonan/foto/foto28f0f4b34ef1ecee785f14fa3fffb8631.jpg', 'repository/lampiran/permohonan/foto/foto38f0f4b34ef1ecee785f14fa3fffb8631.jpg', 'repository/lampiran/permohonan/foto/foto48f0f4b34ef1ecee785f14fa3fffb8631.jpg', 'repository/lampiran/permohonan/foto/foto58f0f4b34ef1ecee785f14fa3fffb8631.jpg', '334/LHPP/SDE/VII/2018, Tanggal 09 Juli 2018', 'repository/lampiran/permohonan/lhpp8f0f4b34ef1ecee785f14fa3fffb8631.pdf', '05F.P.20.428.3204.GE03.18', NULL, 4, 70, 'H. ARIEF AZHARI, ST', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 72, 'SANURI', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 0, NULL),
('05G', 'SDE-1007186366', 'PT. CAHAYA TIRTAMAS UTAMA', '5/KMJ-K/VI/2018', NULL, 'Jl. Sukaati No. 43 Mengger Bandung', 'repository/slo/permohonan/e9a2512f76e148049b138fde88c6ceda.pdf', NULL, NULL, '', '2018-07-10 15:19:58', NULL, '1', '2018-06-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_pesan`
--

CREATE TABLE `t_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `tgl_waktu` datetime DEFAULT NULL,
  `isi_pesan` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pesan`
--

INSERT INTO `t_pesan` (`id_pesan`, `id_pemohon`, `tgl_waktu`, `isi_pesan`) VALUES
(1, '004', '2017-06-15 09:18:31', 'tes'),
(2, '008', '2017-07-21 08:20:44', 'PT. Krakatau Tirta Industri, daya tersambung dari PLN +- 3000 KVA. dikarenakan BP/UJL PLN dengan daya 3000 KVA tidak mencukupi untuk pengadaan material, konsumen disarankan untuk mengajukan permohonan dengan daya 5900 KVA. sedangkan yang akan disambung PLN adalah daya 3000 kva.'),
(3, '008', '2017-07-21 08:21:36', 'Sebagai bahan evaluasi kami lampirkan berita acara penyambungan PLN dengan pembatas CT 150 A'),
(4, '00M', '2017-08-11 09:26:19', 'Untuk Surat Keterangan Non Instalatir dari konsumen sudah di upload  di dalam upload-an SIP/SPJBTL'),
(5, '013', '2017-10-10 17:48:56', 'ada koreksi wilayah distribusi, adalah sumatera selatan bukan sumatera utara..trm ksh.'),
(6, '01U', '2017-11-22 11:08:12', 'Hotel horison bengkulu ini adalah perubahan dari Grage Hotel, yang mana bangunan hotel tersebut diperbaharui dan berganti nama menjadi Hotel Horison'),
(7, '020', '2017-12-06 08:24:53', 'Untuk PT. Indonesia Multi Colour Printing (Surabaya) memang ada 2 permohonan dikarenakan ada ada 2 cabang-nya di surabaya dengan alamat yang berbeda.'),
(8, '020', '2017-12-06 08:27:04', 'Untuk surat keterangan Non Instalatir sudah di sertakan bersamaan dengan Surat Permohonan pada file upload surat permohonan kedua perusahaan tersebut.'),
(9, '040', '2018-03-12 15:30:49', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `t_satuan_kapasitas`
--

CREATE TABLE `t_satuan_kapasitas` (
  `id` varchar(10) NOT NULL,
  `nama` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_satuan_kapasitas`
--

INSERT INTO `t_satuan_kapasitas` (`id`, `nama`) VALUES
('kVA', 'kVA'),
('kW', 'kW'),
('kWp', 'kWp');

-- --------------------------------------------------------

--
-- Table structure for table `t_sistem_jaringan`
--

CREATE TABLE `t_sistem_jaringan` (
  `id` int(11) NOT NULL,
  `sistem_jaringan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sistem_jaringan`
--

INSERT INTO `t_sistem_jaringan` (`id`, `sistem_jaringan`) VALUES
(1, 'Wilayah Aceh'),
(2, 'Wilayah Sumatera Utara'),
(3, 'Wilayah Sumatera Barat'),
(4, 'Wilayah Riau Dan Kepulauan Riau'),
(5, 'Wilayah Bangka Belitung'),
(6, 'Wilayah Sumatera selatan, Jambi dan Bengkulu'),
(7, 'Wilayah Kalimantan Barat'),
(8, 'Wilayah Kalimantan selatan dan Tengah'),
(9, 'Wilayah Kalimantan Timur'),
(10, 'Wilayah Sulawesi Utara, Tengah dan Gorontalo'),
(11, 'Wilayah Sulawesi Selatan, Tenggara dan Barat'),
(12, 'Wilayah Maluku dan Maluku Utara'),
(13, 'Wilayah Nusa Tengara Barat'),
(14, 'Wilayah Nusa Tenggara Timur'),
(15, 'Wilayah Papua dan Papua Barat'),
(16, 'Wilayah Distribusi DKI Jaya dan Tangerang'),
(17, 'Wilayah Distribusi Jabar dan Banten'),
(18, 'Wilayah Distribusi Jawa Timur'),
(19, 'Wilayah Distribusi Jawa Tengah dan DI Yogyakarta'),
(20, 'Wilayah Distribusi Bali'),
(21, 'Wilayah Distribusi Lampung');

-- --------------------------------------------------------

--
-- Table structure for table `t_status`
--

CREATE TABLE `t_status` (
  `id_status` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `no_NomorPermohonan` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_status_api`
--

CREATE TABLE `t_status_api` (
  `id_status` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `code_status` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_surat_perjanjian`
--

CREATE TABLE `t_surat_perjanjian` (
  `id_surat_perjanjian` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `nomor` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `file_jual_beli` varchar(255) DEFAULT NULL,
  `file_sld` varchar(255) DEFAULT NULL,
  `file_gitl` varchar(255) DEFAULT NULL,
  `file_jki` varchar(255) DEFAULT NULL,
  `file_spui` varchar(255) DEFAULT NULL,
  `file_io` varchar(255) DEFAULT NULL,
  `file_npwp` varchar(255) DEFAULT NULL,
  `file_pkp` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_surat_perjanjian`
--

INSERT INTO `t_surat_perjanjian` (`id_surat_perjanjian`, `id_pemohon`, `nomor`, `tanggal`, `file_jual_beli`, `file_sld`, `file_gitl`, `file_jki`, `file_spui`, `file_io`, `file_npwp`, `file_pkp`) VALUES
(15, '00B', '006.b.PJ/161/A.YGK/2015', '2015-02-25', 'repository/slo/perjanjianjualbeli/filejb671d0acfb4610364f0da0eb2b8d1135a.pdf', 'repository/slo/perjanjianjualbeli/filesld3ad12563c2a6476d880129a6af1fca11.pdf', 'repository/slo/perjanjianjualbeli/filegitl15235d978b81bbe5c88e93ca19b2ce93.pdf', 'repository/slo/perjanjianjualbeli/filejkid8c9152bdf4cd746b56be99c9d4feda3', 'repository/slo/perjanjianjualbeli/compresspdf_bhHbKP6C.pdf', 'repository/slo/perjanjianjualbeli/fileiod8c9152bdf4cd746b56be99c9d4feda3', 'repository/slo/perjanjianjualbeli/filenpwpd8c9152bdf4cd746b56be99c9d4feda3', 'repository/slo/perjanjianjualbeli/filepkpd8c9152bdf4cd746b56be99c9d4feda3'),
(14, '00A', '0327/AGA.01.01/A.BLG/2016', '2016-12-23', 'repository/slo/perjanjianjualbeli/filejbe84ddca84df4346549ba30b0f98dd568.pdf', 'repository/slo/perjanjianjualbeli/fileslde84ddca84df4346549ba30b0f98dd568.pdf', 'repository/slo/perjanjianjualbeli/filegitle84ddca84df4346549ba30b0f98dd568.pdf', 'repository/slo/perjanjianjualbeli/filejkie84ddca84df4346549ba30b0f98dd568', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileioe84ddca84df4346549ba30b0f98dd568', 'repository/slo/perjanjianjualbeli/filenpwpe84ddca84df4346549ba30b0f98dd568', 'repository/slo/perjanjianjualbeli/filepkpe84ddca84df4346549ba30b0f98dd568'),
(13, '009', '0023/AGA01.01/A.CRB/2017', '2017-03-23', 'repository/slo/perjanjianjualbeli/filejb901cf03cf810254caa41856600143525.pdf', 'repository/slo/perjanjianjualbeli/filesld901cf03cf810254caa41856600143525.pdf', 'repository/slo/perjanjianjualbeli/filegitl901cf03cf810254caa41856600143525.pdf', 'repository/slo/perjanjianjualbeli/filejki1838a8d549eb211872d3aa43caae8b4e', 'repository/slo/perjanjianjualbeli/SPESIFIKASI_INSTALASI.pdf', 'repository/slo/perjanjianjualbeli/fileio1838a8d549eb211872d3aa43caae8b4e', 'repository/slo/perjanjianjualbeli/filenpwp1838a8d549eb211872d3aa43caae8b4e', 'repository/slo/perjanjianjualbeli/filepkp1838a8d549eb211872d3aa43caae8b4e'),
(4, '004', '0430/AGA.01.01/A.SMG/2016', '2016-12-02', 'repository/slo/perjanjianjualbeli/filejb983277094d825687b027729452c1f7d3.pdf', 'repository/slo/perjanjianjualbeli/filesld46e75100a75bdf7b4701a96cd90d2750.pdf', 'repository/slo/perjanjianjualbeli/filegitl983277094d825687b027729452c1f7d3.pdf', 'repository/slo/perjanjianjualbeli/filejki5af613d6fe698f54010ca12a2c77d587', 'repository/slo/perjanjianjualbeli/Spesifikasi_Teknis.pdf', 'repository/slo/perjanjianjualbeli/fileio5af613d6fe698f54010ca12a2c77d587', 'repository/slo/perjanjianjualbeli/filenpwp5af613d6fe698f54010ca12a2c77d587', 'repository/slo/perjanjianjualbeli/filepkp5af613d6fe698f54010ca12a2c77d587'),
(9, '005', '0072/AGA.01.01/A.PWK/2017', '2017-04-26', 'repository/slo/perjanjianjualbeli/filejb11aa5a1e449abf979491c74fb653e6bb.PDF', 'repository/slo/perjanjianjualbeli/filesld11aa5a1e449abf979491c74fb653e6bb.pdf', 'repository/slo/perjanjianjualbeli/filegitl11aa5a1e449abf979491c74fb653e6bb.pdf', 'repository/slo/perjanjianjualbeli/filejki11aa5a1e449abf979491c74fb653e6bb', 'repository/slo/perjanjianjualbeli/Spesifikasi_Teknis.pdf', 'repository/slo/perjanjianjualbeli/fileio11aa5a1e449abf979491c74fb653e6bb', 'repository/slo/perjanjianjualbeli/filenpwp11aa5a1e449abf979491c74fb653e6bb', 'repository/slo/perjanjianjualbeli/filepkp11aa5a1e449abf979491c74fb653e6bb'),
(10, '006', '032.PJ/AGA.01.01/A.GPI/2017', '2017-04-27', 'repository/slo/perjanjianjualbeli/filejbedffb0086376953af95f2e751c994b0e.pdf', 'repository/slo/perjanjianjualbeli/filesld02bdffec3e4414f3040d18fa8ffac4e9.pdf', 'repository/slo/perjanjianjualbeli/filegitl02bdffec3e4414f3040d18fa8ffac4e9.pdf', 'repository/slo/perjanjianjualbeli/filejkif33a63ed11678a5be9a3cb88576b3b21', 'repository/slo/perjanjianjualbeli/Spesifikasi_Teknik.pdf', 'repository/slo/perjanjianjualbeli/fileiof33a63ed11678a5be9a3cb88576b3b21', 'repository/slo/perjanjianjualbeli/filenpwpf33a63ed11678a5be9a3cb88576b3b21', 'repository/slo/perjanjianjualbeli/filepkpf33a63ed11678a5be9a3cb88576b3b21'),
(11, '007', '0047.Pj/AGA.01.01/A.GPI/2017', '2017-06-07', 'repository/slo/perjanjianjualbeli/filejb42090b0315999889f14ee39add47fb0a.jpg', 'repository/slo/perjanjianjualbeli/filesld42090b0315999889f14ee39add47fb0a.pdf', 'repository/slo/perjanjianjualbeli/filegitl42090b0315999889f14ee39add47fb0a.pdf', 'repository/slo/perjanjianjualbeli/filejki42090b0315999889f14ee39add47fb0a', 'repository/slo/perjanjianjualbeli/SPESIFIKASI_INSTALASI.pdf', 'repository/slo/perjanjianjualbeli/fileio42090b0315999889f14ee39add47fb0a', 'repository/slo/perjanjianjualbeli/filenpwp42090b0315999889f14ee39add47fb0a', 'repository/slo/perjanjianjualbeli/filepkp42090b0315999889f14ee39add47fb0a'),
(12, '008', '0006/AGA.01.01/ABTU/2016', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejbfae731b24b41b6e5a8f47b016dd8c84e.pdf', 'repository/slo/perjanjianjualbeli/filesldaf55cf9677f3af6e0188609e9ce4c545.pdf', 'repository/slo/perjanjianjualbeli/filegitlf42b673f32665f3164425cff7e94239e.pdf', 'repository/slo/perjanjianjualbeli/filejki04fe424172b3fccd9fc3065baae7e69d', 'repository/slo/perjanjianjualbeli/Data_Teknis.compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio04fe424172b3fccd9fc3065baae7e69d', 'repository/slo/perjanjianjualbeli/filenpwp04fe424172b3fccd9fc3065baae7e69d', 'repository/slo/perjanjianjualbeli/filepkp04fe424172b3fccd9fc3065baae7e69d'),
(16, '00C', '4353509911704250100', '2017-04-27', 'repository/slo/perjanjianjualbeli/filejb9a52222e37da10eb8ac821973dcefb7c.pdf', 'repository/slo/perjanjianjualbeli/filesld9a52222e37da10eb8ac821973dcefb7c.pdf', 'repository/slo/perjanjianjualbeli/filegitl63e1b2e0ce98547313b53b4d493d828f.pdf', 'repository/slo/perjanjianjualbeli/filejkia121ad16cb23c6c7569f14ae186d35b7', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileioa121ad16cb23c6c7569f14ae186d35b7', 'repository/slo/perjanjianjualbeli/filenpwpa121ad16cb23c6c7569f14ae186d35b7', 'repository/slo/perjanjianjualbeli/filepkpa121ad16cb23c6c7569f14ae186d35b7'),
(17, '00D', '43350/160426/5468', '2017-04-27', 'repository/slo/perjanjianjualbeli/filejb22d7f125d4fd3d466c95fc147df34f6d.pdf', 'repository/slo/perjanjianjualbeli/filesld1a4e10fca5e6ad1507301f3b9253525d.pdf', 'repository/slo/perjanjianjualbeli/filegitl1a4e10fca5e6ad1507301f3b9253525d.pdf', 'repository/slo/perjanjianjualbeli/filejki22d7f125d4fd3d466c95fc147df34f6d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio22d7f125d4fd3d466c95fc147df34f6d', 'repository/slo/perjanjianjualbeli/filenpwp22d7f125d4fd3d466c95fc147df34f6d', 'repository/slo/perjanjianjualbeli/filepkp22d7f125d4fd3d466c95fc147df34f6d'),
(18, '00E', '006.b.PJ/161/A.YGK/2015', '2015-02-25', 'repository/slo/perjanjianjualbeli/filejb899e702c0447692be7442680ebf038cd.pdf', 'repository/slo/perjanjianjualbeli/filesldc282d24c2097672e8bf31cc47e18f131.pdf', 'repository/slo/perjanjianjualbeli/filegitl473beeaf052fe67d5c33103132c591c1.pdf', 'repository/slo/perjanjianjualbeli/filejkie2cdfc705fc7f9f2dd19b54777dcc2ba', 'repository/slo/perjanjianjualbeli/koba_pengestu.pdf', 'repository/slo/perjanjianjualbeli/fileioe2cdfc705fc7f9f2dd19b54777dcc2ba', 'repository/slo/perjanjianjualbeli/filenpwpe2cdfc705fc7f9f2dd19b54777dcc2ba', 'repository/slo/perjanjianjualbeli/filepkpe2cdfc705fc7f9f2dd19b54777dcc2ba'),
(19, '00F', '012.Add/AGA.01.01/A.PWK/2017', '2017-02-06', 'repository/slo/perjanjianjualbeli/filejb4c7c6b5348b3380c02c4d79782e80dce.pdf', 'repository/slo/perjanjianjualbeli/filesld22d2027bb6b90603625ae8a944cac044.pdf', 'repository/slo/perjanjianjualbeli/filegitl22d2027bb6b90603625ae8a944cac044.pdf', 'repository/slo/perjanjianjualbeli/filejki4c7c6b5348b3380c02c4d79782e80dce', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio4c7c6b5348b3380c02c4d79782e80dce', 'repository/slo/perjanjianjualbeli/filenpwp4c7c6b5348b3380c02c4d79782e80dce', 'repository/slo/perjanjianjualbeli/filepkp4c7c6b5348b3380c02c4d79782e80dce'),
(20, '00G', '0095/AGA.01.01/AREAKUP/2017', '2017-05-24', 'repository/slo/perjanjianjualbeli/filejb73345479e2409d79f125fc04a2be116a.jpg', 'repository/slo/perjanjianjualbeli/filesld549eecd60d761f338dbca9e82854a7c4.pdf', 'repository/slo/perjanjianjualbeli/filegitl549eecd60d761f338dbca9e82854a7c4.pdf', 'repository/slo/perjanjianjualbeli/filejki549eecd60d761f338dbca9e82854a7c4', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_UNDANA.pdf', 'repository/slo/perjanjianjualbeli/fileio549eecd60d761f338dbca9e82854a7c4', 'repository/slo/perjanjianjualbeli/filenpwp549eecd60d761f338dbca9e82854a7c4', 'repository/slo/perjanjianjualbeli/filepkp549eecd60d761f338dbca9e82854a7c4'),
(21, '00H', '0011.Pj/AGA.01.01/A.CRB/2017', '2017-03-23', 'repository/slo/perjanjianjualbeli/filejbfc10ca9f635ba3bca016f304bf6345c2.pdf', 'repository/slo/perjanjianjualbeli/filesldfc10ca9f635ba3bca016f304bf6345c2.pdf', 'repository/slo/perjanjianjualbeli/filegitlfc10ca9f635ba3bca016f304bf6345c2.pdf', 'repository/slo/perjanjianjualbeli/filejkifc10ca9f635ba3bca016f304bf6345c2', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._Pupuk_Indonesia_Pangan.pdf', 'repository/slo/perjanjianjualbeli/fileio914d21f9947968cc2f4d04b9044650c6', 'repository/slo/perjanjianjualbeli/filenpwp914d21f9947968cc2f4d04b9044650c6', 'repository/slo/perjanjianjualbeli/filepkp914d21f9947968cc2f4d04b9044650c6'),
(22, '00I', '553476/170427/1996', '2017-04-27', 'repository/slo/perjanjianjualbeli/filejbad36170bea740d08eef33ef1a4917711.pdf', 'repository/slo/perjanjianjualbeli/filesldad36170bea740d08eef33ef1a4917711.pdf', 'repository/slo/perjanjianjualbeli/filegitl0c3425c7749285c9714cea70cf05e4aa.pdf', 'repository/slo/perjanjianjualbeli/filejkiad36170bea740d08eef33ef1a4917711', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio55d51d550d5944bf5a84f93b1f2dceff', 'repository/slo/perjanjianjualbeli/filenpwp55d51d550d5944bf5a84f93b1f2dceff', 'repository/slo/perjanjianjualbeli/filepkp55d51d550d5944bf5a84f93b1f2dceff'),
(23, '00J', '0020/AGA.01.01/A.GPI/2017', '2017-03-16', 'repository/slo/perjanjianjualbeli/filejb68e8b13b01a49eec394b69120827a96d.pdf', 'repository/slo/perjanjianjualbeli/filesld92399871f9fae845c58b787279f74b3e.pdf', 'repository/slo/perjanjianjualbeli/filegitl92399871f9fae845c58b787279f74b3e.pdf', 'repository/slo/perjanjianjualbeli/filejki92399871f9fae845c58b787279f74b3e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Yayasan_Al-Fityan.pdf', 'repository/slo/perjanjianjualbeli/fileio971703aa4234d02af56a8599781e8c0f', 'repository/slo/perjanjianjualbeli/filenpwp971703aa4234d02af56a8599781e8c0f', 'repository/slo/perjanjianjualbeli/filepkp971703aa4234d02af56a8599781e8c0f'),
(24, '00K', '562400511702205945', '2017-02-20', 'repository/slo/perjanjianjualbeli/filejbee3a8e113dc4718e4321f4233dbadb21.pdf', 'repository/slo/perjanjianjualbeli/filesldee3a8e113dc4718e4321f4233dbadb21.pdf', 'repository/slo/perjanjianjualbeli/filegitl59408196a471229968d66f99c8040af5.pdf', 'repository/slo/perjanjianjualbeli/filejkiad17dd1a85a02e65644f6118d6bc8eb6', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TEDDY_GUNAWAN.pdf', 'repository/slo/perjanjianjualbeli/fileioad17dd1a85a02e65644f6118d6bc8eb6', 'repository/slo/perjanjianjualbeli/filenpwpad17dd1a85a02e65644f6118d6bc8eb6', 'repository/slo/perjanjianjualbeli/filepkpad17dd1a85a02e65644f6118d6bc8eb6'),
(25, '00L', '562400521704121455', '2017-04-12', 'repository/slo/perjanjianjualbeli/filejb868db1fc5103643d2aebe92655f0b14d.pdf', 'repository/slo/perjanjianjualbeli/filesld507758f2e3354e5cac280909de4c492c.pdf', 'repository/slo/perjanjianjualbeli/filegitl507758f2e3354e5cac280909de4c492c.pdf', 'repository/slo/perjanjianjualbeli/filejki6f98ff0fb397661ef885765a76a42110', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_IR._JAMAL_ABDUL_NASSER08082017_00000.pdf', 'repository/slo/perjanjianjualbeli/fileio6f98ff0fb397661ef885765a76a42110', 'repository/slo/perjanjianjualbeli/filenpwp6f98ff0fb397661ef885765a76a42110', 'repository/slo/perjanjianjualbeli/filepkp6f98ff0fb397661ef885765a76a42110'),
(26, '00M', '544100076592', '2017-05-01', 'repository/slo/perjanjianjualbeli/filejba579cdc5aca2dead4d8ff850afb52eac.pdf', 'repository/slo/perjanjianjualbeli/fileslda579cdc5aca2dead4d8ff850afb52eac.pdf', 'repository/slo/perjanjianjualbeli/filegitla579cdc5aca2dead4d8ff850afb52eac.pdf', 'repository/slo/perjanjianjualbeli/filejki262ba6dfc61ac576acd1f5b1c38071c7', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._Gramedia_Asri_Media.pdf', 'repository/slo/perjanjianjualbeli/fileio262ba6dfc61ac576acd1f5b1c38071c7', 'repository/slo/perjanjianjualbeli/filenpwp262ba6dfc61ac576acd1f5b1c38071c7', 'repository/slo/perjanjianjualbeli/filepkp262ba6dfc61ac576acd1f5b1c38071c7'),
(27, '00N', 'ID. PELANGGAN 535171233802', '2017-04-01', 'repository/slo/perjanjianjualbeli/filejbbc89b48f0eed52235c0fb7564498dd75.jpg', 'repository/slo/perjanjianjualbeli/filesldbc89b48f0eed52235c0fb7564498dd75.pdf', 'repository/slo/perjanjianjualbeli/filegitlbc89b48f0eed52235c0fb7564498dd75.pdf', 'repository/slo/perjanjianjualbeli/filejki092075c236afb4bd721e6c245ee6eee4', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio092075c236afb4bd721e6c245ee6eee4', 'repository/slo/perjanjianjualbeli/filenpwp092075c236afb4bd721e6c245ee6eee4', 'repository/slo/perjanjianjualbeli/filepkp092075c236afb4bd721e6c245ee6eee4'),
(28, '00O', '535171233802', '2017-04-01', 'repository/slo/perjanjianjualbeli/filejb7e23ff71f9791fe3348e32ff5ecbbeb7.jpg', 'repository/slo/perjanjianjualbeli/filesld7e23ff71f9791fe3348e32ff5ecbbeb7.pdf', 'repository/slo/perjanjianjualbeli/filegitl7e23ff71f9791fe3348e32ff5ecbbeb7.pdf', 'repository/slo/perjanjianjualbeli/filejki7e23ff71f9791fe3348e32ff5ecbbeb7', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio7e23ff71f9791fe3348e32ff5ecbbeb7', 'repository/slo/perjanjianjualbeli/filenpwp7e23ff71f9791fe3348e32ff5ecbbeb7', 'repository/slo/perjanjianjualbeli/filepkp7e23ff71f9791fe3348e32ff5ecbbeb7'),
(29, '00P', '-', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejbbf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/filesldbf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/filegitlbf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/filejkibf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileiobf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/filenpwpbf96758dfdeafa33733c907c410e5c60', 'repository/slo/perjanjianjualbeli/filepkpbf96758dfdeafa33733c907c410e5c60'),
(30, '00Q', '144409911705256822', '2017-08-02', 'repository/slo/perjanjianjualbeli/filejb4386f0fdc50250a261395e2401449553.pdf', 'repository/slo/perjanjianjualbeli/filesld4386f0fdc50250a261395e2401449553.pdf', 'repository/slo/perjanjianjualbeli/filegitl4386f0fdc50250a261395e2401449553.pdf', 'repository/slo/perjanjianjualbeli/filejki151645781e028e93f81395127fdeea12', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._TOWER_BERSAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio151645781e028e93f81395127fdeea12', 'repository/slo/perjanjianjualbeli/filenpwp151645781e028e93f81395127fdeea12', 'repository/slo/perjanjianjualbeli/filepkp151645781e028e93f81395127fdeea12'),
(31, '00R', '538610511708034590', '2017-08-03', 'repository/slo/perjanjianjualbeli/filejbf3a98023732a44ba356721993c06c72e.pdf', 'repository/slo/perjanjianjualbeli/filesld0ac505d9d55601030b1fd6b4cb4cd326.pdf', 'repository/slo/perjanjianjualbeli/filegitl0ac505d9d55601030b1fd6b4cb4cd326.pdf', 'repository/slo/perjanjianjualbeli/filejki73f809b91fcf30e73ad9047eab7827fe', 'repository/slo/perjanjianjualbeli/Spesifikasi_Teknik_Rumdis_Universitas_Pertahanan_Sarana_dan_Prasarana.pdf', 'repository/slo/perjanjianjualbeli/fileio73f809b91fcf30e73ad9047eab7827fe', 'repository/slo/perjanjianjualbeli/filenpwp73f809b91fcf30e73ad9047eab7827fe', 'repository/slo/perjanjianjualbeli/filepkp73f809b91fcf30e73ad9047eab7827fe'),
(32, '00S', '533212437205', '2017-05-26', 'repository/slo/perjanjianjualbeli/filejbb46b2f977089d7964de870188dd2cc36.jpg', 'repository/slo/perjanjianjualbeli/filesldb46b2f977089d7964de870188dd2cc36.pdf', 'repository/slo/perjanjianjualbeli/filegitlb46b2f977089d7964de870188dd2cc36.pdf', 'repository/slo/perjanjianjualbeli/filejkib46b2f977089d7964de870188dd2cc36', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SARI_SIDO_MULTIFARM.pdf', 'repository/slo/perjanjianjualbeli/fileiob46b2f977089d7964de870188dd2cc36', 'repository/slo/perjanjianjualbeli/filenpwpb46b2f977089d7964de870188dd2cc36', 'repository/slo/perjanjianjualbeli/filepkpb46b2f977089d7964de870188dd2cc36'),
(33, '00T', '538414161951', '2017-02-17', 'repository/slo/perjanjianjualbeli/filejb5f9fe7903d7ec915b75a539e11c96f0e.pdf', 'repository/slo/perjanjianjualbeli/fileslda56114323d9b3231708e5ba20b6f5c22.pdf', 'repository/slo/perjanjianjualbeli/filegitl5f9fe7903d7ec915b75a539e11c96f0e.pdf', 'repository/slo/perjanjianjualbeli/filejki5f9fe7903d7ec915b75a539e11c96f0e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Puslitbang_POLRI.pdf', 'repository/slo/perjanjianjualbeli/fileio5f9fe7903d7ec915b75a539e11c96f0e', 'repository/slo/perjanjianjualbeli/filenpwp5f9fe7903d7ec915b75a539e11c96f0e', 'repository/slo/perjanjianjualbeli/filepkp5f9fe7903d7ec915b75a539e11c96f0e'),
(34, '00U', '171360081398', '2017-01-25', 'repository/slo/perjanjianjualbeli/filejbde6b9f286cf729271ec9c629db8ee859.jpg', 'repository/slo/perjanjianjualbeli/filesld4ebe8907b8b8450d22410ba944f5f4ca.pdf', 'repository/slo/perjanjianjualbeli/filegitl534bc5d1fd14ea0e6b19feffdcd078c7.pdf', 'repository/slo/perjanjianjualbeli/filejki2649722b9589ac087676e4682380f288', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Hj._MERRY_WARTI,_SE.pdf', 'repository/slo/perjanjianjualbeli/fileio2649722b9589ac087676e4682380f288', 'repository/slo/perjanjianjualbeli/filenpwp2649722b9589ac087676e4682380f288', 'repository/slo/perjanjianjualbeli/filepkp2649722b9589ac087676e4682380f288'),
(35, '00V', '0225/AGA.01.01/AREA-METRO/2015', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejb187530c726166d24e8f2bc788039a68e.pdf', 'repository/slo/perjanjianjualbeli/filesld187530c726166d24e8f2bc788039a68e.pdf', 'repository/slo/perjanjianjualbeli/filegitl8d177c457a8517da946af0ce2c10ce2b.pdf', 'repository/slo/perjanjianjualbeli/filejki187530c726166d24e8f2bc788039a68e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi__Ir._HEMRIZAL,_M.pdf', 'repository/slo/perjanjianjualbeli/fileio187530c726166d24e8f2bc788039a68e', 'repository/slo/perjanjianjualbeli/filenpwp187530c726166d24e8f2bc788039a68e', 'repository/slo/perjanjianjualbeli/filepkp187530c726166d24e8f2bc788039a68e'),
(36, '00W', '176/AGA.01.01/AREA-TGK/2017', '2017-03-30', 'repository/slo/perjanjianjualbeli/filejbc61c7d1566b7740ec313512e2e7827f2.pdf', 'repository/slo/perjanjianjualbeli/filesldc61c7d1566b7740ec313512e2e7827f2.pdf', 'repository/slo/perjanjianjualbeli/filegitlc61c7d1566b7740ec313512e2e7827f2.pdf', 'repository/slo/perjanjianjualbeli/filejki2be453296e2c6d62da5d7da68a0be4dc', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio2be453296e2c6d62da5d7da68a0be4dc', 'repository/slo/perjanjianjualbeli/filenpwp2be453296e2c6d62da5d7da68a0be4dc', 'repository/slo/perjanjianjualbeli/filepkp2be453296e2c6d62da5d7da68a0be4dc'),
(37, '00X', '0098/AGA.01.01/ADPK/2017', '2017-07-04', 'repository/slo/perjanjianjualbeli/filejb228928fcec7983d2b14e8250a2a0d55b.pdf', 'repository/slo/perjanjianjualbeli/filesld228928fcec7983d2b14e8250a2a0d55b.pdf', 'repository/slo/perjanjianjualbeli/filegitl037d08d7408c1f9b21c8db7851b336cf.pdf', 'repository/slo/perjanjianjualbeli/filejkiea8c6a30403ccc7d4e33e5ec5c1d0f81', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SAVERO_INDOHOTEL_JAYA_NUSANTARA.pdf', 'repository/slo/perjanjianjualbeli/fileioea8c6a30403ccc7d4e33e5ec5c1d0f81', 'repository/slo/perjanjianjualbeli/filenpwpea8c6a30403ccc7d4e33e5ec5c1d0f81', 'repository/slo/perjanjianjualbeli/filepkpea8c6a30403ccc7d4e33e5ec5c1d0f81'),
(38, '00Y', '431600511709068567', '2017-09-06', 'repository/slo/perjanjianjualbeli/filejb9e473a0bf2e4328042240d8e01c79641.jpg', 'repository/slo/perjanjianjualbeli/filesld9e473a0bf2e4328042240d8e01c79641.pdf', 'repository/slo/perjanjianjualbeli/filegitl9e473a0bf2e4328042240d8e01c79641.pdf', 'repository/slo/perjanjianjualbeli/filejki9e473a0bf2e4328042240d8e01c79641', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TBG_TSEL_KAI035_TELUKMUTE3.pdf', 'repository/slo/perjanjianjualbeli/fileio9e473a0bf2e4328042240d8e01c79641', 'repository/slo/perjanjianjualbeli/filenpwp9e473a0bf2e4328042240d8e01c79641', 'repository/slo/perjanjianjualbeli/filepkp9e473a0bf2e4328042240d8e01c79641'),
(39, '00Z', '431600511709068567', '2017-09-06', 'repository/slo/perjanjianjualbeli/filejb44435ae84c8125d45ebe78cbcdab31bd.jpg', 'repository/slo/perjanjianjualbeli/filesld44435ae84c8125d45ebe78cbcdab31bd.pdf', 'repository/slo/perjanjianjualbeli/filegitldff78ef1efb60d4d08378826b7232285.pdf', 'repository/slo/perjanjianjualbeli/filejki44435ae84c8125d45ebe78cbcdab31bd', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TBG_TSEL_KAI035_TELUKMUTE3.pdf', 'repository/slo/perjanjianjualbeli/fileio44435ae84c8125d45ebe78cbcdab31bd', 'repository/slo/perjanjianjualbeli/filenpwp44435ae84c8125d45ebe78cbcdab31bd', 'repository/slo/perjanjianjualbeli/filepkp44435ae84c8125d45ebe78cbcdab31bd'),
(40, '010', '0012/AGA.01.01/RYN-KAI/2016', '2016-10-10', 'repository/slo/perjanjianjualbeli/filejbd9cae64a0789c1903cfeea8aa0db0bc2.jpg', 'repository/slo/perjanjianjualbeli/filesldd9cae64a0789c1903cfeea8aa0db0bc2.pdf', 'repository/slo/perjanjianjualbeli/filegitld9cae64a0789c1903cfeea8aa0db0bc2.pdf', 'repository/slo/perjanjianjualbeli/filejkid9cae64a0789c1903cfeea8aa0db0bc2', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Telkomsel_KAI012_SITE_MORU.pdf', 'repository/slo/perjanjianjualbeli/fileiod9cae64a0789c1903cfeea8aa0db0bc2', 'repository/slo/perjanjianjualbeli/filenpwpd9cae64a0789c1903cfeea8aa0db0bc2', 'repository/slo/perjanjianjualbeli/filepkpd9cae64a0789c1903cfeea8aa0db0bc2'),
(41, '011', '0012/AGA.01.01/RYN-KAI/2016', '2016-10-10', 'repository/slo/perjanjianjualbeli/filejb2892036c5314c23b1223ed711daa5875.jpg', 'repository/slo/perjanjianjualbeli/filesld2892036c5314c23b1223ed711daa5875.pdf', 'repository/slo/perjanjianjualbeli/filegitl2892036c5314c23b1223ed711daa5875.pdf', 'repository/slo/perjanjianjualbeli/filejki2892036c5314c23b1223ed711daa5875', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Telkomsel_KAI012_SITE_MORU.pdf', 'repository/slo/perjanjianjualbeli/fileio2892036c5314c23b1223ed711daa5875', 'repository/slo/perjanjianjualbeli/filenpwp2892036c5314c23b1223ed711daa5875', 'repository/slo/perjanjianjualbeli/filepkp2892036c5314c23b1223ed711daa5875'),
(42, '012', '147400911088', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejb789d12cd7844cf9c75886a7457fcfd91.pdf', 'repository/slo/perjanjianjualbeli/filesld789d12cd7844cf9c75886a7457fcfd91.pdf', 'repository/slo/perjanjianjualbeli/filegitl789d12cd7844cf9c75886a7457fcfd91.pdf', 'repository/slo/perjanjianjualbeli/filejki83605df6406ed3faa74a35c5863ed5d6', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TBG_TSEL_PBM077_TJ_TELANG.pdf', 'repository/slo/perjanjianjualbeli/fileio83605df6406ed3faa74a35c5863ed5d6', 'repository/slo/perjanjianjualbeli/filenpwp83605df6406ed3faa74a35c5863ed5d6', 'repository/slo/perjanjianjualbeli/filepkp83605df6406ed3faa74a35c5863ed5d6'),
(43, '013', '147400911088', '2017-09-06', 'repository/slo/perjanjianjualbeli/filejbebb7785328b850153acbeb440ad54341.pdf', 'repository/slo/perjanjianjualbeli/filesldebb7785328b850153acbeb440ad54341.pdf', 'repository/slo/perjanjianjualbeli/filegitlebb7785328b850153acbeb440ad54341.pdf', 'repository/slo/perjanjianjualbeli/filejkiebb7785328b850153acbeb440ad54341', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TBG_TSEL_PBM077_TJ_TELANG.pdf', 'repository/slo/perjanjianjualbeli/fileioebb7785328b850153acbeb440ad54341', 'repository/slo/perjanjianjualbeli/filenpwpebb7785328b850153acbeb440ad54341', 'repository/slo/perjanjianjualbeli/filepkpebb7785328b850153acbeb440ad54341'),
(44, '014', '536210615699', '2017-06-01', 'repository/slo/perjanjianjualbeli/filejbad40b38b59b2f09fa76fb6b25aff1165.pdf', 'repository/slo/perjanjianjualbeli/filesld989b19ae98ec9c7ea72c43ec15a62b9d.pdf', 'repository/slo/perjanjianjualbeli/filegitlf7fb45df32c0b0bd5b83860f287ab0af.pdf', 'repository/slo/perjanjianjualbeli/filejkiad40b38b59b2f09fa76fb6b25aff1165', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CIPTA_DWI_BUSANA.pdf', 'repository/slo/perjanjianjualbeli/fileioad40b38b59b2f09fa76fb6b25aff1165', 'repository/slo/perjanjianjualbeli/filenpwpad40b38b59b2f09fa76fb6b25aff1165', 'repository/slo/perjanjianjualbeli/filepkpad40b38b59b2f09fa76fb6b25aff1165'),
(45, '015', '537710511707130607', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejb4a3824d9524ddf5b4d547cf5ddb737d0.jpg', 'repository/slo/perjanjianjualbeli/filesldc9eb7957050c7ac47c25e47555d3f836.pdf', 'repository/slo/perjanjianjualbeli/filegitl4a3824d9524ddf5b4d547cf5ddb737d0.pdf', 'repository/slo/perjanjianjualbeli/filejki4a3824d9524ddf5b4d547cf5ddb737d0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_HPC_LIQUIDE.pdf', 'repository/slo/perjanjianjualbeli/fileio4a3824d9524ddf5b4d547cf5ddb737d0', 'repository/slo/perjanjianjualbeli/filenpwp4a3824d9524ddf5b4d547cf5ddb737d0', 'repository/slo/perjanjianjualbeli/filepkp4a3824d9524ddf5b4d547cf5ddb737d0'),
(46, '016', '543105108833', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejbd6b2ef152ca26f436b755a6c31819e07.pdf', 'repository/slo/perjanjianjualbeli/filesldaf47d7fefc408e0bf2f3bfa945797d7f.pdf', 'repository/slo/perjanjianjualbeli/filegitl602e974dfee248c41befaba3cb158457.pdf', 'repository/slo/perjanjianjualbeli/filejki602e974dfee248c41befaba3cb158457', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._BANDAR_GADANG_JAYA.pdf', 'repository/slo/perjanjianjualbeli/fileio602e974dfee248c41befaba3cb158457', 'repository/slo/perjanjianjualbeli/filenpwp602e974dfee248c41befaba3cb158457', 'repository/slo/perjanjianjualbeli/filepkp602e974dfee248c41befaba3cb158457'),
(47, '017', '173000752246', '2017-09-22', 'repository/slo/perjanjianjualbeli/filejb1c3461163ab3d746e3c9985e0a88b835.jpg', 'repository/slo/perjanjianjualbeli/filesld1c3461163ab3d746e3c9985e0a88b835.pdf', 'repository/slo/perjanjianjualbeli/filegitla8b2150ab44442a9e3590048d57cf674.pdf', 'repository/slo/perjanjianjualbeli/filejki1c3461163ab3d746e3c9985e0a88b835', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_CV._JAYA_AGRO_MANDIRI.pdf', 'repository/slo/perjanjianjualbeli/fileio1c3461163ab3d746e3c9985e0a88b835', 'repository/slo/perjanjianjualbeli/filenpwp1c3461163ab3d746e3c9985e0a88b835', 'repository/slo/perjanjianjualbeli/filepkp1c3461163ab3d746e3c9985e0a88b835'),
(48, '018', '541101342350', '2016-04-01', 'repository/slo/perjanjianjualbeli/filejb62b11e063df26a5043abbb8a20a08526.pdf', 'repository/slo/perjanjianjualbeli/filesld62b11e063df26a5043abbb8a20a08526.pdf', 'repository/slo/perjanjianjualbeli/filegitl62b11e063df26a5043abbb8a20a08526.pdf', 'repository/slo/perjanjianjualbeli/filejki62b11e063df26a5043abbb8a20a08526', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Kementerian_BUMN.pdf', 'repository/slo/perjanjianjualbeli/fileio62b11e063df26a5043abbb8a20a08526', 'repository/slo/perjanjianjualbeli/filenpwp62b11e063df26a5043abbb8a20a08526', 'repository/slo/perjanjianjualbeli/filepkp62b11e063df26a5043abbb8a20a08526'),
(49, '019', '537715058012', '2017-07-21', 'repository/slo/perjanjianjualbeli/filejbb2cf5a4f37b90b5520941274acb22cbe.jpg', 'repository/slo/perjanjianjualbeli/filesldb2cf5a4f37b90b5520941274acb22cbe.pdf', 'repository/slo/perjanjianjualbeli/filegitlb2cf5a4f37b90b5520941274acb22cbe.pdf', 'repository/slo/perjanjianjualbeli/filejkib2cf5a4f37b90b5520941274acb22cbe', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SOLUSI_PRIMA_PACKAGING.pdf', 'repository/slo/perjanjianjualbeli/fileiob79dc17418cf7ebc2590faddf8064076', 'repository/slo/perjanjianjualbeli/filenpwpb79dc17418cf7ebc2590faddf8064076', 'repository/slo/perjanjianjualbeli/filepkpb79dc17418cf7ebc2590faddf8064076'),
(50, '01A', '236.PJ/AGA 01.01/SPJBTL/AREA BKS/2017', '2017-08-15', 'repository/slo/perjanjianjualbeli/filejb22eea2fb93c72c1f5fea79981626fa47.pdf', 'repository/slo/perjanjianjualbeli/filesld22eea2fb93c72c1f5fea79981626fa47.pdf', 'repository/slo/perjanjianjualbeli/filegitl22eea2fb93c72c1f5fea79981626fa47.pdf', 'repository/slo/perjanjianjualbeli/filejki22eea2fb93c72c1f5fea79981626fa47', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._MULTI_SAKA_ABADI.pdf', 'repository/slo/perjanjianjualbeli/fileio428630e8dbee9fa1d34764ef462e677f', 'repository/slo/perjanjianjualbeli/filenpwp428630e8dbee9fa1d34764ef462e677f', 'repository/slo/perjanjianjualbeli/filepkp428630e8dbee9fa1d34764ef462e677f'),
(51, '01B', '538612197872', '2017-09-01', 'repository/slo/perjanjianjualbeli/filejbb9bf6abe320cf3caf356bce59e1d7189.pdf', 'repository/slo/perjanjianjualbeli/filesld1a91d4362a54898daac7b58a6a5893a7', 'repository/slo/perjanjianjualbeli/filegitl1a91d4362a54898daac7b58a6a5893a7.pdf', 'repository/slo/perjanjianjualbeli/filejki87ecdd719358c00f03eeacfa16ceb402', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SIMBA_INDOSNACK_MAKMUR.compressed_(2).pdf', 'repository/slo/perjanjianjualbeli/fileio87ecdd719358c00f03eeacfa16ceb402', 'repository/slo/perjanjianjualbeli/filenpwp87ecdd719358c00f03eeacfa16ceb402', 'repository/slo/perjanjianjualbeli/filepkp87ecdd719358c00f03eeacfa16ceb402'),
(52, '01C', '547200747760', '2017-06-02', 'repository/slo/perjanjianjualbeli/filejbfb8dbc4a5d09ac189cc72a8f90b08d38.jpg', 'repository/slo/perjanjianjualbeli/filesld2db391ef50d83ed70cab97386040d29a.pdf', 'repository/slo/perjanjianjualbeli/filegitlfb8dbc4a5d09ac189cc72a8f90b08d38.pdf', 'repository/slo/perjanjianjualbeli/filejkifb8dbc4a5d09ac189cc72a8f90b08d38', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Bambang_Wibowo.pdf', 'repository/slo/perjanjianjualbeli/fileiofb8dbc4a5d09ac189cc72a8f90b08d38', 'repository/slo/perjanjianjualbeli/filenpwpfb8dbc4a5d09ac189cc72a8f90b08d38', 'repository/slo/perjanjianjualbeli/filepkpfb8dbc4a5d09ac189cc72a8f90b08d38'),
(53, '01D', '541103425522', '2017-10-14', 'repository/slo/perjanjianjualbeli/filejbd2f842b3b0def70fa219d0fba349fa0d.jpg', 'repository/slo/perjanjianjualbeli/filesld92f146586845ddb75c90df7563a5db8f.pdf', 'repository/slo/perjanjianjualbeli/filegitl92f146586845ddb75c90df7563a5db8f.pdf', 'repository/slo/perjanjianjualbeli/filejki507b755615eea064dc43c25dfd8b8f0e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_KAI_SUDIRMAN.pdf', 'repository/slo/perjanjianjualbeli/fileio507b755615eea064dc43c25dfd8b8f0e', 'repository/slo/perjanjianjualbeli/filenpwp507b755615eea064dc43c25dfd8b8f0e', 'repository/slo/perjanjianjualbeli/filepkp507b755615eea064dc43c25dfd8b8f0e'),
(54, '01E', '548200002342', '2017-09-19', 'repository/slo/perjanjianjualbeli/filejb25a8509b5c15c694e61b182a3a676448.jpg', 'repository/slo/perjanjianjualbeli/filesld25a8509b5c15c694e61b182a3a676448.pdf', 'repository/slo/perjanjianjualbeli/filegitl25a8509b5c15c694e61b182a3a676448.pdf', 'repository/slo/perjanjianjualbeli/filejki25a8509b5c15c694e61b182a3a676448', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ASTARI_NIAGARA_INTERNATIONAL.pdf', 'repository/slo/perjanjianjualbeli/fileio25a8509b5c15c694e61b182a3a676448', 'repository/slo/perjanjianjualbeli/filenpwp25a8509b5c15c694e61b182a3a676448', 'repository/slo/perjanjianjualbeli/filepkp25a8509b5c15c694e61b182a3a676448'),
(55, '01F', '222200021311', '2017-10-09', 'repository/slo/perjanjianjualbeli/filejb61c78869e750afb7270f132d6a4c2939.jpg', 'repository/slo/perjanjianjualbeli/filesld61c78869e750afb7270f132d6a4c2939.pdf', 'repository/slo/perjanjianjualbeli/filegitl61c78869e750afb7270f132d6a4c2939.pdf', 'repository/slo/perjanjianjualbeli/filejki61c78869e750afb7270f132d6a4c2939', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_RSU._BrigJend._Hasan_Basry.pdf', 'repository/slo/perjanjianjualbeli/fileio61c78869e750afb7270f132d6a4c2939', 'repository/slo/perjanjianjualbeli/filenpwp61c78869e750afb7270f132d6a4c2939', 'repository/slo/perjanjianjualbeli/filepkp61c78869e750afb7270f132d6a4c2939'),
(56, '01G', '5359829000003', '2017-10-17', 'repository/slo/perjanjianjualbeli/filejba69d9f959d5e2e0b74212eff134e9417.jpg', 'repository/slo/perjanjianjualbeli/filesld10a4253011dc5a2afe671910a8a38471.pdf', 'repository/slo/perjanjianjualbeli/filegitla69d9f959d5e2e0b74212eff134e9417.pdf', 'repository/slo/perjanjianjualbeli/filejkia69d9f959d5e2e0b74212eff134e9417', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_High_Speed_Railway_Contraktor..pdf', 'repository/slo/perjanjianjualbeli/fileioa69d9f959d5e2e0b74212eff134e9417', 'repository/slo/perjanjianjualbeli/filenpwpa69d9f959d5e2e0b74212eff134e9417', 'repository/slo/perjanjianjualbeli/filepkpa69d9f959d5e2e0b74212eff134e9417'),
(57, '01H', '1738011041061', '2017-06-07', 'repository/slo/perjanjianjualbeli/filejbe538ad16a756ceb7344e3360fbdb7ed2.jpg', 'repository/slo/perjanjianjualbeli/fileslde538ad16a756ceb7344e3360fbdb7ed2.pdf', 'repository/slo/perjanjianjualbeli/filegitle538ad16a756ceb7344e3360fbdb7ed2.pdf', 'repository/slo/perjanjianjualbeli/filejki63992462fbec383029e70a3160644c1f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Gardu_Distribusi_RSUD_Pesisir_Barat.pdf', 'repository/slo/perjanjianjualbeli/fileio63992462fbec383029e70a3160644c1f', 'repository/slo/perjanjianjualbeli/filenpwp63992462fbec383029e70a3160644c1f', 'repository/slo/perjanjianjualbeli/filepkp63992462fbec383029e70a3160644c1f'),
(58, '01I', '827.PJ/AGA 01.01/SPJBTL/AREA BKS/2016', '2016-11-02', 'repository/slo/perjanjianjualbeli/filejba9425caf50f18256424ae2a6ff8ba654.pdf', 'repository/slo/perjanjianjualbeli/filesld5552824ecc3a6f768a91671dd54b2679.pdf', 'repository/slo/perjanjianjualbeli/filegitl5552824ecc3a6f768a91671dd54b2679.pdf', 'repository/slo/perjanjianjualbeli/filejki5552824ecc3a6f768a91671dd54b2679', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._LUXINDO_INTERNUSA.pdf', 'repository/slo/perjanjianjualbeli/fileio5552824ecc3a6f768a91671dd54b2679', 'repository/slo/perjanjianjualbeli/filenpwp5552824ecc3a6f768a91671dd54b2679', 'repository/slo/perjanjianjualbeli/filepkp5552824ecc3a6f768a91671dd54b2679'),
(59, '01J', '830.PJ/AGA 01.01/SPJBTL/AREA BKS/2016', '2016-11-02', 'repository/slo/perjanjianjualbeli/filejb226009e49060ccf20421394e06df01e4.pdf', 'repository/slo/perjanjianjualbeli/filesld16382ccd2618c2c3d7bbaafa67bd4fc0.pdf', 'repository/slo/perjanjianjualbeli/filegitl16382ccd2618c2c3d7bbaafa67bd4fc0', 'repository/slo/perjanjianjualbeli/filejki16382ccd2618c2c3d7bbaafa67bd4fc0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi__PT._UNIVERSAL_AGRI_BISNISINDO.pdf', 'repository/slo/perjanjianjualbeli/fileio16382ccd2618c2c3d7bbaafa67bd4fc0', 'repository/slo/perjanjianjualbeli/filenpwp16382ccd2618c2c3d7bbaafa67bd4fc0', 'repository/slo/perjanjianjualbeli/filepkp16382ccd2618c2c3d7bbaafa67bd4fc0'),
(60, '01K', '548200004474', '2017-10-23', 'repository/slo/perjanjianjualbeli/filejb03d533ce8d1ed5e32605997ca97e5e72.jpg', 'repository/slo/perjanjianjualbeli/filesld03d533ce8d1ed5e32605997ca97e5e72.pdf', 'repository/slo/perjanjianjualbeli/filegitl03d533ce8d1ed5e32605997ca97e5e72.pdf', 'repository/slo/perjanjianjualbeli/filejki03d533ce8d1ed5e32605997ca97e5e72', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._DAMAI_INDAH_KACA_TIPIS.pdf', 'repository/slo/perjanjianjualbeli/fileio03d533ce8d1ed5e32605997ca97e5e72', 'repository/slo/perjanjianjualbeli/filenpwp03d533ce8d1ed5e32605997ca97e5e72', 'repository/slo/perjanjianjualbeli/filepkp03d533ce8d1ed5e32605997ca97e5e72'),
(61, '01L', '431500314424', '2017-05-12', 'repository/slo/perjanjianjualbeli/filejb82e59521dbed28895d1fe31cf77e9b94.jpg', 'repository/slo/perjanjianjualbeli/filesld82e59521dbed28895d1fe31cf77e9b94.pdf', 'repository/slo/perjanjianjualbeli/filegitl82e59521dbed28895d1fe31cf77e9b94.pdf', 'repository/slo/perjanjianjualbeli/filejki798d14075556ce6e8411d1cb0b86e942', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalai._PT._ANUGRAH_NUSANTARA_SEJAHTERA.pdf', 'repository/slo/perjanjianjualbeli/fileio798d14075556ce6e8411d1cb0b86e942', 'repository/slo/perjanjianjualbeli/filenpwp798d14075556ce6e8411d1cb0b86e942', 'repository/slo/perjanjianjualbeli/filepkp798d14075556ce6e8411d1cb0b86e942'),
(62, '01M', '538655926699', '2017-10-02', 'repository/slo/perjanjianjualbeli/filejb6c207bd078860fb7750b815b32fb5b72.pdf', 'repository/slo/perjanjianjualbeli/filesld08fa5b5378f834be02d4f6cb2a0826b0.pdf', 'repository/slo/perjanjianjualbeli/filegitl08fa5b5378f834be02d4f6cb2a0826b0.pdf', 'repository/slo/perjanjianjualbeli/filejki476263945f378a3fef42ceb7f93714b9', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalai._PT._GRESHINDO_UTAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio476263945f378a3fef42ceb7f93714b9', 'repository/slo/perjanjianjualbeli/filenpwp476263945f378a3fef42ceb7f93714b9', 'repository/slo/perjanjianjualbeli/filepkp476263945f378a3fef42ceb7f93714b9'),
(63, '01N', '5346113050313', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejb3d11a3af1de2777e743f14a31e562e81.jpg', 'repository/slo/perjanjianjualbeli/filesld3d11a3af1de2777e743f14a31e562e81.pdf', 'repository/slo/perjanjianjualbeli/filegitl3d11a3af1de2777e743f14a31e562e81.pdf', 'repository/slo/perjanjianjualbeli/filejkia8014b1fdfecc072b884ca495ac3fe9d', 'repository/slo/perjanjianjualbeli/Speksifikasi_izza.pdf', 'repository/slo/perjanjianjualbeli/fileioa8014b1fdfecc072b884ca495ac3fe9d', 'repository/slo/perjanjianjualbeli/filenpwpa8014b1fdfecc072b884ca495ac3fe9d', 'repository/slo/perjanjianjualbeli/filepkpa8014b1fdfecc072b884ca495ac3fe9d'),
(64, '01O', '536210573223', '2011-01-05', 'repository/slo/perjanjianjualbeli/filejb9b066a876be17eece4f78b18b85783d3.png', 'repository/slo/perjanjianjualbeli/filesld9b066a876be17eece4f78b18b85783d3.pdf', 'repository/slo/perjanjianjualbeli/filegitl9b066a876be17eece4f78b18b85783d3.pdf', 'repository/slo/perjanjianjualbeli/filejki9b066a876be17eece4f78b18b85783d3', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._WHO_SHIN_GARMENT_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio9b066a876be17eece4f78b18b85783d3', 'repository/slo/perjanjianjualbeli/filenpwp9b066a876be17eece4f78b18b85783d3', 'repository/slo/perjanjianjualbeli/filepkp9b066a876be17eece4f78b18b85783d3'),
(65, '01P', '5331113035006', '2017-08-21', 'repository/slo/perjanjianjualbeli/filejb22f910936e2467e19be39675af1ef46b.jpg', 'repository/slo/perjanjianjualbeli/filesldba4b725249b602302b7983960dd3d678.pdf', 'repository/slo/perjanjianjualbeli/filegitlba4b725249b602302b7983960dd3d678.pdf', 'repository/slo/perjanjianjualbeli/filejki21a13c911fef784219b9dfec89733f68', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._Alfa_Retailindo15112017_00000.pdf', 'repository/slo/perjanjianjualbeli/fileio21a13c911fef784219b9dfec89733f68', 'repository/slo/perjanjianjualbeli/filenpwp21a13c911fef784219b9dfec89733f68', 'repository/slo/perjanjianjualbeli/filepkp21a13c911fef784219b9dfec89733f68'),
(66, '01Q', '0059.SUPL/AGA/A.BGR/2017', '2017-04-03', 'repository/slo/perjanjianjualbeli/filejb0a26a4c4a98191dfad2dabf6557437fe.pdf', 'repository/slo/perjanjianjualbeli/filesld0a26a4c4a98191dfad2dabf6557437fe.pdf', 'repository/slo/perjanjianjualbeli/filegitle6aa1b165e4cb7c388fa9583b8b38c71.pdf', 'repository/slo/perjanjianjualbeli/filejki016eec61c292bfc8917d578a552cfcb5', 'repository/slo/perjanjianjualbeli/SPESIFIKASI_TEKNIK14112017_00000.pdf', 'repository/slo/perjanjianjualbeli/fileio016eec61c292bfc8917d578a552cfcb5', 'repository/slo/perjanjianjualbeli/filenpwp016eec61c292bfc8917d578a552cfcb5', 'repository/slo/perjanjianjualbeli/filepkp016eec61c292bfc8917d578a552cfcb5'),
(67, '01R', '0318/AGA.01/A.GPI/2017', '2017-09-02', 'repository/slo/perjanjianjualbeli/filejb987303caf5698d83eb2a5caab7c2c099.pdf', 'repository/slo/perjanjianjualbeli/filesld987303caf5698d83eb2a5caab7c2c099.pdf', 'repository/slo/perjanjianjualbeli/filegitl987303caf5698d83eb2a5caab7c2c099.pdf', 'repository/slo/perjanjianjualbeli/filejki987303caf5698d83eb2a5caab7c2c099', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._INDESSO_AROMA.pdf', 'repository/slo/perjanjianjualbeli/fileio987303caf5698d83eb2a5caab7c2c099', 'repository/slo/perjanjianjualbeli/filenpwp987303caf5698d83eb2a5caab7c2c099', 'repository/slo/perjanjianjualbeli/filepkp987303caf5698d83eb2a5caab7c2c099'),
(68, '01S', '0019/PJ/HKM.00.01/A.CMI/2017', '2017-07-13', 'repository/slo/perjanjianjualbeli/filejbca2444e8932b72992754063b33a57bc1.jpg', 'repository/slo/perjanjianjualbeli/filesld5e4e52f45643b95c3dce331ff00a8d66.pdf', 'repository/slo/perjanjianjualbeli/filegitl5e4e52f45643b95c3dce331ff00a8d66.pdf', 'repository/slo/perjanjianjualbeli/filejki5e4e52f45643b95c3dce331ff00a8d66', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._TEODORE_PAN_GARMINDO.pdf', 'repository/slo/perjanjianjualbeli/fileio5e4e52f45643b95c3dce331ff00a8d66', 'repository/slo/perjanjianjualbeli/filenpwp5e4e52f45643b95c3dce331ff00a8d66', 'repository/slo/perjanjianjualbeli/filepkp5e4e52f45643b95c3dce331ff00a8d66'),
(69, '01T', '537213239188', '2017-10-11', 'repository/slo/perjanjianjualbeli/filejb9f0460da7e62dcf66e5b8d886a2eeb54.jpg', 'repository/slo/perjanjianjualbeli/fileslde4cbf03bf32c7ca5ea76774514e8db3c.pdf', 'repository/slo/perjanjianjualbeli/filegitle4cbf03bf32c7ca5ea76774514e8db3c.pdf', 'repository/slo/perjanjianjualbeli/filejkic5f9312d5a3bf212ce25830f5e5de75e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileioc5f9312d5a3bf212ce25830f5e5de75e', 'repository/slo/perjanjianjualbeli/filenpwpc5f9312d5a3bf212ce25830f5e5de75e', 'repository/slo/perjanjianjualbeli/filepkpc5f9312d5a3bf212ce25830f5e5de75e'),
(70, '01U', '145000129189', '2017-10-20', 'repository/slo/perjanjianjualbeli/filejb543f48459550a51f91107a6a23bf5eb0.jpg', 'repository/slo/perjanjianjualbeli/filesld709cf835ebc9db6cf0205fa91350d705.pdf', 'repository/slo/perjanjianjualbeli/filegitl709cf835ebc9db6cf0205fa91350d705.pdf', 'repository/slo/perjanjianjualbeli/filejki0e5b85e97c99d63db7df0868125968e8', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_HOTEL_HORISON.pdf', 'repository/slo/perjanjianjualbeli/fileio0e5b85e97c99d63db7df0868125968e8', 'repository/slo/perjanjianjualbeli/filenpwp0e5b85e97c99d63db7df0868125968e8', 'repository/slo/perjanjianjualbeli/filepkp0e5b85e97c99d63db7df0868125968e8'),
(71, '01V', '538612197632', '2017-10-24', 'repository/slo/perjanjianjualbeli/filejb5556e420612cedb3d2ead07ccffb169e.pdf', 'repository/slo/perjanjianjualbeli/filesld5556e420612cedb3d2ead07ccffb169e.pdf', 'repository/slo/perjanjianjualbeli/filegitl5556e420612cedb3d2ead07ccffb169e.pdf', 'repository/slo/perjanjianjualbeli/filejki12972a7700986dc578f4bd7979f765f2', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._INTALAN_WORKS.pdf', 'repository/slo/perjanjianjualbeli/fileio12972a7700986dc578f4bd7979f765f2', 'repository/slo/perjanjianjualbeli/filenpwp12972a7700986dc578f4bd7979f765f2', 'repository/slo/perjanjianjualbeli/filepkp12972a7700986dc578f4bd7979f765f2'),
(72, '01W', '0100.ADD/AGA.01/A.SKI/2017', '2009-01-05', 'repository/slo/perjanjianjualbeli/filejb8419977d9587756ef59311156fd18d29.jpg', 'repository/slo/perjanjianjualbeli/filesld8419977d9587756ef59311156fd18d29.pdf', 'repository/slo/perjanjianjualbeli/filegitl8419977d9587756ef59311156fd18d29.pdf', 'repository/slo/perjanjianjualbeli/filejki8419977d9587756ef59311156fd18d29', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._DASAN_PAN_PACIFIC_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio8419977d9587756ef59311156fd18d29', 'repository/slo/perjanjianjualbeli/filenpwp8419977d9587756ef59311156fd18d29', 'repository/slo/perjanjianjualbeli/filepkp8419977d9587756ef59311156fd18d29'),
(73, '01X', '536612400163', '2017-07-26', 'repository/slo/perjanjianjualbeli/filejb5f167222b1b516c1750742b9dda071b8.pdf', 'repository/slo/perjanjianjualbeli/filesld5f167222b1b516c1750742b9dda071b8.pdf', 'repository/slo/perjanjianjualbeli/filegitl5f167222b1b516c1750742b9dda071b8.pdf', 'repository/slo/perjanjianjualbeli/filejki5f167222b1b516c1750742b9dda071b8', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SEMANGAT_MEKAR_JAYA.pdf', 'repository/slo/perjanjianjualbeli/fileio5f167222b1b516c1750742b9dda071b8', 'repository/slo/perjanjianjualbeli/filenpwp5f167222b1b516c1750742b9dda071b8', 'repository/slo/perjanjianjualbeli/filepkp5f167222b1b516c1750742b9dda071b8'),
(74, '01Y', '147400913273', '2017-09-13', 'repository/slo/perjanjianjualbeli/filejb4b2cfb35ebf54bcde429d338652f9470.pdf', 'repository/slo/perjanjianjualbeli/filesld4b2cfb35ebf54bcde429d338652f9470.pdf', 'repository/slo/perjanjianjualbeli/filegitl4b2cfb35ebf54bcde429d338652f9470.pdf', 'repository/slo/perjanjianjualbeli/filejki4b2cfb35ebf54bcde429d338652f9470', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_TBG-TSEL_PBM078_SUKARAJA..pdf', 'repository/slo/perjanjianjualbeli/fileio4b2cfb35ebf54bcde429d338652f9470', 'repository/slo/perjanjianjualbeli/filenpwp4b2cfb35ebf54bcde429d338652f9470', 'repository/slo/perjanjianjualbeli/filepkp4b2cfb35ebf54bcde429d338652f9470'),
(75, '01Z', '511432809928', '2017-09-25', 'repository/slo/perjanjianjualbeli/filejbb841059aea128f2d6c84877be5182f8a.pdf', 'repository/slo/perjanjianjualbeli/filesldb841059aea128f2d6c84877be5182f8a.pdf', 'repository/slo/perjanjianjualbeli/filegitlb841059aea128f2d6c84877be5182f8a.pdf', 'repository/slo/perjanjianjualbeli/filejkifceb502d7be66bff40f3fc0cc31281dc', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._INDONESIA_MULTI_COLOUR_PRINTING_(sby).pdf', 'repository/slo/perjanjianjualbeli/fileiofceb502d7be66bff40f3fc0cc31281dc', 'repository/slo/perjanjianjualbeli/filenpwpfceb502d7be66bff40f3fc0cc31281dc', 'repository/slo/perjanjianjualbeli/filepkpfceb502d7be66bff40f3fc0cc31281dc'),
(76, '020', '511430764185', '2017-09-25', 'repository/slo/perjanjianjualbeli/filejb2fd6db515e583e6cd80fd56ae193615a.pdf', 'repository/slo/perjanjianjualbeli/filesld57275db076898d4ee855123f65ceb5cf.pdf', 'repository/slo/perjanjianjualbeli/filegitl57275db076898d4ee855123f65ceb5cf.pdf', 'repository/slo/perjanjianjualbeli/filejki075167f832db4a419074f39b6a2dcf69', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._IMCP_(Surabaya).pdf', 'repository/slo/perjanjianjualbeli/fileio075167f832db4a419074f39b6a2dcf69', 'repository/slo/perjanjianjualbeli/filenpwp075167f832db4a419074f39b6a2dcf69', 'repository/slo/perjanjianjualbeli/filepkp075167f832db4a419074f39b6a2dcf69'),
(77, '021', '', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejbd0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/filesldd0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/filegitld0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/filejkid0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileiod0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/filenpwpd0a15c80ef12091e7a76aac548793efe', 'repository/slo/perjanjianjualbeli/filepkpd0a15c80ef12091e7a76aac548793efe'),
(78, '022', '0083.PJ/AGA.01.01/ADPK/2017', '2017-07-05', 'repository/slo/perjanjianjualbeli/filejbfe9c1e47c00e784044e14ed59b02f7d3.pdf', 'repository/slo/perjanjianjualbeli/filesld51b027e3031b3476a500ec9eb8cfb536', 'repository/slo/perjanjianjualbeli/filegitl51b027e3031b3476a500ec9eb8cfb536.pdf', 'repository/slo/perjanjianjualbeli/filejki51b027e3031b3476a500ec9eb8cfb536', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio51b027e3031b3476a500ec9eb8cfb536', 'repository/slo/perjanjianjualbeli/filenpwp51b027e3031b3476a500ec9eb8cfb536', 'repository/slo/perjanjianjualbeli/filepkp51b027e3031b3476a500ec9eb8cfb536'),
(79, '023', '637213427979', '2017-11-16', 'repository/slo/perjanjianjualbeli/filejb19ff73741d357b320589166073d767ff.jpg', 'repository/slo/perjanjianjualbeli/filesld7816049199d3682ccf61f2812184b4d6.pdf', 'repository/slo/perjanjianjualbeli/filegitl19ff73741d357b320589166073d767ff.pdf', 'repository/slo/perjanjianjualbeli/filejki19ff73741d357b320589166073d767ff', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._SINAR_JAYA_ML.pdf', 'repository/slo/perjanjianjualbeli/fileiob403ffff3b0355c4769a0be8f636ecc0', 'repository/slo/perjanjianjualbeli/filenpwpb403ffff3b0355c4769a0be8f636ecc0', 'repository/slo/perjanjianjualbeli/filepkpb403ffff3b0355c4769a0be8f636ecc0'),
(80, '024', '442300169818', '2017-09-04', 'repository/slo/perjanjianjualbeli/filejbc703197f77ebbaf1af09e5c81e5f8186.pdf', 'repository/slo/perjanjianjualbeli/filesldc703197f77ebbaf1af09e5c81e5f8186.pdf', 'repository/slo/perjanjianjualbeli/filegitlc703197f77ebbaf1af09e5c81e5f8186.pdf', 'repository/slo/perjanjianjualbeli/filejkic703197f77ebbaf1af09e5c81e5f8186', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Agus_Salim...pdf', 'repository/slo/perjanjianjualbeli/fileioc703197f77ebbaf1af09e5c81e5f8186', 'repository/slo/perjanjianjualbeli/filenpwpc703197f77ebbaf1af09e5c81e5f8186', 'repository/slo/perjanjianjualbeli/filepkpc703197f77ebbaf1af09e5c81e5f8186');
INSERT INTO `t_surat_perjanjian` (`id_surat_perjanjian`, `id_pemohon`, `nomor`, `tanggal`, `file_jual_beli`, `file_sld`, `file_gitl`, `file_jki`, `file_spui`, `file_io`, `file_npwp`, `file_pkp`) VALUES
(81, '025', '534751108850', '2017-11-15', 'repository/slo/perjanjianjualbeli/filejb1d4dc6b6477be29b76172df1d6a1c751.pdf', 'repository/slo/perjanjianjualbeli/filesld1d4dc6b6477be29b76172df1d6a1c751.pdf', 'repository/slo/perjanjianjualbeli/filegitl1d4dc6b6477be29b76172df1d6a1c751.pdf', 'repository/slo/perjanjianjualbeli/filejkid7667fedb3e022cf053c459c6392fdcd', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-Samsat_Bersama.pdf', 'repository/slo/perjanjianjualbeli/fileioe5680659910ebbf2300e1908efc38987', 'repository/slo/perjanjianjualbeli/filenpwpe5680659910ebbf2300e1908efc38987', 'repository/slo/perjanjianjualbeli/filepkpe5680659910ebbf2300e1908efc38987'),
(82, '026', 'AGA.01.01/AREASBW/2017', '2017-09-04', 'repository/slo/perjanjianjualbeli/filejb7b09bfaac236942e4b655c71f4992a3e.jpg', 'repository/slo/perjanjianjualbeli/filesld7b09bfaac236942e4b655c71f4992a3e.pdf', 'repository/slo/perjanjianjualbeli/filegitl7b09bfaac236942e4b655c71f4992a3e.pdf', 'repository/slo/perjanjianjualbeli/filejki7b09bfaac236942e4b655c71f4992a3e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio358bc7b4ab8e6e93a4a86d1e578b8d27', 'repository/slo/perjanjianjualbeli/filenpwp358bc7b4ab8e6e93a4a86d1e578b8d27', 'repository/slo/perjanjianjualbeli/filepkp358bc7b4ab8e6e93a4a86d1e578b8d27'),
(83, '027', '53559494709', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejb773b69e80994d7822d517ea2b417616d.pdf', 'repository/slo/perjanjianjualbeli/filesld773b69e80994d7822d517ea2b417616d.pdf', 'repository/slo/perjanjianjualbeli/filegitl773b69e80994d7822d517ea2b417616d.pdf', 'repository/slo/perjanjianjualbeli/filejki77b79b4a3848fbcc266e79f9e4629cc2', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio77b79b4a3848fbcc266e79f9e4629cc2', 'repository/slo/perjanjianjualbeli/filenpwp77b79b4a3848fbcc266e79f9e4629cc2', 'repository/slo/perjanjianjualbeli/filepkp77b79b4a3848fbcc266e79f9e4629cc2'),
(84, '028', '095.Pj/AGA.01.01/RPK/2017', '2017-10-31', 'repository/slo/perjanjianjualbeli/filejb75bbb244e2aa0526610ae342ccc9b121.pdf', 'repository/slo/perjanjianjualbeli/filesldc185ae5db47923bcfb9c09fd7af8b0ae.pdf', 'repository/slo/perjanjianjualbeli/filegitlc185ae5db47923bcfb9c09fd7af8b0ae.pdf', 'repository/slo/perjanjianjualbeli/filejkic185ae5db47923bcfb9c09fd7af8b0ae', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-BKKM.pdf', 'repository/slo/perjanjianjualbeli/fileioc185ae5db47923bcfb9c09fd7af8b0ae', 'repository/slo/perjanjianjualbeli/filenpwpc185ae5db47923bcfb9c09fd7af8b0ae', 'repository/slo/perjanjianjualbeli/filepkpc185ae5db47923bcfb9c09fd7af8b0ae'),
(85, '029', '435000064460', '2017-11-21', 'repository/slo/perjanjianjualbeli/filejb0319191020c6abe398e629e48d536bc7.jpg', 'repository/slo/perjanjianjualbeli/filesld0319191020c6abe398e629e48d536bc7.pdf', 'repository/slo/perjanjianjualbeli/filegitl0319191020c6abe398e629e48d536bc7.pdf', 'repository/slo/perjanjianjualbeli/filejki0319191020c6abe398e629e48d536bc7', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio0319191020c6abe398e629e48d536bc7', 'repository/slo/perjanjianjualbeli/filenpwp0319191020c6abe398e629e48d536bc7', 'repository/slo/perjanjianjualbeli/filepkp0319191020c6abe398e629e48d536bc7'),
(86, '02A', '4357011017211', '2017-11-16', 'repository/slo/perjanjianjualbeli/filejbe3aac76a56c366d3bfcf1d69e38413c9.jpg', 'repository/slo/perjanjianjualbeli/fileslde3aac76a56c366d3bfcf1d69e38413c9.pdf', 'repository/slo/perjanjianjualbeli/filegitle3aac76a56c366d3bfcf1d69e38413c9.pdf', 'repository/slo/perjanjianjualbeli/filejki03a85e8757e81829aeb2385b26594703', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio03a85e8757e81829aeb2385b26594703', 'repository/slo/perjanjianjualbeli/filenpwp03a85e8757e81829aeb2385b26594703', 'repository/slo/perjanjianjualbeli/filepkp03a85e8757e81829aeb2385b26594703'),
(87, '02B', '536210327181', '2017-08-30', 'repository/slo/perjanjianjualbeli/filejb18414df951c42435f776c79cd5f4adb0.jpg', 'repository/slo/perjanjianjualbeli/filesld18414df951c42435f776c79cd5f4adb0.pdf', 'repository/slo/perjanjianjualbeli/filegitl18414df951c42435f776c79cd5f4adb0.pdf', 'repository/slo/perjanjianjualbeli/filejki18414df951c42435f776c79cd5f4adb0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._NINA_VENUS_1.pdf', 'repository/slo/perjanjianjualbeli/fileiod19c9920eb66eb8e927729b78ecb4edb', 'repository/slo/perjanjianjualbeli/filenpwpd19c9920eb66eb8e927729b78ecb4edb', 'repository/slo/perjanjianjualbeli/filepkpd19c9920eb66eb8e927729b78ecb4edb'),
(88, '02C', '536210598968', '2017-08-30', 'repository/slo/perjanjianjualbeli/filejbb0c97ad6500e2cedb7100072d40be0b1.jpg', 'repository/slo/perjanjianjualbeli/filesldb0c97ad6500e2cedb7100072d40be0b1.pdf', 'repository/slo/perjanjianjualbeli/filegitlb0c97ad6500e2cedb7100072d40be0b1.pdf', 'repository/slo/perjanjianjualbeli/filejkib0c97ad6500e2cedb7100072d40be0b1', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio32a82ca2e7d9699afb6154138edaf7a6', 'repository/slo/perjanjianjualbeli/filenpwp32a82ca2e7d9699afb6154138edaf7a6', 'repository/slo/perjanjianjualbeli/filepkp32a82ca2e7d9699afb6154138edaf7a6'),
(89, '02D', 'AGA.01.01/AREA SBW/17', '2017-09-04', 'repository/slo/perjanjianjualbeli/filejbca05b64292d14d3534a07ed591fe5b82.pdf', 'repository/slo/perjanjianjualbeli/filesld41499c2791727aa635dee5caadee168d.pdf', 'repository/slo/perjanjianjualbeli/filegitl41499c2791727aa635dee5caadee168d.pdf', 'repository/slo/perjanjianjualbeli/filejki41499c2791727aa635dee5caadee168d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-Irwan_Laksadien.pdf', 'repository/slo/perjanjianjualbeli/fileio41499c2791727aa635dee5caadee168d', 'repository/slo/perjanjianjualbeli/filenpwp41499c2791727aa635dee5caadee168d', 'repository/slo/perjanjianjualbeli/filepkp41499c2791727aa635dee5caadee168d'),
(90, '02E', '534763541981', '2017-10-05', 'repository/slo/perjanjianjualbeli/filejb62a1b1d3b9985652035945465789cd57.pdf', 'repository/slo/perjanjianjualbeli/filesld62a1b1d3b9985652035945465789cd57.pdf', 'repository/slo/perjanjianjualbeli/filegitl4fc88d254823f4f7a5349a66f0ef917e.pdf', 'repository/slo/perjanjianjualbeli/filejki4fc88d254823f4f7a5349a66f0ef917e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PEMKAB_KARAWANG.pdf', 'repository/slo/perjanjianjualbeli/fileio4fc88d254823f4f7a5349a66f0ef917e', 'repository/slo/perjanjianjualbeli/filenpwp4fc88d254823f4f7a5349a66f0ef917e', 'repository/slo/perjanjianjualbeli/filepkp4fc88d254823f4f7a5349a66f0ef917e'),
(91, '02F', '543105391771', '2017-12-13', 'repository/slo/perjanjianjualbeli/filejb0c0a10afd14e441503b1a3a7b700eb49.jpg', 'repository/slo/perjanjianjualbeli/filesld0c0a10afd14e441503b1a3a7b700eb49.pdf', 'repository/slo/perjanjianjualbeli/filegitl0c0a10afd14e441503b1a3a7b700eb49.pdf', 'repository/slo/perjanjianjualbeli/filejki0c0a10afd14e441503b1a3a7b700eb49', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-Mall_21_Avanue.pdf', 'repository/slo/perjanjianjualbeli/fileio0c0a10afd14e441503b1a3a7b700eb49', 'repository/slo/perjanjianjualbeli/filenpwp0c0a10afd14e441503b1a3a7b700eb49', 'repository/slo/perjanjianjualbeli/filepkp0c0a10afd14e441503b1a3a7b700eb49'),
(92, '02G', '534763541981 ', '2017-10-05', 'repository/slo/perjanjianjualbeli/filejb3461c0b4bbfd987331a2206eaa2086f2.pdf', 'repository/slo/perjanjianjualbeli/filesld3461c0b4bbfd987331a2206eaa2086f2.pdf', 'repository/slo/perjanjianjualbeli/filegitla6041a0e2adb4b38f5a99c15e2be6c45.pdf', 'repository/slo/perjanjianjualbeli/filejkia6041a0e2adb4b38f5a99c15e2be6c45', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PEMKAB_KARAWANG.pdf', 'repository/slo/perjanjianjualbeli/fileio2310eb9daaef6ca65682e3f710a5dfb2', 'repository/slo/perjanjianjualbeli/filenpwp2310eb9daaef6ca65682e3f710a5dfb2', 'repository/slo/perjanjianjualbeli/filepkp2310eb9daaef6ca65682e3f710a5dfb2'),
(93, '02H', '534763541981 ', '2017-10-05', 'repository/slo/perjanjianjualbeli/filejb25487adf717b88ce343739dad444b18f.pdf', 'repository/slo/perjanjianjualbeli/filesld25487adf717b88ce343739dad444b18f.pdf', 'repository/slo/perjanjianjualbeli/filegitl25487adf717b88ce343739dad444b18f.pdf', 'repository/slo/perjanjianjualbeli/filejki25487adf717b88ce343739dad444b18f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PEMKAB_KARAWANG.pdf', 'repository/slo/perjanjianjualbeli/fileio25487adf717b88ce343739dad444b18f', 'repository/slo/perjanjianjualbeli/filenpwp25487adf717b88ce343739dad444b18f', 'repository/slo/perjanjianjualbeli/filepkp25487adf717b88ce343739dad444b18f'),
(94, '02I', '534763541981 ', '2017-10-05', 'repository/slo/perjanjianjualbeli/filejba5361e7cb22487a6326b8ce5f832ef92.pdf', 'repository/slo/perjanjianjualbeli/fileslda5361e7cb22487a6326b8ce5f832ef92.pdf', 'repository/slo/perjanjianjualbeli/filegitla5361e7cb22487a6326b8ce5f832ef92.pdf', 'repository/slo/perjanjianjualbeli/filejkia5361e7cb22487a6326b8ce5f832ef92', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PEMKAB_KARAWANG.pdf', 'repository/slo/perjanjianjualbeli/fileioa5361e7cb22487a6326b8ce5f832ef92', 'repository/slo/perjanjianjualbeli/filenpwpa5361e7cb22487a6326b8ce5f832ef92', 'repository/slo/perjanjianjualbeli/filepkpa5361e7cb22487a6326b8ce5f832ef92'),
(95, '02J', '546103073806', '2017-11-07', 'repository/slo/perjanjianjualbeli/filejbe4a3e0ea1681c198e26ce5d8968543af.jpg', 'repository/slo/perjanjianjualbeli/fileslde4a3e0ea1681c198e26ce5d8968543af.pdf', 'repository/slo/perjanjianjualbeli/filegitle4a3e0ea1681c198e26ce5d8968543af.pdf', 'repository/slo/perjanjianjualbeli/filejkie4a3e0ea1681c198e26ce5d8968543af', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Instalasi_Air_Minum.pdf', 'repository/slo/perjanjianjualbeli/fileioe4a3e0ea1681c198e26ce5d8968543af', 'repository/slo/perjanjianjualbeli/filenpwpe4a3e0ea1681c198e26ce5d8968543af', 'repository/slo/perjanjianjualbeli/filepkpe4a3e0ea1681c198e26ce5d8968543af'),
(96, '02K', '141301933716', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejbdd476db5e93fc2cce6b81ed1f9f47b96.pdf', 'repository/slo/perjanjianjualbeli/fileslddd476db5e93fc2cce6b81ed1f9f47b96.pdf', 'repository/slo/perjanjianjualbeli/filegitlebb01ac1bad3e07e546d23298794bcb5.pdf', 'repository/slo/perjanjianjualbeli/filejkiebb01ac1bad3e07e546d23298794bcb5', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT_XYLO_INDAH_PRATAMA.pdf', 'repository/slo/perjanjianjualbeli/fileioebb01ac1bad3e07e546d23298794bcb5', 'repository/slo/perjanjianjualbeli/filenpwpebb01ac1bad3e07e546d23298794bcb5', 'repository/slo/perjanjianjualbeli/filepkpebb01ac1bad3e07e546d23298794bcb5'),
(97, '02L', '141301933716', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejbde77dd0236a5c36451fa973ae1800e9b.pdf', 'repository/slo/perjanjianjualbeli/filesldde77dd0236a5c36451fa973ae1800e9b.pdf', 'repository/slo/perjanjianjualbeli/filegitlde77dd0236a5c36451fa973ae1800e9b.pdf', 'repository/slo/perjanjianjualbeli/filejkide77dd0236a5c36451fa973ae1800e9b', 'repository/slo/perjanjianjualbeli/Spesifikasi_InstalasiPT.XYLO_INDAH_PRATAMA.pdf', 'repository/slo/perjanjianjualbeli/fileiode77dd0236a5c36451fa973ae1800e9b', 'repository/slo/perjanjianjualbeli/filenpwpde77dd0236a5c36451fa973ae1800e9b', 'repository/slo/perjanjianjualbeli/filepkpde77dd0236a5c36451fa973ae1800e9b'),
(98, '02M', '141301933716', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejb5e1f2c20a49e0541899b4ca0fbd361f7.pdf', 'repository/slo/perjanjianjualbeli/filesld5e1f2c20a49e0541899b4ca0fbd361f7.pdf', 'repository/slo/perjanjianjualbeli/filegitl5e1f2c20a49e0541899b4ca0fbd361f7.pdf', 'repository/slo/perjanjianjualbeli/filejki5e1f2c20a49e0541899b4ca0fbd361f7', 'repository/slo/perjanjianjualbeli/Spesifikasi_InstalasiPT.XYLO_INDAH_PRATAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio5e1f2c20a49e0541899b4ca0fbd361f7', 'repository/slo/perjanjianjualbeli/filenpwp5e1f2c20a49e0541899b4ca0fbd361f7', 'repository/slo/perjanjianjualbeli/filepkp5e1f2c20a49e0541899b4ca0fbd361f7'),
(99, '02N', '141301933716', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejb9282e66e408fb0537660986d0112dffc.pdf', 'repository/slo/perjanjianjualbeli/filesld9282e66e408fb0537660986d0112dffc.pdf', 'repository/slo/perjanjianjualbeli/filegitl9282e66e408fb0537660986d0112dffc.pdf', 'repository/slo/perjanjianjualbeli/filejki9282e66e408fb0537660986d0112dffc', 'repository/slo/perjanjianjualbeli/Spesifikasi_InstalasiPT.XYLO_INDAH_PRATAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio9282e66e408fb0537660986d0112dffc', 'repository/slo/perjanjianjualbeli/filenpwp9282e66e408fb0537660986d0112dffc', 'repository/slo/perjanjianjualbeli/filepkp9282e66e408fb0537660986d0112dffc'),
(100, '02O', '141301933716', '2017-09-29', 'repository/slo/perjanjianjualbeli/filejb9f8e24e492b9531d7ae9095db0b71806.pdf', 'repository/slo/perjanjianjualbeli/filesld9f8e24e492b9531d7ae9095db0b71806.pdf', 'repository/slo/perjanjianjualbeli/filegitl9f8e24e492b9531d7ae9095db0b71806.pdf', 'repository/slo/perjanjianjualbeli/filejki9f8e24e492b9531d7ae9095db0b71806', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT.XYLO_INDAH_PRATAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio9f8e24e492b9531d7ae9095db0b71806', 'repository/slo/perjanjianjualbeli/filenpwp9f8e24e492b9531d7ae9095db0b71806', 'repository/slo/perjanjianjualbeli/filepkp9f8e24e492b9531d7ae9095db0b71806'),
(101, '02P', '538652197578', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejbc93b1657445fc30d375b01be6a55ae9f.pdf', 'repository/slo/perjanjianjualbeli/filesldc93b1657445fc30d375b01be6a55ae9f.pdf', 'repository/slo/perjanjianjualbeli/filegitlc93b1657445fc30d375b01be6a55ae9f.pdf', 'repository/slo/perjanjianjualbeli/filejkic93b1657445fc30d375b01be6a55ae9f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ENTEK_SEPARINDO_ASIA.pdf', 'repository/slo/perjanjianjualbeli/fileioc93b1657445fc30d375b01be6a55ae9f', 'repository/slo/perjanjianjualbeli/filenpwpc93b1657445fc30d375b01be6a55ae9f', 'repository/slo/perjanjianjualbeli/filepkpc93b1657445fc30d375b01be6a55ae9f'),
(102, '02Q', '538652197578', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejbfac7af3cc8dc3576a724e94cbad098ac.pdf', 'repository/slo/perjanjianjualbeli/filesldfac7af3cc8dc3576a724e94cbad098ac.pdf', 'repository/slo/perjanjianjualbeli/filegitlfac7af3cc8dc3576a724e94cbad098ac.pdf', 'repository/slo/perjanjianjualbeli/filejkifac7af3cc8dc3576a724e94cbad098ac', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ENTEK_SEPARINDO_ASIA.pdf', 'repository/slo/perjanjianjualbeli/fileiofac7af3cc8dc3576a724e94cbad098ac', 'repository/slo/perjanjianjualbeli/filenpwpfac7af3cc8dc3576a724e94cbad098ac', 'repository/slo/perjanjianjualbeli/filepkpfac7af3cc8dc3576a724e94cbad098ac'),
(103, '02R', '539810002981', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejba361ec82678d6409cc85b028246d4995.jpg', 'repository/slo/perjanjianjualbeli/fileslda361ec82678d6409cc85b028246d4995.pdf', 'repository/slo/perjanjianjualbeli/filegitla361ec82678d6409cc85b028246d4995.pdf', 'repository/slo/perjanjianjualbeli/filejkia361ec82678d6409cc85b028246d4995', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._WIN_APLIANCE_1.pdf', 'repository/slo/perjanjianjualbeli/fileioa361ec82678d6409cc85b028246d4995', 'repository/slo/perjanjianjualbeli/filenpwpa361ec82678d6409cc85b028246d4995', 'repository/slo/perjanjianjualbeli/filepkpa361ec82678d6409cc85b028246d4995'),
(104, '02S', '539810002981 ', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejb4e5b5d7b1a5debc5f6809b640b1de12b.jpg', 'repository/slo/perjanjianjualbeli/filesld4e5b5d7b1a5debc5f6809b640b1de12b.pdf', 'repository/slo/perjanjianjualbeli/filegitl4e5b5d7b1a5debc5f6809b640b1de12b.pdf', 'repository/slo/perjanjianjualbeli/filejki4e5b5d7b1a5debc5f6809b640b1de12b', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._WIN_APLIANCE_1.pdf', 'repository/slo/perjanjianjualbeli/fileiob03f2f75986342e3682e52c2d46b9007', 'repository/slo/perjanjianjualbeli/filenpwpb03f2f75986342e3682e52c2d46b9007', 'repository/slo/perjanjianjualbeli/filepkpb03f2f75986342e3682e52c2d46b9007'),
(105, '02T', '534253699615', '2017-12-06', 'repository/slo/perjanjianjualbeli/filejb96f62801e62193ae755e3d3e92121401.jpg', 'repository/slo/perjanjianjualbeli/filesld96f62801e62193ae755e3d3e92121401.pdf', 'repository/slo/perjanjianjualbeli/filegitl96f62801e62193ae755e3d3e92121401.pdf', 'repository/slo/perjanjianjualbeli/filejkife553da6f2636058f6e7a7cb94080e3f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_CV._AGRO_BUMI.pdf', 'repository/slo/perjanjianjualbeli/fileiofe553da6f2636058f6e7a7cb94080e3f', 'repository/slo/perjanjianjualbeli/filenpwpfe553da6f2636058f6e7a7cb94080e3f', 'repository/slo/perjanjianjualbeli/filepkpfe553da6f2636058f6e7a7cb94080e3f'),
(106, '02U', '534253699615', '2018-01-20', 'repository/slo/perjanjianjualbeli/filejbd7f65f375d99a5d361e470801aa0e727.pdf', 'repository/slo/perjanjianjualbeli/filesldd7f65f375d99a5d361e470801aa0e727.jpg', 'repository/slo/perjanjianjualbeli/filegitld7f65f375d99a5d361e470801aa0e727.pdf', 'repository/slo/perjanjianjualbeli/filejkid7f65f375d99a5d361e470801aa0e727', 'repository/slo/perjanjianjualbeli/filejb96f62801e62193ae755e3d3e92121401.jpg', 'repository/slo/perjanjianjualbeli/fileiod7f65f375d99a5d361e470801aa0e727', 'repository/slo/perjanjianjualbeli/filenpwpd7f65f375d99a5d361e470801aa0e727', 'repository/slo/perjanjianjualbeli/filepkpd7f65f375d99a5d361e470801aa0e727'),
(107, '02V', '538652197578', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejbb9cac867e69d3de6ffc77ebe04536843.pdf', 'repository/slo/perjanjianjualbeli/filesldb9cac867e69d3de6ffc77ebe04536843.pdf', 'repository/slo/perjanjianjualbeli/filegitl350b48bb23338d27728aa92d88992e3c.pdf', 'repository/slo/perjanjianjualbeli/filejki350b48bb23338d27728aa92d88992e3c', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ENTEK_SEPARINDO_ASIA.pdf', 'repository/slo/perjanjianjualbeli/fileio350b48bb23338d27728aa92d88992e3c', 'repository/slo/perjanjianjualbeli/filenpwp350b48bb23338d27728aa92d88992e3c', 'repository/slo/perjanjianjualbeli/filepkp350b48bb23338d27728aa92d88992e3c'),
(108, '02W', '538652197578', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejbbce063da12b5c64685df70ac1d53c6d4.pdf', 'repository/slo/perjanjianjualbeli/filesldbce063da12b5c64685df70ac1d53c6d4.pdf', 'repository/slo/perjanjianjualbeli/filegitlbce063da12b5c64685df70ac1d53c6d4.pdf', 'repository/slo/perjanjianjualbeli/filejkibce063da12b5c64685df70ac1d53c6d4', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ENTEK_SEPARINDO_ASIA.pdf', 'repository/slo/perjanjianjualbeli/fileiobce063da12b5c64685df70ac1d53c6d4', 'repository/slo/perjanjianjualbeli/filenpwpbce063da12b5c64685df70ac1d53c6d4', 'repository/slo/perjanjianjualbeli/filepkpbce063da12b5c64685df70ac1d53c6d4'),
(109, '02X', '53981000981', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejb6231fe527e32fbaa8c05186a0d950da0.jpg', 'repository/slo/perjanjianjualbeli/filesld6231fe527e32fbaa8c05186a0d950da0.pdf', 'repository/slo/perjanjianjualbeli/filegitl6231fe527e32fbaa8c05186a0d950da0.pdf', 'repository/slo/perjanjianjualbeli/filejki6231fe527e32fbaa8c05186a0d950da0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._WIN_APLIANCE_1.pdf', 'repository/slo/perjanjianjualbeli/fileio6231fe527e32fbaa8c05186a0d950da0', 'repository/slo/perjanjianjualbeli/filenpwp6231fe527e32fbaa8c05186a0d950da0', 'repository/slo/perjanjianjualbeli/filepkp6231fe527e32fbaa8c05186a0d950da0'),
(110, '02Y', '534253699615 ', '2017-12-06', 'repository/slo/perjanjianjualbeli/filejb00076342b51b046414cd3e1cac5b6781.jpg', 'repository/slo/perjanjianjualbeli/filesld00076342b51b046414cd3e1cac5b6781.pdf', 'repository/slo/perjanjianjualbeli/filegitl00076342b51b046414cd3e1cac5b6781.pdf', 'repository/slo/perjanjianjualbeli/filejki00076342b51b046414cd3e1cac5b6781', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_CV._AGRO_BUMI.pdf', 'repository/slo/perjanjianjualbeli/fileio9d03b310867b77279368c4dfb5925011', 'repository/slo/perjanjianjualbeli/filenpwp9d03b310867b77279368c4dfb5925011', 'repository/slo/perjanjianjualbeli/filepkp9d03b310867b77279368c4dfb5925011'),
(111, '02Z', '2232332', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejb91d1b4368badbc98a44edc5db2ab1f7d.pdf', 'repository/slo/perjanjianjualbeli/filesld91d1b4368badbc98a44edc5db2ab1f7d.pdf', 'repository/slo/perjanjianjualbeli/filegitl91d1b4368badbc98a44edc5db2ab1f7d.pdf', 'repository/slo/perjanjianjualbeli/filejki91d1b4368badbc98a44edc5db2ab1f7d', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio91d1b4368badbc98a44edc5db2ab1f7d', 'repository/slo/perjanjianjualbeli/filenpwp91d1b4368badbc98a44edc5db2ab1f7d', 'repository/slo/perjanjianjualbeli/filepkp91d1b4368badbc98a44edc5db2ab1f7d'),
(112, '030', '12345', '2018-01-25', 'repository/slo/perjanjianjualbeli/filejb931af2410301cbcda05e01c15a83153a.pdf', 'repository/slo/perjanjianjualbeli/filesld931af2410301cbcda05e01c15a83153a.jpg', 'repository/slo/perjanjianjualbeli/filegitl931af2410301cbcda05e01c15a83153a.jpg', 'repository/slo/perjanjianjualbeli/filejki931af2410301cbcda05e01c15a83153a', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio931af2410301cbcda05e01c15a83153a', 'repository/slo/perjanjianjualbeli/filenpwp931af2410301cbcda05e01c15a83153a', 'repository/slo/perjanjianjualbeli/filepkp931af2410301cbcda05e01c15a83153a'),
(113, '031', '547302466806', '2017-11-10', 'repository/slo/perjanjianjualbeli/filejb3a8dd1d552d711df9c135e2968623222.pdf', 'repository/slo/perjanjianjualbeli/filesld3a8dd1d552d711df9c135e2968623222.pdf', 'repository/slo/perjanjianjualbeli/filegitl3a8dd1d552d711df9c135e2968623222.pdf', 'repository/slo/perjanjianjualbeli/filejki3a8dd1d552d711df9c135e2968623222', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Muji_Mulyoadi_Wibowo,_ST-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio3a8dd1d552d711df9c135e2968623222', 'repository/slo/perjanjianjualbeli/filenpwp3a8dd1d552d711df9c135e2968623222', 'repository/slo/perjanjianjualbeli/filepkp3a8dd1d552d711df9c135e2968623222'),
(114, '032', '383.PJ/AGA 01.01/SPJBTL/AREA BKS/2017', '2017-11-29', 'repository/slo/perjanjianjualbeli/filejb8a973720a2571f392367282194d8f588.pdf', 'repository/slo/perjanjianjualbeli/filesld8a973720a2571f392367282194d8f588.pdf', 'repository/slo/perjanjianjualbeli/filegitl8a973720a2571f392367282194d8f588.pdf', 'repository/slo/perjanjianjualbeli/filejki8a973720a2571f392367282194d8f588', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi._RSIA_Yayasan_Hermina.pdf', 'repository/slo/perjanjianjualbeli/fileio8a973720a2571f392367282194d8f588', 'repository/slo/perjanjianjualbeli/filenpwp8a973720a2571f392367282194d8f588', 'repository/slo/perjanjianjualbeli/filepkp8a973720a2571f392367282194d8f588'),
(115, '033', '541100907715', '2016-11-04', 'repository/slo/perjanjianjualbeli/filejb222b82f0e0665b4a308250fa0c507cb7.pdf', 'repository/slo/perjanjianjualbeli/filesld222b82f0e0665b4a308250fa0c507cb7.pdf', 'repository/slo/perjanjianjualbeli/filegitlf0a9b6e1b70a99bbabe6d16140a70e68.pdf', 'repository/slo/perjanjianjualbeli/filejki172898d48a06b877a01fe3df56c11e8e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi.pdf', 'repository/slo/perjanjianjualbeli/fileio172898d48a06b877a01fe3df56c11e8e', 'repository/slo/perjanjianjualbeli/filenpwp172898d48a06b877a01fe3df56c11e8e', 'repository/slo/perjanjianjualbeli/filepkp172898d48a06b877a01fe3df56c11e8e'),
(116, '034', '54610055535', '2013-05-28', 'repository/slo/perjanjianjualbeli/filejb3d9a29f57644757aba9a207a7d9832ee.pdf', 'repository/slo/perjanjianjualbeli/filesld1eb6a9161b1eb9b10cdd5784ccef8ba1.pdf', 'repository/slo/perjanjianjualbeli/filegitl3d9a29f57644757aba9a207a7d9832ee.pdf', 'repository/slo/perjanjianjualbeli/filejki3d9a29f57644757aba9a207a7d9832ee', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_-_PT._RODA_MAS_LOGAM_UTAMA.pdf', 'repository/slo/perjanjianjualbeli/fileio3d9a29f57644757aba9a207a7d9832ee', 'repository/slo/perjanjianjualbeli/filenpwp3d9a29f57644757aba9a207a7d9832ee', 'repository/slo/perjanjianjualbeli/filepkp3d9a29f57644757aba9a207a7d9832ee'),
(117, '035', '018.PJ/AGA.01.01/A.CPP/2016', '2016-10-03', 'repository/slo/perjanjianjualbeli/filejbff3db8a2ece9ba44d5dc605451dbcdab.pdf', 'repository/slo/perjanjianjualbeli/filesld4c4c92dafb87bf05190b793e4e5b2099.pdf', 'repository/slo/perjanjianjualbeli/filegitl4c4c92dafb87bf05190b793e4e5b2099.pdf', 'repository/slo/perjanjianjualbeli/filejki4c4c92dafb87bf05190b793e4e5b2099', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_GOR_Rawamangun.pdf', 'repository/slo/perjanjianjualbeli/fileio4c4c92dafb87bf05190b793e4e5b2099', 'repository/slo/perjanjianjualbeli/filenpwp4c4c92dafb87bf05190b793e4e5b2099', 'repository/slo/perjanjianjualbeli/filepkp4c4c92dafb87bf05190b793e4e5b2099'),
(118, '036', '541100907715', '2016-11-04', 'repository/slo/perjanjianjualbeli/filejb16c0e3a40f02bb0f3b0d5e5c062684b4.pdf', 'repository/slo/perjanjianjualbeli/filesld16c0e3a40f02bb0f3b0d5e5c062684b4.pdf', 'repository/slo/perjanjianjualbeli/filegitl16c0e3a40f02bb0f3b0d5e5c062684b4.pdf', 'repository/slo/perjanjianjualbeli/filejki16c0e3a40f02bb0f3b0d5e5c062684b4', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_RSCM.pdf', 'repository/slo/perjanjianjualbeli/fileio16c0e3a40f02bb0f3b0d5e5c062684b4', 'repository/slo/perjanjianjualbeli/filenpwp16c0e3a40f02bb0f3b0d5e5c062684b4', 'repository/slo/perjanjianjualbeli/filepkp16c0e3a40f02bb0f3b0d5e5c062684b4'),
(119, '037', '045.PJ/AGA.01.01/ATPI/2017', '2017-09-26', 'repository/slo/perjanjianjualbeli/filejb3b487469268d433faecb3cfde65b064d.pdf', 'repository/slo/perjanjianjualbeli/filesld2facfc7e2bac183fde5c3e12910025f5.pdf', 'repository/slo/perjanjianjualbeli/filegitl2facfc7e2bac183fde5c3e12910025f5.pdf', 'repository/slo/perjanjianjualbeli/filejkic67fbf3d56498266b378f2642ebb98d1', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ANTARTIKA_INDO_SAMUDRA.pdf', 'repository/slo/perjanjianjualbeli/fileioc67fbf3d56498266b378f2642ebb98d1', 'repository/slo/perjanjianjualbeli/filenpwpc67fbf3d56498266b378f2642ebb98d1', 'repository/slo/perjanjianjualbeli/filepkpc67fbf3d56498266b378f2642ebb98d1'),
(120, '038', '543105387784', '2017-11-09', 'repository/slo/perjanjianjualbeli/filejbe5fbb1b71f8e2681f2afb24f6811b86c.pdf', 'repository/slo/perjanjianjualbeli/filesld28b32761412524141fb659679f45f5f8.pdf', 'repository/slo/perjanjianjualbeli/filegitle5fbb1b71f8e2681f2afb24f6811b86c.pdf', 'repository/slo/perjanjianjualbeli/filejkie5fbb1b71f8e2681f2afb24f6811b86c', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KPM_OIL_GAS.pdf', 'repository/slo/perjanjianjualbeli/fileioe5fbb1b71f8e2681f2afb24f6811b86c', 'repository/slo/perjanjianjualbeli/filenpwpe5fbb1b71f8e2681f2afb24f6811b86c', 'repository/slo/perjanjianjualbeli/filepkpe5fbb1b71f8e2681f2afb24f6811b86c'),
(121, '039', '02.PJ/AGA 01.01/SPJBTL/AREA BKS/2018', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejbbf66c0acd7893cc487f0346ca8ae6976.pdf', 'repository/slo/perjanjianjualbeli/filesldbf66c0acd7893cc487f0346ca8ae6976.pdf', 'repository/slo/perjanjianjualbeli/filegitl42fbb2ed58585eb2aa7c61f8f5fde300.pdf', 'repository/slo/perjanjianjualbeli/filejkibf66c0acd7893cc487f0346ca8ae6976', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SYNTRUM_LOGISTICS.pdf', 'repository/slo/perjanjianjualbeli/fileiobf66c0acd7893cc487f0346ca8ae6976', 'repository/slo/perjanjianjualbeli/filenpwpbf66c0acd7893cc487f0346ca8ae6976', 'repository/slo/perjanjianjualbeli/filepkpbf66c0acd7893cc487f0346ca8ae6976'),
(122, '03A', '537715062648', '2017-12-19', 'repository/slo/perjanjianjualbeli/filejbab6a9b128ca17b6a5d9192c35924509d.pdf', 'repository/slo/perjanjianjualbeli/filesld4a2ef1d52e2ccb7d11a918e35ff2abc1.pdf', 'repository/slo/perjanjianjualbeli/filegitlab6a9b128ca17b6a5d9192c35924509d.pdf', 'repository/slo/perjanjianjualbeli/filejkiab6a9b128ca17b6a5d9192c35924509d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_KOPKAR_TBINA.pdf', 'repository/slo/perjanjianjualbeli/fileioab6a9b128ca17b6a5d9192c35924509d', 'repository/slo/perjanjianjualbeli/filenpwpab6a9b128ca17b6a5d9192c35924509d', 'repository/slo/perjanjianjualbeli/filepkpab6a9b128ca17b6a5d9192c35924509d'),
(123, '03B', '535770023586', '2017-11-23', 'repository/slo/perjanjianjualbeli/filejbb0b9fd6025564a2ea51fb87a1be4baa0.pdf', 'repository/slo/perjanjianjualbeli/filesldb0b9fd6025564a2ea51fb87a1be4baa0.pdf', 'repository/slo/perjanjianjualbeli/filegitlb0b9fd6025564a2ea51fb87a1be4baa0.pdf', 'repository/slo/perjanjianjualbeli/filejkib0b9fd6025564a2ea51fb87a1be4baa0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_DINASPERHUBUNGAN_KOTA_BANDUNG.pdf', 'repository/slo/perjanjianjualbeli/fileiob0b9fd6025564a2ea51fb87a1be4baa0', 'repository/slo/perjanjianjualbeli/filenpwpb0b9fd6025564a2ea51fb87a1be4baa0', 'repository/slo/perjanjianjualbeli/filepkpb0b9fd6025564a2ea51fb87a1be4baa0'),
(124, '03C', '535770023586', '2017-11-23', 'repository/slo/perjanjianjualbeli/filejba2cbf85290641e51ab459edbc43e4bd3.pdf', 'repository/slo/perjanjianjualbeli/fileslda2cbf85290641e51ab459edbc43e4bd3.pdf', 'repository/slo/perjanjianjualbeli/filegitla2cbf85290641e51ab459edbc43e4bd3.pdf', 'repository/slo/perjanjianjualbeli/filejkia2cbf85290641e51ab459edbc43e4bd3', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_DINASPERHUBUNGAN_KOTA_BANDUNG.pdf', 'repository/slo/perjanjianjualbeli/fileioa61443cda942e59614ecd9dc8df40b35', 'repository/slo/perjanjianjualbeli/filenpwpa61443cda942e59614ecd9dc8df40b35', 'repository/slo/perjanjianjualbeli/filepkpa61443cda942e59614ecd9dc8df40b35'),
(125, '03D', 'tes01', '2018-02-12', 'repository/slo/perjanjianjualbeli/filejbb4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/filesldb4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/filegitlb4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/filejkib4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileiob4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/filenpwpb4cf9d7567099f55d5930f3f5c80c928', 'repository/slo/perjanjianjualbeli/filepkpb4cf9d7567099f55d5930f3f5c80c928'),
(126, '03E', '1236', '2018-02-12', 'repository/slo/perjanjianjualbeli/filejb82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/filesld82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/filegitl82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/filejki82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/filenpwp82cf8d84223e8a87611cc72efad2844d', 'repository/slo/perjanjianjualbeli/filepkp82cf8d84223e8a87611cc72efad2844d'),
(127, '03F', '535770022272', '2014-11-02', 'repository/slo/perjanjianjualbeli/filejbab7764fde04f59ffbdcb61b77abc586d.jpg', 'repository/slo/perjanjianjualbeli/filesldab7764fde04f59ffbdcb61b77abc586d.pdf', 'repository/slo/perjanjianjualbeli/filegitlab7764fde04f59ffbdcb61b77abc586d.pdf', 'repository/slo/perjanjianjualbeli/filejkiab7764fde04f59ffbdcb61b77abc586d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._INDAH_GEMA_NUSANTARA.pdf', 'repository/slo/perjanjianjualbeli/fileioab7764fde04f59ffbdcb61b77abc586d', 'repository/slo/perjanjianjualbeli/filenpwpab7764fde04f59ffbdcb61b77abc586d', 'repository/slo/perjanjianjualbeli/filepkpab7764fde04f59ffbdcb61b77abc586d'),
(128, '03G', '535770022272', '2014-11-02', 'repository/slo/perjanjianjualbeli/filejbc0c2e2f958c7513268732ba47f4c774f.jpg', 'repository/slo/perjanjianjualbeli/filesldc0c2e2f958c7513268732ba47f4c774f.pdf', 'repository/slo/perjanjianjualbeli/filegitlc0c2e2f958c7513268732ba47f4c774f.pdf', 'repository/slo/perjanjianjualbeli/filejkic0c2e2f958c7513268732ba47f4c774f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._INDAH_GEMA_NUSANTARA.pdf', 'repository/slo/perjanjianjualbeli/fileioc0c2e2f958c7513268732ba47f4c774f', 'repository/slo/perjanjianjualbeli/filenpwpc0c2e2f958c7513268732ba47f4c774f', 'repository/slo/perjanjianjualbeli/filepkpc0c2e2f958c7513268732ba47f4c774f'),
(129, '03H', '0457/AGA.01.01/RYN.PRM-BKS/2017', '2017-12-13', 'repository/slo/perjanjianjualbeli/filejba9a0261b68b01409ec16cc9e857a9c2f.jpg', 'repository/slo/perjanjianjualbeli/fileslda9a0261b68b01409ec16cc9e857a9c2f.pdf', 'repository/slo/perjanjianjualbeli/filegitla9a0261b68b01409ec16cc9e857a9c2f.pdf', 'repository/slo/perjanjianjualbeli/filejkia9a0261b68b01409ec16cc9e857a9c2f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CIPTA_ORION_METAL.pdf', 'repository/slo/perjanjianjualbeli/fileioa9a0261b68b01409ec16cc9e857a9c2f', 'repository/slo/perjanjianjualbeli/filenpwpa9a0261b68b01409ec16cc9e857a9c2f', 'repository/slo/perjanjianjualbeli/filepkpa9a0261b68b01409ec16cc9e857a9c2f'),
(130, '03I', '0457/AGA.01.01/RYN.PRM-BKS/2017', '2017-12-13', 'repository/slo/perjanjianjualbeli/filejb2c012e7a6f27c4e60457c19df26980f7.jpg', 'repository/slo/perjanjianjualbeli/filesld2c012e7a6f27c4e60457c19df26980f7.pdf', 'repository/slo/perjanjianjualbeli/filegitl2c012e7a6f27c4e60457c19df26980f7.pdf', 'repository/slo/perjanjianjualbeli/filejki2c012e7a6f27c4e60457c19df26980f7', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CIPTA_ORION_METAL.pdf', 'repository/slo/perjanjianjualbeli/fileioa32ac5959032f0eb327cb2d61deb1795', 'repository/slo/perjanjianjualbeli/filenpwpa32ac5959032f0eb327cb2d61deb1795', 'repository/slo/perjanjianjualbeli/filepkpa32ac5959032f0eb327cb2d61deb1795'),
(131, '03J', '0001/AGA.01.01/A.SMD/2018', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejbdffc194ec86997906e997e757f27ab90.pdf', 'repository/slo/perjanjianjualbeli/fileslddffc194ec86997906e997e757f27ab90.pdf', 'repository/slo/perjanjianjualbeli/filegitldffc194ec86997906e997e757f27ab90.pdf', 'repository/slo/perjanjianjualbeli/filejkidffc194ec86997906e997e757f27ab90', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KALDU_SARI_NABATI_INDO-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileiodffc194ec86997906e997e757f27ab90', 'repository/slo/perjanjianjualbeli/filenpwpdffc194ec86997906e997e757f27ab90', 'repository/slo/perjanjianjualbeli/filepkpdffc194ec86997906e997e757f27ab90'),
(132, '03K', '0001/AGA.01.01/A.SMD/2018', '2018-01-08', 'repository/slo/perjanjianjualbeli/filejb619897e5ad299c9a699e35896062ff8f.pdf', 'repository/slo/perjanjianjualbeli/filesld619897e5ad299c9a699e35896062ff8f.pdf', 'repository/slo/perjanjianjualbeli/filegitl619897e5ad299c9a699e35896062ff8f.pdf', 'repository/slo/perjanjianjualbeli/filejki619897e5ad299c9a699e35896062ff8f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KALDU_SARI_NABATI_INDO-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileioa914e98cf31359459cb6a39a1bdda54e', 'repository/slo/perjanjianjualbeli/filenpwpa914e98cf31359459cb6a39a1bdda54e', 'repository/slo/perjanjianjualbeli/filepkpa914e98cf31359459cb6a39a1bdda54e'),
(133, '03L', '5359811000677', '2017-11-17', 'repository/slo/perjanjianjualbeli/filejb56fe6c47e9e6c80887dd81624cd8924d.pdf', 'repository/slo/perjanjianjualbeli/filesld56fe6c47e9e6c80887dd81624cd8924d.pdf', 'repository/slo/perjanjianjualbeli/filegitl56fe6c47e9e6c80887dd81624cd8924d.pdf', 'repository/slo/perjanjianjualbeli/filejki56fe6c47e9e6c80887dd81624cd8924d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-RSU_CIMAHI.pdf', 'repository/slo/perjanjianjualbeli/fileio56fe6c47e9e6c80887dd81624cd8924d', 'repository/slo/perjanjianjualbeli/filenpwp56fe6c47e9e6c80887dd81624cd8924d', 'repository/slo/perjanjianjualbeli/filepkp56fe6c47e9e6c80887dd81624cd8924d'),
(134, '03M', '5359811000677', '2017-11-17', 'repository/slo/perjanjianjualbeli/filejb6344f55377d4ba90a124a144c17dbbc9.pdf', 'repository/slo/perjanjianjualbeli/filesldc7e9499585b50fb94fc05544291dda37.pdf', 'repository/slo/perjanjianjualbeli/filegitl6344f55377d4ba90a124a144c17dbbc9.pdf', 'repository/slo/perjanjianjualbeli/filejki6344f55377d4ba90a124a144c17dbbc9', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_RSU_CIMAHI.pdf', 'repository/slo/perjanjianjualbeli/fileio6344f55377d4ba90a124a144c17dbbc9', 'repository/slo/perjanjianjualbeli/filenpwp6344f55377d4ba90a124a144c17dbbc9', 'repository/slo/perjanjianjualbeli/filepkp6344f55377d4ba90a124a144c17dbbc9'),
(135, '03N', '0007.PJ/AGA.01.01/A.KIT/2016', '2016-08-08', 'repository/slo/perjanjianjualbeli/filejb11bc7c175dd1394819a40f74656c8287.pdf', 'repository/slo/perjanjianjualbeli/filesld9bae35e57f5bfc4b3da5df9a827cc7c3.jpg', 'repository/slo/perjanjianjualbeli/filegitl9bae35e57f5bfc4b3da5df9a827cc7c3.pdf', 'repository/slo/perjanjianjualbeli/filejki9bae35e57f5bfc4b3da5df9a827cc7c3', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._SUVARNA_LAND.pdf', 'repository/slo/perjanjianjualbeli/fileio9bae35e57f5bfc4b3da5df9a827cc7c3', 'repository/slo/perjanjianjualbeli/filenpwp9bae35e57f5bfc4b3da5df9a827cc7c3', 'repository/slo/perjanjianjualbeli/filepkp9bae35e57f5bfc4b3da5df9a827cc7c3'),
(136, '03O', '0007.PJ/AGA.01.01/A.KIT/2016', '2016-08-08', 'repository/slo/perjanjianjualbeli/filejb2cb2dd0477d21642e77ab41657f33f92', 'repository/slo/perjanjianjualbeli/filesld2cb2dd0477d21642e77ab41657f33f92.jpg', 'repository/slo/perjanjianjualbeli/filegitl2cb2dd0477d21642e77ab41657f33f92.pdf', 'repository/slo/perjanjianjualbeli/filejki2cb2dd0477d21642e77ab41657f33f92', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio2cb2dd0477d21642e77ab41657f33f92', 'repository/slo/perjanjianjualbeli/filenpwp2cb2dd0477d21642e77ab41657f33f92', 'repository/slo/perjanjianjualbeli/filepkp2cb2dd0477d21642e77ab41657f33f92'),
(137, '03P', '023.Pj/160/UPPRN/2004', '2004-07-21', 'repository/slo/perjanjianjualbeli/filejbbdcd83fe410d221bde38a36801b9aaa8.pdf', 'repository/slo/perjanjianjualbeli/filesldf72e23deac10a2a8fd487ec27d7c68f6.pdf', 'repository/slo/perjanjianjualbeli/filegitlf72e23deac10a2a8fd487ec27d7c68f6.pdf', 'repository/slo/perjanjianjualbeli/filejkif72e23deac10a2a8fd487ec27d7c68f6', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Hotel_Grand_Setiabudi.pdf', 'repository/slo/perjanjianjualbeli/fileiof72e23deac10a2a8fd487ec27d7c68f6', 'repository/slo/perjanjianjualbeli/filenpwpf72e23deac10a2a8fd487ec27d7c68f6', 'repository/slo/perjanjianjualbeli/filepkpf72e23deac10a2a8fd487ec27d7c68f6'),
(138, '03Q', '023.Pj/160/UPPRN/2004', '2004-07-21', 'repository/slo/perjanjianjualbeli/filejbc1614fe26a1ca8675c285cc69599ee2d.pdf', 'repository/slo/perjanjianjualbeli/filesld290d86d1f76716d0494c271939c17bca.pdf', 'repository/slo/perjanjianjualbeli/filegitl24dc05e7bd0a28719a07dce92571c237.pdf', 'repository/slo/perjanjianjualbeli/filejki290d86d1f76716d0494c271939c17bca', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-Hotel_Setiabudi.pdf', 'repository/slo/perjanjianjualbeli/fileio290d86d1f76716d0494c271939c17bca', 'repository/slo/perjanjianjualbeli/filenpwp290d86d1f76716d0494c271939c17bca', 'repository/slo/perjanjianjualbeli/filepkp290d86d1f76716d0494c271939c17bca'),
(139, '03R', '537710531802130004', '2018-02-13', 'repository/slo/perjanjianjualbeli/filejb421c64f8b0301b305882f4aab8a084d0.pdf', 'repository/slo/perjanjianjualbeli/filesld421c64f8b0301b305882f4aab8a084d0.pdf', 'repository/slo/perjanjianjualbeli/filegitl421c64f8b0301b305882f4aab8a084d0.pdf', 'repository/slo/perjanjianjualbeli/filejki421c64f8b0301b305882f4aab8a084d0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SMCC_UTAMA_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio421c64f8b0301b305882f4aab8a084d0', 'repository/slo/perjanjianjualbeli/filenpwp421c64f8b0301b305882f4aab8a084d0', 'repository/slo/perjanjianjualbeli/filepkp421c64f8b0301b305882f4aab8a084d0'),
(140, '03S', '537710531802130004', '2018-02-13', 'repository/slo/perjanjianjualbeli/filejb390ee79c552acf94c5871f5ca32bc28b.pdf', 'repository/slo/perjanjianjualbeli/filesld390ee79c552acf94c5871f5ca32bc28b.pdf', 'repository/slo/perjanjianjualbeli/filegitl390ee79c552acf94c5871f5ca32bc28b.pdf', 'repository/slo/perjanjianjualbeli/filejki390ee79c552acf94c5871f5ca32bc28b', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SMCC_UTAMA_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio390ee79c552acf94c5871f5ca32bc28b', 'repository/slo/perjanjianjualbeli/filenpwp390ee79c552acf94c5871f5ca32bc28b', 'repository/slo/perjanjianjualbeli/filepkp390ee79c552acf94c5871f5ca32bc28b'),
(141, '03T', '548200002877', '2014-04-20', 'repository/slo/perjanjianjualbeli/filejb2f02702d6cb1d887f7d72ed06046df27.pdf', 'repository/slo/perjanjianjualbeli/filesld20da9a657a486ffec4af228c177f1221.pdf', 'repository/slo/perjanjianjualbeli/filegitl20da9a657a486ffec4af228c177f1221.pdf', 'repository/slo/perjanjianjualbeli/filejki20da9a657a486ffec4af228c177f1221', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._RUKUN_JAYA_SOLINDO.pdf', 'repository/slo/perjanjianjualbeli/fileio20da9a657a486ffec4af228c177f1221', 'repository/slo/perjanjianjualbeli/filenpwp20da9a657a486ffec4af228c177f1221', 'repository/slo/perjanjianjualbeli/filepkp20da9a657a486ffec4af228c177f1221'),
(142, '03U', '548200002877', '2014-04-20', 'repository/slo/perjanjianjualbeli/filejbb0459ae3c927d6ec02166662e1ac6fc0.pdf', 'repository/slo/perjanjianjualbeli/filesldb0459ae3c927d6ec02166662e1ac6fc0.pdf', 'repository/slo/perjanjianjualbeli/filegitlb0459ae3c927d6ec02166662e1ac6fc0.pdf', 'repository/slo/perjanjianjualbeli/filejkib0459ae3c927d6ec02166662e1ac6fc0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._RUKUN_JAYA_SOLINDO.pdf', 'repository/slo/perjanjianjualbeli/fileio9917ee7350284f66ed354d0877d615ed', 'repository/slo/perjanjianjualbeli/filenpwp9917ee7350284f66ed354d0877d615ed', 'repository/slo/perjanjianjualbeli/filepkp9917ee7350284f66ed354d0877d615ed'),
(143, '03V', '534763516699', '2018-02-01', 'repository/slo/perjanjianjualbeli/filejb9be3720c105d6981de9e3e126099b495.pdf', 'repository/slo/perjanjianjualbeli/filesldf2f6acd8f27699602787659712532ab6.pdf', 'repository/slo/perjanjianjualbeli/filegitle5dbd0376acd5333267f25fa5355b9d7.pdf', 'repository/slo/perjanjianjualbeli/filejki9be3720c105d6981de9e3e126099b495', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._YAMAHA_INDONESIA_MOTOR.pdf', 'repository/slo/perjanjianjualbeli/fileio16a97e6759a72d9e8b0b3b5570b73e8e', 'repository/slo/perjanjianjualbeli/filenpwp16a97e6759a72d9e8b0b3b5570b73e8e', 'repository/slo/perjanjianjualbeli/filepkp16a97e6759a72d9e8b0b3b5570b73e8e'),
(144, '03W', '535594949687', '2018-02-01', 'repository/slo/perjanjianjualbeli/filejbb96ecf67f245c79035162bf7b37bce7b.pdf', 'repository/slo/perjanjianjualbeli/filesld82c330d7c7b1fc9bba79ed32a9106125.pdf', 'repository/slo/perjanjianjualbeli/filegitl82c330d7c7b1fc9bba79ed32a9106125.pdf', 'repository/slo/perjanjianjualbeli/filejki82c330d7c7b1fc9bba79ed32a9106125', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_THE_MAJESTY_HOTEL_APARTEMEnt.pdf', 'repository/slo/perjanjianjualbeli/fileio82c330d7c7b1fc9bba79ed32a9106125', 'repository/slo/perjanjianjualbeli/filenpwp82c330d7c7b1fc9bba79ed32a9106125', 'repository/slo/perjanjianjualbeli/filepkp82c330d7c7b1fc9bba79ed32a9106125'),
(145, '03X', '543802364443', '2017-10-27', 'repository/slo/perjanjianjualbeli/filejbd17acfcb18c6d5a7bcebd33436fa3508.pdf', 'repository/slo/perjanjianjualbeli/filesldd17acfcb18c6d5a7bcebd33436fa3508.pdf', 'repository/slo/perjanjianjualbeli/filegitld17acfcb18c6d5a7bcebd33436fa3508.pdf', 'repository/slo/perjanjianjualbeli/filejki17fcc02cb9fafdc5ead2958680faf9f6', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._PROSPECT_MOTOR.pdf', 'repository/slo/perjanjianjualbeli/fileio811239563ad50a75ef6af9286086039c', 'repository/slo/perjanjianjualbeli/filenpwp811239563ad50a75ef6af9286086039c', 'repository/slo/perjanjianjualbeli/filepkp811239563ad50a75ef6af9286086039c'),
(146, '03Y', '537710531801260006', '2018-01-26', 'repository/slo/perjanjianjualbeli/filejb0730ead4a6da1530cfbc268ca875e540.pdf', 'repository/slo/perjanjianjualbeli/filesld0730ead4a6da1530cfbc268ca875e540.pdf', 'repository/slo/perjanjianjualbeli/filegitl0730ead4a6da1530cfbc268ca875e540.pdf', 'repository/slo/perjanjianjualbeli/filejki0730ead4a6da1530cfbc268ca875e540', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-CSCEC-SAJR_JO_(Division_3).pdf', 'repository/slo/perjanjianjualbeli/fileio20c6abe782947a66bafcc6c0f838626c', 'repository/slo/perjanjianjualbeli/filenpwp20c6abe782947a66bafcc6c0f838626c', 'repository/slo/perjanjianjualbeli/filepkp20c6abe782947a66bafcc6c0f838626c'),
(147, '03Z', '534763542017', '2018-02-12', 'repository/slo/perjanjianjualbeli/filejbd11ecf485bbf582a5e18e0cbb4a68cd2.pdf', 'repository/slo/perjanjianjualbeli/filesld393bf387874303192abd0f149887df9c.pdf', 'repository/slo/perjanjianjualbeli/filegitld11ecf485bbf582a5e18e0cbb4a68cd2.pdf', 'repository/slo/perjanjianjualbeli/filejkib4794f6ac6e4c506ac8c45c7ee2a9e4b', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CHUNETSU_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileiob4794f6ac6e4c506ac8c45c7ee2a9e4b', 'repository/slo/perjanjianjualbeli/filenpwpb4794f6ac6e4c506ac8c45c7ee2a9e4b', 'repository/slo/perjanjianjualbeli/filepkpb4794f6ac6e4c506ac8c45c7ee2a9e4b'),
(148, '040', '0093/AGA.01.01/A.CRB/2017', '2017-12-20', 'repository/slo/perjanjianjualbeli/filejb75cb516ed376296e2de683ba4f98ece5.pdf', 'repository/slo/perjanjianjualbeli/filesld75cb516ed376296e2de683ba4f98ece5.jpeg', 'repository/slo/perjanjianjualbeli/filegitl75cb516ed376296e2de683ba4f98ece5.pdf', 'repository/slo/perjanjianjualbeli/filejki75cb516ed376296e2de683ba4f98ece5', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._SUPER_UNGGAS_JAYA.pdf', 'repository/slo/perjanjianjualbeli/fileioa013182da2708cadda060f4d5e069df5', 'repository/slo/perjanjianjualbeli/filenpwpa013182da2708cadda060f4d5e069df5', 'repository/slo/perjanjianjualbeli/filepkpa013182da2708cadda060f4d5e069df5'),
(149, '041', '007.PJ/AGA.01.01/SPJBTL/AREA BKS/2018', '2018-01-15', 'repository/slo/perjanjianjualbeli/filejb215114b8cc1105c1085066a194395052.pdf', 'repository/slo/perjanjianjualbeli/fileslddb19580998d382645a00f29dbc695e18.pdf', 'repository/slo/perjanjianjualbeli/filegitldb19580998d382645a00f29dbc695e18.pdf', 'repository/slo/perjanjianjualbeli/filejkidb19580998d382645a00f29dbc695e18', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SUMMARECON_AGUNG._Tbk.pdf', 'repository/slo/perjanjianjualbeli/fileiodb19580998d382645a00f29dbc695e18', 'repository/slo/perjanjianjualbeli/filenpwpdb19580998d382645a00f29dbc695e18', 'repository/slo/perjanjianjualbeli/filepkpdb19580998d382645a00f29dbc695e18'),
(150, '042', '0001/AGA.01.01/A.GPI/2017', '2018-01-03', 'repository/slo/perjanjianjualbeli/filejbe3d97d78d0919044f10e744a19592991.pdf', 'repository/slo/perjanjianjualbeli/fileslde3d97d78d0919044f10e744a19592991.pdf', 'repository/slo/perjanjianjualbeli/filegitle3d97d78d0919044f10e744a19592991.pdf', 'repository/slo/perjanjianjualbeli/filejkie3d97d78d0919044f10e744a19592991', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ANDHIKA_MAKMUR_PERKASA.pdf', 'repository/slo/perjanjianjualbeli/fileioe3d97d78d0919044f10e744a19592991', 'repository/slo/perjanjianjualbeli/filenpwpe3d97d78d0919044f10e744a19592991', 'repository/slo/perjanjianjualbeli/filepkpe3d97d78d0919044f10e744a19592991'),
(151, '043', '5347629000567', '2017-12-12', 'repository/slo/perjanjianjualbeli/filejb640d90e3cc3d97afc82ecc45fb430cc6.pdf', 'repository/slo/perjanjianjualbeli/filesld640d90e3cc3d97afc82ecc45fb430cc6.pdf', 'repository/slo/perjanjianjualbeli/filegitl02efe5a1411fefdece349e27abfa44a0.pdf', 'repository/slo/perjanjianjualbeli/filejki02efe5a1411fefdece349e27abfa44a0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._BUKAKA_TEKNIK_UTAMA,_Tbk.pdf', 'repository/slo/perjanjianjualbeli/fileio02efe5a1411fefdece349e27abfa44a0', 'repository/slo/perjanjianjualbeli/filenpwp02efe5a1411fefdece349e27abfa44a0', 'repository/slo/perjanjianjualbeli/filepkp02efe5a1411fefdece349e27abfa44a0'),
(152, '045', 'Pj/AGA.01.01/A.BTU/2017', '2017-10-20', 'repository/slo/perjanjianjualbeli/filejb1e5ddc8dc0d6ce1d2e7c65a5fbb0a421.pdf', 'repository/slo/perjanjianjualbeli/filesld1e5ddc8dc0d6ce1d2e7c65a5fbb0a421.pdf', 'repository/slo/perjanjianjualbeli/filegitld8d962c8ca7027b3fb2146d2d80ca93e.pdf', 'repository/slo/perjanjianjualbeli/filejki59bf57e4a94a98acfc43cbb197df1c2f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SILTEC_MAJU_PERKASA.pdf', 'repository/slo/perjanjianjualbeli/fileio59bf57e4a94a98acfc43cbb197df1c2f', 'repository/slo/perjanjianjualbeli/filenpwp59bf57e4a94a98acfc43cbb197df1c2f', 'repository/slo/perjanjianjualbeli/filepkp59bf57e4a94a98acfc43cbb197df1c2f'),
(153, '046', '539810003017', '2018-03-02', 'repository/slo/perjanjianjualbeli/filejb0af5400960d07525b1756ea65585ed21.pdf', 'repository/slo/perjanjianjualbeli/filesld0af5400960d07525b1756ea65585ed21.pdf', 'repository/slo/perjanjianjualbeli/filegitl0af5400960d07525b1756ea65585ed21.pdf', 'repository/slo/perjanjianjualbeli/filejki0af5400960d07525b1756ea65585ed21', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._GOLDEN_FORTUNE_STELL.pdf', 'repository/slo/perjanjianjualbeli/fileio0af5400960d07525b1756ea65585ed21', 'repository/slo/perjanjianjualbeli/filenpwp0af5400960d07525b1756ea65585ed21', 'repository/slo/perjanjianjualbeli/filepkp0af5400960d07525b1756ea65585ed21');
INSERT INTO `t_surat_perjanjian` (`id_surat_perjanjian`, `id_pemohon`, `nomor`, `tanggal`, `file_jual_beli`, `file_sld`, `file_gitl`, `file_jki`, `file_spui`, `file_io`, `file_npwp`, `file_pkp`) VALUES
(154, '047', '539810002725', '2018-03-02', 'repository/slo/perjanjianjualbeli/filejb08af1188b99767a77dc4284f972eed92.pdf', 'repository/slo/perjanjianjualbeli/filesld08af1188b99767a77dc4284f972eed92.pdf', 'repository/slo/perjanjianjualbeli/filegitl08af1188b99767a77dc4284f972eed92.pdf', 'repository/slo/perjanjianjualbeli/filejki08af1188b99767a77dc4284f972eed92', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_CITRA_BARU_STELL.pdf', 'repository/slo/perjanjianjualbeli/fileio08af1188b99767a77dc4284f972eed92', 'repository/slo/perjanjianjualbeli/filenpwp08af1188b99767a77dc4284f972eed92', 'repository/slo/perjanjianjualbeli/filepkp08af1188b99767a77dc4284f972eed92'),
(155, '048', '537411023736', '2018-03-27', 'repository/slo/perjanjianjualbeli/filejb95953678691170ecc3a1b5fc5f321d63.pdf', 'repository/slo/perjanjianjualbeli/filesld95953678691170ecc3a1b5fc5f321d63.pdf', 'repository/slo/perjanjianjualbeli/filegitl5eebc3e91107c0ce1c5769b610fcb46b.pdf', 'repository/slo/perjanjianjualbeli/filejki96a466fd041b5ec0eab1f98c74240649', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_APARTEMENT_TAMANSARI_ISWARA.pdf', 'repository/slo/perjanjianjualbeli/fileio96a466fd041b5ec0eab1f98c74240649', 'repository/slo/perjanjianjualbeli/filenpwp96a466fd041b5ec0eab1f98c74240649', 'repository/slo/perjanjianjualbeli/filepkp96a466fd041b5ec0eab1f98c74240649'),
(156, '049', '535311845880', '2018-03-16', 'repository/slo/perjanjianjualbeli/filejb5600042162063fdb06d67478d456fabc.jpg', 'repository/slo/perjanjianjualbeli/filesld69ba97535d6ab99a207b22d13e0f84c5.pdf', 'repository/slo/perjanjianjualbeli/filegitl69ba97535d6ab99a207b22d13e0f84c5.pdf', 'repository/slo/perjanjianjualbeli/filejki5600042162063fdb06d67478d456fabc', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_-_CV._TEXCO.pdf', 'repository/slo/perjanjianjualbeli/fileio5600042162063fdb06d67478d456fabc', 'repository/slo/perjanjianjualbeli/filenpwp5600042162063fdb06d67478d456fabc', 'repository/slo/perjanjianjualbeli/filepkp5600042162063fdb06d67478d456fabc'),
(157, '04A', '0010.Pj/AGA.01.01/A.PWK/2018', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb894ac391197909ec4921bb2a4c8c7f2c.pdf', 'repository/slo/perjanjianjualbeli/filesld9ebcf1017b19d4b4b1321db372777971.pdf', 'repository/slo/perjanjianjualbeli/filegitl9ebcf1017b19d4b4b1321db372777971.pdf', 'repository/slo/perjanjianjualbeli/filejki9ebcf1017b19d4b4b1321db372777971', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-BUMI_GAMPING_SRIWIJAYA.compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio39bc211e2b01d1d19a7da1bbe0553783', 'repository/slo/perjanjianjualbeli/filenpwp39bc211e2b01d1d19a7da1bbe0553783', 'repository/slo/perjanjianjualbeli/filepkp39bc211e2b01d1d19a7da1bbe0553783'),
(158, '04B', '0008.PJ/AGA.01.01/A.SRP/2018', '2017-05-17', 'repository/slo/perjanjianjualbeli/filejbd15a58a9fed09e397a731f308148250e.pdf', 'repository/slo/perjanjianjualbeli/filesldd15a58a9fed09e397a731f308148250e.pdf', 'repository/slo/perjanjianjualbeli/filegitld15a58a9fed09e397a731f308148250e.pdf', 'repository/slo/perjanjianjualbeli/filejkid15a58a9fed09e397a731f308148250e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi...MASTERINA_GRAFIKA_ESPRINTA.pdf', 'repository/slo/perjanjianjualbeli/fileiod15a58a9fed09e397a731f308148250e', 'repository/slo/perjanjianjualbeli/filenpwpd15a58a9fed09e397a731f308148250e', 'repository/slo/perjanjianjualbeli/filepkpd15a58a9fed09e397a731f308148250e'),
(159, '04C', '.PJ/AGA.01.01/A.PDG/2018', '2018-02-22', 'repository/slo/perjanjianjualbeli/filejba8359d9f4af8bae4c9142b591beaddbc.pdf', 'repository/slo/perjanjianjualbeli/filesld3d34cb4b41a8c9f2af7d1b9d1060dd89.pdf', 'repository/slo/perjanjianjualbeli/filegitl3d34cb4b41a8c9f2af7d1b9d1060dd89.pdf', 'repository/slo/perjanjianjualbeli/filejki3d34cb4b41a8c9f2af7d1b9d1060dd89', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_-_YAYASAN_PENDIDIKAN_GUNADARMA.pdf', 'repository/slo/perjanjianjualbeli/fileio3d34cb4b41a8c9f2af7d1b9d1060dd89', 'repository/slo/perjanjianjualbeli/filenpwp3d34cb4b41a8c9f2af7d1b9d1060dd89', 'repository/slo/perjanjianjualbeli/filepkp3d34cb4b41a8c9f2af7d1b9d1060dd89'),
(160, '04D', '435300207987', '2017-11-20', 'repository/slo/perjanjianjualbeli/filejba43dc07fc377d453266da7f2ff7aca8a.pdf', 'repository/slo/perjanjianjualbeli/filesldb39ff2d7fc22ecc9eab6ef4776b75ff0.pdf', 'repository/slo/perjanjianjualbeli/filegitla99567d80fe4c1678618d6c1c150a6f2.pdf', 'repository/slo/perjanjianjualbeli/filejkia43dc07fc377d453266da7f2ff7aca8a', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_GUDANG_BEKU_TERINTEGRASI.compressed_(1).pdf', 'repository/slo/perjanjianjualbeli/fileioa43dc07fc377d453266da7f2ff7aca8a', 'repository/slo/perjanjianjualbeli/filenpwpa43dc07fc377d453266da7f2ff7aca8a', 'repository/slo/perjanjianjualbeli/filepkpa43dc07fc377d453266da7f2ff7aca8a'),
(161, '04E', '535754313081', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filesld89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filegitl89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filejki9e5ed84bc7480bee81caf20d96cb9694', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KHARISMA_PRINTEX-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio9e5ed84bc7480bee81caf20d96cb9694', 'repository/slo/perjanjianjualbeli/filenpwp9e5ed84bc7480bee81caf20d96cb9694', 'repository/slo/perjanjianjualbeli/filepkp9e5ed84bc7480bee81caf20d96cb9694'),
(162, '04E', '535754313081', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filesld89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filegitl89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filejki3d184b285c270b843201239a7d12a52f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KHARISMA_PRINTEX-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio3d184b285c270b843201239a7d12a52f', 'repository/slo/perjanjianjualbeli/filenpwp3d184b285c270b843201239a7d12a52f', 'repository/slo/perjanjianjualbeli/filepkp3d184b285c270b843201239a7d12a52f'),
(163, '04E', '535754313081', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filesld89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filegitl89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filejkic0eec9dcc38a9e5fea02154918ec8d83', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KHARISMA_PRINTEX-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileioc0eec9dcc38a9e5fea02154918ec8d83', 'repository/slo/perjanjianjualbeli/filenpwpc0eec9dcc38a9e5fea02154918ec8d83', 'repository/slo/perjanjianjualbeli/filepkpc0eec9dcc38a9e5fea02154918ec8d83'),
(165, '04F', '0090/AGA/01.01/A.CMI/2017', '2017-09-08', 'repository/slo/perjanjianjualbeli/filejb3d5820c7d3e15dae27ce7437ca08d3ae.jpg', 'repository/slo/perjanjianjualbeli/filesld3d5820c7d3e15dae27ce7437ca08d3ae.PDF', 'repository/slo/perjanjianjualbeli/filegitl3d5820c7d3e15dae27ce7437ca08d3ae.PDF', 'repository/slo/perjanjianjualbeli/filejki3d5820c7d3e15dae27ce7437ca08d3ae', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_HIGH_SPEED_RAILWAY.pdf', 'repository/slo/perjanjianjualbeli/fileio3d5820c7d3e15dae27ce7437ca08d3ae', 'repository/slo/perjanjianjualbeli/filenpwp3d5820c7d3e15dae27ce7437ca08d3ae', 'repository/slo/perjanjianjualbeli/filepkp3d5820c7d3e15dae27ce7437ca08d3ae'),
(164, '04E', '535754313081', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filesld89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filegitl89e7ab9a70b90000bac9112ac0759833.pdf', 'repository/slo/perjanjianjualbeli/filejki71c8ea7d66810eb739cffd3bc2377a6e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KHARISMA_PRINTEX-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio449b76253510e97c073fc8be577d853d', 'repository/slo/perjanjianjualbeli/filenpwp449b76253510e97c073fc8be577d853d', 'repository/slo/perjanjianjualbeli/filepkp449b76253510e97c073fc8be577d853d'),
(166, '04G', '535754313081', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb155320a78b58d038633d5fd3c1994783.pdf', 'repository/slo/perjanjianjualbeli/filesld155320a78b58d038633d5fd3c1994783.pdf', 'repository/slo/perjanjianjualbeli/filegitl155320a78b58d038633d5fd3c1994783.pdf', 'repository/slo/perjanjianjualbeli/filejki155320a78b58d038633d5fd3c1994783', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-PT._KHARISMA_PRINTEX.pdf', 'repository/slo/perjanjianjualbeli/fileio9c08e50412546ba1524421791b0c6189', 'repository/slo/perjanjianjualbeli/filenpwp9c08e50412546ba1524421791b0c6189', 'repository/slo/perjanjianjualbeli/filepkp9c08e50412546ba1524421791b0c6189'),
(167, '04H', '537715061263', '2018-03-21', 'repository/slo/perjanjianjualbeli/filejbcb189342db1e51faa041789a63e78df2.pdf', 'repository/slo/perjanjianjualbeli/filesldcb189342db1e51faa041789a63e78df2.pdf', 'repository/slo/perjanjianjualbeli/filegitlcb189342db1e51faa041789a63e78df2.pdf', 'repository/slo/perjanjianjualbeli/filejkib2af2aa1131679324e4e54cc5e707052', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._THOMPSON.pdf', 'repository/slo/perjanjianjualbeli/fileio3e7fc51297e4477d10ace88cfd84af4b', 'repository/slo/perjanjianjualbeli/filenpwp3e7fc51297e4477d10ace88cfd84af4b', 'repository/slo/perjanjianjualbeli/filepkp3e7fc51297e4477d10ace88cfd84af4b'),
(168, '04I', '', '0000-00-00', 'repository/slo/perjanjianjualbeli/filejb6ef52d041bb01cfeb6cbebab2dc25ad9', 'repository/slo/perjanjianjualbeli/filesld6ef52d041bb01cfeb6cbebab2dc25ad9.pdf', 'repository/slo/perjanjianjualbeli/filegitl6ef52d041bb01cfeb6cbebab2dc25ad9.pdf', 'repository/slo/perjanjianjualbeli/filejki6ef52d041bb01cfeb6cbebab2dc25ad9', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SHINO_HIDRO.pdf', 'repository/slo/perjanjianjualbeli/fileio6ef52d041bb01cfeb6cbebab2dc25ad9', 'repository/slo/perjanjianjualbeli/filenpwp6ef52d041bb01cfeb6cbebab2dc25ad9', 'repository/slo/perjanjianjualbeli/filepkp6ef52d041bb01cfeb6cbebab2dc25ad9'),
(169, '04J', '0202002', '2018-04-13', 'repository/slo/perjanjianjualbeli/filejb577bf90994cc9c39e27f897515ebe6d8.pdf', 'repository/slo/perjanjianjualbeli/filesld577bf90994cc9c39e27f897515ebe6d8', 'repository/slo/perjanjianjualbeli/filegitl577bf90994cc9c39e27f897515ebe6d8', 'repository/slo/perjanjianjualbeli/filejki577bf90994cc9c39e27f897515ebe6d8', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio577bf90994cc9c39e27f897515ebe6d8', 'repository/slo/perjanjianjualbeli/filenpwp577bf90994cc9c39e27f897515ebe6d8', 'repository/slo/perjanjianjualbeli/filepkp577bf90994cc9c39e27f897515ebe6d8'),
(170, '04K', '544100576263', '2018-01-20', 'repository/slo/perjanjianjualbeli/filejb1a502f54202d584f9b162f836e4f1b52.jpg', 'repository/slo/perjanjianjualbeli/filesldc12b7b108ce44399624de2f7e9b0ae8b.pdf', 'repository/slo/perjanjianjualbeli/filegitlc12b7b108ce44399624de2f7e9b0ae8b.pdf', 'repository/slo/perjanjianjualbeli/filejki1a502f54202d584f9b162f836e4f1b52', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CORTEXI_INAS.pdf', 'repository/slo/perjanjianjualbeli/fileio1a502f54202d584f9b162f836e4f1b52', 'repository/slo/perjanjianjualbeli/filenpwp1a502f54202d584f9b162f836e4f1b52', 'repository/slo/perjanjianjualbeli/filepkp1a502f54202d584f9b162f836e4f1b52'),
(171, '04L', '535980021660', '2018-03-06', 'repository/slo/perjanjianjualbeli/filejb02b7fb898f3e1995d0f623bce790837f.pdf', 'repository/slo/perjanjianjualbeli/filesld02b7fb898f3e1995d0f623bce790837f.pdf', 'repository/slo/perjanjianjualbeli/filegitl02b7fb898f3e1995d0f623bce790837f.pdf', 'repository/slo/perjanjianjualbeli/filejki02b7fb898f3e1995d0f623bce790837f', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_KAMPUS_AKPAR_NHI_BANDUNG-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio020f4225d386b731359cdb884fc2529b', 'repository/slo/perjanjianjualbeli/filenpwp020f4225d386b731359cdb884fc2529b', 'repository/slo/perjanjianjualbeli/filepkp020f4225d386b731359cdb884fc2529b'),
(172, '04M', '535980021660', '2018-03-06', 'repository/slo/perjanjianjualbeli/filejbaae7e127b09acbe4bd2adb6796c4b89e.pdf', 'repository/slo/perjanjianjualbeli/filesldaae7e127b09acbe4bd2adb6796c4b89e.pdf', 'repository/slo/perjanjianjualbeli/filegitlaae7e127b09acbe4bd2adb6796c4b89e.pdf', 'repository/slo/perjanjianjualbeli/filejkiaae7e127b09acbe4bd2adb6796c4b89e', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_KAMPUS_AKPAR_NHI_BANDUNG-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileioaae7e127b09acbe4bd2adb6796c4b89e', 'repository/slo/perjanjianjualbeli/filenpwpaae7e127b09acbe4bd2adb6796c4b89e', 'repository/slo/perjanjianjualbeli/filepkpaae7e127b09acbe4bd2adb6796c4b89e'),
(173, '04N', '0490.PJ/AGA.01.01/RYNPP/2017', '2017-12-04', 'repository/slo/perjanjianjualbeli/filejbdbd0f2426c1281db53479448019ff452.pdf', 'repository/slo/perjanjianjualbeli/filesld2e001324fa870903997fcd46ed7dfec1.pdf', 'repository/slo/perjanjianjualbeli/filegitl2e001324fa870903997fcd46ed7dfec1.pdf', 'repository/slo/perjanjianjualbeli/filejki2e001324fa870903997fcd46ed7dfec1', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_HOTEL_SARINAH_BRAGA_BANDUNG.pdf', 'repository/slo/perjanjianjualbeli/fileio2e001324fa870903997fcd46ed7dfec1', 'repository/slo/perjanjianjualbeli/filenpwp2e001324fa870903997fcd46ed7dfec1', 'repository/slo/perjanjianjualbeli/filepkp2e001324fa870903997fcd46ed7dfec1'),
(174, '04O', '543105296894', '2018-02-09', 'repository/slo/perjanjianjualbeli/filejb6f68fbe5a96e2c0d26c6e81ab33b4ef2.pdf', 'repository/slo/perjanjianjualbeli/filesld6f68fbe5a96e2c0d26c6e81ab33b4ef2.pdf', 'repository/slo/perjanjianjualbeli/filegitl6f68fbe5a96e2c0d26c6e81ab33b4ef2.pdf', 'repository/slo/perjanjianjualbeli/filejki6f68fbe5a96e2c0d26c6e81ab33b4ef2', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KEMANG_SUAR_ARTHA.pdf', 'repository/slo/perjanjianjualbeli/fileio6f68fbe5a96e2c0d26c6e81ab33b4ef2', 'repository/slo/perjanjianjualbeli/filenpwp6f68fbe5a96e2c0d26c6e81ab33b4ef2', 'repository/slo/perjanjianjualbeli/filepkp6f68fbe5a96e2c0d26c6e81ab33b4ef2'),
(175, '04P', '0039/AGA.01.01/A.SMD/2018', '2018-03-12', 'repository/slo/perjanjianjualbeli/filejb214db63d1d570a472e1a7cb9a192316a.pdf', 'repository/slo/perjanjianjualbeli/filesld214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/slo/perjanjianjualbeli/filegitl214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/slo/perjanjianjualbeli/filejki611fd7359d85098b2b62ab424609ff9d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-CV._DEBORA_DAN_LAURUS-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileioce6f591118970a7ba9f9589045a5e426', 'repository/slo/perjanjianjualbeli/filenpwpce6f591118970a7ba9f9589045a5e426', 'repository/slo/perjanjianjualbeli/filepkpce6f591118970a7ba9f9589045a5e426'),
(176, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejki4f2468916e1a4b5ed477cfa721cdac95', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileio4f2468916e1a4b5ed477cfa721cdac95', 'repository/slo/perjanjianjualbeli/filenpwp4f2468916e1a4b5ed477cfa721cdac95', 'repository/slo/perjanjianjualbeli/filepkp4f2468916e1a4b5ed477cfa721cdac95'),
(177, '04R', '537715062697', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filesld8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filegitl8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filejkib59e37bc201d76184e56d6cc476bf64b', 'repository/slo/perjanjianjualbeli/Spesikasi_Instalasi-PDAM_TEGAL_DANAS.pdf', 'repository/slo/perjanjianjualbeli/fileiob59e37bc201d76184e56d6cc476bf64b', 'repository/slo/perjanjianjualbeli/filenpwpb59e37bc201d76184e56d6cc476bf64b', 'repository/slo/perjanjianjualbeli/filepkpb59e37bc201d76184e56d6cc476bf64b'),
(178, '04P', '0039/AGA.01.01/A.SMD/2018', '2018-03-12', 'repository/slo/perjanjianjualbeli/filejb214db63d1d570a472e1a7cb9a192316a.pdf', 'repository/slo/perjanjianjualbeli/filesld214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/slo/perjanjianjualbeli/filegitl214db63d1d570a472e1a7cb9a192316a.jpg', 'repository/slo/perjanjianjualbeli/filejkib16d75635cfe86c3b6da1fadb281ff04', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-CV._DEBORA_DAN_LAURUS-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileiob16d75635cfe86c3b6da1fadb281ff04', 'repository/slo/perjanjianjualbeli/filenpwpb16d75635cfe86c3b6da1fadb281ff04', 'repository/slo/perjanjianjualbeli/filepkpb16d75635cfe86c3b6da1fadb281ff04'),
(179, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejki80cd7b5e08917176f991f3e798049c0a', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileio80cd7b5e08917176f991f3e798049c0a', 'repository/slo/perjanjianjualbeli/filenpwp80cd7b5e08917176f991f3e798049c0a', 'repository/slo/perjanjianjualbeli/filepkp80cd7b5e08917176f991f3e798049c0a'),
(180, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejkibdb257f70c1a6069ca206379b369eaef', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileiobdb257f70c1a6069ca206379b369eaef', 'repository/slo/perjanjianjualbeli/filenpwpbdb257f70c1a6069ca206379b369eaef', 'repository/slo/perjanjianjualbeli/filepkpbdb257f70c1a6069ca206379b369eaef'),
(181, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejkia023bf0af8c48489e0da8a4b1387fec5', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileioa023bf0af8c48489e0da8a4b1387fec5', 'repository/slo/perjanjianjualbeli/filenpwpa023bf0af8c48489e0da8a4b1387fec5', 'repository/slo/perjanjianjualbeli/filepkpa023bf0af8c48489e0da8a4b1387fec5'),
(182, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejki9f885117567607863eb978f50375efa8', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileio7d79a306f54abeba771ec8822ccb2025', 'repository/slo/perjanjianjualbeli/filenpwp7d79a306f54abeba771ec8822ccb2025', 'repository/slo/perjanjianjualbeli/filepkp7d79a306f54abeba771ec8822ccb2025'),
(183, '04Q', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb7cc957431cfdc6e491fdee4532ff5ba3.jpg', 'repository/slo/perjanjianjualbeli/filesld7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filegitl7cc957431cfdc6e491fdee4532ff5ba3.pdf', 'repository/slo/perjanjianjualbeli/filejkiecde38193c2e8cb1f1740af5d5c193a2', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileioecde38193c2e8cb1f1740af5d5c193a2', 'repository/slo/perjanjianjualbeli/filenpwpecde38193c2e8cb1f1740af5d5c193a2', 'repository/slo/perjanjianjualbeli/filepkpecde38193c2e8cb1f1740af5d5c193a2'),
(184, '04R', '537715062697', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filesld8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filegitl8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filejkia2bb71513aef8718f6c0264d0667b8ca', 'repository/slo/perjanjianjualbeli/Spesikasi_Instalasi-PDAM_TEGAL_DANAS.pdf', 'repository/slo/perjanjianjualbeli/fileioa2bb71513aef8718f6c0264d0667b8ca', 'repository/slo/perjanjianjualbeli/filenpwpa2bb71513aef8718f6c0264d0667b8ca', 'repository/slo/perjanjianjualbeli/filepkpa2bb71513aef8718f6c0264d0667b8ca'),
(185, '04R', '537715062697', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filesld8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filegitl8c358110684665921581a8040bb584a3.pdf', 'repository/slo/perjanjianjualbeli/filejki55643a2a7f3351e14835229fb10045e8', 'repository/slo/perjanjianjualbeli/Spesikasi_Instalasi-PDAM_TEGAL_DANAS.pdf', 'repository/slo/perjanjianjualbeli/fileio9926aaf26244b708e9829ef2ee5d9d2d', 'repository/slo/perjanjianjualbeli/filenpwp9926aaf26244b708e9829ef2ee5d9d2d', 'repository/slo/perjanjianjualbeli/filepkp9926aaf26244b708e9829ef2ee5d9d2d'),
(186, '04S', '566600725403', '2018-03-23', 'repository/slo/perjanjianjualbeli/filejbbb7827a8f36556ffbeafb3caeedfdf03.pdf', 'repository/slo/perjanjianjualbeli/filesldbb7827a8f36556ffbeafb3caeedfdf03.jpeg', 'repository/slo/perjanjianjualbeli/filegitlbb7827a8f36556ffbeafb3caeedfdf03.jpeg', 'repository/slo/perjanjianjualbeli/filejkibb7827a8f36556ffbeafb3caeedfdf03', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._ASIA_BOTTLE_CYCLE.pdf', 'repository/slo/perjanjianjualbeli/fileiobb7827a8f36556ffbeafb3caeedfdf03', 'repository/slo/perjanjianjualbeli/filenpwpbb7827a8f36556ffbeafb3caeedfdf03', 'repository/slo/perjanjianjualbeli/filepkpbb7827a8f36556ffbeafb3caeedfdf03'),
(187, '04T', '0028/AGA.01.01/A.PWK/2018', '2018-02-26', 'repository/slo/perjanjianjualbeli/filejb8bbd29572d2b9cb128b1ab25e8da9261.pdf', 'repository/slo/perjanjianjualbeli/filesld8bbd29572d2b9cb128b1ab25e8da9261.pdf', 'repository/slo/perjanjianjualbeli/filegitl8bbd29572d2b9cb128b1ab25e8da9261.pdf', 'repository/slo/perjanjianjualbeli/filejki8bbd29572d2b9cb128b1ab25e8da9261', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._SEOLINDO_PRIMATAMA21052018_00000-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio8bbd29572d2b9cb128b1ab25e8da9261', 'repository/slo/perjanjianjualbeli/filenpwp8bbd29572d2b9cb128b1ab25e8da9261', 'repository/slo/perjanjianjualbeli/filepkp8bbd29572d2b9cb128b1ab25e8da9261'),
(188, '04U', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejbb25a6c82f44cd8cdc411e9b877dd555c.jpg', 'repository/slo/perjanjianjualbeli/filesldb25a6c82f44cd8cdc411e9b877dd555c.pdf', 'repository/slo/perjanjianjualbeli/filegitlb25a6c82f44cd8cdc411e9b877dd555c.pdf', 'repository/slo/perjanjianjualbeli/filejkib25a6c82f44cd8cdc411e9b877dd555c', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-.PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileiob25a6c82f44cd8cdc411e9b877dd555c', 'repository/slo/perjanjianjualbeli/filenpwpb25a6c82f44cd8cdc411e9b877dd555c', 'repository/slo/perjanjianjualbeli/filepkpb25a6c82f44cd8cdc411e9b877dd555c'),
(189, '04V', '536230119247', '2018-05-02', 'repository/slo/perjanjianjualbeli/filejb6ca6263be9e4ed950341a70f72f1a25c.jpg', 'repository/slo/perjanjianjualbeli/filesld6ca6263be9e4ed950341a70f72f1a25c.pdf', 'repository/slo/perjanjianjualbeli/filegitl6ca6263be9e4ed950341a70f72f1a25c.pdf', 'repository/slo/perjanjianjualbeli/filejki6ca6263be9e4ed950341a70f72f1a25c', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi...PT._MULIA_CEMERLANG_ABADI_MULTI_INDUSTRY.pdf', 'repository/slo/perjanjianjualbeli/fileio6ca6263be9e4ed950341a70f72f1a25c', 'repository/slo/perjanjianjualbeli/filenpwp6ca6263be9e4ed950341a70f72f1a25c', 'repository/slo/perjanjianjualbeli/filepkp6ca6263be9e4ed950341a70f72f1a25c'),
(190, '04V', '142300641424', '2018-04-22', 'repository/slo/perjanjianjualbeli/filejbc75a77b26ad0a11106e444c181cc3a7b.jpg', 'repository/slo/perjanjianjualbeli/filesldc75a77b26ad0a11106e444c181cc3a7b.pdf', 'repository/slo/perjanjianjualbeli/filegitlc75a77b26ad0a11106e444c181cc3a7b.pdf', 'repository/slo/perjanjianjualbeli/filejkic75a77b26ad0a11106e444c181cc3a7b', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_SITE_KELAPA_DUA.pdf', 'repository/slo/perjanjianjualbeli/fileioc75a77b26ad0a11106e444c181cc3a7b', 'repository/slo/perjanjianjualbeli/filenpwpc75a77b26ad0a11106e444c181cc3a7b', 'repository/slo/perjanjianjualbeli/filepkpc75a77b26ad0a11106e444c181cc3a7b'),
(191, '04W', '142300641424', '2018-04-22', 'repository/slo/perjanjianjualbeli/filejb3c551fda88885a6e4f9a2f180e81cfc0.jpg', 'repository/slo/perjanjianjualbeli/filesld3c551fda88885a6e4f9a2f180e81cfc0.pdf', 'repository/slo/perjanjianjualbeli/filegitl3c551fda88885a6e4f9a2f180e81cfc0.pdf', 'repository/slo/perjanjianjualbeli/filejki3c551fda88885a6e4f9a2f180e81cfc0', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_SITE_KELAPA_DUA.pdf', 'repository/slo/perjanjianjualbeli/fileio3c551fda88885a6e4f9a2f180e81cfc0', 'repository/slo/perjanjianjualbeli/filenpwp3c551fda88885a6e4f9a2f180e81cfc0', 'repository/slo/perjanjianjualbeli/filepkp3c551fda88885a6e4f9a2f180e81cfc0'),
(192, '04X', '1611011040374', '2018-03-16', 'repository/slo/perjanjianjualbeli/filejb0f5ef5415372a14c345b9e6e8b7d1d07.pdf', 'repository/slo/perjanjianjualbeli/filesld0f5ef5415372a14c345b9e6e8b7d1d07.pdf', 'repository/slo/perjanjianjualbeli/filegitl0f5ef5415372a14c345b9e6e8b7d1d07.pdf', 'repository/slo/perjanjianjualbeli/filejkid46ec3c8c61e430ea9a9a6f9bfe30a88', 'repository/slo/perjanjianjualbeli/SP._Tek.pdf', 'repository/slo/perjanjianjualbeli/fileiod46ec3c8c61e430ea9a9a6f9bfe30a88', 'repository/slo/perjanjianjualbeli/filenpwpd46ec3c8c61e430ea9a9a6f9bfe30a88', 'repository/slo/perjanjianjualbeli/filepkpd46ec3c8c61e430ea9a9a6f9bfe30a88'),
(193, '04Y', '5377111001213', '2018-02-07', 'repository/slo/perjanjianjualbeli/filejbbcb072dbfd32549596ee51cb36586152.pdf', 'repository/slo/perjanjianjualbeli/filesldb1ccd4ee3e3390d28cdda58224247f53.pdf', 'repository/slo/perjanjianjualbeli/filegitlb1ccd4ee3e3390d28cdda58224247f53.pdf', 'repository/slo/perjanjianjualbeli/filejkib1ccd4ee3e3390d28cdda58224247f53', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._HATIRE.pdf', 'repository/slo/perjanjianjualbeli/fileiob1ccd4ee3e3390d28cdda58224247f53', 'repository/slo/perjanjianjualbeli/filenpwpb1ccd4ee3e3390d28cdda58224247f53', 'repository/slo/perjanjianjualbeli/filepkpb1ccd4ee3e3390d28cdda58224247f53'),
(194, '04Z', '5377111001213', '2018-02-07', 'repository/slo/perjanjianjualbeli/filejb9a4b5f1667b443b08e46e98b9f51b7f1.pdf', 'repository/slo/perjanjianjualbeli/filesld08ad7da45ac51cae9b0cc90d25b9362f.pdf', 'repository/slo/perjanjianjualbeli/filegitl9a4b5f1667b443b08e46e98b9f51b7f1.pdf', 'repository/slo/perjanjianjualbeli/filejki9a4b5f1667b443b08e46e98b9f51b7f1', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._HATIRE.pdf', 'repository/slo/perjanjianjualbeli/fileio9a4b5f1667b443b08e46e98b9f51b7f1', 'repository/slo/perjanjianjualbeli/filenpwp9a4b5f1667b443b08e46e98b9f51b7f1', 'repository/slo/perjanjianjualbeli/filepkp9a4b5f1667b443b08e46e98b9f51b7f1'),
(195, '050', '161001250598', '2018-05-18', 'repository/slo/perjanjianjualbeli/filejb81e98623e042f259ae8ab5e5883ff1d2.pdf', 'repository/slo/perjanjianjualbeli/filesld4a6b523b466128c31f34ccb144ca0579.jpg', 'repository/slo/perjanjianjualbeli/filegitl4a6b523b466128c31f34ccb144ca0579.jpg', 'repository/slo/perjanjianjualbeli/filejkia469544bdcd9809e32e0094a01a51fde', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._RAJEHAN_ARIQ.pdf', 'repository/slo/perjanjianjualbeli/fileioa469544bdcd9809e32e0094a01a51fde', 'repository/slo/perjanjianjualbeli/filenpwpa469544bdcd9809e32e0094a01a51fde', 'repository/slo/perjanjianjualbeli/filepkpa469544bdcd9809e32e0094a01a51fde'),
(196, '051', '537212069877', '2018-02-15', 'repository/slo/perjanjianjualbeli/filejb68abb33645364891168eafcc6dddf65e.jpg', 'repository/slo/perjanjianjualbeli/filesld68abb33645364891168eafcc6dddf65e.jpg', 'repository/slo/perjanjianjualbeli/filegitl97b2b52c04100661295359ecc0a8ddf6.jpg', 'repository/slo/perjanjianjualbeli/filejki97b2b52c04100661295359ecc0a8ddf6', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_RS._BHAKTI_HUSADA.pdf', 'repository/slo/perjanjianjualbeli/fileio97b2b52c04100661295359ecc0a8ddf6', 'repository/slo/perjanjianjualbeli/filenpwp97b2b52c04100661295359ecc0a8ddf6', 'repository/slo/perjanjianjualbeli/filepkp97b2b52c04100661295359ecc0a8ddf6'),
(197, '052', '5377129000640', '2018-06-04', 'repository/slo/perjanjianjualbeli/filejb94ab44b3eb0a05e598a2a3c748582f43.pdf', 'repository/slo/perjanjianjualbeli/filesld94ab44b3eb0a05e598a2a3c748582f43.jpg', 'repository/slo/perjanjianjualbeli/filegitl94ab44b3eb0a05e598a2a3c748582f43.jpg', 'repository/slo/perjanjianjualbeli/filejki94ab44b3eb0a05e598a2a3c748582f43', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_HIGH_SPEED_RAILWAY_CC-ilovepdf-compressed.pdf', 'repository/slo/perjanjianjualbeli/fileio54f9b0bf7a18ebb4944480c5f1452f86', 'repository/slo/perjanjianjualbeli/filenpwp54f9b0bf7a18ebb4944480c5f1452f86', 'repository/slo/perjanjianjualbeli/filepkp54f9b0bf7a18ebb4944480c5f1452f86'),
(198, '053', 'PJBTL-173009911805208723', '2018-05-20', 'repository/slo/perjanjianjualbeli/filejb4c72230dceaa117ee7673ef3b0787962.pdf', 'repository/slo/perjanjianjualbeli/filesld4c72230dceaa117ee7673ef3b0787962.jpg', 'repository/slo/perjanjianjualbeli/filegitl1a6add903d4cfc75027b76baff804114.jpg', 'repository/slo/perjanjianjualbeli/filejkic6c98b61cadabf09f1d9da47abfcbd9d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Site_Negeri_Batin_2_BLU037.pdf', 'repository/slo/perjanjianjualbeli/fileio522cf594cc6c10be8ea5278e8ee5bfd1', 'repository/slo/perjanjianjualbeli/filenpwp522cf594cc6c10be8ea5278e8ee5bfd1', 'repository/slo/perjanjianjualbeli/filepkp522cf594cc6c10be8ea5278e8ee5bfd1'),
(199, '054', 'PJBTL-173009911805208723', '2018-05-20', 'repository/slo/perjanjianjualbeli/filejb913a6ceef2d095b9f4ffceefc7e3ad90.pdf', 'repository/slo/perjanjianjualbeli/filesld913a6ceef2d095b9f4ffceefc7e3ad90.jpg', 'repository/slo/perjanjianjualbeli/filegitl913a6ceef2d095b9f4ffceefc7e3ad90.jpg', 'repository/slo/perjanjianjualbeli/filejki913a6ceef2d095b9f4ffceefc7e3ad90', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Site_Negeri_Batin_2_BLU037.pdf', 'repository/slo/perjanjianjualbeli/fileio913a6ceef2d095b9f4ffceefc7e3ad90', 'repository/slo/perjanjianjualbeli/filenpwp913a6ceef2d095b9f4ffceefc7e3ad90', 'repository/slo/perjanjianjualbeli/filepkp913a6ceef2d095b9f4ffceefc7e3ad90'),
(200, '055', '5377111001213', '2018-06-14', 'repository/slo/perjanjianjualbeli/filejb1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/filesld1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/filegitl1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/filejki1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/filenpwp1cd44a7b94ae6e106ef90085bb5fcf93', 'repository/slo/perjanjianjualbeli/filepkp1cd44a7b94ae6e106ef90085bb5fcf93'),
(201, '056', '2', '2018-06-30', 'repository/slo/perjanjianjualbeli/filejb90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/filesld90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/filegitl90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/filejki90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/', 'repository/slo/perjanjianjualbeli/fileio90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/filenpwp90a69266e2a22daf9e8e2e062391d499', 'repository/slo/perjanjianjualbeli/filepkp90a69266e2a22daf9e8e2e062391d499'),
(202, '057', '533811975071', '2018-04-20', 'repository/slo/perjanjianjualbeli/filejbf222901fa5e0eeeed308ad3a40787db5.jpg', 'repository/slo/perjanjianjualbeli/filesldf222901fa5e0eeeed308ad3a40787db5.pdf', 'repository/slo/perjanjianjualbeli/filegitlf222901fa5e0eeeed308ad3a40787db5.pdf', 'repository/slo/perjanjianjualbeli/filejkif222901fa5e0eeeed308ad3a40787db5', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CIBADAK_INDAH_SARI_F2.pdf', 'repository/slo/perjanjianjualbeli/fileiof222901fa5e0eeeed308ad3a40787db5', 'repository/slo/perjanjianjualbeli/filenpwpf222901fa5e0eeeed308ad3a40787db5', 'repository/slo/perjanjianjualbeli/filepkpf222901fa5e0eeeed308ad3a40787db5'),
(203, '058', '533811975071', '2018-04-20', 'repository/slo/perjanjianjualbeli/filejb36a86015323250b6d6f9449bdf72ce38.jpg', 'repository/slo/perjanjianjualbeli/filesld36a86015323250b6d6f9449bdf72ce38.pdf', 'repository/slo/perjanjianjualbeli/filegitl36a86015323250b6d6f9449bdf72ce38.pdf', 'repository/slo/perjanjianjualbeli/filejki36a86015323250b6d6f9449bdf72ce38', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._CIBADAK_INDAH_SARI_F2.pdf', 'repository/slo/perjanjianjualbeli/fileio36a86015323250b6d6f9449bdf72ce38', 'repository/slo/perjanjianjualbeli/filenpwp36a86015323250b6d6f9449bdf72ce38', 'repository/slo/perjanjianjualbeli/filepkp36a86015323250b6d6f9449bdf72ce38'),
(204, '059', '534112324339', '2018-05-22', 'repository/slo/perjanjianjualbeli/filejb25a94e830a2b5a91e47099fc3dd39d2a.pdf', 'repository/slo/perjanjianjualbeli/filesld25a94e830a2b5a91e47099fc3dd39d2a.pdf', 'repository/slo/perjanjianjualbeli/filegitl25a94e830a2b5a91e47099fc3dd39d2a.pdf', 'repository/slo/perjanjianjualbeli/filejki25a94e830a2b5a91e47099fc3dd39d2a', 'repository/slo/perjanjianjualbeli/Spesifikasi_PT._YOUNG_WON_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio25a94e830a2b5a91e47099fc3dd39d2a', 'repository/slo/perjanjianjualbeli/filenpwp25a94e830a2b5a91e47099fc3dd39d2a', 'repository/slo/perjanjianjualbeli/filepkp25a94e830a2b5a91e47099fc3dd39d2a'),
(205, '05A', '00.30./AGA.01.01/ADPK/2018', '2018-02-12', 'repository/slo/perjanjianjualbeli/filejb2747157b9b0fef5e0f6c6667b0f48d41.pdf', 'repository/slo/perjanjianjualbeli/filesld2747157b9b0fef5e0f6c6667b0f48d41.pdf', 'repository/slo/perjanjianjualbeli/filegitl2747157b9b0fef5e0f6c6667b0f48d41.pdf', 'repository/slo/perjanjianjualbeli/filejki2747157b9b0fef5e0f6c6667b0f48d41', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Grand_Zamzam_Tower_Apartement.pdf', 'repository/slo/perjanjianjualbeli/fileio2747157b9b0fef5e0f6c6667b0f48d41', 'repository/slo/perjanjianjualbeli/filenpwp2747157b9b0fef5e0f6c6667b0f48d41', 'repository/slo/perjanjianjualbeli/filepkp2747157b9b0fef5e0f6c6667b0f48d41'),
(206, '05A', '00.30./AGA.01.01/ADPK/2018', '2018-02-12', 'repository/slo/perjanjianjualbeli/filejb708be72bbde2b50a74df5e2757b44cbc.pdf', 'repository/slo/perjanjianjualbeli/filesld708be72bbde2b50a74df5e2757b44cbc.pdf', 'repository/slo/perjanjianjualbeli/filegitl708be72bbde2b50a74df5e2757b44cbc.pdf', 'repository/slo/perjanjianjualbeli/filejki708be72bbde2b50a74df5e2757b44cbc', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_Grand_Zamzam_Tower_Apartement.pdf', 'repository/slo/perjanjianjualbeli/fileio708be72bbde2b50a74df5e2757b44cbc', 'repository/slo/perjanjianjualbeli/filenpwp708be72bbde2b50a74df5e2757b44cbc', 'repository/slo/perjanjianjualbeli/filepkp708be72bbde2b50a74df5e2757b44cbc'),
(207, '05B', '136.PJ/AGA01.01/SPJBTL/AREABKS/2018', '2018-04-18', 'repository/slo/perjanjianjualbeli/filejb49ae6de37725cef7a222eebef6e5bada.pdf', 'repository/slo/perjanjianjualbeli/filesld49ae6de37725cef7a222eebef6e5bada.pdf', 'repository/slo/perjanjianjualbeli/filegitl49ae6de37725cef7a222eebef6e5bada.pdf', 'repository/slo/perjanjianjualbeli/filejkiecbdafa713ab0f5659238610b8cb5c3b', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi-Yayasan_Bina_Nusantara.pdf', 'repository/slo/perjanjianjualbeli/fileioecbdafa713ab0f5659238610b8cb5c3b', 'repository/slo/perjanjianjualbeli/filenpwpecbdafa713ab0f5659238610b8cb5c3b', 'repository/slo/perjanjianjualbeli/filepkpecbdafa713ab0f5659238610b8cb5c3b'),
(208, '05C', '534680448930', '2018-06-25', 'repository/slo/perjanjianjualbeli/filejb25474df490ea9d565776ea790bfd926d.pdf', 'repository/slo/perjanjianjualbeli/filesld34cf8bcdb189bfe695d1f601e75e7d31.pdf', 'repository/slo/perjanjianjualbeli/filegitl25474df490ea9d565776ea790bfd926d.pdf', 'repository/slo/perjanjianjualbeli/filejki25474df490ea9d565776ea790bfd926d', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._GEORG_FISCHER_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio21dd314e7936293d90f8495038f16e3d', 'repository/slo/perjanjianjualbeli/filenpwp21dd314e7936293d90f8495038f16e3d', 'repository/slo/perjanjianjualbeli/filepkp21dd314e7936293d90f8495038f16e3d'),
(209, '05C', '534680448930', '2018-06-25', 'repository/slo/perjanjianjualbeli/filejbc7894c55ffcafbbed2c8b34cd96e82de.pdf', 'repository/slo/perjanjianjualbeli/filesld34cf8bcdb189bfe695d1f601e75e7d31.pdf', 'repository/slo/perjanjianjualbeli/filegitlc7894c55ffcafbbed2c8b34cd96e82de.pdf', 'repository/slo/perjanjianjualbeli/filejkic7894c55ffcafbbed2c8b34cd96e82de', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._GEORG_FISCHER_INDONESIA.pdf', 'repository/slo/perjanjianjualbeli/fileio3a2486647a5b2b3755ec19ddca78e06d', 'repository/slo/perjanjianjualbeli/filenpwp3a2486647a5b2b3755ec19ddca78e06d', 'repository/slo/perjanjianjualbeli/filepkp3a2486647a5b2b3755ec19ddca78e06d'),
(210, '05E', '141302048680', '2018-04-24', 'repository/slo/perjanjianjualbeli/filejb44dcf90b249a6d0ca0c53ed50c69a8ce.pdf', 'repository/slo/perjanjianjualbeli/filesld44dcf90b249a6d0ca0c53ed50c69a8ce.pdf', 'repository/slo/perjanjianjualbeli/filegitl44dcf90b249a6d0ca0c53ed50c69a8ce.pdf', 'repository/slo/perjanjianjualbeli/filejki44dcf90b249a6d0ca0c53ed50c69a8ce', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_DEPO_LRT.pdf', 'repository/slo/perjanjianjualbeli/fileio44dcf90b249a6d0ca0c53ed50c69a8ce', 'repository/slo/perjanjianjualbeli/filenpwp44dcf90b249a6d0ca0c53ed50c69a8ce', 'repository/slo/perjanjianjualbeli/filepkp44dcf90b249a6d0ca0c53ed50c69a8ce'),
(211, '05F', '566600725403', '2018-03-23', 'repository/slo/perjanjianjualbeli/filejb11661693de04251e8ffde0513dc8952c.pdf', 'repository/slo/perjanjianjualbeli/filesld11661693de04251e8ffde0513dc8952c.pdf', 'repository/slo/perjanjianjualbeli/filegitl11661693de04251e8ffde0513dc8952c.pdf', 'repository/slo/perjanjianjualbeli/filejki0d1d742041a93859ef945058270360ee', 'repository/slo/perjanjianjualbeli/Spesifikasi_Instalasi_PT._KARTONINDO_MEGA_JAYA.pdf', 'repository/slo/perjanjianjualbeli/fileio0d1d742041a93859ef945058270360ee', 'repository/slo/perjanjianjualbeli/filenpwp0d1d742041a93859ef945058270360ee', 'repository/slo/perjanjianjualbeli/filepkp0d1d742041a93859ef945058270360ee');

-- --------------------------------------------------------

--
-- Table structure for table `t_tegangan_pemanfaatan`
--

CREATE TABLE `t_tegangan_pemanfaatan` (
  `id` int(11) NOT NULL,
  `tegangan` varchar(50) DEFAULT NULL,
  `id_tegangan_pengenal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tegangan_pemanfaatan`
--

INSERT INTO `t_tegangan_pemanfaatan` (`id`, `tegangan`, `id_tegangan_pengenal`) VALUES
(1, 'Untuk system Tegangan Menengah 20 kV', 15),
(2, 'Untuk system Tegangan Rendah 380 V', 12);

-- --------------------------------------------------------

--
-- Table structure for table `t_tegangan_pengenal`
--

CREATE TABLE `t_tegangan_pengenal` (
  `id` int(11) NOT NULL,
  `tegangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tegangan_pengenal`
--

INSERT INTO `t_tegangan_pengenal` (`id`, `tegangan`) VALUES
(11, '220 V'),
(12, '380 V'),
(13, '6 kV'),
(14, '12 kV'),
(15, '20 kV'),
(16, '30 kV'),
(17, '70 kV'),
(18, '150 kV'),
(19, '275 kV'),
(20, '500 kV');

-- --------------------------------------------------------

--
-- Table structure for table `t_trafo_distribusi`
--

CREATE TABLE `t_trafo_distribusi` (
  `id_trafo` int(11) NOT NULL,
  `id_distribusi` int(11) DEFAULT NULL,
  `kva` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_transmisi`
--

CREATE TABLE `t_transmisi` (
  `id_transmisi` int(11) NOT NULL,
  `id_pemohon` varchar(4) DEFAULT NULL,
  `kode_jenis_transmisi` varchar(100) DEFAULT NULL,
  `kode_jenis_usaha` varchar(255) DEFAULT NULL,
  `kode_kepemilikan` varchar(100) DEFAULT NULL,
  `kode_sistem_jaringan` varchar(100) DEFAULT NULL,
  `kode_tegangan_pengenal` varchar(100) DEFAULT NULL,
  `p_saluran_sutet` varchar(100) DEFAULT NULL,
  `p_saluran_sutt` varchar(100) DEFAULT NULL,
  `kapasitas_travo` varchar(100) DEFAULT NULL,
  `jumlah_tower` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_login` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `passmd5` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_key` varchar(60) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `sub_bidang` varchar(500) DEFAULT NULL,
  `no_sertifikat` varchar(100) DEFAULT NULL,
  `kode_unit` varchar(100) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `registered_at` datetime DEFAULT NULL,
  `active` varchar(1) DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`, `passmd5`, `email`, `activation_key`, `display_name`, `picture`, `sub_bidang`, `no_sertifikat`, `kode_unit`, `group_id`, `registered_at`, `active`) VALUES
(1, 'admin', '$2y$10$6ITOskyAHvPkZ1iqQn5Z.O1wlG9FCgc2JZxIbfoyD3a14aMIY/vc2', '88f7b0199083ab4f0d8ed6b6c088b384', 'admin@saranadeteksienergi.com', NULL, 'Admin', 'assets/backend/img/default.png', NULL, NULL, NULL, 1, '2012-03-03 09:41:19', 'Y'),
(70, 'arief', '$2y$10$zXzvJkAsZJmhP0PJTPqjZO/h4aNd0SG6wcaLB4ctUCZtefllXpG2G', '88f7b0199083ab4f0d8ed6b6c088b384', 'elektrajaya@ymail.com', NULL, 'H. ARIEF AZHARI, ST', 'repository/user/0ae9ede63b8e076ece30e75035978ebb.jpg', 'Pemeriksaan dan Pengujian ', '0288.0.02.D033.02.2015', '3201022612760012', 3, '2017-06-15 10:03:01', 'Y'),
(71, 'abdul', '$2y$10$GIwrL853iNVBl4gMIWOO.O99dB02Y7qtNUfVvQZ9IRSWAQ3bGRioG', '88f7b0199083ab4f0d8ed6b6c088b384', 'saranadeteksienergi@gmail.com', NULL, 'ABDUL KHODIR', 'repository/user/f7c2bb2aaddecedb19c0fc5e359e7d06.jpg', 'Pemeriksaan dan Pengujian ', '0286.0.02.D032.02.2015', '3201022712880004', 3, '2017-06-15 10:06:17', 'Y'),
(72, 'sanuri', '$2y$10$dg1pGR4AmhDDNBCERwp3jus.756NyOSfHkuGc5Y8WEaOmG.A2220y', '88f7b0199083ab4f0d8ed6b6c088b384', 'saranadeteksienergi@gmail.com', NULL, 'SANURI', 'repository/user/827cac9fab4b263c05da90e6b5b1df3f.jpg', 'Pemeriksaan dan Pengujian ', '0308.0.03.P033.05.2016', '3175070101840025', 3, '2017-06-15 10:15:31', 'Y'),
(73, 'ryan', 'ryan', '10c7ccc7a4f0aff03c915c485565b9da', 'ryanefendiproaf', '', 'ryan', NULL, NULL, NULL, NULL, 1, NULL, 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`) USING BTREE,
  ADD UNIQUE KEY `roles_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `group_role`
--
ALTER TABLE `group_role`
  ADD PRIMARY KEY (`group_role_id`);

--
-- Indexes for table `inf_lokasi`
--
ALTER TABLE `inf_lokasi`
  ADD PRIMARY KEY (`lokasi_ID`),
  ADD KEY `lokasi_kode` (`lokasi_kode`) USING BTREE,
  ADD KEY `lokasi_propinsi` (`lokasi_propinsi`) USING BTREE,
  ADD KEY `lokasi_kabupatenkota` (`lokasi_kabupatenkota`) USING BTREE,
  ADD KEY `lokasi_kecamatan` (`lokasi_kecamatan`) USING BTREE,
  ADD KEY `lokasi_kelurahan` (`lokasi_kelurahan`) USING BTREE;

--
-- Indexes for table `kab`
--
ALTER TABLE `kab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_meta`
--
ALTER TABLE `post_meta`
  ADD PRIMARY KEY (`post_meta_id`);

--
-- Indexes for table `post_term`
--
ALTER TABLE `post_term`
  ADD PRIMARY KEY (`post_term_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sk`
--
ALTER TABLE `sk`
  ADD PRIMARY KEY (`id_sk`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `t_bahan_bakar`
--
ALTER TABLE `t_bahan_bakar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_cetak_ulang_slo_api`
--
ALTER TABLE `t_cetak_ulang_slo_api`
  ADD PRIMARY KEY (`id_api_cetak_slo`);

--
-- Indexes for table `t_distribusi`
--
ALTER TABLE `t_distribusi`
  ADD PRIMARY KEY (`id_distribusi`);

--
-- Indexes for table `t_hasil_permohonan_api`
--
ALTER TABLE `t_hasil_permohonan_api`
  ADD PRIMARY KEY (`id_api_hasil_permohonan`);

--
-- Indexes for table `t_instalasi`
--
ALTER TABLE `t_instalasi`
  ADD PRIMARY KEY (`id_instalasi`);

--
-- Indexes for table `t_instalasi_jenis`
--
ALTER TABLE `t_instalasi_jenis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `id_jenis_instalasi` (`id_jenis_instalasi`);

--
-- Indexes for table `t_instalasi_pemanfaatan`
--
ALTER TABLE `t_instalasi_pemanfaatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jenis_instalasi`
--
ALTER TABLE `t_jenis_instalasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jenis_pembangkit`
--
ALTER TABLE `t_jenis_pembangkit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jenis_usaha`
--
ALTER TABLE `t_jenis_usaha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_kepemilikan_sistem_jaringan`
--
ALTER TABLE `t_kepemilikan_sistem_jaringan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_kwitansi`
--
ALTER TABLE `t_kwitansi`
  ADD PRIMARY KEY (`Id_kwitansi`);

--
-- Indexes for table `t_lampiran`
--
ALTER TABLE `t_lampiran`
  ADD PRIMARY KEY (`id_lampiran`);

--
-- Indexes for table `t_pemanfaatan`
--
ALTER TABLE `t_pemanfaatan`
  ADD PRIMARY KEY (`id_pemanfaatan`);

--
-- Indexes for table `t_pemasang_instalasi`
--
ALTER TABLE `t_pemasang_instalasi`
  ADD PRIMARY KEY (`id_pemasang_instalasi`);

--
-- Indexes for table `t_pembangkit`
--
ALTER TABLE `t_pembangkit`
  ADD PRIMARY KEY (`id_pembangkit`);

--
-- Indexes for table `t_pemohon`
--
ALTER TABLE `t_pemohon`
  ADD PRIMARY KEY (`id_pemohon`);

--
-- Indexes for table `t_pesan`
--
ALTER TABLE `t_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `t_satuan_kapasitas`
--
ALTER TABLE `t_satuan_kapasitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_sistem_jaringan`
--
ALTER TABLE `t_sistem_jaringan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `t_status_api`
--
ALTER TABLE `t_status_api`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `t_surat_perjanjian`
--
ALTER TABLE `t_surat_perjanjian`
  ADD PRIMARY KEY (`id_surat_perjanjian`);

--
-- Indexes for table `t_tegangan_pemanfaatan`
--
ALTER TABLE `t_tegangan_pemanfaatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tegangan_pengenal` (`id_tegangan_pengenal`);

--
-- Indexes for table `t_tegangan_pengenal`
--
ALTER TABLE `t_tegangan_pengenal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_trafo_distribusi`
--
ALTER TABLE `t_trafo_distribusi`
  ADD PRIMARY KEY (`id_trafo`);

--
-- Indexes for table `t_transmisi`
--
ALTER TABLE `t_transmisi`
  ADD PRIMARY KEY (`id_transmisi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_role`
--
ALTER TABLE `group_role`
  MODIFY `group_role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inf_lokasi`
--
ALTER TABLE `inf_lokasi`
  MODIFY `lokasi_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kab`
--
ALTER TABLE `kab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_meta`
--
ALTER TABLE `post_meta`
  MODIFY `post_meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_term`
--
ALTER TABLE `post_term`
  MODIFY `post_term_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sk`
--
ALTER TABLE `sk`
  MODIFY `id_sk` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_cetak_ulang_slo_api`
--
ALTER TABLE `t_cetak_ulang_slo_api`
  MODIFY `id_api_cetak_slo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_distribusi`
--
ALTER TABLE `t_distribusi`
  MODIFY `id_distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_hasil_permohonan_api`
--
ALTER TABLE `t_hasil_permohonan_api`
  MODIFY `id_api_hasil_permohonan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `t_instalasi`
--
ALTER TABLE `t_instalasi`
  MODIFY `id_instalasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `t_instalasi_jenis`
--
ALTER TABLE `t_instalasi_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `t_instalasi_pemanfaatan`
--
ALTER TABLE `t_instalasi_pemanfaatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_jenis_instalasi`
--
ALTER TABLE `t_jenis_instalasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_kepemilikan_sistem_jaringan`
--
ALTER TABLE `t_kepemilikan_sistem_jaringan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_kwitansi`
--
ALTER TABLE `t_kwitansi`
  MODIFY `Id_kwitansi` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `t_lampiran`
--
ALTER TABLE `t_lampiran`
  MODIFY `id_lampiran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_pemanfaatan`
--
ALTER TABLE `t_pemanfaatan`
  MODIFY `id_pemanfaatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `t_pemasang_instalasi`
--
ALTER TABLE `t_pemasang_instalasi`
  MODIFY `id_pemasang_instalasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `t_pembangkit`
--
ALTER TABLE `t_pembangkit`
  MODIFY `id_pembangkit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_pesan`
--
ALTER TABLE `t_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_sistem_jaringan`
--
ALTER TABLE `t_sistem_jaringan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `t_status`
--
ALTER TABLE `t_status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_status_api`
--
ALTER TABLE `t_status_api`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_surat_perjanjian`
--
ALTER TABLE `t_surat_perjanjian`
  MODIFY `id_surat_perjanjian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `t_tegangan_pemanfaatan`
--
ALTER TABLE `t_tegangan_pemanfaatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_tegangan_pengenal`
--
ALTER TABLE `t_tegangan_pengenal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_trafo_distribusi`
--
ALTER TABLE `t_trafo_distribusi`
  MODIFY `id_trafo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_transmisi`
--
ALTER TABLE `t_transmisi`
  MODIFY `id_transmisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_instalasi_jenis`
--
ALTER TABLE `t_instalasi_jenis`
  ADD CONSTRAINT `id_jenis_instalasi` FOREIGN KEY (`id_jenis_instalasi`) REFERENCES `t_jenis_instalasi` (`id`);

--
-- Constraints for table `t_tegangan_pemanfaatan`
--
ALTER TABLE `t_tegangan_pemanfaatan`
  ADD CONSTRAINT `t_tegangan_pemanfaatan_ibfk_1` FOREIGN KEY (`id_tegangan_pengenal`) REFERENCES `t_tegangan_pengenal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

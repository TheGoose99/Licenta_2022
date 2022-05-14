-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 14, 2022 at 02:09 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_dblicenta`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_code` int(5) NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `phone_code`, `country_code`, `country_name`) VALUES
(1, 93, 'AF', 'Afghanistan'),
(2, 358, 'AX', 'Aland Islands'),
(3, 355, 'AL', 'Albania'),
(4, 213, 'DZ', 'Algeria'),
(5, 1684, 'AS', 'American Samoa'),
(6, 376, 'AD', 'Andorra'),
(7, 244, 'AO', 'Angola'),
(8, 1264, 'AI', 'Anguilla'),
(9, 672, 'AQ', 'Antarctica'),
(10, 1268, 'AG', 'Antigua and Barbuda'),
(11, 54, 'AR', 'Argentina'),
(12, 374, 'AM', 'Armenia'),
(13, 297, 'AW', 'Aruba'),
(14, 61, 'AU', 'Australia'),
(15, 43, 'AT', 'Austria'),
(16, 994, 'AZ', 'Azerbaijan'),
(17, 1242, 'BS', 'Bahamas'),
(18, 973, 'BH', 'Bahrain'),
(19, 880, 'BD', 'Bangladesh'),
(20, 1246, 'BB', 'Barbados'),
(21, 375, 'BY', 'Belarus'),
(22, 32, 'BE', 'Belgium'),
(23, 501, 'BZ', 'Belize'),
(24, 229, 'BJ', 'Benin'),
(25, 1441, 'BM', 'Bermuda'),
(26, 975, 'BT', 'Bhutan'),
(27, 591, 'BO', 'Bolivia'),
(28, 599, 'BQ', 'Bonaire, Sint Eustatius and Saba'),
(29, 387, 'BA', 'Bosnia and Herzegovina'),
(30, 267, 'BW', 'Botswana'),
(31, 55, 'BV', 'Bouvet Island'),
(32, 55, 'BR', 'Brazil'),
(33, 246, 'IO', 'British Indian Ocean Territory'),
(34, 673, 'BN', 'Brunei Darussalam'),
(35, 359, 'BG', 'Bulgaria'),
(36, 226, 'BF', 'Burkina Faso'),
(37, 257, 'BI', 'Burundi'),
(38, 855, 'KH', 'Cambodia'),
(39, 237, 'CM', 'Cameroon'),
(40, 1, 'CA', 'Canada'),
(41, 238, 'CV', 'Cape Verde'),
(42, 1345, 'KY', 'Cayman Islands'),
(43, 236, 'CF', 'Central African Republic'),
(44, 235, 'TD', 'Chad'),
(45, 56, 'CL', 'Chile'),
(46, 86, 'CN', 'China'),
(47, 61, 'CX', 'Christmas Island'),
(48, 672, 'CC', 'Cocos (Keeling) Islands'),
(49, 57, 'CO', 'Colombia'),
(50, 269, 'KM', 'Comoros'),
(51, 242, 'CG', 'Congo'),
(52, 242, 'CD', 'Congo, Democratic Republic of the Congo'),
(53, 682, 'CK', 'Cook Islands'),
(54, 506, 'CR', 'Costa Rica'),
(55, 225, 'CI', 'Cote D\'Ivoire'),
(56, 385, 'HR', 'Croatia'),
(57, 53, 'CU', 'Cuba'),
(58, 599, 'CW', 'Curacao'),
(59, 357, 'CY', 'Cyprus'),
(60, 420, 'CZ', 'Czech Republic'),
(61, 45, 'DK', 'Denmark'),
(62, 253, 'DJ', 'Djibouti'),
(63, 1767, 'DM', 'Dominica'),
(64, 1809, 'DO', 'Dominican Republic'),
(65, 593, 'EC', 'Ecuador'),
(66, 20, 'EG', 'Egypt'),
(67, 503, 'SV', 'El Salvador'),
(68, 240, 'GQ', 'Equatorial Guinea'),
(69, 291, 'ER', 'Eritrea'),
(70, 372, 'EE', 'Estonia'),
(71, 251, 'ET', 'Ethiopia'),
(72, 500, 'FK', 'Falkland Islands (Malvinas)'),
(73, 298, 'FO', 'Faroe Islands'),
(74, 679, 'FJ', 'Fiji'),
(75, 358, 'FI', 'Finland'),
(76, 33, 'FR', 'France'),
(77, 594, 'GF', 'French Guiana'),
(78, 689, 'PF', 'French Polynesia'),
(79, 262, 'TF', 'French Southern Territories'),
(80, 241, 'GA', 'Gabon'),
(81, 220, 'GM', 'Gambia'),
(82, 995, 'GE', 'Georgia'),
(83, 49, 'DE', 'Germany'),
(84, 233, 'GH', 'Ghana'),
(85, 350, 'GI', 'Gibraltar'),
(86, 30, 'GR', 'Greece'),
(87, 299, 'GL', 'Greenland'),
(88, 1473, 'GD', 'Grenada'),
(89, 590, 'GP', 'Guadeloupe'),
(90, 1671, 'GU', 'Guam'),
(91, 502, 'GT', 'Guatemala'),
(92, 44, 'GG', 'Guernsey'),
(93, 224, 'GN', 'Guinea'),
(94, 245, 'GW', 'Guinea-Bissau'),
(95, 592, 'GY', 'Guyana'),
(96, 509, 'HT', 'Haiti'),
(97, 0, 'HM', 'Heard Island and Mcdonald Islands'),
(98, 39, 'VA', 'Holy See (Vatican City State)'),
(99, 504, 'HN', 'Honduras'),
(100, 852, 'HK', 'Hong Kong'),
(101, 36, 'HU', 'Hungary'),
(102, 354, 'IS', 'Iceland'),
(103, 91, 'IN', 'India'),
(104, 62, 'ID', 'Indonesia'),
(105, 98, 'IR', 'Iran, Islamic Republic of'),
(106, 964, 'IQ', 'Iraq'),
(107, 353, 'IE', 'Ireland'),
(108, 44, 'IM', 'Isle of Man'),
(109, 972, 'IL', 'Israel'),
(110, 39, 'IT', 'Italy'),
(111, 1876, 'JM', 'Jamaica'),
(112, 81, 'JP', 'Japan'),
(113, 44, 'JE', 'Jersey'),
(114, 962, 'JO', 'Jordan'),
(115, 7, 'KZ', 'Kazakhstan'),
(116, 254, 'KE', 'Kenya'),
(117, 686, 'KI', 'Kiribati'),
(118, 850, 'KP', 'Korea, Democratic People\'s Republic of'),
(119, 82, 'KR', 'Korea, Republic of'),
(120, 381, 'XK', 'Kosovo'),
(121, 965, 'KW', 'Kuwait'),
(122, 996, 'KG', 'Kyrgyzstan'),
(123, 856, 'LA', 'Lao People\'s Democratic Republic'),
(124, 371, 'LV', 'Latvia'),
(125, 961, 'LB', 'Lebanon'),
(126, 266, 'LS', 'Lesotho'),
(127, 231, 'LR', 'Liberia'),
(128, 218, 'LY', 'Libyan Arab Jamahiriya'),
(129, 423, 'LI', 'Liechtenstein'),
(130, 370, 'LT', 'Lithuania'),
(131, 352, 'LU', 'Luxembourg'),
(132, 853, 'MO', 'Macao'),
(133, 389, 'MK', 'Macedonia, the Former Yugoslav Republic of'),
(134, 261, 'MG', 'Madagascar'),
(135, 265, 'MW', 'Malawi'),
(136, 60, 'MY', 'Malaysia'),
(137, 960, 'MV', 'Maldives'),
(138, 223, 'ML', 'Mali'),
(139, 356, 'MT', 'Malta'),
(140, 692, 'MH', 'Marshall Islands'),
(141, 596, 'MQ', 'Martinique'),
(142, 222, 'MR', 'Mauritania'),
(143, 230, 'MU', 'Mauritius'),
(144, 269, 'YT', 'Mayotte'),
(145, 52, 'MX', 'Mexico'),
(146, 691, 'FM', 'Micronesia, Federated States of'),
(147, 373, 'MD', 'Moldova, Republic of'),
(148, 377, 'MC', 'Monaco'),
(149, 976, 'MN', 'Mongolia'),
(150, 382, 'ME', 'Montenegro'),
(151, 1664, 'MS', 'Montserrat'),
(152, 212, 'MA', 'Morocco'),
(153, 258, 'MZ', 'Mozambique'),
(154, 95, 'MM', 'Myanmar'),
(155, 264, 'NA', 'Namibia'),
(156, 674, 'NR', 'Nauru'),
(157, 977, 'NP', 'Nepal'),
(158, 31, 'NL', 'Netherlands'),
(159, 599, 'AN', 'Netherlands Antilles'),
(160, 687, 'NC', 'New Caledonia'),
(161, 64, 'NZ', 'New Zealand'),
(162, 505, 'NI', 'Nicaragua'),
(163, 227, 'NE', 'Niger'),
(164, 234, 'NG', 'Nigeria'),
(165, 683, 'NU', 'Niue'),
(166, 672, 'NF', 'Norfolk Island'),
(167, 1670, 'MP', 'Northern Mariana Islands'),
(168, 47, 'NO', 'Norway'),
(169, 968, 'OM', 'Oman'),
(170, 92, 'PK', 'Pakistan'),
(171, 680, 'PW', 'Palau'),
(172, 970, 'PS', 'Palestinian Territory, Occupied'),
(173, 507, 'PA', 'Panama'),
(174, 675, 'PG', 'Papua New Guinea'),
(175, 595, 'PY', 'Paraguay'),
(176, 51, 'PE', 'Peru'),
(177, 63, 'PH', 'Philippines'),
(178, 64, 'PN', 'Pitcairn'),
(179, 48, 'PL', 'Poland'),
(180, 351, 'PT', 'Portugal'),
(181, 1787, 'PR', 'Puerto Rico'),
(182, 974, 'QA', 'Qatar'),
(183, 262, 'RE', 'Reunion'),
(184, 40, 'RO', 'Romania'),
(185, 70, 'RU', 'Russian Federation'),
(186, 250, 'RW', 'Rwanda'),
(187, 590, 'BL', 'Saint Barthelemy'),
(188, 290, 'SH', 'Saint Helena'),
(189, 1869, 'KN', 'Saint Kitts and Nevis'),
(190, 1758, 'LC', 'Saint Lucia'),
(191, 590, 'MF', 'Saint Martin'),
(192, 508, 'PM', 'Saint Pierre and Miquelon'),
(193, 1784, 'VC', 'Saint Vincent and the Grenadines'),
(194, 684, 'WS', 'Samoa'),
(195, 378, 'SM', 'San Marino'),
(196, 239, 'ST', 'Sao Tome and Principe'),
(197, 966, 'SA', 'Saudi Arabia'),
(198, 221, 'SN', 'Senegal'),
(199, 381, 'RS', 'Serbia'),
(200, 381, 'CS', 'Serbia and Montenegro'),
(201, 248, 'SC', 'Seychelles'),
(202, 232, 'SL', 'Sierra Leone'),
(203, 65, 'SG', 'Singapore'),
(204, 1, 'SX', 'Sint Maarten'),
(205, 421, 'SK', 'Slovakia'),
(206, 386, 'SI', 'Slovenia'),
(207, 677, 'SB', 'Solomon Islands'),
(208, 252, 'SO', 'Somalia'),
(209, 27, 'ZA', 'South Africa'),
(210, 500, 'GS', 'South Georgia and the South Sandwich Islands'),
(211, 211, 'SS', 'South Sudan'),
(212, 34, 'ES', 'Spain'),
(213, 94, 'LK', 'Sri Lanka'),
(214, 249, 'SD', 'Sudan'),
(215, 597, 'SR', 'Suriname'),
(216, 47, 'SJ', 'Svalbard and Jan Mayen'),
(217, 268, 'SZ', 'Swaziland'),
(218, 46, 'SE', 'Sweden'),
(219, 41, 'CH', 'Switzerland'),
(220, 963, 'SY', 'Syrian Arab Republic'),
(221, 886, 'TW', 'Taiwan, Province of China'),
(222, 992, 'TJ', 'Tajikistan'),
(223, 255, 'TZ', 'Tanzania, United Republic of'),
(224, 66, 'TH', 'Thailand'),
(225, 670, 'TL', 'Timor-Leste'),
(226, 228, 'TG', 'Togo'),
(227, 690, 'TK', 'Tokelau'),
(228, 676, 'TO', 'Tonga'),
(229, 1868, 'TT', 'Trinidad and Tobago'),
(230, 216, 'TN', 'Tunisia'),
(231, 90, 'TR', 'Turkey'),
(232, 7370, 'TM', 'Turkmenistan'),
(233, 1649, 'TC', 'Turks and Caicos Islands'),
(234, 688, 'TV', 'Tuvalu'),
(235, 256, 'UG', 'Uganda'),
(236, 380, 'UA', 'Ukraine'),
(237, 971, 'AE', 'United Arab Emirates'),
(238, 44, 'GB', 'United Kingdom'),
(239, 1, 'US', 'United States'),
(240, 1, 'UM', 'United States Minor Outlying Islands'),
(241, 598, 'UY', 'Uruguay'),
(242, 998, 'UZ', 'Uzbekistan'),
(243, 678, 'VU', 'Vanuatu'),
(244, 58, 'VE', 'Venezuela'),
(245, 84, 'VN', 'Viet Nam'),
(246, 1284, 'VG', 'Virgin Islands, British'),
(247, 1340, 'VI', 'Virgin Islands, U.s.'),
(248, 681, 'WF', 'Wallis and Futuna'),
(249, 212, 'EH', 'Western Sahara'),
(250, 967, 'YE', 'Yemen'),
(251, 260, 'ZM', 'Zambia'),
(252, 263, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_03_29_194727_create_roles_table', 1),
(17, '2022_03_29_195708_create_permissions_table', 1),
(18, '2022_03_29_200606_create_users_permissions_table', 1),
(19, '2022_03_29_200659_create_users_roles_table', 1),
(20, '2022_03_29_200821_create_roles_permissions_table', 1),
(29, '2022_04_01_131017_create_sells_table', 3),
(25, '2022_04_23_173517_create_stocks_table', 2),
(28, '2022_03_30_174747_create_purchases_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'View Admin Panel', 'view-admin-panel', '2022-04-05 18:40:36', '2022-04-05 18:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE IF NOT EXISTS `permission_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `permission_user_permission_id_foreign` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '21873b94274ae1cceacd23ef814973f7b4dfefb44f14472cd2cb3b2f0ca6a3c5', '[\"*\"]', NULL, '2022-04-02 13:13:23', '2022-04-02 13:13:23'),
(2, 'App\\Models\\User', 1, 'auth_token', 'a3bc9e8a9ed85f907790a31d8acad1fed2ce32c3d50c4e88b995bbb0bd0f66e0', '[\"*\"]', NULL, '2022-04-02 13:13:38', '2022-04-02 13:13:38'),
(3, 'App\\Models\\User', 1, 'auth_token', '7fba9321e9bb7e3349e24e92dcd0a59e7337ab3d208fe8829f48ce96468ee6c1', '[\"*\"]', NULL, '2022-04-02 14:45:35', '2022-04-02 14:45:35'),
(4, 'App\\Models\\User', 1, 'auth_token', '4f983970deac5f2c0742a9d1212c3b2f2bfdc661fbdcc66b1d5624bf7b4134ea', '[\"*\"]', NULL, '2022-04-02 14:51:16', '2022-04-02 14:51:16'),
(5, 'App\\Models\\User', 2, 'auth_token', '273e8bddca7947d522279f223edbb76b3fbc8385b011cea5961e586d4ec0a800', '[\"*\"]', NULL, '2022-04-04 09:48:32', '2022-04-04 09:48:32'),
(6, 'App\\Models\\User', 1, 'auth_token', 'dd929edbd4a75e4beba8c002c9e95a451bf1e5963f14e9960fbd40b1f0c9779d', '[\"*\"]', NULL, '2022-04-04 09:49:03', '2022-04-04 09:49:03'),
(7, 'App\\Models\\User', 1, 'auth_token', '3036b96b44c709cf86942cbb8d3f727445bfff9b45d9d2855e2c705de935eea5', '[\"*\"]', NULL, '2022-04-04 15:03:32', '2022-04-04 15:03:32'),
(8, 'App\\Models\\User', 1, 'auth_token', '5e6b5fba5581473e74232f696291f0c85bf95990319765fe7571781f955e51c4', '[\"*\"]', NULL, '2022-04-04 15:11:41', '2022-04-04 15:11:41'),
(9, 'App\\Models\\User', 1, 'auth_token', '7a4673e2d73b29f756fe9266bf589647d470933ffb1b87911dee517378c7e5b8', '[\"*\"]', NULL, '2022-04-04 15:41:13', '2022-04-04 15:41:13'),
(10, 'App\\Models\\User', 1, 'auth_token', 'f8aa42bf8911890da650055577dbc3b3d8eaf60f30d30ba474cf1ae115afbf04', '[\"*\"]', NULL, '2022-04-05 09:28:15', '2022-04-05 09:28:15'),
(11, 'App\\Models\\User', 1, 'auth_token', 'c6872ac3c86a8704b0e43e757ad3b8605a59df6b994d81608c7e14364d2e1fc3', '[\"*\"]', NULL, '2022-04-05 09:32:59', '2022-04-05 09:32:59'),
(12, 'App\\Models\\User', 1, 'auth_token', '527ea58f6d5b45f4af66c89f39b0dd365e29c7591125db9cd18582dcb92b94bc', '[\"*\"]', NULL, '2022-04-05 09:44:55', '2022-04-05 09:44:55'),
(13, 'App\\Models\\User', 1, 'auth_token', '321196707b70e99819bc58b52655f8da6f139408d4188d242648a17f0a27f599', '[\"*\"]', NULL, '2022-04-05 11:04:41', '2022-04-05 11:04:41'),
(14, 'App\\Models\\User', 1, 'auth_token', '783a802a7edabce5f85a4147bfe47432cc30e70d311aff5ff626efe7796ee522', '[\"*\"]', NULL, '2022-04-05 11:06:18', '2022-04-05 11:06:18'),
(15, 'App\\Models\\User', 3, 'auth_token', '9ff771c4560a370f4069c50cdf29ae3a88b7fe608a3517aee9a063aa9ed0d4d4', '[\"*\"]', NULL, '2022-04-05 11:09:57', '2022-04-05 11:09:57'),
(16, 'App\\Models\\User', 1, 'auth_token', 'afc4b25139dea0e1adfb50492b529a4ff0577fa39a908061b244a2a411820f5a', '[\"*\"]', NULL, '2022-04-05 11:17:18', '2022-04-05 11:17:18'),
(17, 'App\\Models\\User', 1, 'auth_token', 'c91736d777fbaa21b1d08ab3f1bd6f286794cdfc0256eb614b97d6707e465c1a', '[\"*\"]', NULL, '2022-04-05 11:34:58', '2022-04-05 11:34:58'),
(18, 'App\\Models\\User', 1, 'auth_token', '935c37c52648b5e4011d479b1122c540c4e2a36233369b618b26c9146c91b2c3', '[\"*\"]', NULL, '2022-04-05 12:51:57', '2022-04-05 12:51:57'),
(19, 'App\\Models\\User', 1, 'auth_token', '853f9dee69e3f9ab29af97f8cdedec0e442ba335000b6452ea79ced1e8275b6d', '[\"*\"]', NULL, '2022-04-05 18:21:55', '2022-04-05 18:21:55'),
(20, 'App\\Models\\User', 1, 'auth_token', '6312bc8eddbc704ffaa6f50035f3723cd975bcea8dd51f940d684159090343b9', '[\"*\"]', NULL, '2022-04-06 16:18:35', '2022-04-06 16:18:35'),
(21, 'App\\Models\\User', 4, 'auth_token', 'b3951264cbfb1c1622180c9da778e47a08d63486ca6a1a8223b3cbbfaaf820b8', '[\"*\"]', NULL, '2022-04-06 17:50:43', '2022-04-06 17:50:43'),
(22, 'App\\Models\\User', 4, 'auth_token', '5d30fda3e542787edeaea705129c306b7a9754875f1fac20f00dcccd843d0752', '[\"*\"]', NULL, '2022-04-06 17:51:30', '2022-04-06 17:51:30'),
(23, 'App\\Models\\User', 1, 'auth_token', '49fa8ed9f59a3b7cc4203afa4a16f5c368d5d1b1a707995c27483f9c32ce5594', '[\"*\"]', NULL, '2022-04-06 18:12:43', '2022-04-06 18:12:43'),
(24, 'App\\Models\\User', 4, 'auth_token', '2079c8ecff180f10f392013ebafe23f5e65be4e7de2a08bf4bbdf4f2fee6bc89', '[\"*\"]', NULL, '2022-04-06 18:14:26', '2022-04-06 18:14:26'),
(25, 'App\\Models\\User', 1, 'auth_token', 'bcae200f7ee3630523010c77dc08a6bcb9c1a097ec7e78ce971ed6e1c58d233a', '[\"*\"]', NULL, '2022-04-06 18:17:39', '2022-04-06 18:17:39'),
(26, 'App\\Models\\User', 1, 'auth_token', '9c51f67827eeb7913aa8cc5c8a36d37a389253ac691fa4b74e0c00ae86ba6536', '[\"*\"]', NULL, '2022-04-06 18:18:50', '2022-04-06 18:18:50'),
(27, 'App\\Models\\User', 1, 'auth_token', 'c36e6a06248a405a47c58a510557fd5b4ffcb749c5ecb37dd32dbe336087f6ad', '[\"*\"]', NULL, '2022-04-06 18:20:21', '2022-04-06 18:20:21'),
(28, 'App\\Models\\User', 1, 'auth_token', '47bab385d9fb376c0d9ccc9e1b6ab3ce43935a577cb5a95f5b1ef72b41ed0e36', '[\"*\"]', NULL, '2022-04-06 18:21:01', '2022-04-06 18:21:01'),
(29, 'App\\Models\\User', 1, 'auth_token', 'be849057eb7258b4b4f4ee84b36c40946413757400c1f469b30716f29c5ab586', '[\"*\"]', NULL, '2022-04-06 18:21:40', '2022-04-06 18:21:40'),
(30, 'App\\Models\\User', 1, 'auth_token', 'c67e791cd3979bcc4c541aabf47dae2c5263c7a6952c47d61d5ca60af069cb89', '[\"*\"]', NULL, '2022-04-06 18:23:25', '2022-04-06 18:23:25'),
(31, 'App\\Models\\User', 1, 'auth_token', '90128532e07779b0cb17cc86178616dc3a9e151f39f1faa6836492a597aa5cfa', '[\"*\"]', NULL, '2022-04-06 18:24:19', '2022-04-06 18:24:19'),
(32, 'App\\Models\\User', 1, 'auth_token', 'a92a3d596d6903df0b9464f428751454eb0f44012aa63181c22fc92fabb83caf', '[\"*\"]', NULL, '2022-04-06 18:25:32', '2022-04-06 18:25:32'),
(33, 'App\\Models\\User', 4, 'auth_token', '29d2d3a94da836151a49a6ced533ee671a1bf882387182f148efde0bb0bd6bb1', '[\"*\"]', NULL, '2022-04-06 18:27:17', '2022-04-06 18:27:17'),
(34, 'App\\Models\\User', 1, 'auth_token', 'db45b44df3d319e9f1d8daf1ec1e25fae642bb10317f0321294edb0bf325b891', '[\"*\"]', NULL, '2022-04-06 18:31:20', '2022-04-06 18:31:20'),
(35, 'App\\Models\\User', 1, 'auth_token', '5d775ad8c51e5f0f314d039515f60f8483906e96cfb13924a3cdfa0dbe4c5627', '[\"*\"]', NULL, '2022-04-06 18:32:22', '2022-04-06 18:32:22'),
(36, 'App\\Models\\User', 1, 'auth_token', '4ef60d98e935b5e4e1671f0d4aa16b64de57041e7c64051859ec85491857928d', '[\"*\"]', NULL, '2022-04-06 18:33:55', '2022-04-06 18:33:55'),
(37, 'App\\Models\\User', 1, 'auth_token', '5cdc06b2dfd2e85535290ae6a95f183fba452b9eb5dd098acd778a8768408fd0', '[\"*\"]', NULL, '2022-04-06 18:37:08', '2022-04-06 18:37:08'),
(38, 'App\\Models\\User', 4, 'auth_token', '7554376c83faf4138d8c49f605c38ea983ad175462393c15a7b934761c0af21b', '[\"*\"]', NULL, '2022-04-06 18:37:32', '2022-04-06 18:37:32'),
(39, 'App\\Models\\User', 1, 'auth_token', '56b194c6094be3af4e5fdc9b99182b0788d1833b241c7ab52a64821fa5e38e76', '[\"*\"]', NULL, '2022-04-06 18:37:50', '2022-04-06 18:37:50'),
(40, 'App\\Models\\User', 1, 'auth_token', '2cb3979dd3e4c7e8481db07908e77a077e59f9aa14df58c1b7c52728ff20b6b2', '[\"*\"]', NULL, '2022-04-07 11:22:27', '2022-04-07 11:22:27'),
(41, 'App\\Models\\User', 4, 'auth_token', '5ccabbac566ecfb2dd09420e3e321c59f816d2a608547f340291f53f320cd1f8', '[\"*\"]', NULL, '2022-04-07 11:22:44', '2022-04-07 11:22:44'),
(42, 'App\\Models\\User', 1, 'auth_token', 'b7b0ffc3aa74eeafc6043b9e354b2b5512d96fa7b59659d5c3793bd762d6f59c', '[\"*\"]', NULL, '2022-04-08 13:02:27', '2022-04-08 13:02:27'),
(43, 'App\\Models\\User', 4, 'auth_token', 'e569641629fd786665f75f056850a5b7f28fbb2b550f558ba32c72c05d784cdc', '[\"*\"]', NULL, '2022-04-08 13:03:39', '2022-04-08 13:03:39'),
(44, 'App\\Models\\User', 1, 'auth_token', 'ed4fbd21727525ca98dc1e8eb646cee1ae2cdc8fab743b3a3bdd593719114026', '[\"*\"]', NULL, '2022-04-08 13:04:11', '2022-04-08 13:04:11'),
(45, 'App\\Models\\User', 1, 'auth_token', '938fa1ef8c6458b9227c4cd121eb297d2ab92a65217fb0696d0820bfabffc272', '[\"*\"]', NULL, '2022-04-13 09:27:39', '2022-04-13 09:27:39'),
(46, 'App\\Models\\User', 1, 'auth_token', 'c7d010a8bb1b22144ff0e4d0934619a7dd2c583952183afc60be991a730a3dfc', '[\"*\"]', NULL, '2022-04-13 09:30:18', '2022-04-13 09:30:18'),
(47, 'App\\Models\\User', 1, 'auth_token', '1acdfb2286a423c70654295b4aa73a3f2a2e336a635ab01c5dfb0176b84bcbe4', '[\"*\"]', NULL, '2022-04-13 09:32:59', '2022-04-13 09:32:59'),
(48, 'App\\Models\\User', 1, 'auth_token', '65043454c32ead51ccc2aab54f5829e3c41b9778e9916ff3cac0a6c191c13f71', '[\"*\"]', NULL, '2022-04-13 09:36:34', '2022-04-13 09:36:34'),
(49, 'App\\Models\\User', 1, 'auth_token', '923a90710bf4bc1591d0e59fba222eee594f42d0a25977bebf2f63861ce49b5a', '[\"*\"]', NULL, '2022-04-13 09:39:43', '2022-04-13 09:39:43'),
(50, 'App\\Models\\User', 1, 'auth_token', 'c6d9c85fdca634f633b47cddcf9fb27b36159e8373afd24bf51798092eea16c0', '[\"*\"]', NULL, '2022-04-13 09:40:49', '2022-04-13 09:40:49'),
(51, 'App\\Models\\User', 1, 'auth_token', 'd1e992600c6fdde03bb09e6a43331311e62b2c550a7a7579824d06b314a25979', '[\"*\"]', NULL, '2022-04-13 09:46:44', '2022-04-13 09:46:44'),
(52, 'App\\Models\\User', 1, 'auth_token', '73b2b04e5d2c9145978d3c173c6c12b4a5dae2777e8ea0a9f44b6be0df1d49f0', '[\"*\"]', NULL, '2022-04-13 09:47:04', '2022-04-13 09:47:04'),
(53, 'App\\Models\\User', 4, 'auth_token', '435282b312a521cb748531c761544a63847103a0b309f9aaa646c9fa6215e12a', '[\"*\"]', NULL, '2022-04-13 09:47:51', '2022-04-13 09:47:51'),
(54, 'App\\Models\\User', 1, 'auth_token', '8a974d93e29be49ac5e3c1832e28e2da126cbba39d80f6716ab7dbb5c5c192e6', '[\"*\"]', NULL, '2022-04-13 09:48:09', '2022-04-13 09:48:09'),
(55, 'App\\Models\\User', 1, 'auth_token', 'b8a3e56fb31ed157d8ece9f849ff2c10e12a1f1c4468f8e0ce2ec4e5d47534d6', '[\"*\"]', NULL, '2022-04-15 08:46:48', '2022-04-15 08:46:48'),
(56, 'App\\Models\\User', 1, 'auth_token', 'b71fa87f336712d465626a0fd5f90a1a6dc3a28c3ea8975455351f46c2db2631', '[\"*\"]', NULL, '2022-04-15 09:29:34', '2022-04-15 09:29:34'),
(57, 'App\\Models\\User', 1, 'auth_token', 'f547f1443509464dc694084f45db17a59b8154033e9a8a4df8b0a8472f2232a6', '[\"*\"]', NULL, '2022-04-15 09:59:33', '2022-04-15 09:59:33'),
(58, 'App\\Models\\User', 6, 'auth_token', '52d212142b0b3e453dd9593026461973f3f7d9064cf9d64fe62502234fdbed37', '[\"*\"]', NULL, '2022-04-16 09:01:29', '2022-04-16 09:01:29'),
(59, 'App\\Models\\User', 6, 'auth_token', 'cc8d10a22b4d444efd430204a139867539a2e25147f0d5fb1e3a2108990c8b9b', '[\"*\"]', NULL, '2022-04-16 09:02:47', '2022-04-16 09:02:47'),
(60, 'App\\Models\\User', 1, 'auth_token', 'ef2d976cad741c30220ec754a61338217bc8b14a29ddc03353fa903346e08c6f', '[\"*\"]', NULL, '2022-04-16 09:12:12', '2022-04-16 09:12:12'),
(61, 'App\\Models\\User', 1, 'auth_token', '5cc1fb0e785e1c13123e1230137f8355cdbd611ccfe1cdc89311d6111a2425ba', '[\"*\"]', NULL, '2022-04-16 13:03:12', '2022-04-16 13:03:12'),
(62, 'App\\Models\\User', 7, 'auth_token', 'b96498f4ca8e56d8c338ded837d9a5bd66f4dca988644b035ef1e18ca2615037', '[\"*\"]', NULL, '2022-04-23 06:43:18', '2022-04-23 06:43:18'),
(63, 'App\\Models\\User', 7, 'auth_token', '2a4d72c4394d2e7761475f4422d32716e02547dbebb9e4c8cc5f340e44bffa36', '[\"*\"]', NULL, '2022-04-23 06:43:40', '2022-04-23 06:43:40'),
(64, 'App\\Models\\User', 1, 'auth_token', '083147a633bbc728ebbe46f4d6454745be031253753989021a007a43fa7c179b', '[\"*\"]', NULL, '2022-04-23 06:50:43', '2022-04-23 06:50:43'),
(65, 'App\\Models\\User', 7, 'auth_token', '393df31601d8bd1f5a97626640abe2168dbe91a6ec0cd44bef980f75fb8842e2', '[\"*\"]', NULL, '2022-04-23 07:02:07', '2022-04-23 07:02:07'),
(66, 'App\\Models\\User', 1, 'auth_token', '0881694f293461ff3fa8d786684abd4afb3d39cece4a69c19bb54bd3213ee32f', '[\"*\"]', NULL, '2022-04-23 07:14:31', '2022-04-23 07:14:31'),
(67, 'App\\Models\\User', 8, 'auth_token', 'fba621108dd69ee8390c5c3fe35d86ad6f2d8e5fb7b26351598823af6ca64f30', '[\"*\"]', NULL, '2022-04-23 07:16:10', '2022-04-23 07:16:10'),
(68, 'App\\Models\\User', 1, 'auth_token', '412d47ab3b7622572dd285cd9bf2adb641802cb7ca8dbc6ab59ff4c5ecbc88b5', '[\"*\"]', NULL, '2022-04-23 07:16:57', '2022-04-23 07:16:57'),
(69, 'App\\Models\\User', 7, 'auth_token', '601eca27258ba85cec7976c8bc7d6df990ae44c681b0dc9ce20fb8a8d7d4c65b', '[\"*\"]', NULL, '2022-04-23 10:36:41', '2022-04-23 10:36:41'),
(70, 'App\\Models\\User', 7, 'auth_token', '2829ed0bfcab626721d18231731ed0ad3d4849dfa8b74e5d86fbc350564291ac', '[\"*\"]', NULL, '2022-04-23 10:45:10', '2022-04-23 10:45:10'),
(71, 'App\\Models\\User', 1, 'auth_token', '29b17b011a0a41f54e9ca491acc4ecaa04558da113ea6d1b840f3ee5344e23a1', '[\"*\"]', NULL, '2022-04-23 10:46:02', '2022-04-23 10:46:02'),
(72, 'App\\Models\\User', 1, 'auth_token', '531edadbd92056f13cf28b145ddb320538bdffe5d8b2464ed31accc30bdea65e', '[\"*\"]', NULL, '2022-04-24 11:18:58', '2022-04-24 11:18:58'),
(73, 'App\\Models\\User', 1, 'auth_token', '909252eaba50c5ee277d308adcf64a372c785c7f3705c644fe7ede94e3987478', '[\"*\"]', NULL, '2022-04-27 08:41:38', '2022-04-27 08:41:38'),
(74, 'App\\Models\\User', 1, 'auth_token', '953dd63840b0af910995daf3bb7d6cbcee0a60cc2fa94820c90967578ba55a5a', '[\"*\"]', NULL, '2022-04-27 11:55:56', '2022-04-27 11:55:56'),
(75, 'App\\Models\\User', 1, 'auth_token', '38264ed618254ab83885e2b44d9b1f0255afb78b105079206ab0505ad09b7d67', '[\"*\"]', NULL, '2022-04-29 11:24:20', '2022-04-29 11:24:20'),
(76, 'App\\Models\\User', 16, 'auth_token', 'de2eb404880c99878f7366e540a6e95493f6fce4d575c7e60cc790902a3368e9', '[\"*\"]', NULL, '2022-04-29 12:58:20', '2022-04-29 12:58:20'),
(77, 'App\\Models\\User', 1, 'auth_token', '169146797216b03c5d3434e666ab7417bce777260186c867946d2f8b37128f4a', '[\"*\"]', NULL, '2022-04-29 12:58:38', '2022-04-29 12:58:38'),
(78, 'App\\Models\\User', 1, 'auth_token', '1a122078d13fc8c909f80dbaffaa525e0a71f62aece273698c4af8cff9a350fa', '[\"*\"]', NULL, '2022-05-01 10:22:13', '2022-05-01 10:22:13'),
(79, 'App\\Models\\User', 1, 'auth_token', '359d13b800beb81839c071ebad841004a5ef50c79286ad716b87aa40123c4eea', '[\"*\"]', NULL, '2022-05-02 06:23:34', '2022-05-02 06:23:34'),
(80, 'App\\Models\\User', 1, 'auth_token', 'a0742b27c69049267872175287ec4a7a800b9f4938e2a37710d859a2ef7bcf9f', '[\"*\"]', NULL, '2022-05-02 13:09:26', '2022-05-02 13:09:26'),
(81, 'App\\Models\\User', 1, 'auth_token', '4eb004214c2049caffda3c130d91c232176d16b89e5e115e9908d694e98e6594', '[\"*\"]', NULL, '2022-05-14 10:59:06', '2022-05-14 10:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `crypto_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bought_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bought_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_wallet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `crypto_symbol`, `bought_for`, `bought_amount`, `used_wallet`, `created_at`, `updated_at`) VALUES
(1, 1, 'eth', '321', '0.11389', '5644444', '2022-05-01 14:23:16', '2022-05-01 14:23:16'),
(2, 1, 'eth', '312', '0.11087', '5644444', '2022-05-01 14:50:10', '2022-05-01 14:50:10'),
(3, 1, 'dai', '13', '12.98701', '5644444', '2022-05-01 14:52:39', '2022-05-01 14:52:39'),
(4, 1, 'eth', '13', '0.00463', '5644444', '2022-04-30 15:10:35', '2022-05-01 15:10:35'),
(5, 1, 'btc', '25', '0.00065', '5644444', '2022-05-01 15:10:40', '2022-05-01 15:10:40'),
(6, 1, 'wbtc', '14', '0.00036', '5644444', '2022-05-01 15:13:54', '2022-05-01 15:13:54'),
(7, 1, 'btc', '1000', '0.02602', '5644444', '2022-04-30 15:15:36', '2022-05-01 15:15:36'),
(9, 1, 'btc', '10000', '0.26022', '5644444', '2022-05-01 15:16:21', '2022-05-01 15:16:21'),
(10, 1, 'btc', '213', '0.00563', '5644444', '2022-05-01 16:33:36', '2022-05-01 16:33:36'),
(11, 1, 'steth', '412', '0.14919', '5644444', '2022-05-01 16:33:41', '2022-05-01 16:33:41'),
(12, 1, 'eth', '412', '0.14898', '5644444', '2022-05-01 16:33:46', '2022-05-01 16:33:46'),
(13, 1, 'btc', '45', '0.00115', '5644444', '2022-05-02 06:35:47', '2022-05-02 06:35:47'),
(14, 1, 'btc', '5000', '0.12930', '5644444', '2022-05-02 13:12:32', '2022-05-02 13:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2022-04-05 18:37:59', '2022-04-16 12:53:48'),
(3, 'Elder', 'elder', '2022-04-15 16:55:20', '2022-04-23 07:36:00'),
(5, 'User', 'user', '2022-04-24 13:38:24', '2022-04-24 13:38:24');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(6, 1),
(6, 3),
(7, 1),
(10, 1),
(10, 3),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
CREATE TABLE IF NOT EXISTS `sells` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `crypto_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_wallet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `user_id`, `crypto_symbol`, `sold_for`, `sold_amount`, `used_wallet`, `created_at`, `updated_at`) VALUES
(5, 1, 'doge', '1290.36600', '10000', '5644444', '2022-05-02 13:21:04', '2022-05-02 13:21:04'),
(4, 1, 'eth', '2807.94000', '1', '5644444', '2022-05-01 15:14:05', '2022-05-01 15:14:05'),
(3, 1, 'dai', '421.42100', '421', '5644444', '2022-05-01 14:52:17', '2022-05-01 14:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bought_price` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `symbol`, `image`, `bought_price`, `volume`, `created_at`, `updated_at`) VALUES
(4, 'Bitcoin', 'btc', 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579', 132, 115686, '2022-05-02 06:34:03', NULL),
(3, 'Wrapped Bitcoin', 'wbtc', 'https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744', 132, 38683, '2022-04-28 21:00:00', NULL),
(5, 'Ethereum', 'eth', 'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880', 50000, 5964, '2022-05-01 14:56:57', NULL),
(6, 'BNB', 'bnb', 'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850', 6, 9785, '2022-05-01 13:25:57', NULL),
(8, 'Dai', 'dai', 'https://assets.coingecko.com/coins/images/9956/large/4943.png?1636636734', 1000, 1408, '2022-05-01 15:07:36', NULL),
(9, 'Dogecoin', 'doge', 'https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256', 100000, 760260, '2022-05-01 14:58:42', NULL),
(10, 'Tether', 'usdt', 'https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707', 10000, 10122, '2022-05-01 14:57:03', NULL),
(11, 'Lido Staked Ether', 'steth', 'https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546', 12300, 346078, '2022-05-01 14:57:39', NULL),
(12, 'Cronos', 'cro', 'https://assets.coingecko.com/coins/images/7310/large/oCw2s3GI_400x400.jpeg?1645172042', 41221, 132081, '2022-05-01 15:09:10', NULL),
(13, 'Polygon', 'matic', 'https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912', 312, 346, '2022-05-01 14:52:25', NULL),
(14, 'ApeCoin', 'ape', 'https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455', 41, 2, '2022-05-01 15:33:42', NULL),
(15, 'The Sandbox', 'sand', 'https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942', 512, 240, '2022-05-01 15:04:53', NULL),
(16, 'Polkadot', 'dot', 'https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644', 4212, 274, '2022-05-01 15:08:49', NULL),
(17, 'FTX Token', 'ftt', 'https://assets.coingecko.com/coins/images/9026/large/F.png?1609051564', 42112, 1085, '2022-05-01 15:08:58', NULL),
(18, 'Binance USD', 'busd', 'https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766', 14, 14, '2022-05-01 15:13:20', NULL),
(19, 'Avalanche', 'avax', 'https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png?1604021818', 14, 834, '2022-05-01 15:13:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `postal_code`, `country_id`, `wallet`, `created_at`, `updated_at`) VALUES
(1, 'Ricardo_Milos', 'Marian', 'marianpoto@yahoo.com', NULL, '$2y$10$XVVSGc/OwMAwR/oQyhxONuhUY8.nl1txVprC.zl5Lr/JRTqDKSd0q', 765265837, 'Ileana Cosanzeana 15', 61133791, 247, '5644444', '2022-04-02 13:13:23', '2022-04-29 13:04:43'),
(7, 'Mu1', 'Ricardo', 'marianpoto1@yahoo.com', NULL, '$2y$10$qK4FYqQkZAhyUPSjhZcdluOYqSTGBMT43IjUGlrgw4Vzf.Vc8ugp.', 765265837, 'SAFafsafs', 21132132, 10, '1232123', '2022-04-23 06:43:18', '2022-04-23 10:41:24'),
(6, 'Radu', 'Radu', 'radu@andrei.com', NULL, '$2y$10$VYDUPIqZ8HmcwK2fmF4YmeTKF8YD4RP19HZczXavYYDmp1SS5Jb9S', NULL, NULL, NULL, NULL, NULL, '2022-04-16 09:01:29', '2022-05-02 13:10:25'),
(10, 'Toor', '1', 'wrwa@wdwdw.com', NULL, 'Praciwre4!', 765265837, 'e212', 1232, 19, '11', '2022-04-23 07:38:49', '2022-05-02 13:10:16'),
(11, 'Ceva', '3112', 'mariar@wwe.wdo', NULL, 'Praciwre4!', 765265837, 'awwwdaw', 13221, 19, '32112', '2022-04-23 07:39:23', '2022-04-24 16:55:09'),
(16, 'Ma', NULL, 'domar@ayahoo.com', NULL, '$2y$10$AYd9N/h38IKCo8YR3.3Yue8VjO7b6JcduGXJNeloGvz3t97LGkGYm', NULL, NULL, NULL, NULL, NULL, '2022-04-29 12:58:20', '2022-04-29 12:58:20'),
(13, 'Mari', '1312', 'mara123@gmail.com', NULL, 'Praciwre4!', NULL, NULL, NULL, NULL, NULL, '2022-04-23 07:43:00', '2022-04-23 07:43:00'),
(14, 'Ramadan', '1', 'asra@wew.com', NULL, 'Praciwre4!', NULL, NULL, NULL, NULL, NULL, '2022-04-23 07:43:26', '2022-04-24 17:27:31'),
(15, 'SE', '1', 'rwa@wedwdw.com', NULL, 'Praciwre4!', NULL, NULL, NULL, 19, NULL, '2022-04-23 11:48:27', '2022-04-23 11:48:27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

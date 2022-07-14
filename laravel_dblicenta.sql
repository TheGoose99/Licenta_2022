-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2022 at 04:32 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(28, '2022_03_30_174747_create_purchases_table', 3),
(32, '2022_06_17_150459_add_default_image_to_stocks_table', 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(81, 'App\\Models\\User', 1, 'auth_token', '4eb004214c2049caffda3c130d91c232176d16b89e5e115e9908d694e98e6594', '[\"*\"]', NULL, '2022-05-14 10:59:06', '2022-05-14 10:59:06'),
(82, 'App\\Models\\User', 1, 'auth_token', '4257445b1336c5dac1c59c959859a8ef682d4415ac653c90cf218266daf4e4bf', '[\"*\"]', NULL, '2022-05-21 08:55:51', '2022-05-21 08:55:51'),
(83, 'App\\Models\\User', 1, 'auth_token', 'a022745458aa1143a51acbc4dd5aaa0a499584769cbfed5def8b0810c22b0985', '[\"*\"]', NULL, '2022-05-21 12:04:22', '2022-05-21 12:04:22'),
(84, 'App\\Models\\User', 1, 'auth_token', '8dd3457bed25092ef70261c70b9fd420eddeaeaceada5b0010edd3d41d0a0019', '[\"*\"]', NULL, '2022-05-23 11:54:10', '2022-05-23 11:54:10'),
(85, 'App\\Models\\User', 1, 'auth_token', 'd72718523d249e3e0c7b5b6ce04f2c69e8f16e6a1073c8f1a361c27658f65788', '[\"*\"]', NULL, '2022-05-23 14:57:26', '2022-05-23 14:57:26'),
(86, 'App\\Models\\User', 1, 'auth_token', 'a141395339f58dd20c384de1a6abd75faa39830705054bfa98e61ceae3509b6f', '[\"*\"]', NULL, '2022-05-24 12:04:56', '2022-05-24 12:04:56'),
(87, 'App\\Models\\User', 1, 'auth_token', 'd6bb44495f2f295ddb85db0a5b0270d96ef1bbb37e116e01d426f67998adc3f1', '[\"*\"]', NULL, '2022-05-26 06:18:10', '2022-05-26 06:18:10'),
(88, 'App\\Models\\User', 1, 'auth_token', '200d37325f0cf306ed4e8b739cc7ad5e8ead8ebfbb261a95124ed9b5c7e4c090', '[\"*\"]', NULL, '2022-05-26 06:28:29', '2022-05-26 06:28:29'),
(89, 'App\\Models\\User', 6, 'auth_token', '1ddc3292753c0b68607309fa770b968fe44220ac59d25379d2c20bb6aa15d09a', '[\"*\"]', NULL, '2022-05-26 07:28:51', '2022-05-26 07:28:51'),
(90, 'App\\Models\\User', 6, 'auth_token', 'c8dc25c48c6868419284523d096e75217f1b7fbe973104b67392fb7189f68871', '[\"*\"]', NULL, '2022-05-26 07:39:48', '2022-05-26 07:39:48'),
(91, 'App\\Models\\User', 1, 'auth_token', '5d767ebef037cbe8ad3765e189a22ec96be597133f5b5323e7bb48500323b0e6', '[\"*\"]', NULL, '2022-05-26 07:40:49', '2022-05-26 07:40:49'),
(92, 'App\\Models\\User', 1, 'auth_token', 'c13be1ae50260dbb253a96926f51e4691311dc1f3081f3214b8eedb80b0dfc04', '[\"*\"]', NULL, '2022-05-27 13:00:43', '2022-05-27 13:00:43'),
(93, 'App\\Models\\User', 1, 'auth_token', '14772183996a968b3b6ef7e66a8e05ed4914ae09533daaa3dc754c7362ca26d2', '[\"*\"]', NULL, '2022-05-31 09:20:52', '2022-05-31 09:20:52'),
(94, 'App\\Models\\User', 1, 'auth_token', 'ccc82452c1a9536ce41a9268e8422c18eea435c6bd416d28469657fdcfcd867d', '[\"*\"]', NULL, '2022-06-15 07:32:13', '2022-06-15 07:32:13'),
(95, 'App\\Models\\User', 1, 'auth_token', 'f1e84c14dd209a0cddbb771a0743803c39d57b15981e51b6e89dec79cc24f659', '[\"*\"]', NULL, '2022-06-15 12:25:11', '2022-06-15 12:25:11'),
(96, 'App\\Models\\User', 1, 'auth_token', '2306a4855b0995f2873a6389a971b5eaaa3a17e1e94ff59d4f126e727ac74b7f', '[\"*\"]', NULL, '2022-06-17 11:12:41', '2022-06-17 11:12:41'),
(97, 'App\\Models\\User', 1, 'auth_token', '19e72f4f943695e5250e876af1aba053a901e01aa175ce299534bf2a19b7b705', '[\"*\"]', NULL, '2022-06-18 06:50:09', '2022-06-18 06:50:09'),
(98, 'App\\Models\\User', 1, 'auth_token', '5e8450ba8227672408f1997172540836260238eed62d57a99836c491ae4d51b6', '[\"*\"]', NULL, '2022-06-18 13:57:34', '2022-06-18 13:57:34'),
(99, 'App\\Models\\User', 1, 'auth_token', 'da4090f4b6a4d8689c0ba88cf097451522b225282ee452f8130f9a021e22e385', '[\"*\"]', NULL, '2022-06-18 13:58:29', '2022-06-18 13:58:29'),
(100, 'App\\Models\\User', 1, 'auth_token', '1917ccbb21804155cd36cd6185374551e8498729458df0bcdaaedd3b069e7ead', '[\"*\"]', NULL, '2022-06-18 13:59:51', '2022-06-18 13:59:51'),
(101, 'App\\Models\\User', 1, 'auth_token', '70edbee836e72d3d006395e933c43cb5f420567594eb7097e5df5466236263c1', '[\"*\"]', NULL, '2022-06-20 06:17:30', '2022-06-20 06:17:30'),
(102, 'App\\Models\\User', 1, 'auth_token', 'a7443f4a9c33cd1ecc4710306202030b7a06eccc3a49fa6591e2f1be466db9e0', '[\"*\"]', NULL, '2022-07-02 07:31:55', '2022-07-02 07:31:55'),
(103, 'App\\Models\\User', 1, 'auth_token', '717233245d637dbe4f889342bf846876e09579d8b6e31b5216ccb99d2036d5e4', '[\"*\"]', NULL, '2022-07-02 07:34:42', '2022-07-02 07:34:42'),
(104, 'App\\Models\\User', 1, 'auth_token', 'b9bd600b7a0cd83023e1a1acb864bd2086517ea72c0a76063640779b3d5c70dd', '[\"*\"]', NULL, '2022-07-02 07:52:46', '2022-07-02 07:52:46'),
(105, 'App\\Models\\User', 1, 'auth_token', '09398f93f91f4ba26220f87c98e9499cc55df94d31e909871028579956e7818e', '[\"*\"]', NULL, '2022-07-04 07:06:21', '2022-07-04 07:06:21'),
(106, 'App\\Models\\User', 1, 'auth_token', '2ab7f79aac10acaa9e9e50aa6e63a19aa21ea11102b4a22238253b1d9cdf982f', '[\"*\"]', NULL, '2022-07-10 07:40:56', '2022-07-10 07:40:56'),
(107, 'App\\Models\\User', 1, 'auth_token', 'cf7216d2af39dd8bc84ec9a4217c983a115c02446a0e2991a2a30ce02cd0ffca', '[\"*\"]', NULL, '2022-07-10 07:43:24', '2022-07-10 07:43:24'),
(108, 'App\\Models\\User', 7, 'auth_token', '8d00ac756e883752b2123bd97c8f02ef7ff01be9c66125ce7b5b662d656e9c75', '[\"*\"]', NULL, '2022-07-10 07:50:10', '2022-07-10 07:50:10'),
(109, 'App\\Models\\User', 1, 'auth_token', '96ba4261526aa94678d91fba75bf870a51397952e18ac6de1a6128fec9ab64bd', '[\"*\"]', NULL, '2022-07-10 07:50:50', '2022-07-10 07:50:50'),
(110, 'App\\Models\\User', 1, 'auth_token', '3716a73b4fa1753e713f8ceda5f697afc817b7430818887237acc81d0e12deca', '[\"*\"]', NULL, '2022-07-10 07:51:54', '2022-07-10 07:51:54'),
(111, 'App\\Models\\User', 17, 'auth_token', '934079ae141766d0f70b0e9f3a93281613b1ec3bc6786aac78e9d2ce10547ea0', '[\"*\"]', NULL, '2022-07-10 08:01:45', '2022-07-10 08:01:45'),
(112, 'App\\Models\\User', 1, 'auth_token', '5da2dae6aa440fc4e6e6a2f2d15db40a335cb69545b4843b15a9cb3cb6859e65', '[\"*\"]', NULL, '2022-07-10 08:02:57', '2022-07-10 08:02:57'),
(113, 'App\\Models\\User', 1, 'auth_token', '6dbcd0691c6c4efa1dc3138a9372ef6679833cd616cbfcc3fa7529bcfbc216f0', '[\"*\"]', NULL, '2022-07-12 10:46:19', '2022-07-12 10:46:19'),
(114, 'App\\Models\\User', 1, 'auth_token', '115cc9df79d0f1bcc5a34d51ce9d60d18ce582aa087f84f1b19329b2136bd4a6', '[\"*\"]', NULL, '2022-07-13 11:56:46', '2022-07-13 11:56:46'),
(115, 'App\\Models\\User', 20, 'auth_token', '76af96dfe27c847e54d6c27b739351af5bfc62c13c5964f2783ee823b9785ef5', '[\"*\"]', NULL, '2022-07-13 11:58:40', '2022-07-13 11:58:40'),
(116, 'App\\Models\\User', 20, 'auth_token', '18bcea6e7abd647b0acf20469c0f3fd510d1fa9fb93631f0324ba2695790a27b', '[\"*\"]', NULL, '2022-07-13 11:58:51', '2022-07-13 11:58:51'),
(117, 'App\\Models\\User', 1, 'auth_token', '13f530387ffdb5446c92593318be5e915a13ed1083864fe219df92d0abf10059', '[\"*\"]', NULL, '2022-07-13 12:01:56', '2022-07-13 12:01:56'),
(118, 'App\\Models\\User', 1, 'auth_token', '551ce5510c84553a758b920263493b136686c628fa4c0e5b3681b52611e74c4a', '[\"*\"]', NULL, '2022-07-13 12:05:36', '2022-07-13 12:05:36'),
(119, 'App\\Models\\User', 20, 'auth_token', '187b7634e22e3f976cbcc95c21ad13163ac9ac918460e34306a7375c8e7429d6', '[\"*\"]', NULL, '2022-07-13 12:08:48', '2022-07-13 12:08:48'),
(120, 'App\\Models\\User', 21, 'auth_token', '2b1cf963e9421afbcb35d50cb03e90d9a34be83fa350c8eff7f958a1ba385496', '[\"*\"]', NULL, '2022-07-13 12:11:16', '2022-07-13 12:11:16'),
(121, 'App\\Models\\User', 21, 'auth_token', '0ad751cda2bf4a7a11edf56fe4f5c42e457c381837dda7ea909b7cf7a74bd0d4', '[\"*\"]', NULL, '2022-07-13 12:11:22', '2022-07-13 12:11:22'),
(122, 'App\\Models\\User', 22, 'auth_token', '68cb6f92ddb687cb2be893db5a0e0678666910a3706ae6fe70b307dc6c2408a4', '[\"*\"]', NULL, '2022-07-13 12:16:21', '2022-07-13 12:16:21'),
(123, 'App\\Models\\User', 23, 'auth_token', '54203e9311389b9a9b8ecf9a7947b4cd0faac7147203dcd1c68553d9d7f24903', '[\"*\"]', NULL, '2022-07-13 12:16:45', '2022-07-13 12:16:45'),
(124, 'App\\Models\\User', 23, 'auth_token', 'f27bf9df6ee343bc19ebc0224eea6653e8e93f140eeaf9052600a4638989d032', '[\"*\"]', NULL, '2022-07-13 12:17:04', '2022-07-13 12:17:04'),
(125, 'App\\Models\\User', 1, 'auth_token', 'cb54fdc1637083d06083466710560e07ee43933f5076f7973e7ed152cc2b17f9', '[\"*\"]', NULL, '2022-07-13 12:20:06', '2022-07-13 12:20:06');

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
  `purchase_code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `crypto_symbol`, `bought_for`, `bought_amount`, `used_wallet`, `created_at`, `updated_at`, `purchase_code`) VALUES
(24, 1, 'vet', '15', '667.58794', '622245533', '2022-06-15 14:13:47', '2022-06-15 14:13:47', 'i4u0w8'),
(23, 1, 'vet', '12', '534.07035', '622245533', '2022-06-15 14:12:14', '2022-06-15 14:12:14', 'd5o5c4'),
(22, 1, 'xec', '12', '337552.74262', '622245533', '2022-06-15 14:09:55', '2022-06-15 14:09:55', 'b8l2d4'),
(21, 1, 'hot', '12', '6124.82391', '622245533', '2022-06-15 14:06:37', '2022-06-15 14:06:37', 'q0f6r3'),
(20, 1, 'grt', '124', '1274.89384', '622245533', '2022-06-15 14:04:58', '2022-06-15 14:04:58', 'a0c7b6'),
(19, 1, 'atom', '12', '1.87500', '622245533', '2022-06-15 14:03:28', '2022-06-15 14:03:28', 'l0s6x1'),
(18, 6, 'usdt', '12', '12', '21122', '2022-05-26 07:40:39', '2022-05-26 07:40:39', 'f9d2l0'),
(15, 1, 'dai', '10', '9.97009', '5644444', '2022-05-21 08:55:59', '2022-05-21 08:55:59', '1259'),
(16, 1, 'eth', '12', '166.51634', '5644444', '2022-05-21 08:56:23', '2022-05-21 08:56:23', '8709'),
(17, 1, 'btc', '10', '0.00034', '5644444', '2022-05-21 12:05:22', '2022-05-21 12:05:22', 'r3p1a2'),
(25, 1, 'vet', '500', '22457.41625', '622245533', '2022-06-15 14:15:02', '2022-06-15 14:15:02', 'c5b3u1'),
(26, 1, 'tfuel', '42', '1041.23798', '622245533', '2022-06-15 14:23:50', '2022-06-15 14:23:50', 'i5b9r2'),
(27, 1, 'tfuel', '10000', '247913.80533', '622245533', '2022-06-15 14:24:32', '2022-06-15 14:24:32', 'v1k5y2'),
(28, 1, 'leo', '50000', '10090.36145', '622245533', '2022-06-15 14:25:59', '2022-06-15 14:25:59', 'm9q1v7'),
(29, 1, 'btc', '1242', '0.05961', '622245533', '2022-06-15 14:29:01', '2022-06-15 14:29:01', 'x5q9w3'),
(30, 1, 'leo', '50000', '10110.66398', '622245533', '2022-06-15 14:29:20', '2022-06-15 14:29:20', 's0v1y3'),
(31, 1, 'flow', '100', '68.49315', '622245533', '2022-06-15 14:30:26', '2022-06-15 14:30:26', 'n0v7c3'),
(32, 1, 'avax', '15', '0.98103', '622245533', '2022-06-18 07:39:55', '2022-06-18 07:39:55', 'g6d8u4'),
(33, 1, 'eth', '100', '0.09912', '622245533', '2022-06-18 07:41:40', '2022-06-18 07:41:40', 'j3n2f7'),
(34, 1, 'tusd', '2212', '2217.20155', '622245533', '2022-06-20 06:21:26', '2022-06-20 06:21:26', 'o1j8p4'),
(35, 1, 'ltc', '150', '2.96384', '622245533', '2022-07-04 07:06:53', '2022-07-04 07:06:53', 'y6u4p5'),
(36, 1, 'avax', '12', '0.62080', '622245533', '2022-07-10 07:41:06', '2022-07-10 07:41:06', 'o7h4f8'),
(37, 1, 'dot', '50', '7.10227', '4143225332', '2022-07-10 08:08:31', '2022-07-10 08:08:31', 't1l3s4'),
(38, 1, 'flow', '100', '59.88024', '4143225332', '2022-07-10 08:09:10', '2022-07-10 08:09:10', 'x8l4i4'),
(39, 1, 'link', '123', '20.60302', '4143225332', '2022-07-13 11:57:04', '2022-07-13 11:57:04', 'j2k4w2'),
(40, 20, 'leo', '123', '22.69373', '132', '2022-07-13 11:59:52', '2022-07-13 11:59:52', 'k6h3i1'),
(41, 20, 'xlm', '125', '1223.04411', '132', '2022-07-13 12:00:27', '2022-07-13 12:00:27', 's1j0h1'),
(42, 1, 'cro', '123', '1098.07703', '4143225332', '2022-07-13 12:05:17', '2022-07-13 12:05:17', 'r5j5n9'),
(43, 21, 'mana', '4000', '5048.70103', '746464', '2022-07-13 12:12:56', '2022-07-13 12:12:56', 'v9e7j4'),
(44, 23, 'ltc', '4500', '93.73047', '4211422', '2022-07-13 12:18:05', '2022-07-13 12:18:05', 't6s6b1'),
(45, 23, 'xlm', '1230', '11975.58150', '4211422', '2022-07-13 12:18:13', '2022-07-13 12:18:13', 'd4u7y7'),
(46, 23, 'xlm', '1230', '11975.58150', '4211422', '2022-07-13 12:18:14', '2022-07-13 12:18:14', 'g7w5v1'),
(47, 23, 'btc', '100', '0.00510', '4211422', '2022-07-13 12:18:20', '2022-07-13 12:18:20', 'e7r8j2'),
(48, 23, 'usdt', '4500', '4501.77370', '4211422', '2022-07-13 12:18:54', '2022-07-13 12:18:54', 'o1m9u9');

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
(7, 1),
(10, 1),
(11, 1),
(13, 3),
(14, 3),
(20, 1),
(23, 3);

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
  `sell_code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `user_id`, `crypto_symbol`, `sold_for`, `sold_amount`, `used_wallet`, `created_at`, `updated_at`, `sell_code`) VALUES
(6, 1, 'wbtc', '351768', '12', '5644444', '2022-05-21 08:59:05', '2022-05-21 08:59:05', '9998'),
(7, 1, 'trx', '0.86478', '12', '5644444', '2022-05-21 08:59:38', '2022-05-21 08:59:38', '7904'),
(8, 1, 'btc', '353556', '12', '5644444', '2022-05-21 12:09:41', '2022-05-21 12:09:41', 's1e8j2'),
(9, 1, 'cro', '4.34192', '23', '5644444', '2022-05-21 12:09:52', '2022-05-21 12:09:52', 'v4j8i0'),
(10, 1, 'link', '7.05000', '1', '5644444', '2022-05-21 12:10:47', '2022-05-21 12:10:47', 'v7k4f8'),
(11, 1, 'cake', '54.84000', '12', '5644444', '2022-05-21 12:11:26', '2022-05-21 12:11:26', 'x0k9r9'),
(12, 1, 'axs', '2570.70000', '123', '5644444', '2022-05-21 12:14:07', '2022-05-21 12:14:07', 'u3v3a2'),
(13, 1, 'Ethereum Classic', '13.70000', '1', '622245533', '2022-06-18 07:40:12', '2022-06-18 07:40:12', 'g3b1i4'),
(14, 20, 'Dai', '2002', '2000', '132', '2022-07-13 12:00:57', '2022-07-13 12:00:57', 'e0r7v4'),
(15, 1, 'Cronos', '13.77920', '123', '4143225332', '2022-07-13 12:08:24', '2022-07-13 12:08:24', 'k4t1j9'),
(17, 20, 'Cronos', '13.79445', '123', '132', '2022-07-13 12:08:55', '2022-07-13 12:08:55', 'x7q9f4'),
(18, 21, 'Stellar', '51.25800', '500', '746464', '2022-07-13 12:13:05', '2022-07-13 12:13:05', 'g9j5f3'),
(19, 23, 'Lido Staked Ether', '123176.40000', '120', '4211422', '2022-07-13 12:18:28', '2022-07-13 12:18:28', 'a5b2s2'),
(20, 23, 'Ethereum', '37383.85000', '35', '4211422', '2022-07-13 12:18:35', '2022-07-13 12:18:35', 'q2n8e9'),
(21, 23, 'Ethereum', '320433', '300', '4211422', '2022-07-13 12:18:45', '2022-07-13 12:18:45', 'p3c1l5');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cryptos/default-image.jpg',
  `bought_price` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `symbol`, `image`, `bought_price`, `volume`, `created_at`, `updated_at`) VALUES
(4, 'Bitcoin', 'btc', 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579', 132, 115698, '2022-05-02 06:34:03', NULL),
(3, 'Wrapped Bitcoin', 'wbtc', 'https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744', 132, 38695, '2022-04-28 21:00:00', NULL),
(5, 'Ethereum', 'eth', 'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880', 50000, 5797, '2022-05-01 14:56:57', NULL),
(6, 'BNB', 'bnb', 'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850', 6, 9785, '2022-05-01 13:25:57', NULL),
(8, 'Dai', 'dai', 'https://assets.coingecko.com/coins/images/9956/large/4943.png?1636636734', 1000, 3398, '2022-05-01 15:07:36', NULL),
(43, 'Stellar', 'xlm', 'https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157', 24000, 209718, '2022-07-13 12:20:43', NULL),
(10, 'Tether', 'usdt', 'https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707', 10000, 5608, '2022-05-01 14:57:03', NULL),
(11, 'Lido Staked Ether', 'steth', 'https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546', 12300, 346078, '2022-05-01 14:57:39', NULL),
(12, 'Cronos', 'cro', 'https://assets.coingecko.com/coins/images/7310/large/oCw2s3GI_400x400.jpeg?1645172042', 41221, 131006, '2022-05-01 15:09:10', NULL),
(13, 'Polygon', 'matic', 'https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912', 312, 346, '2022-05-01 14:52:25', NULL),
(14, 'ApeCoin', 'ape', 'https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455', 41, 2, '2022-05-01 15:33:42', NULL),
(15, 'The Sandbox', 'sand', 'https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942', 512, 240, '2022-05-01 15:04:53', NULL),
(16, 'Polkadot', 'dot', 'https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644', 4212, 267, '2022-05-01 15:08:49', NULL),
(17, 'FTX Token', 'ftt', 'https://assets.coingecko.com/coins/images/9026/large/F.png?1609051564', 42112, 1085, '2022-05-01 15:08:58', NULL),
(18, 'Binance USD', 'busd', 'https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766', 14, 14, '2022-05-01 15:13:20', NULL),
(19, 'Avalanche', 'avax', 'https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png?1604021818', 14, 832, '2022-05-01 15:13:33', NULL),
(20, 'TRON', 'trx', 'https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066', 12, 13, '2022-05-21 08:59:16', NULL),
(21, 'Shiba Inu', 'shib', 'https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446', 1, 91491, '2022-05-26 06:18:32', NULL),
(22, 'Algorand', 'algo', 'https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725', 32, 14, '2022-05-21 12:09:19', NULL),
(23, 'Chainlink', 'link', 'https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700', 12, 65, '2022-05-21 12:10:31', NULL),
(24, 'PancakeSwap', 'cake', 'https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065', 12, 67, '2022-05-21 12:11:05', NULL),
(25, 'Axie Infinity', 'axs', 'https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082', 123, 2694, '2022-05-21 12:14:07', NULL),
(26, 'Radix', 'xrd', 'https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658', 1, 17, '2022-06-15 13:43:02', NULL),
(27, 'NEM', 'xem', 'https://assets.coingecko.com/coins/images/242/large/NEM_WC_Logo_200px.png?1642668663', 1, 26, '2022-06-15 13:43:27', NULL),
(28, 'IOTA', 'miota', 'https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557', 10, 40, '2022-06-15 14:01:09', NULL),
(29, 'Aave', 'aave', 'https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110', 12, 0, '2022-06-15 14:01:53', NULL),
(30, 'Cosmos Hub', 'atom', 'https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960', 12, 2, '2022-06-15 14:03:28', NULL),
(31, 'The Graph', 'grt', 'https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566', 1275, 1275, '2022-06-15 14:04:58', NULL),
(32, 'Decred', 'dcr', 'https://assets.coingecko.com/coins/images/329/large/decred.png?1547034093', 12, 0, '2022-06-15 14:06:14', NULL),
(33, 'STEPN', 'gmt', 'https://assets.coingecko.com/coins/images/23597/large/gmt.png?1644658792', 12, 0, '2022-06-15 14:06:30', NULL),
(34, 'Holo', 'hot', 'https://assets.coingecko.com/coins/images/3348/large/Holologo_Profile.png?1547037966', 12, 6125, '2022-06-15 14:06:37', NULL),
(35, 'eCash', 'xec', 'https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446', 12, 337553, '2022-06-15 14:09:17', NULL),
(36, 'VeChain', 'vet', 'https://assets.coingecko.com/coins/images/1167/large/VeChain-Logo-768x725.png?1547035194', 12, 534, '2022-06-15 14:10:54', NULL),
(37, 'Theta Fuel', 'tfuel', 'https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622', 42, 1041, '2022-06-15 14:21:26', NULL),
(38, 'LEO Token', 'leo', 'https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215', 400, 60, '2022-07-13 12:20:28', NULL),
(39, 'Flow', 'flow', 'https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776', 100, 0, '2022-06-15 14:30:26', NULL),
(40, 'Ethereum Classic', 'Ethereum Classic', 'https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169', 1, 15, '2022-06-18 07:40:12', NULL),
(41, 'TrueUSD', 'tusd', 'https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665', 2212, 0, '2022-06-20 06:21:26', NULL),
(42, 'Litecoin', 'ltc', 'https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580', 100, 880, '2022-07-13 12:21:03', NULL),
(44, 'Decentraland', 'mana', 'https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745', 4000, 0, '2022-07-13 12:12:56', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `postal_code`, `country_id`, `wallet`, `created_at`, `updated_at`) VALUES
(1, 'The_Goose99', 'TestName', 'test@test.com', NULL, '$2y$10$SH7iR3T8UNGnFKZiuWSxZ.UwWrN22paMfm5Akq82cFNTk0EdMdn4q', 728123815, 'Bucuresti, str. 32, Ap. 12, Sc. A', 43412643, 247, '4143225332', '2022-04-02 13:13:23', '2022-07-10 08:05:06'),
(23, 'TestNumber4', 'Daniel', 'marianpoto@yahoo.com', NULL, '$2y$10$GBGwyjUhd.aDCI.JN/GGYuqdUuWsVTCVcFUs40Az2L/8XLhyojeLe', 132471934, 'Str. Biruintei nr 74 Sc. B', 123123, 152, '4211422', '2022-07-13 12:16:45', '2022-07-13 12:29:12'),
(20, 'Test123', 'Test', 'test@yahoo.com', NULL, '$2y$10$wpA/inHC.Q6WZVptN7UzUuSiyOr/DqiqdeXdpoC7TKF8b7NIBt4E2', 765265837, 'Str. Hunedoara', 613779, 184, '132', '2022-07-13 11:58:40', '2022-07-13 12:22:29'),
(21, 'TestNumber2', 'TestName', 'gamingro99@yahoo.com', NULL, '$2y$10$MpatE.Y1fQs1M7e7vJHMs.FmfJ9iNbg3IRgTogmqSx6oAFnbuUR1G', 432148315, 'Str. Dummy Data', 665837, 163, '746464', '2022-07-13 12:11:16', '2022-07-13 12:12:44'),
(22, 'TestNumber3', NULL, 'gamingro991@yahoo.com', NULL, '$2y$10$hXXAKP6DMvLroDnrcth1keIcJaOXx9hslnhwJxvW6qgber4NSwHL2', NULL, NULL, NULL, NULL, NULL, '2022-07-13 12:16:21', '2022-07-13 12:16:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

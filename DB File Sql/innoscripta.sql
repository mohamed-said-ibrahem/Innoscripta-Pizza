SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Innoscripta`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'Neapolitan Pizza', 'Neapolitan Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(2, 0, 'Chicago Pizza', 'Chicago Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(3, 0, 'New York-Style Pizza', 'New York-Style Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(4, 0, 'Sicilian Pizza', 'Sicilian Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(5, 0, 'Greek Pizza', 'Greek Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(6, 0, 'California Pizza', 'California Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(7, 0, 'Local Pizza', 'Local Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(8, 1, 'Marinara', 'Marinara', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(9, 1, 'Margherita', 'Margherita', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(10, 1, 'Margherita extra', 'Margherita extra', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(11, 2, 'Traditional Toppings', 'Traditional Toppings', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(12, 2, 'Baking Suggestions', 'Baking Suggestions', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(13, 4, 'Traditional Toppings 2', 'Traditional Toppings', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(14, 4, 'Baking Suggestions 2', 'Baking Suggestions', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(15, 7, 'St. Louis Pizza', 'St. Louis Pizza', 1, NULL, '2019-11-15 20:08:08', '2019-11-15 20:08:08');


-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(2, 'AL', 'Albania', NULL, NULL),
(3, 'DZ', 'Algeria', NULL, NULL),
(4, 'DS', 'American Samoa', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', NULL, NULL),
(10, 'AR', 'Argentina', NULL, NULL),
(11, 'AM', 'Armenia', NULL, NULL),
(12, 'AW', 'Aruba', NULL, NULL),
(13, 'AU', 'Australia', NULL, NULL),
(14, 'AT', 'Austria', NULL, NULL),
(15, 'AZ', 'Azerbaijan', NULL, NULL),
(16, 'BS', 'Bahamas', NULL, NULL),
(17, 'BH', 'Bahrain', NULL, NULL),
(18, 'BD', 'Bangladesh', NULL, NULL),
(19, 'BB', 'Barbados', NULL, NULL),
(20, 'BY', 'Belarus', NULL, NULL),
(21, 'BE', 'Belgium', NULL, NULL),
(22, 'BZ', 'Belize', NULL, NULL),
(23, 'BJ', 'Benin', NULL, NULL),
(24, 'BM', 'Bermuda', NULL, NULL),
(25, 'BT', 'Bhutan', NULL, NULL),
(26, 'BO', 'Bolivia', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(28, 'BW', 'Botswana', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', NULL, NULL),
(33, 'BG', 'Bulgaria', NULL, NULL),
(34, 'BF', 'Burkina Faso', NULL, NULL),
(35, 'BI', 'Burundi', NULL, NULL),
(36, 'KH', 'Cambodia', NULL, NULL),
(37, 'CM', 'Cameroon', NULL, NULL),
(38, 'CA', 'Canada', NULL, NULL),
(39, 'CV', 'Cape Verde', NULL, NULL),
(40, 'KY', 'Cayman Islands', NULL, NULL),
(41, 'CF', 'Central African Republic', NULL, NULL),
(42, 'TD', 'Chad', NULL, NULL),
(43, 'CL', 'Chile', NULL, NULL),
(44, 'CN', 'China', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', NULL, NULL),
(48, 'KM', 'Comoros', NULL, NULL),
(49, 'CG', 'Congo', NULL, NULL),
(50, 'CK', 'Cook Islands', NULL, NULL),
(51, 'CR', 'Costa Rica', NULL, NULL),
(52, 'AF', 'Afghanistan', NULL, NULL),
(53, 'AL', 'Albania', NULL, NULL),
(54, 'DZ', 'Algeria', NULL, NULL),
(55, 'DS', 'American Samoa', NULL, NULL),
(56, 'AD', 'Andorra', NULL, NULL),
(57, 'AO', 'Angola', NULL, NULL),
(58, 'AI', 'Anguilla', NULL, NULL),
(59, 'AQ', 'Antarctica', NULL, NULL),
(60, 'AG', 'Antigua and Barbuda', NULL, NULL),
(61, 'AR', 'Argentina', NULL, NULL),
(62, 'AM', 'Armenia', NULL, NULL),
(63, 'AW', 'Aruba', NULL, NULL),
(64, 'AU', 'Australia', NULL, NULL),
(65, 'AT', 'Austria', NULL, NULL),
(66, 'AZ', 'Azerbaijan', NULL, NULL),
(67, 'BS', 'Bahamas', NULL, NULL),
(68, 'BH', 'Bahrain', NULL, NULL),
(69, 'BD', 'Bangladesh', NULL, NULL),
(70, 'BB', 'Barbados', NULL, NULL),
(71, 'BY', 'Belarus', NULL, NULL),
(72, 'BE', 'Belgium', NULL, NULL),
(73, 'BZ', 'Belize', NULL, NULL),
(74, 'BJ', 'Benin', NULL, NULL),
(75, 'BM', 'Bermuda', NULL, NULL),
(76, 'BT', 'Bhutan', NULL, NULL),
(77, 'BO', 'Bolivia', NULL, NULL),
(78, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(79, 'BW', 'Botswana', NULL, NULL),
(80, 'BV', 'Bouvet Island', NULL, NULL),
(81, 'BR', 'Brazil', NULL, NULL),
(82, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(83, 'BN', 'Brunei Darussalam', NULL, NULL),
(84, 'BG', 'Bulgaria', NULL, NULL),
(85, 'BF', 'Burkina Faso', NULL, NULL),
(86, 'BI', 'Burundi', NULL, NULL),
(87, 'KH', 'Cambodia', NULL, NULL),
(88, 'CM', 'Cameroon', NULL, NULL),
(89, 'CA', 'Canada', NULL, NULL),
(90, 'CV', 'Cape Verde', NULL, NULL),
(91, 'KY', 'Cayman Islands', NULL, NULL),
(92, 'CF', 'Central African Republic', NULL, NULL),
(93, 'TD', 'Chad', NULL, NULL),
(94, 'CL', 'Chile', NULL, NULL),
(95, 'CN', 'China', NULL, NULL),
(96, 'CX', 'Christmas Island', NULL, NULL),
(97, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(98, 'CO', 'Colombia', NULL, NULL),
(99, 'KM', 'Comoros', NULL, NULL),
(100, 'CG', 'Congo', NULL, NULL),
(101, 'CK', 'Cook Islands', NULL, NULL),
(102, 'CR', 'Costa Rica', NULL, NULL),
(103, 'HR', 'Croatia (Hrvatska)', NULL, NULL),
(104, 'CU', 'Cuba', NULL, NULL),
(105, 'CY', 'Cyprus', NULL, NULL),
(106, 'CZ', 'Czech Republic', NULL, NULL),
(107, 'DK', 'Denmark', NULL, NULL),
(108, 'DJ', 'Djibouti', NULL, NULL),
(109, 'DM', 'Dominica', NULL, NULL),
(110, 'DO', 'Dominican Republic', NULL, NULL),
(111, 'TP', 'East Timor', NULL, NULL),
(112, 'EC', 'Ecuador', NULL, NULL),
(113, 'EG', 'Egypt', NULL, NULL),
(114, 'SV', 'El Salvador', NULL, NULL),
(115, 'GQ', 'Equatorial Guinea', NULL, NULL),
(116, 'ER', 'Eritrea', NULL, NULL),
(117, 'EE', 'Estonia', NULL, NULL),
(118, 'ET', 'Ethiopia', NULL, NULL),
(119, 'FK', 'Falkland Islands (Malvinas)', NULL, NULL),
(120, 'FO', 'Faroe Islands', NULL, NULL),
(121, 'FJ', 'Fiji', NULL, NULL),
(122, 'FI', 'Finland', NULL, NULL),
(123, 'FR', 'France', NULL, NULL),
(124, 'FX', 'France, Metropolitan', NULL, NULL),
(125, 'GF', 'French Guiana', NULL, NULL),
(126, 'PF', 'French Polynesia', NULL, NULL),
(127, 'TF', 'French Southern Territories', NULL, NULL),
(128, 'GA', 'Gabon', NULL, NULL),
(129, 'GM', 'Gambia', NULL, NULL),
(130, 'GE', 'Georgia', NULL, NULL),
(131, 'DE', 'Germany', NULL, NULL),
(132, 'GH', 'Ghana', NULL, NULL),
(133, 'GI', 'Gibraltar', NULL, NULL),
(134, 'GK', 'Guernsey', NULL, NULL),
(135, 'GR', 'Greece', NULL, NULL),
(136, 'GL', 'Greenland', NULL, NULL),
(137, 'GD', 'Grenada', NULL, NULL),
(138, 'GP', 'Guadeloupe', NULL, NULL),
(139, 'GU', 'Guam', NULL, NULL),
(140, 'GT', 'Guatemala', NULL, NULL),
(141, 'GN', 'Guinea', NULL, NULL),
(142, 'GW', 'Guinea-Bissau', NULL, NULL),
(143, 'GY', 'Guyana', NULL, NULL),
(144, 'HT', 'Haiti', NULL, NULL),
(145, 'HM', 'Heard and Mc Donald Islands', NULL, NULL),
(146, 'HN', 'Honduras', NULL, NULL),
(147, 'HK', 'Hong Kong', NULL, NULL),
(148, 'HU', 'Hungary', NULL, NULL),
(149, 'IS', 'Iceland', NULL, NULL),
(150, 'IN', 'India', NULL, NULL),
(151, 'IM', 'Isle of Man', NULL, NULL),
(152, 'ID', 'Indonesia', NULL, NULL),
(153, 'IR', 'Iran (Islamic Republic of)', NULL, NULL),
(154, 'IQ', 'Iraq', NULL, NULL),
(155, 'IE', 'Ireland', NULL, NULL),
(156, 'IL', 'Israel', NULL, NULL),
(157, 'IT', 'Italy', NULL, NULL),
(158, 'CI', 'Ivory Coast', NULL, NULL),
(159, 'JE', 'Jersey', NULL, NULL),
(160, 'JM', 'Jamaica', NULL, NULL),
(161, 'JP', 'Japan', NULL, NULL),
(162, 'JO', 'Jordan', NULL, NULL),
(163, 'KZ', 'Kazakhstan', NULL, NULL),
(164, 'KE', 'Kenya', NULL, NULL),
(165, 'KI', 'Kiribati', NULL, NULL),
(166, 'KP', 'Korea, Democratic Peoples Republic of', NULL, NULL),
(167, 'KR', 'Korea, Republic of', NULL, NULL),
(168, 'XK', 'Kosovo', NULL, NULL),
(169, 'KW', 'Kuwait', NULL, NULL),
(170, 'KG', 'Kyrgyzstan', NULL, NULL),
(171, 'LA', 'Lao Peoples Democratic Republic', NULL, NULL),
(172, 'LV', 'Latvia', NULL, NULL),
(173, 'LB', 'Lebanon', NULL, NULL),
(174, 'LS', 'Lesotho', NULL, NULL),
(175, 'LR', 'Liberia', NULL, NULL),
(176, 'LY', 'Libyan Arab Jamahiriya', NULL, NULL),
(177, 'LI', 'Liechtenstein', NULL, NULL),
(178, 'LT', 'Lithuania', NULL, NULL),
(179, 'LU', 'Luxembourg', NULL, NULL),
(180, 'MO', 'Macau', NULL, NULL),
(181, 'MK', 'Macedonia', NULL, NULL),
(182, 'MG', 'Madagascar', NULL, NULL),
(183, 'MW', 'Malawi', NULL, NULL),
(184, 'MY', 'Malaysia', NULL, NULL),
(185, 'MV', 'Maldives', NULL, NULL),
(186, 'ML', 'Mali', NULL, NULL),
(187, 'MT', 'Malta', NULL, NULL),
(188, 'MH', 'Marshall Islands', NULL, NULL),
(189, 'MQ', 'Martinique', NULL, NULL),
(190, 'MR', 'Mauritania', NULL, NULL),
(191, 'MU', 'Mauritius', NULL, NULL),
(192, 'TY', 'Mayotte', NULL, NULL),
(193, 'MX', 'Mexico', NULL, NULL),
(194, 'FM', 'Micronesia, Federated States of', NULL, NULL),
(195, 'MD', 'Moldova, Republic of', NULL, NULL),
(196, 'MC', 'Monaco', NULL, NULL),
(197, 'MN', 'Mongolia', NULL, NULL),
(198, 'ME', 'Montenegro', NULL, NULL),
(199, 'MS', 'Montserrat', NULL, NULL),
(200, 'MA', 'Morocco', NULL, NULL),
(201, 'MZ', 'Mozambique', NULL, NULL),
(202, 'MM', 'Myanmar', NULL, NULL),
(203, 'NA', 'Namibia', NULL, NULL),
(204, 'NR', 'Nauru', NULL, NULL),
(205, 'NP', 'Nepal', NULL, NULL),
(206, 'NL', 'Netherlands', NULL, NULL),
(207, 'AN', 'Netherlands Antilles', NULL, NULL),
(208, 'NC', 'New Caledonia', NULL, NULL),
(209, 'NZ', 'New Zealand', NULL, NULL),
(210, 'NI', 'Nicaragua', NULL, NULL),
(211, 'NE', 'Niger', NULL, NULL),
(212, 'NG', 'Nigeria', NULL, NULL),
(213, 'NU', 'Niue', NULL, NULL),
(214, 'NF', 'Norfolk Island', NULL, NULL),
(215, 'MP', 'Northern Mariana Islands', NULL, NULL),
(216, 'NO', 'Norway', NULL, NULL),
(217, 'OM', 'Oman', NULL, NULL),
(218, 'PK', 'Pakistan', NULL, NULL),
(219, 'PW', 'Palau', NULL, NULL),
(220, 'PS', 'Palestine', NULL, NULL),
(221, 'PA', 'Panama', NULL, NULL),
(222, 'PG', 'Papua New Guinea', NULL, NULL),
(223, 'PY', 'Paraguay', NULL, NULL),
(224, 'PE', 'Peru', NULL, NULL),
(225, 'PH', 'Philippines', NULL, NULL),
(226, 'PN', 'Pitcairn', NULL, NULL),
(227, 'PL', 'Poland', NULL, NULL),
(228, 'PT', 'Portugal', NULL, NULL),
(229, 'PR', 'Puerto Rico', NULL, NULL),
(230, 'QA', 'Qatar', NULL, NULL),
(231, 'RE', 'Reunion', NULL, NULL),
(232, 'RO', 'Romania', NULL, NULL),
(233, 'RU', 'Russian Federation', NULL, NULL),
(234, 'RW', 'Rwanda', NULL, NULL),
(235, 'KN', 'Saint Kitts and Nevis', NULL, NULL),
(236, 'LC', 'Saint Lucia', NULL, NULL),
(237, 'VC', 'Saint Vincent and the Grenadines', NULL, NULL),
(238, 'WS', 'Samoa', NULL, NULL),
(239, 'SM', 'San Marino', NULL, NULL),
(240, 'ST', 'Sao Tome and Principe', NULL, NULL),
(241, 'SA', 'Saudi Arabia', NULL, NULL),
(242, 'SN', 'Senegal', NULL, NULL),
(243, 'RS', 'Serbia', NULL, NULL),
(244, 'SC', 'Seychelles', NULL, NULL),
(245, 'SL', 'Sierra Leone', NULL, NULL),
(246, 'SG', 'Singapore', NULL, NULL),
(247, 'SK', 'Slovakia', NULL, NULL),
(248, 'SI', 'Slovenia', NULL, NULL),
(249, 'SB', 'Solomon Islands', NULL, NULL),
(250, 'SO', 'Somalia', NULL, NULL),
(251, 'ZA', 'South Africa', NULL, NULL),
(252, 'GS', 'South Georgia South Sandwich Islands', NULL, NULL),
(253, 'SS', 'South Sudan', NULL, NULL),
(254, 'ES', 'Spain', NULL, NULL),
(255, 'LK', 'Sri Lanka', NULL, NULL),
(256, 'SH', 'St. Helena', NULL, NULL),
(257, 'PM', 'St. Pierre and Miquelon', NULL, NULL),
(258, 'SD', 'Sudan', NULL, NULL),
(259, 'SR', 'Suriname', NULL, NULL),
(260, 'SJ', 'Svalbard and Jan Mayen Islands', NULL, NULL),
(261, 'SZ', 'Swaziland', NULL, NULL),
(262, 'SE', 'Sweden', NULL, NULL),
(263, 'CH', 'Switzerland', NULL, NULL),
(264, 'SY', 'Syrian Arab Republic', NULL, NULL),
(265, 'TW', 'Taiwan', NULL, NULL),
(266, 'TJ', 'Tajikistan', NULL, NULL),
(267, 'TZ', 'Tanzania, United Republic of', NULL, NULL),
(268, 'TH', 'Thailand', NULL, NULL),
(269, 'TG', 'Togo', NULL, NULL),
(270, 'TK', 'Tokelau', NULL, NULL),
(271, 'TO', 'Tonga', NULL, NULL),
(272, 'TT', 'Trinidad and Tobago', NULL, NULL),
(273, 'TN', 'Tunisia', NULL, NULL),
(274, 'TR', 'Turkey', NULL, NULL),
(275, 'TM', 'Turkmenistan', NULL, NULL),
(276, 'TC', 'Turks and Caicos Islands', NULL, NULL),
(277, 'TV', 'Tuvalu', NULL, NULL),
(278, 'UG', 'Uganda', NULL, NULL),
(279, 'UA', 'Ukraine', NULL, NULL),
(280, 'AE', 'United Arab Emirates', NULL, NULL),
(281, 'GB', 'United Kingdom', NULL, NULL),
(282, 'US', 'United States', NULL, NULL),
(283, 'UM', 'United States minor outlying islands', NULL, NULL),
(284, 'UY', 'Uruguay', NULL, NULL),
(285, 'UZ', 'Uzbekistan', NULL, NULL),
(286, 'VU', 'Vanuatu', NULL, NULL),
(287, 'VA', 'Vatican City State', NULL, NULL),
(288, 'VE', 'Venezuela', NULL, NULL),
(289, 'VN', 'Vietnam', NULL, NULL),
(290, 'VG', 'Virgin Islands (British)', NULL, NULL),
(291, 'VI', 'Virgin Islands (U.S.)', NULL, NULL),
(292, 'WF', 'Wallis and Futuna Islands', NULL, NULL),
(293, 'EH', 'Western Sahara', NULL, NULL),
(294, 'YE', 'Yemen', NULL, NULL),
(295, 'ZR', 'Zaire', NULL, NULL),
(296, 'ZM', 'Zambia', NULL, NULL),
(297, 'ZW', 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------
--
-- Table structure for table `delivery_address`
--

DROP TABLE IF EXISTS `delivery_address`;
CREATE TABLE IF NOT EXISTS `delivery_address` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `users_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_address`
--

INSERT INTO `delivery_address` (`id`, `users_id`, `users_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 2, 'm.said.bdr@gmail.com', 'Mohamed', 'my address', 'city', 'state', 'Egypt', '12345', 'mobile', NULL, NULL),
(2, 1, 'test@gmail.com', 'test', 'test address', 'test city', 'test state', 'Egypt', '12345', 'mobile', NULL, NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 2),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_20_040609_create_categories_table', 3),
(4, '2018_10_24_075802_create_products_table', 4),
(5, '2018_11_08_024109_create_product_att_table', 5),
(6, '2018_11_20_055123_create_tblgallery_table', 6),
(7, '2018_11_26_070031_create_cart_table', 7),
(8, '2018_12_01_042342_create_countries_table', 10),
(9, '2018_12_03_043804_add_more_fields_to_users_table', 14),
(10, '2018_12_03_093548_create_delivery_address_table', 12),
(11, '2018_12_05_024718_create_orders_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `users_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charges` double(8,2) NOT NULL,
  `order_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `users_email`, `name`, `address`, `city`, `state`, `pincode`, `country`, `mobile`, `shipping_charges`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 2, 'test@gmail.com', 'test', 'test address', 'test city', 'test', '12345', 'Egypt', 'mobile', 0.00, 'success', 'Paypal', '70', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(2, 1, 'm.said.bdr@gmail.com', 'mohamed', 'my address', 'my city', 'test state', '12345', 'Egypt', 'mobile', 0.00, 'success', 'Paypal', '18', '2019-11-15 20:08:08', '2019-11-15 20:08:08');

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `name`, `code`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pizza_1', 'P_C_1', 'This is one of the best pizza ever<br>, it is hot and spicy', 10.00, '1.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(2, 1, 'Pizza_2', 'P_C_2', 'If you like cheese and vegetables so this pizza is the best for you', 6.00, '2.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(3, 2, 'Pizza_3', 'P_C_3', 'The best pizza ever the best pizza ever the best pizza ever the best pizza ever', 5.00, '3.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(4, 2, 'Pizza_4', 'P_C_4', 'This is one of the best pizza ever<br>, it is hot and spicy', 5.00, '4.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(5, 2, 'Pizza_5', 'P_C_5', 'If you like cheese and vegetables so this pizza is the best for you', 10.00, '5.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(6, 3, 'Pizza_6', 'P_C_6', 'number one pizza ever number one pizza ever number one pizza ever number one pizza ever', 10.00, '6.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(7, 4, 'Pizza_7', 'P_C_7', 'This is one of the best pizza ever<br>, it is hot and spicy', 10.00, '7.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(8, 5, 'Pizza_8', 'P_C_8', 'If you like cheese and vegetables so this pizza is the best for you', 12.00, '8.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(9, 5, 'Pizza_9', 'P_C_9', 'number one pizza ever number one pizza ever number one pizza ever number one pizza ever', 11.00, '9.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(10, 6, 'Pizza_10', 'P_C_10', 'The best pizza ever the best pizza ever the best pizza ever the best pizza ever', 20.00, '10.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(11, 7, 'Pizza_11', 'P_C_11', 'If you like cheese and vegetables so this pizza is the best for you', 10.00, '11.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(12, 8, 'Pizza_12', 'P_C_12', 'number one pizza ever number one pizza ever number one pizza ever number one pizza ever', 15.00, '12.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(13, 9, 'Pizza_13', 'P_C_13', 'number one pizza ever number one pizza ever number one pizza ever number one pizza ever', 20.00, '13.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(14, 10, 'Pizza_14', 'P_C_14', 'If you like cheese and vegetables so this pizza is the best for you', 20.00, '14.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(15, 12, 'Pizza_15', 'P_C_15', 'This is one of the best pizza ever<br>, it is hot and spicy', 15.00, '15.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(16, 13, 'Pizza_16', 'P_C_16', 'If you like cheese and vegetables so this pizza is the best for you', 13.00, '16.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(17, 13, 'Pizza_17', 'P_C_17', 'This is one of the best pizza ever<br>, it is hot and spicy', 10.00, '17.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(18, 15, 'Pizza_18', 'P_C_18', 'number one pizza ever number one pizza ever number one pizza ever number one pizza ever', 10.00, '18.jpg', '2019-11-15 20:08:08', '2019-11-15 20:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_att`
--

DROP TABLE IF EXISTS `product_att`;
CREATE TABLE IF NOT EXISTS `product_att` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_att`
--

INSERT INTO `product_att` (`id`, `products_id`, `code`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pizza_1_Small', 'Small Only', 10.00, 100, '2019-11-15 20:08:43', '2019-11-15 20:08:43'),
(2, 2, 'Pizza_2_Small', 'Small', 6.00, 100, '2019-11-15 20:08:08', '2019-11-15 20:08:08'),
(3, 2, 'Pizza_2_Large', 'Large', 10.00, 100, '2019-11-15 20:07:42', '2019-11-15 20:07:42'),
(4, 2, 'Pizza_2_Medium', 'Medium', 8.00, 100, '2019-11-15 20:07:11', '2019-11-15 20:07:11'),
(5, 3, 'Pizza_3_Small', 'Small Only', 5.00, 100, '2019-11-15 20:09:05', '2019-11-15 20:09:05'),
(6, 4, 'Pizza_4_Large', 'Large', 15.00, 100, '2019-11-15 20:09:45', '2019-11-15 20:09:45'),
(7, 4, 'Pizza_4_Medium', 'Medium', 10.00, 100, '2019-11-15 20:09:58', '2019-11-15 20:09:58'),
(8, 4, 'Pizza_4_Small', 'Small', 5.00, 100, '2019-11-15 20:10:16', '2019-11-15 20:10:16'),
(9, 5, 'Pizza_5_Small', 'Small', 10.00, 100, '2019-11-15 20:11:02', '2019-11-15 20:11:02'),
(10, 5, 'Pizza_5_Medium', 'Medium', 15.00, 100, '2019-11-15 20:11:24', '2019-11-15 20:11:24'),
(11, 5, 'Pizza_5_Large', 'Large', 20.00, 100, '2019-11-15 20:11:38', '2019-11-15 20:11:38'),
(12, 6, 'Pizza_6_Large', 'Large', 25.00, 100, '2019-11-15 20:12:13', '2019-11-15 20:12:13'),
(13, 6, 'Pizza_6_Small', 'Small', 10.00, 100, '2019-11-15 20:12:30', '2019-11-15 20:12:30'),
(14, 6, 'Pizza_6_Medium', 'Medium', 20.00, 100, '2019-11-15 20:12:46', '2019-11-15 20:12:46'),
(15, 7, 'Pizza_7_Small', 'Small', 10.00, 100, '2019-11-15 20:13:06', '2019-11-15 20:13:06'),
(16, 7, 'Pizza_7_Medium', 'Medium', 15.00, 100, '2019-11-15 20:13:23', '2019-11-15 20:13:23'),
(17, 7, 'Pizza_7_Large', 'Large', 25.00, 100, '2019-11-15 20:14:55', '2019-11-15 20:14:55'),
(18, 8, 'Pizza_8_Small', 'Small', 12.00, 100, '2019-11-15 20:15:43', '2019-11-15 20:15:43'),
(19, 8, 'Pizza_8_Medium', 'Medium', 15.00, 100, '2019-11-15 20:15:43', '2019-11-15 20:15:43'),
(20, 8, 'Pizza_8_Large', 'Large', 20.00, 100, '2019-11-15 20:15:43', '2019-11-15 20:15:43'),
(21, 9, 'Pizza_9_Medium', 'Medium', 12.00, 100, '2019-11-15 20:16:28', '2019-11-15 20:16:28'),
(22, 9, 'Pizza_9_Small', 'Small', 11.00, 100, '2019-11-15 20:16:48', '2019-11-15 20:16:48'),
(23, 9, 'Pizza_9_Large', 'Large', 15.00, 100, '2019-11-15 20:17:02', '2019-11-15 20:17:02'),
(24, 10, 'Pizza_10_Large', 'Large', 50.00, 100, '2019-11-15 20:17:35', '2019-11-15 20:17:35'),
(25, 10, 'Pizza_10_Small', 'Small', 20.00, 100, '2019-11-15 20:17:46', '2019-11-15 20:17:46'),
(26, 10, 'Pizza_10_Medium', 'Medium', 30.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(27, 11, 'Pizza_11_Small', 'Small Only', 10.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(28, 12, 'Pizza_12_Small', 'Small Only', 15.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(29, 13, 'Pizza_13_Small', 'Small Only', 20.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(30, 14, 'Pizza_14_Small', 'Small Only', 20.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(31, 15, 'Pizza_15_Small', 'Small Only', 15.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(32, 16, 'Pizza_16_Small', 'Small Only', 13.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(33, 17, 'Pizza_17_Small', 'Small Only', 10.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(34, 18, 'Pizza_18_Small', 'Small', 10.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(35, 18, 'Pizza_18_Medium', 'Medium', 20.00, 100, '2019-11-15 20:18:01', '2019-11-15 20:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblgallery`
--

DROP TABLE IF EXISTS `tblgallery`;
CREATE TABLE IF NOT EXISTS `tblgallery` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblgallery`
--

INSERT INTO `tblgallery` (`id`, `products_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '17.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(2, 1, '18.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(3, 1, '19.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(4, 2, '20.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(5, 2, '21.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(6, 2, '22.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(7, 3, '23.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(8, 3, '24.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(9, 3, '25.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(10, 4, '26.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(11, 4, '27.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(12, 4, '28.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(13, 5, '29.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(14, 5, '30.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(15, 5, '31.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(16, 6, '32.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(17, 6, '33.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(18, 6, '34.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(19, 7, '35.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(20, 7, '36.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(21, 7, '37.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(22, 8, '38.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(23, 8, '39.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(24, 8, '15.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(25, 9, '1.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(26, 9, '16.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(27, 9, '15.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(28, 10, '28.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(29, 10, '29.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(30, 10, '30.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(31, 11, '13.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(32, 11, '32.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(33, 11, '12.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(34, 12, '34.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(35, 12, '5.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(36, 12, '36.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(37, 13, '37.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(38, 13, '38.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(39, 13, '2.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(40, 14, '17.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(41, 14, '6.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(42, 14, '28.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(43, 15, '29.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(44, 15, '30.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(45, 15, '9.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(46, 16, '16.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(47, 16, '31.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(48, 16, '35.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(49, 17, '10.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(50, 17, '36.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(51, 17, '37.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(52, 18, '11.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(53, 18, '39.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01'),
(54, 18, '18.jpg', '2019-11-15 20:18:01', '2019-11-15 20:18:01');
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`, `address`, `city`, `state`, `country`, `pincode`, `mobile`) VALUES
(1, 'Test', 'test@gmail.com', NULL, '$2y$10$m9fNpTgwyBVqqVfsJ9bXUensvx5iqlYhzqmL3khhSpKpgqNQnW0t2', 1, 'eXRJYaZCo6qXgGfTHiOFvShGWta2eLgaIhcBVfa9ppQnN5SFFH7yo516DQs1', '2019-11-15 20:18:01', '2019-11-15 20:18:01', 'test Street', 'test test', 'test', 'Egypt', '12345', '01000000'),
(2, 'Mohamed', 'm.said.bdr@gmail.com', NULL, '$2y$10$3Ccxg17LYw/.qS7ib5Xcr.T5po6AXUsnjEcEI4IHcQ0MGkcuRfO.O', NULL, 'za7FtmzYvfzBYmkQtE5tfvStl7dY3Z6uZKSpuRtBRIvlbXzM0csZEQYzjuEb', '2019-11-15 20:18:01', '2019-11-15 20:18:01', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` double(8,2) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

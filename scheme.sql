-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Oca 2020, 10:11:17
-- Sunucu sürümü: 10.4.6-MariaDB
-- PHP Sürümü: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ecommerceproject`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `parentid`, `title`, `keywords`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 0, 'Computer', 'computer, technology', 'computer', NULL, NULL, NULL, NULL),
(3, 0, 'Phone', 'phone', 'phone, technology', NULL, NULL, NULL, NULL),
(4, 0, 'Electronics', 'electronics', 'technology, electronics', NULL, NULL, NULL, NULL),
(5, 0, 'Books', 'books', 'book', NULL, NULL, NULL, NULL),
(6, 0, 'Products', 'products', 'products', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`id`, `subject`, `comment`, `status`, `ip`, `userid`, `created_at`, `updated_at`, `rate`, `productid`) VALUES
(1, 'Test', 'Comment', 'True', NULL, 10, NULL, NULL, 2, 4),
(2, 'Best Phone', 'I like phone', 'True', NULL, 10, NULL, NULL, 5, 4),
(3, 'test subject', NULL, 'New', '127.0.0.1', 10, NULL, NULL, 4, 4),
(4, 'a', 'a', 'False', '127.0.0.1', 10, NULL, NULL, 1, 4),
(5, 'Very Good Product', 'This product is very good', 'True', '127.0.0.1', 10, NULL, NULL, 5, 4),
(6, 'Bad Phone', 'Never buy it', 'True', '127.0.0.1', 10, NULL, NULL, 1, 4),
(7, 'Test', 'test', 'True', '127.0.0.1', 10, NULL, NULL, 1, 14),
(8, 'nice play station', 'nice play station', 'True', '127.0.0.1', 10, NULL, NULL, 4, 14),
(9, 'aplleee', 'apple the best computer tech.', 'True', '127.0.0.1', 3, NULL, NULL, 5, 10),
(10, 'About Phone', 'İyi bir ürün, geçen hafta aldım ve beğendim.', 'True', '127.0.0.1', 128, NULL, NULL, 5, 17),
(11, 'apple', 'apple is a bad product', 'True', '127.0.0.1', 3, NULL, NULL, 1, 18),
(12, 'xaomi', 'good phone', 'True', '127.0.0.1', 3, NULL, NULL, 5, 17),
(13, 'tv', 'really really is a so so good product. i like it.', 'True', '127.0.0.1', 0, NULL, NULL, 5, 18),
(14, 'watch', 'Bu ürün idare eder', 'New', '127.0.0.1', 0, NULL, NULL, 3, 15),
(15, 'asus', 'asus zenbook the best computer in the world, in my opinion', 'New', '127.0.0.1', 0, NULL, NULL, 5, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `image`
--

INSERT INTO `image` (`id`, `product_id`, `title`, `image`) VALUES
(12, 5, 'Artisanal kale', '8748f41ebc5981b5d417a82efdc9805a.jpeg'),
(33, 5, 'Artisanal kale', NULL),
(40, 10, 'Artisanal kale', NULL),
(41, 10, 'Artisanal kale', NULL),
(42, 11, 'Artisanal kale', NULL),
(44, 11, 'Artisanal kale', NULL),
(46, 4, 'Artisanal kale', '2c6568a0c629d60f530ae8e572f3fec7.jpeg'),
(47, 4, 'Artisanal kale', 'b23d2aadd80801bec6a249eb3c69637a.jpeg'),
(48, 4, 'Artisanal kale', '32e71ebccbbb252864892643213096e0.jpeg'),
(49, 10, 'Artisanal kale', NULL),
(50, 10, 'Artisanal kale', NULL),
(51, 18, 'apple1', 'd7de7bb5935bc27fb5cde0d4a459f3e2.jpeg'),
(52, 18, 'apple2', 'ce11a2d87d14c9c2b11e80798bfefb8c.jpeg'),
(53, 18, 'apple 3', 'fb0c28c3d74bfe24443a951ba96de8a5.jpeg'),
(54, 26, 'Artisanal kale', NULL),
(55, 15, 'watch 1', '35eca3f6a67f2ad7b8779227c3d27e7a.jpeg'),
(56, 15, 'watch 2', 'e536c1dc3d99790662e99ebc19ac0896.jpeg'),
(57, 15, 'watch 3', '25400260c52536498386b981e01d42c9.jpeg'),
(58, 9, 'asus 1', '1a217b64031898c7ad6e4cb92d9da7b3.jpeg'),
(59, 9, 'asus 2', 'ba86196fb91f605996d7c0c17be673c4.jpeg'),
(60, 9, 'asus 3', '92107f71a68566eab09a46858d08d98f.jpeg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `message`, `status`, `ip`, `note`, `created_at`, `updated_at`, `email`) VALUES
(1, 'Ali CAN', 'test subject', NULL, NULL, NULL, 'message', NULL, NULL, 'ali@hotmail.com'),
(2, 'Ozan Ergon', 'asd', 'asd', 'New', '127.0.0.1', 'I will answer this request. Yüksel', NULL, NULL, 'ozanergon@gmail.com'),
(3, 'ahmet', 'asd', 'asd', 'New', '127.0.0.1', NULL, NULL, NULL, 'a@gmail.com'),
(4, 'g', 'my Subject', 'a', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(5, 'a', 'my Subject', 'a', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(6, 'yuksel celik', 'ders', 'ders', 'New', '127.0.0.1', NULL, NULL, NULL, 'yukselcelik@gmail.com'),
(7, 'Cansu Can', 'I like your videos', 'Hello,\r\nI want to more videos about php framework\r\nThank you', 'New', '127.0.0.1', NULL, NULL, NULL, 'cansu@hotmail.com'),
(8, 'Ozan Ergön', 'Test Subject', 'Test Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(9, 'Ozan Ergön', 'Test Subject', 'Test Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(10, 'Ozan Ergön', 'Test Subject', 'Test Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(11, 'Ozan Ergön', 'Test Subject', 'Test Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(12, 'Ozan Ergön', 'Test Subject', 'Test Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(13, 'Ozan Ergön', 'Test Subject', 'Your Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(14, 'Ozan Ergön', 'Test Subject', 'Your Request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(15, 'Ozan Ergön', 'Test Subject', 'Your request Message', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(16, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(17, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(18, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(19, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(20, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(21, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(22, 'Ozan Ergön', 'Test Subject', 'Your Message Request', 'New', '127.0.0.1', NULL, NULL, NULL, 'ozanergon@gmail.com'),
(23, 'Cansu Can', 'Test Subject', 'Hello, I want to more videos about php framework Thank you', 'New', '127.0.0.1', NULL, NULL, NULL, 'cansu@hotmail.com'),
(24, 'Cansu Can', 'Test Subject', 'Hello, I want to more videos about php framework Thank you', 'New', '127.0.0.1', NULL, NULL, NULL, 'cansu@hotmail.com'),
(25, 'a', 'a', 'a', 'New', '127.0.0.1', NULL, NULL, NULL, 'a@gmail.com'),
(26, 'kaan', 'kaan', 'kaaaan', 'New', '127.0.0.1', NULL, NULL, NULL, 'kaan@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191119182203', '2019-11-19 18:23:00'),
('20191127173341', '2019-11-27 17:34:53'),
('20191130135221', '2019-11-30 13:52:37'),
('20191201071051', '2019-12-01 07:12:31'),
('20191204190049', '2019-12-04 19:01:32'),
('20191211075416', '2019-12-11 07:54:34'),
('20191218044102', '2019-12-18 04:41:21'),
('20191218050008', '2019-12-18 05:01:33'),
('20191219064420', '2019-12-19 06:44:37'),
('20191219082027', '2019-12-19 08:21:11'),
('20191229023625', '2019-12-29 02:36:49'),
('20200110160748', '2020-01-10 16:08:15'),
('20200110161049', '2020-01-10 16:11:16'),
('20200110162451', '2020-01-10 18:35:42'),
('20200110183531', '2020-01-10 18:35:43');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipinfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `userid`, `amount`, `name`, `address`, `city`, `phone`, `shipinfo`, `status`, `note`, `updated_at`, `created_at`) VALUES
(12, 10, 42500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', 'ada', 'Canceled', 'sdaw', NULL, NULL),
(13, 10, 20000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'Accepted', 'iki gün sonra kargoya ver.', NULL, NULL),
(14, 10, 0, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'Accepted', '', NULL, NULL),
(15, 10, 0, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'Canceled', NULL, NULL, NULL),
(16, 10, 5500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'New', 'iki gün sonra kargoya ver', NULL, NULL),
(17, 10, 0, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(18, 10, 0, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(19, 10, 12500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(20, 10, 51500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'InShipping', '', NULL, NULL),
(21, 10, 0, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(22, 10, 2500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(23, 10, 33000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'InShipping', 'şu an depoda yok iki gün sonra geline onayla\r\n', NULL, NULL),
(24, 3, 3500, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(25, 3, 6000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(26, 3, 16000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'InShipping', '', NULL, NULL),
(27, 3, 20500, 'yuksel celik', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(28, 3, 6000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', NULL, 'New', NULL, NULL, NULL),
(29, 3, 68000, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'InShipping', 'yurtiçi kargoya verdin', NULL, NULL),
(30, 3, 21200, 'Ayse', '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', 'Karabük', '0554 784 4544', '', 'InShipping', 'sony z3 iki gün sonra kargoya verilcek', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `orderid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `order_detail`
--

INSERT INTO `order_detail` (`id`, `orderid`, `userid`, `productid`, `price`, `quantity`, `amount`, `name`, `status`) VALUES
(1, 10, 10, 4, 10000, 3, 30000, 'Samsung S10', NULL),
(2, 10, 10, 14, 2500, 7, 17500, 'Play Station', NULL),
(3, 12, 10, 4, 10000, 3, 30000, 'Samsung S10', 'Ordered'),
(4, 12, 10, 14, 2500, 3, 7500, 'Play Station', 'Ordered'),
(5, 12, 10, 15, 2500, 2, 5000, 'Apple Watch', 'Ordered'),
(6, 13, 10, 4, 10000, 1, 10000, 'Samsung S10', 'Ordered'),
(7, 13, 10, 14, 2500, 4, 10000, 'Play Station', 'Ordered'),
(8, 16, 10, 9, 5500, 1, 5500, 'Asus Zenbook', 'Ordered'),
(9, 19, 10, 15, 2500, 1, 2500, 'Apple Watch', 'Ordered'),
(10, 19, 10, 4, 10000, 1, 10000, 'Samsung S10', 'Ordered'),
(11, 20, 10, 4, 10000, 1, 10000, 'Samsung S10', 'Ordered'),
(12, 20, 10, 4, 10000, 3, 30000, 'Samsung S10', 'Ordered'),
(13, 20, 10, 5, 11500, 1, 11500, 'Iphone 11 Pro Max', 'Ordered'),
(14, 22, 10, 15, 2500, 1, 2500, 'Apple Watch', 'Ordered'),
(15, 23, 10, 4, 10000, 3, 30000, 'Samsung S10', 'Ordered'),
(16, 23, 10, 11, 1500, 2, 3000, 'JBL HeadPhones', 'Ordered'),
(17, 24, 3, 17, 3500, 1, 3500, 'Xiaomi redmi note 8', 'Ordered'),
(18, 25, 3, 18, 6000, 1, 6000, 'Apple TV', 'Ordered'),
(19, 26, 3, 18, 6000, 1, 6000, 'Apple TV', 'Ordered'),
(20, 26, 3, 4, 10000, 1, 10000, 'Samsung S10', 'Ordered'),
(21, 27, 3, 18, 6000, 2, 12000, 'Apple TV', 'Ordered'),
(22, 27, 3, 16, 8500, 1, 8500, 'Samsung Led TV', 'Ordered'),
(23, 28, 3, 18, 6000, 1, 6000, 'Apple TV', 'Ordered'),
(24, 29, 3, 18, 6000, 3, 18000, 'Apple TV', 'Ordered'),
(25, 29, 3, 4, 10000, 5, 50000, 'Samsung S10', 'Ordered'),
(26, 30, 3, 24, 1200, 1, 1200, 'Sony Z3', 'Ordered'),
(27, 30, 3, 4, 10000, 2, 20000, 'Samsung S10', 'Ordered');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `writer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `keywords`, `description`, `image`, `amount`, `detail`, `price`, `type`, `year`, `writer`, `status`, `created_at`, `updated_at`, `userid`) VALUES
(4, 2, 'Samsung S10', NULL, NULL, 'c399df65824b4607050a68ac646a0cdb.jpeg', 12, '<h3>Teknik &Ouml;zellikler</h3>\r\n\r\n<p>Ağ Bağlantıları</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Wi-Fi standartları</td>\r\n			<td>802.11a, Wi-Fi 5 (802.11ac), Wi-Fi 6 (802.11ax), 802.11b, 802.11g, Wi-Fi 4 (802.11n)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3G</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3G Standartları</td>\r\n			<td>WCDMA</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4G</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4G standartları</td>\r\n			<td>LTE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SIM kart t&uuml;r&uuml;</td>\r\n			<td>NanoSIM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Yakın Alan İletişimi</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth versiyonu</td>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ağırlık &amp; boyutlar</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Ağırlık</td>\r\n			<td>150&nbsp;g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Y&uuml;kseklik</td>\r\n			<td>142, 2&nbsp;mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Genişlik</td>\r\n			<td>69, 9&nbsp;mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Derinlik</td>\r\n			<td>7, 9&nbsp;mm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Bağlantı</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Bluetooth versiyonu</td>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kulaklık bağlantısı</td>\r\n			<td>3, 5 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>USB bağlantı noktası</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>USB bağlayıcı</td>\r\n			<td>USB C Tipi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Evet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Uyumlu hafıza kartları</td>\r\n			<td>MicroSD (TransFlash)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '10000', NULL, 2018, NULL, 'True', NULL, NULL, 2),
(5, 3, 'Iphone 11 Pro Max', NULL, NULL, '740772a2cb62c0dfa3df3d81e0abc588.jpeg', 20, NULL, '11500', NULL, 2019, NULL, 'True', NULL, NULL, 2),
(9, 2, 'Asus Zenbook', NULL, NULL, '45d0126122bea1e5ccf633722c6cf8d6.jpeg', 53, NULL, '5500', NULL, 2017, NULL, 'True', NULL, NULL, 3),
(10, 2, 'Mac Pro', 'Mac Pro', 'Mac Pro', '9c1a59747544d18efc5a83782c7fa3ad.jpeg', 35, NULL, '42000', NULL, 2019, NULL, 'True', NULL, NULL, 10),
(11, 4, 'JBL HeadPhones', 'JBL HeadPhones', 'JBL HeadPhones', '9e490ab1493a328a01b63de04b49cfaf.jpeg', 60, NULL, '1500', NULL, 2017, NULL, 'True', NULL, NULL, 10),
(14, 4, 'Play Station', 'playstation', 'playstation', '07cd779b548763308da8680414b720e9.jpeg', 15, NULL, '2500', NULL, 2013, NULL, 'True', NULL, NULL, 3),
(15, 4, 'Apple Watch', 'apple watch', 'apple watch', 'd9adf0076229288f6708e8b0bc96908b.jpeg', 15, NULL, '2500', NULL, 2018, NULL, 'True', NULL, NULL, 3),
(16, 4, 'Samsung Led TV', 'samsung led tv', 'samsung led tv', 'efcc081f987551fbe5f1656ab90423af.jpeg', 45, NULL, '8500', NULL, 2019, NULL, 'True', NULL, NULL, 3),
(17, 3, 'Xiaomi redmi note 8', 'Xiaomi', 'Xiaomi', '1de00a51f0bb01671f2adf2fed0704ce.png', 14, NULL, '3500', NULL, 2017, NULL, 'True', NULL, NULL, 10),
(18, 4, 'Apple TV', 'apple', 'apple', '3006f31574365005aac5f084b0c22742.jpeg', 20, '<p><img src=\"https://www.vatanbilgisayar.com/upload/HTML/AKSBCH/APPLE/88021/1.jpg\" /></p>\r\n\r\n<h1>APPLE TV 4K</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>4K&nbsp;HDR &ccedil;ağı.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Şimdi&nbsp;g&ouml;sterimde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Apple TV 4K ile, en sevdiğiniz filmleri ve TV programlarını g&ouml;z alıcı 4K&nbsp;HDR kalitesinde izleyin. Netflix, TV+, Blu TV ve puhutv gibi uygulamaların sunduğu heyecan verici i&ccedil;eriklerle, televizyonun yeni&nbsp;&ccedil;ağına tanık olun. Canlı spor karşılaşmalarını ve haberleri takip&nbsp;edin.&nbsp;&Ccedil;ığır a&ccedil;an bir TV deneyimi sizi bekliyor.</p>\r\n\r\n<p>Yepyeni bir standart. 4K HDR.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Standart HD &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml;n d&ouml;rt katı piksel kullanan 4K teknolojisiyle şimdi her şey &ccedil;ok&nbsp;daha net. Y&uuml;ksek Dinamik Aralık (HDR) daha parlak ve ger&ccedil;ek&ccedil;i renkler ile daha fazla detay sunuyor. B&ouml;ylece en pop&uuml;ler ve en&nbsp;yeni&nbsp;filmlerden, severek takip ettiğiniz TV&nbsp;programlarına her şey ger&ccedil;eğe her&nbsp;zamankinden daha yakın.</p>\r\n\r\n<p><img src=\"https://www.vatanbilgisayar.com/upload/HTML/AKSBCH/APPLE/88021/2.jpg\" /></p>', '6000', 'television', 2014, NULL, 'True', NULL, NULL, 2),
(19, 4, 'Sinbo Kahve Makinesi', 'kahve makinesi', 'kahve makinesi', 'fd9ee25348b14a3dc8aba6440f8b8fe8.jpeg', 7, NULL, '300', 'coffe machine', 2009, NULL, 'True', NULL, NULL, 3),
(20, 4, 'Preo Drone', 'drone', 'drone', 'c43044032e04370da480650ca17cb361.jpeg', 5, NULL, '1200', 'drone', 2011, NULL, 'True', NULL, NULL, 0),
(21, 4, 'Nikon Fotoğraf Makinası', 'fotoğraf makinası', 'fotoğraf makinası', '70d985d66e6eea3eba20bdad2f1dc6b5.jpeg', 12, NULL, '2400', 'fotoğraf makinası', 2004, NULL, 'True', NULL, NULL, 3),
(22, 4, 'Logitech Gaming Mouse', 'mouse', 'mouse', 'df24f4eb8c24c991aad286c4a2c18aac.jpeg', 4, NULL, '120', 'mouse', 2013, NULL, 'True', NULL, NULL, 3),
(23, 2, 'HP Elitebook Computer', 'computer', 'computer', 'a34d892265264394f1c5ea4b83aa06e3.jpeg', 13, NULL, '5000', 'computer', 2011, NULL, 'True', NULL, NULL, 3),
(24, 2, 'Sony Z3', 'sony', 'sony', '2efabd49381e683d46228304ef8a450b.jpeg', NULL, NULL, '1200', NULL, 2010, NULL, 'True', NULL, NULL, 3),
(25, 2, 'asuss', 'asuss', 'assuss', '2677457203c0ac05961987ebffefb3b5.png', 2, NULL, '122', 'we', 1222, NULL, 'New', NULL, NULL, 3),
(26, 5, 'İnce Memed', 'ince memed', 'ince memed', '319ebf41ac95fcd41c67030bd809b95b.jpeg', 14, NULL, '10', 'books', 1989, NULL, 'True', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtpserver` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtppassword` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpport` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `setting`
--

INSERT INTO `setting` (`id`, `title`, `keywords`, `description`, `company`, `address`, `phone`, `fax`, `email`, `smtpserver`, `smtpemail`, `smtppassword`, `smtpport`, `facebook`, `instagram`, `twitter`, `aboutus`, `contact`, `reference`, `status`) VALUES
(3, 'Travel All', 'Travel All', 'Travel All', 'TravelAll Anonim Şirketi', 'Aksaray, İstanbul, 34000, Turkey', '23413423434', '234134234', 'info@travelall.com', 'gmail', 'karabuktest@gmail.com', 'Marabalar2019*', '578', 'https://www.facebook.com/krbkuni', 'https://www.instagram.com/karabukuniv', 'https://www.twitterT.com/krbkuni', '<ul>\r\n	<li>\r\n	<div class=\"title\" style=\"margin-bottom:30px\"><span style=\"color:#e67e22\"><span style=\"font-size:24px\">Every Individual Deserves a Website</span></span></div>\r\n\r\n	<p><span style=\"font-size:16px\"><span style=\"color:#000000\">We believe every individual should have the power to create their own website or online store. If you can point and click, you can create a professional website or online store using our free and intuitive tools.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<div class=\"title\" style=\"margin-bottom:30px\"><span style=\"color:#e67e22\"><span style=\"font-size:24px\">Our Customers Mean the World</span></span></div>\r\n\r\n	<p><span style=\"font-size:16px\"><span style=\"color:#000000\">At Website.com, we strive to provide exactly what our customers are looking for. A huge part of our brainstorming process is looking at our client feedback to make sure you&#39;re well taken care of.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<div class=\"title\" style=\"margin-bottom:30px\"><span style=\"color:#d35400\"><span style=\"font-size:24px\">In-House Made</span></span></div>\r\n\r\n	<p><span style=\"font-size:16px\"><span style=\"color:#000000\">We are personally committed to delivering the very best. Everything, from customer support to product design and development, is provided by our dedicated (and adorable) team in beautiful BC, Canada.</span></span></p>\r\n	</li>\r\n</ul>', '<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>Adres</strong></td>\r\n			<td>Karab&uuml;k &Uuml;niversitesi Demir &Ccedil;elik Kamp&uuml;s&uuml;<br />\r\n			Kılavuzlar K&ouml;y&uuml; &Ouml;te Karşı &Uuml;niversite Kamp&uuml;s&uuml; Merkez Karab&uuml;k</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Telefon</strong></td>\r\n			<td><a href=\"tel:4440478\">444 0 478</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>E-mail</strong></td>\r\n			<td><a href=\"mailto:iletisim@karabuk.edu.tr\">iletisim@karabuk.edu.tr</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Web</strong></td>\r\n			<td>www.karabuk.edu.tr</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><iframe frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001.2550114756!2d32.64944681495948!3d41.21621291455287!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x408354ac4492953f%3A0xab3b48ed0392a743!2sKarab%C3%BCk+%C3%9Cniversitesi!5e0!3m2!1str!2str!4v1471528432043\" width=\"100%\"></iframe></p>\r\n\r\n<p>&nbsp;<strong>Eklenme Zamanı:</strong>&nbsp;9.10.2017 / 09:54</p>', '<ul>\r\n	<li>\r\n	<h1>Akım Metal</h1>\r\n\r\n	<p>40 yılı aşkın işleme tecr&uuml;besine sahip Akım Metal, Tuzla&ndash;İstanbul&rsquo;daki işletmesinde beyaz eşya, otomotiv, end&uuml;striyel motor, havacılık ve savunma sanayisi sekt&ouml;rlerine metal işleme ve metal enjeksiyon ile par&ccedil;a imalatı yapmaktadır. 2011 yılı itibariyle yeni bir &uuml;r&uuml;n &uuml;retmek, pazarda farklılaşmak...</p>\r\n	<a href=\"http://a-group.com.tr/en/grup_sirketleri/akim-metal-1\">continuation</a></li>\r\n	<li>\r\n	<p><img src=\"http://a-group.com.tr/media/images/akplas-gorsel.jpg\" /></p>\r\n\r\n	<h1>Akplas</h1>\r\n\r\n	<p>Akplas&nbsp;was established in Istanbul in 1989, for the production of plastic injection moulding. Later moving to its Gebze location in 1996, as the company developed its quality systems approach, technological investments and R &amp; D studies. In the years to follow, silk screen serigraphy printing, plastic wet painting, blow moulding and heat...</p>\r\n	<a href=\"http://a-group.com.tr/en/grup_sirketleri/akplas-2\">continuation</a></li>\r\n	<li>\r\n	<p><img src=\"http://a-group.com.tr/media/images/aksem-gorsel.jpg\" /></p>\r\n\r\n	<h1>Aksem Kalıp</h1>\r\n\r\n	<p>Our sister company, AKPLAS has been in the plastics sector serving for White Goods&amp;Household Appliances and Automotive Industries for a long time and has established a tooling division to widen customer satisfaction in 1997. This division has become bigger, developed itself in a short time and has established as a sister company of AKPLAS with...</p>\r\n	<a href=\"http://a-group.com.tr/en/grup_sirketleri/aksem-kalip-3\">continuation</a></li>\r\n	<li>\r\n	<p><img src=\"http://a-group.com.tr/media/images/ymb-gorsel_1.jpg\" /></p>\r\n\r\n	<h1>Ymb</h1>\r\n\r\n	<p>YMB Teknolojik &Uuml;r&uuml;nler Pazarlama şirketi, A GRUP B&uuml;nyesindeki &ouml;zg&uuml;n &uuml;r&uuml;nlerin satışı, pazarlanması ve &ccedil;eşitli uluslararası &uuml;reticilerin yurt i&ccedil;i distrib&uuml;t&ouml;rl&uuml;k faaliyetlerini s&uuml;rd&uuml;rmek amacıyla 2013 yılında kurulmuştur. YMB, &uuml;lkemize ve sanayi sekt&ouml;rlerine...</p>\r\n	<a href=\"http://a-group.com.tr/en/grup_sirketleri/ymb-4\">continuation</a></li>\r\n</ul>', 'True');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shopcart`
--

CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `surname`, `image`, `status`, `created_at`, `updated_at`, `address`, `phone`, `city`) VALUES
(0, 'ozan@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$TmF1RDA4V2hQUmxUQnNBMw$OJACbkOZT+leMXWbZvsS7uhM1ERPF2NojbTVR7i1QVQ', 'Ozan', 'Ergön', '3383277469ee2dacc83f55e8e4cb859d.jpeg', 'True', NULL, NULL, NULL, NULL, NULL),
(1, 'ibo@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZllFZHI2eVI4YkE2WlBxaw$dI3RHxGikTlVgjktv8LJUMCUMUqA6vU7nJ7bJfSezsU', 'İbrahim', 'Kupşik', '924c1d3f0fda79fd2943dce3a2f5b8ac.jpeg', 'True', NULL, NULL, NULL, NULL, NULL),
(2, 'ibocaan@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$QVIvSW1jd2ZXeFQyOXd1Tw$z60BrKWrNOj8bC5+8xi5I3hWmNIHC2Qonog61sI0gv0', 'İbrahim', 'Can', NULL, 'True', NULL, NULL, NULL, NULL, NULL),
(3, 'ayse@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$TmF1RDA4V2hQUmxUQnNBMw$OJACbkOZT+leMXWbZvsS7uhM1ERPF2NojbTVR7i1QVQ', 'Ayse', 'Can', '9d97344aa070d68a34261584c4972ce8.jpeg', 'True', NULL, NULL, '100. Yıl Mah 1005 Sokak. GüzelYurt Sitesi', '0554 784 4544', 'Karabük'),
(5, 'mehmet1@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$MWVHd2xTMjd4TW1yem04bw$mMaRb+DxpIv2XiZNQe3GI1n9E40/GgTV9uzXHd76fPk', 'Mehmet', 'Kaya', NULL, 'True', NULL, NULL, 'Yüzüncü Yıl Mah.', '05555555555', 'Karabük'),
(6, 'ali@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$QXhadmtvaXJrWFp3ZWQuUA$7vYqSIYIBL67iWwkHH1jllmhDMwS265axZ2N6sR/nxE', 'Ali', 'Can', '987da56559a4a4032bc1d87b9c91086e.jpeg', 'True', NULL, NULL, NULL, NULL, NULL),
(111, 'aleyna@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$L2hqcnlVeHladWJieG01Mw$o89vySfkx/I3qNAxmJAvJuP0jGpR2pSuZlRdpgQyXhk', 'aleyna', 'bilgin', '22a49d6703fa491368efba2d49a997d7.jpeg', 'True', NULL, NULL, 'Yüzüncü Yıl', '555', 'İstanbul'),
(128, 'yukselcelik@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$SE1Tb21MUU1udkVyaDZLYw$SGfO1dxF6PTtqc/3SQKAdCN7SAZ2WAdaiAmNv13hUW8', 'yüksel', 'çelik', '74dc93b65d62532a7d9031cf9e5935a6.jpeg', 'True', NULL, NULL, 'Yüzüncü Yıl', '555', 'Karabük'),
(130, 'ozi@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$Wi9WQVNGRXJvSjJGQ2I1Yg$1vjG2GTJ6nIP/3Y76nUcM0C6SQUx8lIwAlBOSzeEzr8', 'ozi', 'ozi', NULL, 'True', NULL, NULL, 'qwe', '123', 'qwe');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F4584665A` (`product_id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Tablo için indeksler `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `shopcart`
--
ALTER TABLE `shopcart`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Tablo için AUTO_INCREMENT değeri `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `shopcart`
--
ALTER TABLE `shopcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Tablo kısıtlamaları `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

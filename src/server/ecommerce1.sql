-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2019 at 04:21 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'hoannguyen', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bukti_bayar`
--

DROP TABLE IF EXISTS `bukti_bayar`;
CREATE TABLE IF NOT EXISTS `bukti_bayar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_code` varchar(255) NOT NULL,
  `bukti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prodName` varchar(255) NOT NULL,
  `prodPrice` int(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `DateOrder` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `checkoutstat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `prod_id`, `prodName`, `prodPrice`, `qty`, `DateOrder`, `checkoutstat_id`) VALUES
(2, 20, 1, 'Jaeger-LeCoultre', 120000, 2, '2019-12-22 22:04:57', 2),
(17, 17, 4, 'Muslimah', 80000, 2, '2018-08-27 11:49:36', 3),
(27, 20, 3, 'Audemars Piguet', 90000, 1, '2019-12-22 22:08:37', 2),
(28, 2, 6, 'Baume & Mercier', 1250000, 2, '2019-12-22 22:10:47', 3),
(29, 2, 2, 'Lange & Söhne', 130000, 1, '2019-12-22 22:55:20', 3),
(31, 2, 5, 'Cartier', 65000, 2, '2019-12-22 23:09:36', 5);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 'Smart Watches', '2019-05-11 04:25:00', '2019-12-20 12:54:04'),
(2, 'Classic', '2019-04-12 14:15:44', '2019-07-19 14:15:44'),
(3, 'Top Trend', '2018-08-25 14:15:49', '2019-12-22 21:46:41'),
(4, 'Event Watches', '2018-08-25 14:15:55', '2019-12-22 21:46:52'),
(5, 'New Watches', '2018-08-25 14:16:15', '2019-12-22 21:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
CREATE TABLE IF NOT EXISTS `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `orderID` varchar(255) DEFAULT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_price` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `subtotal` int(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_add` varchar(255) NOT NULL,
  `ship_phone` varchar(25) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `dev_meth` varchar(255) NOT NULL,
  `dev_price` int(255) NOT NULL,
  `itemstatus_id` int(11) NOT NULL,
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id`, `user_id`, `cart_id`, `orderID`, `prod_name`, `prod_price`, `quantity`, `subtotal`, `ship_name`, `ship_add`, `ship_phone`, `bank`, `dev_meth`, `dev_price`, `itemstatus_id`, `orderDate`) VALUES
(2, 20, 25, '00011', 'Ali Marguter', 120000, 1, 120000, 'hoannguyen', 'VietNam', '0377601559', 'BNI - 5264-2227-3113-6537', 'TiKi', 10000, 3, '2019-12-22 19:04:54'),
(5, 2, 28, '00012', 'Baume & Mercier', 1250000, 2, 2500000, 'hoannguyen', 'VietNam', '0377601559', 'VietComBank IB - 1245-343-2334-3433', 'Grap', 15000, 3, '2019-12-22 23:07:51'),
(6, 2, 29, '00012', 'Lange & Söhne', 130000, 1, 130000, 'hoannguyen', 'VietNam', '0377601559', 'VietComBank IB - 1245-343-2334-3433', 'Grap', 15000, 3, '2019-12-22 23:07:51'),
(7, 2, 31, '00013', 'Cartier', 65000, 2, 130000, 'hoannguyen', 'VietNam', '0377601559', 'Payment on delivery', 'Pos Viettel', 6000, 5, '2019-12-22 23:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `method`, `price`) VALUES
(1, 'TiKi', 10000),
(2, 'Go-Viet', 20000),
(3, 'Grap', 15000),
(4, 'GHN', 9000),
(5, 'Pos Viettel', 6000),
(6, 'Best Now', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail`
--

DROP TABLE IF EXISTS `inv_detail`;
CREATE TABLE IF NOT EXISTS `inv_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `orderID` varchar(255) DEFAULT NULL,
  `INV` varchar(255) DEFAULT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_price` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `subtotal` int(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_add` varchar(255) NOT NULL,
  `ship_phone` varchar(25) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `dev_meth` varchar(255) NOT NULL,
  `dev_price` int(255) NOT NULL,
  `itemstatus_id` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `confirmDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_detail`
--

INSERT INTO `inv_detail` (`id`, `user_id`, `orderID`, `INV`, `prod_name`, `prod_price`, `quantity`, `subtotal`, `ship_name`, `ship_add`, `ship_phone`, `bank`, `dev_meth`, `dev_price`, `itemstatus_id`, `orderDate`, `confirmDate`) VALUES
(2, 20, '00011', '00009', 'Hot Watches', 120000, 1, 120000, 'hoannguyen', 'VietNam', '0377601559', 'BNI - 5264-2227-3113-6537', 'TiKi', 10000, 3, '2019-12-22 19:04:54', '2019-12-22 19:11:01'),
(3, 2, '00012', '00010', 'Baume & Mercier', 1250000, 2, 2500000, 'hoannguyen', 'VietNam', '0377601559', 'VietComBank IB - 1245-343-2334-3433', 'Grap', 15000, 3, '2019-12-22 23:07:51', '2019-12-22 23:08:40'),
(4, 2, '00012', '00010', 'Lange & Söhne', 130000, 1, 130000, 'hoannguyen', 'VietNam', '0377601559', 'VietComBank IB - 1245-343-2334-3433', 'Grap', 15000, 3, '2019-12-22 23:07:51', '2019-12-22 23:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `inv_header`
--

DROP TABLE IF EXISTS `inv_header`;
CREATE TABLE IF NOT EXISTS `inv_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `INV` varchar(255) DEFAULT NULL,
  `grandtotal` int(255) DEFAULT NULL,
  `itemstatus_id` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `confirmDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_header`
--

INSERT INTO `inv_header` (`id`, `user_id`, `INV`, `grandtotal`, `itemstatus_id`, `orderDate`, `confirmDate`) VALUES
(1, 3, '00001', 130000, 8, '2018-08-27 07:41:18', '2018-08-27 08:16:21'),
(2, 3, '00002', 169000, 3, '2018-08-27 08:28:50', '2018-08-27 08:29:26'),
(3, 13, '00003', 136000, 3, '2018-08-27 08:29:12', '2018-08-27 08:29:27'),
(4, 7, '00004', 105000, 8, '2018-08-27 08:29:50', '2018-08-27 08:30:01'),
(5, 17, '00005', 424000, 3, '2018-08-27 11:51:11', '2018-08-27 11:52:04'),
(6, 19, '00006', 490000, 3, '2018-08-27 14:29:06', '2018-08-27 14:29:57'),
(7, 19, '00007', 380000, 8, '2018-08-27 14:38:42', '2018-08-27 14:39:09'),
(8, 17, '00008', 140000, 3, '2018-08-27 16:21:01', '2018-08-27 16:22:14'),
(9, 20, '00009', 130000, 3, '2019-12-22 19:04:54', '2019-12-22 19:11:01'),
(10, 2, '00010', 2645000, 3, '2019-12-22 23:07:51', '2019-12-22 23:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `itemstatus`
--

DROP TABLE IF EXISTS `itemstatus`;
CREATE TABLE IF NOT EXISTS `itemstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemstatus`
--

INSERT INTO `itemstatus` (`id`, `status`) VALUES
(1, 'unpaid'),
(2, 'cart'),
(3, 'paid'),
(4, 'failed'),
(5, 'process'),
(6, 'expired'),
(7, 'beingsent'),
(8, 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `prod_img` varchar(255) DEFAULT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_price` int(255) NOT NULL,
  `prod_desc` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `cat_id`, `prod_img`, `prod_name`, `prod_price`, `prod_desc`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 1, 'box1.jpg', 'Jaeger-LeCoultre', 120000, 'The Swiss watch brand was established in 1833 and is known for its classic designs, especially the Reverso (left), which was developed in 1931. ', '2019-03-22 14:16:55', '2019-11-16 12:45:03'),
(2, 1, 'box2.jpg', 'Lange & Söhne', 130000, 'The German watchmaker was established by Ferdinand Adolph Lange in the town of Glashütte in 1845. For the next 100 years, it was known for pocket watches and then took a 45-year hiatus after the World War II. ', '2019-02-27 14:51:08', '2019-02-15 12:51:08'),
(3, 2, 'box3.jpg', 'Audemars Piguet', 90000, 'Audemars Piguet, which Jules-Louis Audemars and Edward-Auguste Piguet founded in 1875, changed the luxury watch game when it debuted the Royal Oak in 1972. The hefty steel timepiece was a notable departure.', '2018-08-25 14:54:07', '2019-12-22 21:32:40'),
(4, 2, 'box4.jpg', 'Piaget', 80000, '\r\nCOURTESY\r\nGeorges-Édouard Piaget set up his first workshop on his family farm in the village of La Côte-aux-Fées in the Swiss mountains in 1874, launching the brand that is now known for offering the thinnest automatic watch in the world.', '2018-08-25 14:54:50', '2019-12-22 21:33:10'),
(5, 5, 'box8.jpg', 'Cartier', 65000, 'Louis-François Cartier founded the iconic jewelry brand in Paris in 1847. Seventy years later, his grandson, Louis Cartier, invented the famous Tank Watch, which was modeled on a military tank.', '2018-08-25 15:16:15', '2019-12-22 21:33:33'),
(6, 4, 'box6.jpg', 'Baume & Mercier', 1250000, 'This Swiss brand is known for offering quality timepieces that won\'t break the bank. Brothers Louis-Victor and Célestin Baume founded the company in Les Bois, a village in the Swiss Jura, in 1830 with the motto', '2018-08-25 15:18:22', '2019-12-22 21:33:59'),
(7, 2, 'box7.jpg', 'Ulysse Nardin\r\n', 85000, 'Ulysse Nardin founded his brand in Le Locle, Switzerland in 1846 after training in watchmaking under his father. The company has long been associated with the nautical world, and by the 1870s more than 50 of the world\'s navies and international.', '2018-08-27 08:13:04', '2019-12-22 21:34:32'),
(8, 3, 'box12.jpg', 'Vacheron Constantin', 54000000, 'Vacheron Constantin is among the oldest luxury watch manufacturers in the world, having been founded in Geneva by Jean-Marc Vacheron in 1755. The watches, which are known for their extensive complications, have been worn on the wrists of famous figures like Napoleon', '2019-12-22 23:18:58', '2019-12-22 23:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE IF NOT EXISTS `userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `birth` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`id`, `fullname`, `birth`, `username`, `password`, `gender`, `phone`, `email`, `address`, `CreatedDate`, `UpdatedDate`) VALUES
(2, 'hoannguyen', '2019-12-05', 'hoannguyen', '$2b$10$zI9H/FNuSEcpihOTrvwLTOfudfJ9uWbAWS3csBF7BrCIBiWsSFUGS', 'Man', '0377601559', 'dinhhoannguyen999@gmail.com', 'VietNam', '2019-12-22 18:14:09', '2019-12-22 21:48:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

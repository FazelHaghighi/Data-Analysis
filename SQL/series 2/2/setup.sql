use ashpazbashi;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 03:57 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ashpazbashi`
--

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `recipe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `recipe`) VALUES
(1, 'Asian Chicken Salad', 'Preheat broiler. Place a stainless steel (be sure the handle is also stainless steel) or cast iron skillet in the broiler, about 7 inches from the heat source, to get it very hot. Season chicken with a little salt and pepper.\r\nIf you are using hijiki or arame place it in a small bowl of hot water to soften for about 10 minutes.\r\nWhile pan is heating, thinly slice cabbage, and shred carrot. Carrot is easily shredded in food processor with shredding blade. Otherwise you can shred it by hand, or slice it thin. Chop cilantro and scallion cabbage and carrot mixture. Add sliced almonds. Squeeze excess water from hijiki, chop if needed, and add to salad.\r\nWhen pan is hot, about 10 minutes, remove from broiler, and place chicken in pan, skin side up, and return to broiler. Cook for about 15 minutes depending on thickness of chicken. This is our Quick Broil cooking method. When done and cool enough to touch, remove skin, and cut into bite-size pieces.\r\nWhisk together olive oil, soy sauce, rice vinegar, honey, red pepper flakes, salt, and pepper. Toss with cabbage mixture and chicken. Sprinkle with sesame seeds. (You can buy sesame seeds that are already toasted.)'),
(2, 'Ghorme Sabzi', 'Something @hamid_ashpazbashi2'),
(3, 'Sample Food', 'Hello @hamid_ashpazbashi2! Yes @hamid_ashpazbashi2@hamid_ashpazbashi2@hamid_ashpazbashi2@hamid_ashpazbashi2@hamid_ashpazbashi2@hamid_ashpazbashi2'),
(4, 'Something @hamid_ashpazbashi2', '@hamid_ashpazbashi2'),
(5, 'Something', ''),
(6, 'Something', ''),
(7, 'Something', ''),
(8, 'Something', ''),
(9, 'Something', ''),
(10, 'Something', ''),
(11, 'Something', ''),
(12, 'Something', '');

-- --------------------------------------------------------

--
-- Table structure for table `food_ingredients`
--

CREATE TABLE `food_ingredients` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_ingredients`
--

INSERT INTO `food_ingredients` (`id`, `food_id`, `ingredient_id`, `amount`) VALUES
(1, 1, 5, '4.00'),
(2, 1, 1, '5.00'),
(3, 1, 2, '1.00'),
(4, 4, 1, '1.00'),
(5, 3, 1, '4.00'),
(6, 3, 2, '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `price_per_unit`) VALUES
(1, 'egg', '2.00'),
(2, 'salt', '1.00'),
(3, 'sugar', '1.00'),
(4, 'chocolate', '5.00'),
(5, 'vanilla extract', '1.50'),
(6, 'flour', '1.80');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `rate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `food_id`, `rate`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 5),
(4, 2, 2, 5),
(5, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
(1, 'quera'),
(2, 'nima');

-- --------------------------------------------------------

--
-- Table structure for table `user_ingredients`
--

CREATE TABLE `user_ingredients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_ingredients`
--

INSERT INTO `user_ingredients` (`id`, `user_id`, `ingredient_id`, `amount`) VALUES
(1, 1, 1, '5.00'),
(2, 1, 2, '1.00'),
(3, 1, 5, '4.00'),
(4, 2, 1, '10.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id,food_id` (`user_id`,`food_id`) USING BTREE,
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_ingredients`
--
ALTER TABLE `user_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_ingredients`
--
ALTER TABLE `user_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  ADD CONSTRAINT `food_ingredients_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  ADD CONSTRAINT `food_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_ingredients`
--
ALTER TABLE `user_ingredients`
  ADD CONSTRAINT `user_ingredients_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `user_ingredients_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

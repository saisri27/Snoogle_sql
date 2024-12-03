

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `snoogle`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(30) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Saisri', 'ma153@snu.edu.in', 'Saisri');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` varchar(20) NOT NULL,
  `booked_on` datetime NOT NULL DEFAULT current_timestamp(),
  `booking_date` varchar(30) NOT NULL,
  `from_time` int(2) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

DELIMITER //
CREATE PROCEDURE insert_record(
    IN booking_id INT,
    IN user_id INT,
    IN room_id VARCHAR(20),
    IN booking_date varchar(30),
    IN from_time INT,
    IN price INT
)
BEGIN
    INSERT INTO bookings (
        booking_id, 
        user_id, 
        room_id, 
        booking_date, 
        from_time, 
        price
    ) VALUES (
        booking_id, 
        user_id, 
        room_id, 
        booking_date, 
        from_time, 
        price
    );
END //
DELIMITER ;

CALL insert_record(1, 6, 'A231', '2023-11-05', 6, 200);

-- --------------------------------------------------------

--
-- Table structure for table `clubrooms`
--

CREATE TABLE `clubrooms` (
  `s_no` int(10) NOT NULL,
  `room_id` varchar(20) NOT NULL,
  `block` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'available',
  `capacity` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `image` varchar(150) NOT NULL,
  `size` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clubrooms`
--

INSERT INTO `clubrooms` (`s_no`, `room_id`, `block`, `type`, `capacity`, `price`, `image`, `size`) VALUES
(10, 'A231', 'A', 'available', 230, 200, './assets/img/products/verylargeclass.jpg', 'VeryLarge'),
(6, 'B016', 'B', 'available', 120, 0, 'assets/img/products/largeclass.jpg', 'Large'),
(1, 'B315', 'B', 'available', 350, 100, 'assets/img/products/verylargeclass.jpg', 'VeryLarge'),
(7, 'C013', 'C', 'available', 100, 100, 'assets/img/products/largeclass.jpg', 'Large'),
(8, 'C016', 'C', 'unavailable', 30, 0, 'assets/img/products/smallclass.png', 'Small'),
(11, 'C309', 'C', 'available', 120, 100, './assets/img/products/mediumclass.jpg', 'Large'),
(9, 'D117', 'D', 'available', 170, 120, 'assets/img/products/largeclass.jpg', 'Large'),
(2, 'D313', 'D', 'available', 50, 200, 'assets/img/products/largeclass.jpg', 'Large'),
(3, 'D317', 'D', 'available', 30, 150, 'assets/img/products/mediumclass.jpg', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `gatepass`
--

CREATE TABLE `gatepass` (
  `s_no` int(30) NOT NULL,
  `pass_code` varchar(30) NOT NULL,
  `u_id` int(30) NOT NULL,
  `security_id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `ph_number` varchar(10) NOT NULL,
  `purpose` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `approval_status` varchar(30) NOT NULL DEFAULT 'unapproved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gatepass`
--
DELIMITER //
CREATE PROCEDURE insert_gatepass(
    IN s_no INT,
    IN pass_code VARCHAR(30),
    IN u_id INT,
    IN security_id INT,
    IN `name` VARCHAR(30),
    IN ph_number VARCHAR(10),
    IN purpose TEXT,
    IN `date` DATETIME,
    IN approval_status VARCHAR(30)
)
BEGIN
    INSERT INTO gatepass (
        s_no,
        pass_code,
        u_id,
        security_id,
        `name`,
        ph_number,
        purpose,
        `date`,
        approval_status
    ) VALUES (
        s_no,
        pass_code,
        u_id,
        security_id,
        `name`,
        ph_number,
        purpose,
        `date`,
        approval_status
        
    );
END //
DELIMITER ;

--
-- Dumping data for table `gatepass`
--

call insert_gatepass(40, '3VWW4W9S', 6, 1, 'bantu', '9014697742', 'Delivery', '2023-11-11 23:38:35', 'approved');
-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `s_no` int(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` varchar(30) NOT NULL,
  `amount` int(30) NOT NULL DEFAULT 0,
  `reason` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

DELIMITER //
CREATE PROCEDURE insert_payments(
    IN s_no INT,
    IN user_id int(11),
    IN seller_id varchar(30),
    IN amount int(30),
    IN reason VARCHAR(30),
    IN `date` DATETIME   
)
BEGIN
    INSERT INTO payments (
        s_no,
        user_id ,
        seller_id,
         amount,
         reason ,
         `date`
  ) VALUES (
        s_no,
        user_id ,
        seller_id,
         amount,
         reason ,
         `date`
        
    );
END //
DELIMITER ;

call insert_payments(2, 6, 'naveen', 30, 'coffee', '2023-11-03 14:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE `security` (
  `sec_id` int(11) NOT NULL,
  `security_name` varchar(100) NOT NULL,
  `security_email` varchar(225) CHARACTER SET macce COLLATE macce_general_nopad_ci NOT NULL,
  `security_password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `security`
--

INSERT INTO `security` (`sec_id`, `security_name`, `security_email`, `security_password`) VALUES
(1, 'Snehith Security', 'snehithsec@gmail.com', 'security');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--


-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shop_id` int(30) NOT NULL,
  `shop_name` varchar(30) NOT NULL,
  `shop_password` varchar(100) NOT NULL,
  `shop_email` varchar(30) NOT NULL,
  `shop_wallet` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shop_id`, `shop_name`, `shop_password`, `shop_email`, `shop_wallet`) VALUES
(3, 'admin', 'adminshop', 'admin@gmail.com', 2400),
(5, 'annas', 'annashop', 'anna@gmail.com', 1040),
(2, 'naveen', 'naveenshop', 'naveen@gmail.com', 200);

-- --------------------------------------------------------

--
-- Table structure for table `sportsvenue`
--

CREATE TABLE `sportsvenue` (
  `s_no` int(10) NOT NULL,
  `venue_id` varchar(20) NOT NULL,
  `sport` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'available',
  `price` int(20) NOT NULL,
  `image` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sportsvenue`
--

INSERT INTO `sportsvenue` (`s_no`, `venue_id`, `sport`, `status`, `price`, `image`, `type`) VALUES
(22, 'badminton_1', 'Badminton', 'unavailable', 0, 'assets/img/products/badminton.jpg', 'unpaid'),
(23, 'badminton_2', 'Badminton', 'unavailable', 0, 'assets/img/products/badminton.jpg', 'unpaid'),
(24, 'badminton_3', 'Badminton', 'available', 0, 'assets/img/products/badminton.jpg', 'unpaid'),
(25, 'badminton_4', 'Badminton', 'available', 100, 'assets/img/products/badminton.jpg', 'paid'),
(6, 'basketball_1', 'Basketball', 'available', 0, 'assets/img/products/basketball.jpg', 'unpaid'),
(8, 'basketball_2', 'Basketball', 'available', 0, 'assets/img/products/basketball.jpg', 'unpaid'),
(9, 'basketball_3', 'Basketball', 'available', 30, 'assets/img/products/basketball.jpg', 'paid'),
(7, 'basketball_4', 'Basketball', 'available', 0, 'assets/img/products/basketball.jpg', 'unpaid'),
(1, 'cricket_1', 'Cricket', 'unavailable', 0, 'assets/img/products/cricket.png', 'unpaid'),
(2, 'cricket_2', 'Cricket', 'available', 0, 'assets/img/products/cricket.png', 'unpaid'),
(3, 'cricket_3', 'Cricket', 'available', 0, 'assets/img/products/cricket.png', 'unpaid'),
(4, 'cricket_4', 'Cricket', 'available', 0, 'assets/img/products/cricket.png', 'unpaid'),
(5, 'cricket_5', 'Cricket', 'available', 100, 'assets/img/products/cricket.png', 'paid'),
(10, 'football_1', 'Football', 'available', 0, 'assets/img/products/football.jpg', 'unpaid'),
(11, 'football_2', 'Football', 'unavailable', 0, 'assets/img/products/football.jpg', 'unpaid'),
(17, 'tabletennis_1', 'TableTennis', 'available', 0, 'assets/img/products/tt.png', 'unpaid'),
(18, 'tabletennis_2', 'TableTennis', 'unavailable', 0, 'assets/img/products/tt.png', 'unpaid'),
(19, 'tabletennis_3', 'TableTennis', 'available', 0, 'assets/img/products/tt.png', 'unpaid'),
(20, 'tabletennis_4', 'TableTennis', 'unavailable', 0, 'assets/img/products/tt.png', 'unpaid'),
(21, 'tabletennis_5', 'TableTennis', 'available', 20, 'assets/img/products/tt.png', 'paid'),
(12, 'tennis_1', 'Tennis', 'available', 0, 'assets/img/products/tennis.png', 'unpaid'),
(13, 'tennis_2', 'Tennis', 'available', 0, 'assets/img/products/tennis.png', 'unpaid'),
(14, 'tennis_3', 'Tennis', 'unavailable', 0, 'assets/img/products/tennis.png', 'unpaid'),
(15, 'tennis_4', 'Tennis', 'available', 0, 'assets/img/products/tennis.png', 'unpaid'),
(16, 'tennis_5', 'Tennis', 'available', 30, 'assets/img/products/tennis.png', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `user_due` int(10) NOT NULL DEFAULT 0,
  `user_limit` int(10) NOT NULL DEFAULT 5000,
  `email` varchar(40) NOT NULL,
  `user_status` varchar(30) NOT NULL DEFAULT 'unblocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `phonenumber`, `user_due`, `user_limit`, `email`, `user_status`) VALUES
(6, 'Snehith', 'snehith', '8309249399', 420, 4580, 'snehithmadala@gmail.com', 'unblocked'),
(7, 'maddirala', 'maddirala', '9876543210', 0, 5000, 'maddirala@gmail.com', 'unblocked'),
(8, 'venkat', 'venkat', '9999999999', 0, 5000, 'venkat@gmail.com', 'unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `venue_bookings`
--

CREATE TABLE `venue_bookings` (
  `booking_id` int(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `venue_id` varchar(20) NOT NULL,
  `booked_on` datetime NOT NULL DEFAULT current_timestamp(),
  `booking_date` varchar(30) NOT NULL,
  `from_time` int(2) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_bookings`
--

INSERT INTO `venue_bookings` (`booking_id`, `user_id`, `venue_id`, `booked_on`, `booking_date`, `from_time`, `price`) VALUES
(1, 6, 'badminton_4', '2022-04-25 15:46:29', '11/07/2023', 7, 100),
(2, 6, 'badminton_4', '2022-04-25 16:11:30', '11/05/2023', 7, 100),
(3, 6, 'badminton_4', '2022-04-25 16:39:59', '11/05/2023', 8, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `us_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `clubrooms`
--
ALTER TABLE `clubrooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `s_no` (`s_no`);

--
-- Indexes for table `gatepass`
--
ALTER TABLE `gatepass`
  ADD PRIMARY KEY (`s_no`),
  ADD KEY `user_id` (`u_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`s_no`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `u_id` (`user_id`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD PRIMARY KEY (`sec_id`);

--
-- Indexes for table `shop`
--


--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shop_name`),
  ADD UNIQUE KEY `shop_id` (`shop_id`);

--
-- Indexes for table `sportsvenue`
--
ALTER TABLE `sportsvenue`
  ADD PRIMARY KEY (`venue_id`),
  ADD UNIQUE KEY `s_no` (`s_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `venue_bookings`
--
ALTER TABLE `venue_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `use_id` (`user_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clubrooms`
--
ALTER TABLE `clubrooms`
  MODIFY `s_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gatepass`
--
ALTER TABLE `gatepass`
  MODIFY `s_no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `s_no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `security`
--
ALTER TABLE `security`
  MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop`
--


--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shop_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sportsvenue`
--
ALTER TABLE `sportsvenue`
  MODIFY `s_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `venue_bookings`
--
ALTER TABLE `venue_bookings`
  MODIFY `booking_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `clubrooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `us_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gatepass`
--
ALTER TABLE `gatepass`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `shops` (`shop_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venue_bookings`
--
ALTER TABLE `venue_bookings`
  ADD CONSTRAINT `use_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venue_id` FOREIGN KEY (`venue_id`) REFERENCES `sportsvenue` (`venue_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;



-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2022 at 09:08 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soft_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_details`
--

CREATE TABLE `assign_details` (
  `assign_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `emp_assigner` varchar(50) NOT NULL,
  `pro_file` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `manager_id` varchar(50) DEFAULT NULL,
  `datetime_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assign_details`
--

INSERT INTO `assign_details` (`assign_id`, `pro_name`, `emp_assigner`, `pro_file`, `status`, `manager_id`, `datetime_created`) VALUES
(5, 'demo', 'mahesh', 'Assign/Project-details/19.jfif', 'in-process', NULL, '2022-04-01 14:19:31.291523'),
(6, 'demo', 'sri', 'Assign/Project-details/22.jfif', 'completed', NULL, '2022-04-01 14:19:31.291523'),
(7, 'demo', 'sri', 'Assign/Project-details/22_9rS6bBQ.jfif', 'completed', '23', '2022-04-01 14:19:31.291523'),
(8, 'demo', 'sri', 'Assign/Project-details/23.jfif', 'in-process', '23', '2022-04-01 14:19:31.291523'),
(9, 'demo', 'mahesh', 'Assign/Project-details/15.jpg', 'completed', '23', '2022-04-01 14:19:31.291523'),
(10, 'demo', 'mahesh', 'Assign/Project-details/15_loByn3i.jpg', NULL, '23', '2022-04-01 14:19:31.291523'),
(11, 'pro-1', 'mahesh', 'Assign/Project-details/21.jfif', NULL, '23', '2022-04-01 14:19:31.291523'),
(12, 'pro-1', 'mahesh2', 'Assign/Project-details/21_lFnOhei.jfif', NULL, '23', '2022-04-03 12:32:21.059797');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add employees', 7, 'add_employees'),
(26, 'Can change employees', 7, 'change_employees'),
(27, 'Can delete employees', 7, 'delete_employees'),
(28, 'Can view employees', 7, 'view_employees'),
(29, 'Can add project', 8, 'add_project'),
(30, 'Can change project', 8, 'change_project'),
(31, 'Can delete project', 8, 'delete_project'),
(32, 'Can view project', 8, 'view_project'),
(33, 'Can add assign_project', 9, 'add_assign_project'),
(34, 'Can change assign_project', 9, 'change_assign_project'),
(35, 'Can delete assign_project', 9, 'delete_assign_project'),
(36, 'Can view assign_project', 9, 'view_assign_project'),
(37, 'Can add task', 10, 'add_task'),
(38, 'Can change task', 10, 'change_task'),
(39, 'Can delete task', 10, 'delete_task'),
(40, 'Can view task', 10, 'view_task');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'adminapp', 'employees'),
(8, 'adminapp', 'project'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'managerapp', 'assign_project'),
(10, 'managerapp', 'task'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-25 05:39:41.403243'),
(2, 'auth', '0001_initial', '2022-03-25 05:39:42.848530'),
(3, 'admin', '0001_initial', '2022-03-25 05:39:43.256525'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-25 05:39:43.275589'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-25 05:39:43.299523'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-25 05:39:43.427752'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-25 05:39:43.556335'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-25 05:39:43.591764'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-25 05:39:43.607720'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-25 05:39:43.715774'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-25 05:39:43.721397'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-25 05:39:43.740960'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-25 05:39:43.773947'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-25 05:39:43.807547'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-25 05:39:43.847927'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-25 05:39:43.865902'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-25 05:39:43.893826'),
(18, 'sessions', '0001_initial', '2022-03-25 05:39:43.996891'),
(19, 'adminapp', '0001_initial', '2022-03-28 06:08:41.456230'),
(20, 'adminapp', '0002_remove_employees_id_card', '2022-03-28 06:55:56.279492'),
(21, 'adminapp', '0003_project', '2022-03-28 08:13:46.315718'),
(22, 'adminapp', '0004_alter_employees_emp_date_birth', '2022-03-28 12:31:17.334215'),
(23, 'adminapp', '0005_alter_employees_emp_addres', '2022-03-28 12:52:33.704041'),
(24, 'adminapp', '0006_auto_20220329_1046', '2022-03-29 05:16:44.871490'),
(25, 'managerapp', '0001_initial', '2022-03-29 08:21:26.447196'),
(26, 'managerapp', '0002_alter_assign_project_emp_assigner', '2022-03-29 08:22:30.118205'),
(27, 'managerapp', '0003_task', '2022-03-29 09:11:01.096327'),
(28, 'adminapp', '0007_employees_status', '2022-03-29 11:44:59.110463'),
(29, 'managerapp', '0004_task_manager_id', '2022-03-30 11:21:07.776388'),
(30, 'managerapp', '0005_auto_20220331_1207', '2022-03-31 06:37:24.624216'),
(31, 'managerapp', '0006_assign_project_manager_id', '2022-03-31 07:22:19.402167'),
(32, 'adminapp', '0008_project_status', '2022-03-31 11:33:01.277546'),
(33, 'adminapp', '0009_alter_project_status', '2022-03-31 12:07:02.729676'),
(34, 'adminapp', '0010_auto_20220401_1327', '2022-04-01 08:26:32.211655'),
(35, 'adminapp', '0011_auto_20220401_1356', '2022-04-01 08:26:32.218671'),
(36, 'adminapp', '0012_auto_20220401_1357', '2022-04-01 08:27:55.079458'),
(37, 'adminapp', '0013_auto_20220401_1401', '2022-04-01 08:31:59.436677'),
(38, 'adminapp', '0014_employees_datetime_created', '2022-04-01 08:46:52.907171'),
(39, 'adminapp', '0015_project_datetime_created', '2022-04-01 08:47:49.162326'),
(40, 'managerapp', '0007_auto_20220401_1419', '2022-04-01 08:49:31.372144');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('rw3v97rrkr8go663hdhgg3zwkg0f0d2v', '.eJyrVkrNLYjPTFGyMtIBMhMzc5SslIpLiyoTDY2MHdJBAnrJ-blKOmB1eYm5qUD53MSM1OIMI6BgbmJeYnpqEcQAYwQfxSSgWF6KiakZhnF47YMZBbWzuCizLDEvU6kWAKyTPBU:1nauGT:1EDI6_xSOnF9erPTSuPgDJrGIDda4ZXDStMLIMayyWE', '2022-04-17 07:03:09.239209');

-- --------------------------------------------------------

--
-- Table structure for table `emp_details`
--

CREATE TABLE `emp_details` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_phone` bigint(20) NOT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  `emp_pwd` varchar(100) NOT NULL,
  `emp_gender` varchar(50) NOT NULL,
  `emp_date_birth` datetime(6) NOT NULL,
  `emp_education` varchar(50) NOT NULL,
  `emp_designation` varchar(50) NOT NULL,
  `emp_photo` varchar(100) NOT NULL,
  `emp_addres` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `datetime_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_details`
--

INSERT INTO `emp_details` (`emp_id`, `emp_name`, `emp_phone`, `emp_email`, `emp_pwd`, `emp_gender`, `emp_date_birth`, `emp_education`, `emp_designation`, `emp_photo`, `emp_addres`, `status`, `datetime_created`) VALUES
(2, 'mahesh2', 8919134556, 'surya123@gmail.com', 'Anand@123', 'Male', '2022-04-05 00:00:00.000000', 'Graduation', 'Backend Developer', 'employees/images/22_6YI3FzG.jfif', 'guntur', 'Accepted', '2022-04-01 14:16:52.856163'),
(8, 'saddam', 8919134556, 'saddamoddin18@gmail.com', 'Anand@123', 'Male', '2022-03-31 00:00:00.000000', 'Graduation', 'App Developer', 'employees/images/01d9188f9c07105d983a0f757125fae5_M67DUKP.jpg', 'LB nagar', 'Accepted', '2022-04-01 14:16:52.856163'),
(13, 'surya', 8919134556, 'surya@gmail.com', 'Anand@123', 'Male', '2022-03-15 00:00:00.000000', 'Graduation', 'Manager', 'employees/images/2_zgQvAR3.jpg', 'guntur', 'Accepted', '2022-04-01 14:16:52.856163'),
(14, 'anand', 891913455, 'anand@123gmail.com', 'Anand@123', 'Female', '2022-03-15 00:00:00.000000', 'Postgraduation', 'Manager', 'employees/images/158-1581112_car-laptop-wallpaper-4k-lamborghini-red-bull.jpg', 'hyderabad', 'Accepted', '2022-04-01 14:16:52.856163'),
(23, 'srivani', 8919134556, 'suryaanand456@gmail.com', 'Surya@123', 'Female', '2022-03-31 00:00:00.000000', 'Graduation', 'Manager', 'employees/images/1.jpeg', 'guntur', 'Accepted', '2022-04-01 14:16:52.856163'),
(24, 'surya', 8919134556, 'suryaanand123@gmail.com', 'Anand@123', 'Male', '2022-04-06 00:00:00.000000', 'Graduation', 'Team Leader', 'employees/images/25.png', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(25, 'surya', 8919134556, 'suryanand123@gmail.com', 'Anand@123', 'Female', '2022-04-18 00:00:00.000000', 'Graduation', 'Team Leader', 'employees/images/20.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(26, 'surya', 8919134556, 'sri123@gmail.com', 'Anand@123', 'Male', '2022-04-12 00:00:00.000000', 'Graduation', 'Team Leader', 'employees/images/21.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(27, 'surya', 8919134556, 'suryaanand9852@gmail.com', 'Anand@123`', 'Male', '2022-04-20 00:00:00.000000', 'Graduation', 'Manager', 'employees/images/22.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(28, 'surya', 8919134556, 'suryaanand523@gmail.com', 'Anand@123', 'Female', '2022-04-14 00:00:00.000000', 'Graduation', 'Frontend Developer', 'employees/images/22_RT6zPFC.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(29, 'surya', 8919134556, 'suryaanand555@gmail.com', 'Anand@123', 'Male', '2022-04-05 00:00:00.000000', '10+2', 'Team Leader', 'employees/images/22_O32sABN.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163'),
(30, 'surya', 8919134556, 'surya11@gmail.com', 'Anand@123', 'Male', '2022-04-26 00:00:00.000000', 'Graduation', 'Frontend Developer', 'employees/images/22_b2O3s4U.jfif', 'demo', 'Accepted', '2022-04-01 14:16:52.856163');

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_assigner` varchar(50) NOT NULL,
  `pro_file` varchar(100) NOT NULL,
  `ending_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `datetime_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_details`
--

INSERT INTO `project_details` (`pro_id`, `pro_name`, `pro_assigner`, `pro_file`, `ending_date`, `start_date`, `status`, `datetime_created`) VALUES
(5, 'demo', 'surya', 'Project/Project-details/essay_1_VTTRIG8.zip', '2022-04-22 00:00:00.000000', '2022-03-30 00:00:00.000000', NULL, '2022-04-01 14:17:49.103893'),
(6, 'demo5', 'anand', 'Project/Project-details/essay_1_4MeoZ7p.zip', '2022-04-29 00:00:00.000000', '2022-03-30 00:00:00.000000', NULL, '2022-04-01 14:17:49.103893'),
(7, 'demo', 'srivani', 'Project/Project-details/Answer_7.html', '2022-03-31 00:00:00.000000', '2022-03-23 00:00:00.000000', 'completed', '2022-04-01 14:17:49.103893'),
(8, 'pro-1', 'srivani', 'Project/Project-details/21.jfif', '2022-04-29 00:00:00.000000', '2022-04-08 00:00:00.000000', 'Pending', '2022-04-01 14:17:49.103893');

-- --------------------------------------------------------

--
-- Table structure for table `task_details`
--

CREATE TABLE `task_details` (
  `task_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `emp_assigner` varchar(50) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `priorty` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `manager_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `datetime_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_details`
--

INSERT INTO `task_details` (`task_id`, `pro_name`, `emp_assigner`, `due_date`, `priorty`, `text`, `manager_id`, `status`, `datetime_created`) VALUES
(1, 'demo5', 'suryademo', '2022-03-23 00:00:00.000000', 'Medium', 'thumri', NULL, NULL, '2022-04-01 14:19:31.338243'),
(2, 'demo', 'suryademo', '2022-03-17 00:00:00.000000', 'Medium', 'guntur', NULL, NULL, '2022-04-01 14:19:31.338243'),
(3, 'demo5', 'demo', '2022-03-31 00:00:00.000000', 'Medium', 'bhooo', NULL, NULL, '2022-04-01 14:19:31.338243'),
(4, 'demo', 'demo', '2022-03-31 00:00:00.000000', 'Medium', 'hii', NULL, NULL, '2022-04-01 14:19:31.338243'),
(5, 'demo', 'demo', '2022-03-31 00:00:00.000000', 'High', 'hiii', '23', NULL, '2022-04-01 14:19:31.338243'),
(6, 'demo', 'demo', '2022-03-31 00:00:00.000000', 'Low', 'low', '23', NULL, '2022-04-01 14:19:31.338243'),
(7, 'demo', 'sri', '2022-03-31 00:00:00.000000', 'Medium', 'medium', '23', 'On-Track', '2022-04-01 14:19:31.338243'),
(8, 'select', 'mahesh', '2022-03-31 00:00:00.000000', 'Low', 'low', '23', 'completed', '2022-04-01 14:19:31.338243'),
(9, 'pro-1', 'mahesh', '2022-04-21 00:00:00.000000', 'Medium', 'demo', '23', NULL, '2022-04-01 14:19:31.338243'),
(10, 'pro-1', 'mahesh', '2022-04-28 00:00:00.000000', 'Medium', 'demo', '23', NULL, '2022-04-01 14:19:31.338243'),
(11, 'pro-1', 'mahesh2', '2022-04-20 00:00:00.000000', 'Medium', 'i need this file', '23', NULL, '2022-04-03 12:32:46.106322');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_details`
--
ALTER TABLE `assign_details`
  ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `emp_details`
--
ALTER TABLE `emp_details`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `task_details`
--
ALTER TABLE `task_details`
  ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_details`
--
ALTER TABLE `assign_details`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `emp_details`
--
ALTER TABLE `emp_details`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task_details`
--
ALTER TABLE `task_details`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

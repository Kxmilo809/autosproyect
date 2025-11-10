-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-11-2025 a las 15:17:31
-- Versión del servidor: 8.0.41
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `autos_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add Marca', 7, 'add_brand'),
(26, 'Can change Marca', 7, 'change_brand'),
(27, 'Can delete Marca', 7, 'delete_brand'),
(28, 'Can view Marca', 7, 'view_brand'),
(29, 'Can add Modelo de Auto', 8, 'add_carmodel'),
(30, 'Can change Modelo de Auto', 8, 'change_carmodel'),
(31, 'Can delete Modelo de Auto', 8, 'delete_carmodel'),
(32, 'Can view Modelo de Auto', 8, 'view_carmodel'),
(33, 'Can add Categoría', 9, 'add_category'),
(34, 'Can change Categoría', 9, 'change_category'),
(35, 'Can delete Categoría', 9, 'delete_category'),
(36, 'Can view Categoría', 9, 'view_category'),
(37, 'Can add Cliente', 10, 'add_client'),
(38, 'Can change Cliente', 10, 'change_client'),
(39, 'Can delete Cliente', 10, 'delete_client'),
(40, 'Can view Cliente', 10, 'view_client'),
(41, 'Can add Compra', 11, 'add_purchase'),
(42, 'Can change Compra', 11, 'change_purchase'),
(43, 'Can delete Compra', 11, 'delete_purchase'),
(44, 'Can view Compra', 11, 'view_purchase'),
(45, 'Can add Venta', 12, 'add_sale'),
(46, 'Can change Venta', 12, 'change_sale'),
(47, 'Can delete Venta', 12, 'delete_sale'),
(48, 'Can view Venta', 12, 'view_sale'),
(49, 'Can add Item de Venta', 13, 'add_saleitem'),
(50, 'Can change Item de Venta', 13, 'change_saleitem'),
(51, 'Can delete Item de Venta', 13, 'delete_saleitem'),
(52, 'Can view Item de Venta', 13, 'view_saleitem'),
(53, 'Can add Mantenimiento', 14, 'add_maintenance'),
(54, 'Can change Mantenimiento', 14, 'change_maintenance'),
(55, 'Can delete Mantenimiento', 14, 'delete_maintenance'),
(56, 'Can view Mantenimiento', 14, 'view_maintenance');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '!k227RfOYc02BM77zYYRjOjyNGZBR8RtuYTz1lR5s', NULL, 1, 'admin', '', '', 'admin@example.com', 1, 1, '2025-11-07 17:55:09.547677'),
(2, 'pbkdf2_sha256$1000000$7GNmv6J1uCl9Lgw9C62FWL$MACNDIncDKm6xXGtwlVSmWSKk1Uf9RG8r3TmZoyJFKA=', NULL, 0, 'usuario1', '', '', 'usuario1@example.com', 0, 1, '2025-11-07 17:57:05.800888'),
(3, 'pbkdf2_sha256$1000000$zyOLGUzg3IwrHiURY8lRUy$Lkw4C3/B68DeItLC51XDnUApCQg/PYRP+mOlexbK36U=', NULL, 0, 'usuario2', '', '', 'usuario2@example.com', 1, 1, '2025-11-07 17:57:26.202111'),
(4, 'pbkdf2_sha256$1000000$oAJmua4mO9RfAUz2eNhWLY$0Uaf2qgugUwCbCEVTITkXl+tWc8yvVt6ep/63aBIOo4=', '2025-11-07 18:00:12.688847', 1, 'admin2', '', '', 'admin2@example.com', 1, 1, '2025-11-07 17:58:50.133176'),
(5, 'pbkdf2_sha256$1000000$tt48Gt1KC1eTYWxUwt1Tu4$S61ekW5E+NEDbVzGaI8Eh3olYYHAHTIHhUhZ+3CkvW8=', '2025-11-10 15:15:36.724345', 1, 'administrador', '', '', 'administrador@gmail.com', 1, 1, '2025-11-10 15:15:15.442914');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorias_name_3c1315a8_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `name`) VALUES
(1, 'Deportivos'),
(5, 'Eléctricos'),
(3, 'Pickups'),
(4, 'Sedanes'),
(2, 'SUV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_email_c8fa8339_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `name`, `email`, `phone`) VALUES
(1, 'andres', 'andresp382@gmail.com', '98273847');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `client_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_purchase_client_id_a71f6c36_fk_clients_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'clients', 'client'),
(11, 'clients', 'purchase'),
(5, 'contenttypes', 'contenttype'),
(14, 'maintenance', 'maintenance'),
(12, 'sales', 'sale'),
(13, 'sales', 'saleitem'),
(6, 'sessions', 'session'),
(7, 'vehicles', 'brand'),
(8, 'vehicles', 'carmodel'),
(9, 'vehicles', 'category');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-11-07 17:43:45.460401'),
(2, 'auth', '0001_initial', '2025-11-07 17:43:46.247288'),
(3, 'admin', '0001_initial', '2025-11-07 17:43:46.429204'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-11-07 17:43:46.439234'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-07 17:43:46.449234'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-11-07 17:43:46.590027'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-11-07 17:43:46.680192'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-11-07 17:43:46.710695'),
(9, 'auth', '0004_alter_user_username_opts', '2025-11-07 17:43:46.720696'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-11-07 17:43:46.801162'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-11-07 17:43:46.805164'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-11-07 17:43:46.816721'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-11-07 17:43:46.894968'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-11-07 17:43:46.997594'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-11-07 17:43:47.022551'),
(16, 'auth', '0011_update_proxy_permissions', '2025-11-07 17:43:47.033708'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-11-07 17:43:47.122640'),
(18, 'clients', '0001_initial', '2025-11-07 17:43:47.241700'),
(19, 'clients', '0002_alter_client_options_alter_purchase_options', '2025-11-07 17:43:47.249215'),
(20, 'vehicles', '0001_initial', '2025-11-07 17:43:47.372814'),
(21, 'vehicles', '0002_category_alter_brand_options_alter_carmodel_options_and_more', '2025-11-07 17:43:47.908136'),
(22, 'vehicles', '0003_alter_carmodel_imagen', '2025-11-07 17:43:48.005001'),
(23, 'maintenance', '0001_initial', '2025-11-07 17:43:48.164124'),
(24, 'sales', '0001_initial', '2025-11-07 17:43:48.335747'),
(25, 'sessions', '0001_initial', '2025-11-07 17:43:48.388268'),
(26, 'clients', '0003_alter_client_email_alter_client_name_and_more', '2025-11-07 17:47:09.586281'),
(27, 'vehicles', '0004_alter_brand_name_alter_carmodel_brand_and_more', '2025-11-07 17:47:09.709715'),
(28, 'maintenance', '0002_alter_maintenance_cost_alter_maintenance_date_and_more', '2025-11-07 17:47:09.753244'),
(29, 'sales', '0002_alter_sale_date_alter_sale_total_and_more', '2025-11-07 17:47:09.821466'),
(30, 'vehicles', '0005_rename_auth_tables', '2025-11-07 17:49:55.782279'),
(31, 'vehicles', '0006_revert_builtin_tables', '2025-11-07 17:54:48.944291'),
(32, 'clients', '0004_alter_client_email_alter_client_name_and_more', '2025-11-07 18:04:36.292079'),
(33, 'maintenance', '0003_alter_maintenance_options_alter_maintenance_cost_and_more', '2025-11-07 18:04:36.310614'),
(34, 'vehicles', '0007_alter_brand_name_alter_carmodel_combustible_and_more', '2025-11-07 18:04:36.490332'),
(35, 'sales', '0003_alter_sale_options_alter_sale_total_and_more', '2025-11-07 18:04:36.532877');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_venta`
--

DROP TABLE IF EXISTS `items_venta`;
CREATE TABLE IF NOT EXISTS `items_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `car_model_id` bigint NOT NULL,
  `sale_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_venta_sale_id_car_model_id_b4b612af_uniq` (`sale_id`,`car_model_id`),
  KEY `sales_saleitem_car_model_id_913411db_fk_vehicles_carmodel_id` (`car_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientos`
--

DROP TABLE IF EXISTS `mantenimientos`;
CREATE TABLE IF NOT EXISTS `mantenimientos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` longtext NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `vehicle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_maintena_vehicle_id_d3db898a_fk_vehicles_` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mantenimientos`
--

INSERT INTO `mantenimientos` (`id`, `date`, `description`, `cost`, `vehicle_id`) VALUES
(2, '1999-02-03', '145184128514925', 521000.00, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marcas_name_0fe5bb66_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `name`) VALUES
(6, 'Audi'),
(5, 'BMW'),
(13, 'BYD'),
(8, 'Chevrolet'),
(1, 'Ferrari'),
(7, 'Ford'),
(9, 'Honda'),
(11, 'Hyundai'),
(2, 'Lamborghini'),
(10, 'Nissan'),
(3, 'Porsche'),
(12, 'Tesla'),
(4, 'Toyota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos_autos`
--

DROP TABLE IF EXISTS `modelos_autos`;
CREATE TABLE IF NOT EXISTS `modelos_autos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `brand_id` bigint NOT NULL,
  `combustible` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `motor` varchar(200) DEFAULT NULL,
  `potencia` varchar(100) DEFAULT NULL,
  `transmision` varchar(100) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modelos_autos_brand_id_name_year_cde0caf8_uniq` (`brand_id`,`name`,`year`),
  KEY `vehicles_carmodel_category_id_b4c09a30_fk_vehicles_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelos_autos`
--

INSERT INTO `modelos_autos` (`id`, `name`, `year`, `price`, `brand_id`, `combustible`, `imagen`, `motor`, `potencia`, `transmision`, `category_id`) VALUES
(1, '488', 2021, 330000.00, 1, 'Gasolina', 'ferrari_488.jpg', 'V8 3.9L Twin-Turbo', '670 HP', 'Automática', 1),
(2, 'Roma', 2022, 210000.00, 1, 'Gasolina', 'ferrari_roma.jpg', 'V8 3.9L Twin-Turbo', '620 HP', 'Automática', 1),
(3, 'SF90', 2023, 500000.00, 1, 'Híbrido', 'ferrari_sf90.jpg', 'V8 4.0L + 3 Eléctricos', '1000 HP', 'Automática', 1),
(4, 'Huracán', 2022, 260000.00, 2, 'Gasolina', 'huracan.jpg', 'V10 5.2L', '640 HP', 'Automática', 1),
(5, 'Aventador', 2022, 400000.00, 2, 'Gasolina', 'aventador.jpg', 'V12 6.5L', '700 HP', 'Automática', 1),
(6, 'Urus', 2023, 220000.00, 2, 'Gasolina', 'urus.jpg', 'V8 4.0L Twin-Turbo', '650 HP', 'Automática', 1),
(7, '911', 2021, 120000.00, 3, 'Gasolina', '911.jpg', '6 Cilindros 3.0L Turbo', '450 HP', 'Automática', 1),
(8, 'Cayman', 2022, 70000.00, 3, 'Gasolina', 'cayman.jpg', '6 Cilindros 2.0L Turbo', '320 HP', 'Manual', 1),
(9, 'Taycan', 2023, 80000.00, 3, 'Eléctrico', 'taycan.jpg', 'Eléctrico Dual', '402 HP', 'Automática', 1),
(10, 'RAV4', 2022, 28000.00, 4, 'Gasolina', 'RAV4.webp', '4 Cilindros 2.5L', '203 HP', 'Automática', 2),
(11, 'Land Cruiser', 2021, 85000.00, 4, 'Gasolina', 'Land Cruiser.webp', 'V6 3.5L Twin-Turbo', '275 HP', 'Automática', 2),
(12, 'Highlander', 2023, 37000.00, 4, 'Híbrido', 'highlander.jpg', '4 Cilindros 2.5L + Eléctrico', '245 HP', 'Automática', 2),
(13, 'X5', 2022, 55000.00, 5, 'Gasolina', 'X5.webp', '6 Cilindros 3.0L Turbo', '375 HP', 'Automática', 2),
(14, 'X6', 2023, 65000.00, 5, 'Gasolina', 'x6.jpg', '6 Cilindros 3.0L Turbo', '375 HP', 'Automática', 2),
(15, 'X7', 2021, 75000.00, 5, 'Gasolina', 'x7.jpg', '6 Cilindros 3.0L Turbo', '375 HP', 'Automática', 2),
(16, 'Q5', 2022, 45000.00, 6, 'Gasolina', 'q5.jpg', '4 Cilindros 2.0L Turbo', '201 HP', 'Automática', 2),
(17, 'Q7', 2023, 60000.00, 6, 'Gasolina', 'Q7.avif', 'V6 3.0L Turbo', '335 HP', 'Automática', 2),
(18, 'Q8', 2021, 70000.00, 6, 'Gasolina', 'q8.jpg', 'V6 3.0L Turbo', '335 HP', 'Automática', 2),
(19, 'F-150', 2022, 35000.00, 7, 'Gasolina', 'F-150.png', 'V6 3.3L', '325 HP', 'Automática', 3),
(20, 'Ranger', 2023, 25000.00, 7, 'Gasolina', 'ranger.jpg', '4 Cilindros 2.3L Turbo', '270 HP', 'Automática', 3),
(21, 'Raptor', 2021, 55000.00, 7, 'Gasolina', 'Raptor.webp', 'V6 3.5L EcoBoost', '450 HP', 'Automática', 3),
(22, 'Silverado', 2022, 40000.00, 8, 'Gasolina', 'silverado.jpg', 'V8 5.3L', '355 HP', 'Automática', 3),
(23, 'Colorado', 2023, 25000.00, 8, 'Gasolina', 'Colorado.webp', '4 Cilindros 2.5L', '200 HP', 'Automática', 3),
(24, 'S10', 2021, 20000.00, 8, 'Gasolina', 'S10.webp', '4 Cilindros 2.5L', '200 HP', 'Manual', 3),
(25, 'Hilux', 2022, 30000.00, 4, 'Diésel', 'Hilux.avif', '4 Cilindros 2.4L Turbo Diésel', '150 HP', 'Manual', 3),
(26, 'Tacoma', 2023, 28000.00, 4, 'Gasolina', 'tacoma.jpg', '4 Cilindros 2.4L Turbo', '278 HP', 'Automática', 3),
(27, 'Tundra', 2021, 35000.00, 4, 'Gasolina', 'tundra.jpg', 'V6 3.5L Twin-Turbo', '310 HP', 'Automática', 3),
(28, 'Civic', 2022, 22000.00, 9, 'Gasolina', 'Civic.avif', '4 Cilindros 2.0L', '158 HP', 'Manual', 4),
(29, 'Accord', 2023, 28000.00, 9, 'Gasolina', 'accord.jpg', '4 Cilindros 1.5L Turbo', '192 HP', 'Automática', 4),
(30, 'City', 2021, 18000.00, 9, 'Gasolina', 'City.avif', '4 Cilindros 1.5L', '130 HP', 'Manual', 4),
(31, 'Sentra', 2022, 20000.00, 10, 'Gasolina', 'Sentra.webp', '4 Cilindros 2.0L', '149 HP', 'Automática', 4),
(32, 'Altima', 2023, 25000.00, 10, 'Gasolina', 'Altima.webp', '4 Cilindros 2.5L', '188 HP', 'Automática', 4),
(33, 'Versa', 2021, 16000.00, 10, 'Gasolina', 'versa.jpg', '4 Cilindros 1.6L', '122 HP', 'Manual', 4),
(34, 'Elantra', 2022, 19000.00, 11, 'Gasolina', 'elantra.jpg', '4 Cilindros 2.0L', '147 HP', 'Automática', 4),
(35, 'Sonata', 2023, 24000.00, 11, 'Gasolina', 'sonata.jpg', '4 Cilindros 2.5L', '191 HP', 'Automática', 4),
(36, 'Accent', 2021, 15000.00, 11, 'Gasolina', 'default.jpg', '4 Cilindros 1.6L', '120 HP', 'Manual', 4),
(37, 'Model S', 2022, 80000.00, 12, 'Eléctrico', 'default.jpg', 'Eléctrico Dual', '670 HP', 'Automática', 5),
(38, 'Model 3', 2023, 40000.00, 12, 'Eléctrico', 'default.jpg', 'Eléctrico', '283 HP', 'Automática', 5),
(39, 'Model X', 2021, 90000.00, 12, 'Eléctrico', 'default.jpg', 'Eléctrico Dual', '670 HP', 'Automática', 5),
(40, 'Han', 2022, 35000.00, 13, 'Eléctrico', 'default.jpg', 'Eléctrico', '204 HP', 'Automática', 5),
(41, 'Tang', 2023, 40000.00, 13, 'Eléctrico', 'default.jpg', 'Eléctrico', '245 HP', 'Automática', 5),
(42, 'Dolphin', 2021, 25000.00, 13, 'Eléctrico', 'default.jpg', 'Eléctrico', '95 HP', 'Automática', 5),
(43, 'Leaf', 2022, 30000.00, 10, 'Eléctrico', 'default.jpg', 'Eléctrico', '150 HP', 'Automática', 5),
(44, 'Ariya', 2023, 45000.00, 10, 'Eléctrico', 'default.jpg', 'Eléctrico Dual', '214 HP', 'Automática', 5),
(45, 'bruno fritsh', 2025, 200000.00, 4, 'Gasolina 95', '', '5.0', '500hp', 'Mecánica', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `clients_purchase_client_id_a71f6c36_fk_clients_client_id` FOREIGN KEY (`client_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `items_venta`
--
ALTER TABLE `items_venta`
  ADD CONSTRAINT `sales_saleitem_car_model_id_913411db_fk_vehicles_carmodel_id` FOREIGN KEY (`car_model_id`) REFERENCES `modelos_autos` (`id`),
  ADD CONSTRAINT `sales_saleitem_sale_id_56e67045_fk_sales_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD CONSTRAINT `maintenance_maintena_vehicle_id_d3db898a_fk_vehicles_` FOREIGN KEY (`vehicle_id`) REFERENCES `modelos_autos` (`id`);

--
-- Filtros para la tabla `modelos_autos`
--
ALTER TABLE `modelos_autos`
  ADD CONSTRAINT `vehicles_carmodel_brand_id_c4f50d72_fk_vehicles_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `vehicles_carmodel_category_id_b4c09a30_fk_vehicles_category_id` FOREIGN KEY (`category_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

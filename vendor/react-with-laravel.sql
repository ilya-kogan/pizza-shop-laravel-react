-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2020_11_28_202117_create_products_table',	1),
(4,	'2020_12_16_203147_create_orders_table',	2),
(5,	'2020_12_19_200133_update_users_table',	3),
(6,	'2016_06_01_000001_create_oauth_auth_codes_table',	4),
(7,	'2016_06_01_000002_create_oauth_access_tokens_table',	4),
(8,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	4),
(9,	'2016_06_01_000004_create_oauth_clients_table',	4),
(10,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	4),
(11,	'2020_12_19_200336_update_users_table',	4),
(12,	'2020_12_19_200421_update_users_table',	5),
(13,	'2020_12_23_174627_update_products_table',	6),
(14,	'2020_12_23_174829_update_users_table',	7),
(15,	'2020_12_23_174847_update_products_table',	8),
(16,	'2020_12_23_175532_update_products_table',	9),
(17,	'2020_12_24_233207_update_products_table',	10),
(18,	'2020_12_25_001911_update_orders_table',	11);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('002da6d7c077d28cb7a0b3549c46ca22518ff6e642d5d1e495bc1ab54486274c3c16acf384f264e8',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:45:46',	'2020-12-24 12:45:46',	'2021-12-24 18:45:46'),
('02346dd6bce6bbeeb7e87bdd1f7f8b313ef0fc2a332b87b33aa58b91d49f69112dab7aae6f2a3828',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:57:45',	'2020-12-19 14:57:45',	'2021-12-19 20:57:45'),
('0b9dfa17072994c7dcb2af2e316ae5e8e17710f9fae355b61043e21cf39b936392509afce1434d95',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:45:11',	'2020-12-19 14:45:11',	'2021-12-19 20:45:11'),
('0e9f6880ec1365d936ef008bb862e4534e078f8c4ff8c8ecb3e9bb9ca226830fd2e4b89048febaf1',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:56:36',	'2020-12-19 14:56:36',	'2021-12-19 20:56:36'),
('0efc7ac83a4a811770e5ff7277bcaad02bd656edc5cf3536e5f3fafb2514ec635e532487076ead77',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:25:54',	'2020-12-22 12:25:54',	'2021-12-22 18:25:54'),
('1299e40069278ac932509b7c76b00052221dd1a44a004349592347b27c70b1fb2ad59e392f029f90',	2,	1,	'app',	'[]',	0,	'2020-12-19 16:42:48',	'2020-12-19 16:42:48',	'2021-12-19 22:42:48'),
('16bd2ad8fefa5025988331c9041be73b534d1a37ed4960cc02188ead9e80e9d67ab085fa45fc1530',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:33:02',	'2020-12-22 12:33:02',	'2021-12-22 18:33:02'),
('1aa350d88f7fcd1238f533eaca57366a4078be48df7902da95b079f37491031a84958bf441d6eeca',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:45:36',	'2020-12-19 14:45:36',	'2021-12-19 20:45:36'),
('1d957926dbd8c375cd42366eca8f15d710c4072e6af333ea88d9185b0ac2ad3d7e03498f124d0c7c',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:18:24',	'2020-12-21 13:18:24',	'2021-12-21 19:18:24'),
('33408ebf1082f772ff20a907fff0bb6b3fc456bddf51684b3b8a3686492dfc66fa770991abadc488',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:40:37',	'2020-12-19 14:40:37',	'2021-12-19 20:40:37'),
('33aae751c6f84f99b3d70ec5b0f0c2674309b1ea3ef155105581f3245e531a673039745e01e6db39',	25,	1,	'app',	'[]',	0,	'2020-12-24 15:36:33',	'2020-12-24 15:36:33',	'2021-12-24 21:36:33'),
('3906088c8bc426dccd3b261aad15020be1316db4b5707ba37a73689c58a2ba1b6eee8bbe34b1accf',	2,	1,	'app',	'[]',	0,	'2020-12-19 15:33:15',	'2020-12-19 15:33:15',	'2021-12-19 21:33:15'),
('3b0664d593ee612d909de9562f55befcfc6e267e448271ef1ba350bcb04d671722a6bbeeb2ca2af2',	2,	1,	'app',	'[]',	0,	'2020-12-19 16:36:32',	'2020-12-19 16:36:32',	'2021-12-19 22:36:32'),
('3e44a1f4b89b934cc69efa853a85970df8b20447786987c24de0df7bff3895c4c07c1b57221be3e5',	2,	1,	'app',	'[]',	0,	'2020-12-19 16:42:42',	'2020-12-19 16:42:42',	'2021-12-19 22:42:42'),
('40beafe688b1eee659feff12f26708962db05b3d35da99cc5a67a86131ed6d37c39f24c77a9db207',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:18:37',	'2020-12-21 13:18:37',	'2021-12-21 19:18:37'),
('4a6732215bf2f0dac37b52506d8fe31a37080735f40584abf3fe9f680ba9e6d8f047ca5e0fa93fb2',	2,	1,	'app',	'[]',	0,	'2020-12-19 16:42:50',	'2020-12-19 16:42:50',	'2021-12-19 22:42:50'),
('4b4edf47aa729d01e263b5ad4bc911a0b7940d29d8e068a8005f669f8e49bac459c25b174ad68b39',	25,	1,	'app',	'[]',	0,	'2020-12-24 15:36:49',	'2020-12-24 15:36:49',	'2021-12-24 21:36:49'),
('4dac104be87dbd217178d68ee5b484238fe1413d872d2199eea90261104999ccbe185329590721b1',	2,	1,	'app',	'[]',	0,	'2020-12-19 15:36:26',	'2020-12-19 15:36:26',	'2021-12-19 21:36:26'),
('5d0fd6310d6fa0a8d6f8a316eab09c39b4efafadc52fa04d1db336a4659e0b1ce4fec37ae30d50a6',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:09:08',	'2020-12-21 13:09:08',	'2021-12-21 19:09:08'),
('614f517f03cfb451578d401746d65a3fc79aff5186a0dabe41dce06a5556ef1bf332f7217bca1264',	2,	1,	'app',	'[]',	0,	'2020-12-19 16:26:49',	'2020-12-19 16:26:49',	'2021-12-19 22:26:49'),
('61bbef9f1f9afb954126d1e967e353401789dac2be4e62f7a88a799d6bcff2255314e296a65bf528',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:23:02',	'2020-12-22 12:23:02',	'2021-12-22 18:23:02'),
('63fe6b6beca48711ca60fdb45560c3fab7883cae29a40ee184ad18fbaecd4d9caafd5808601408dc',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:21:24',	'2020-12-21 13:21:24',	'2021-12-21 19:21:24'),
('664f8a1cf20718a44e52fa6be6c6af6a88c608f25655cfc0468297324a595bb1ebe2cc535003d1ea',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:14:44',	'2020-12-24 12:14:44',	'2021-12-24 18:14:44'),
('66d23b6bb8e26d9460153da23c659230f7c8fd5b2e6cb37aba586a435cc6df27513d57a8d890734b',	2,	1,	NULL,	'[]',	0,	'2020-12-19 15:00:38',	'2020-12-19 15:00:38',	'2021-12-19 21:00:38'),
('6dfcf5d427e3a9887b4744150d02af7ee9b4fe9f46cf0be0a330267b375550af06ecd3048655608c',	2,	1,	'app',	'[]',	0,	'2020-12-20 13:52:09',	'2020-12-20 13:52:09',	'2021-12-20 19:52:09'),
('7206b668b882403446d76dd20b91afa44d93d639f1ead71bd46eba1a79f05c4ee1369a214f5b3e74',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:35:33',	'2020-12-24 12:35:33',	'2021-12-24 18:35:33'),
('72f250968aacabd3a24e5c30554d4a047901b935352279609c012709011cc39981ba62331ee43b2c',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:28:35',	'2020-12-21 13:28:35',	'2021-12-21 19:28:35'),
('76a71fad4d042ec0f71e864ce4cb810edaee258ff1d29a1d5c565031e0c9e2da28ac936237be2d26',	2,	1,	'app',	'[]',	0,	'2020-12-19 15:06:51',	'2020-12-19 15:06:51',	'2021-12-19 21:06:51'),
('7f30b9c8d631fc22eee2257b17bff3b84a39a30881cd9816df0af183b0f0ce46e02986c4c5254c65',	25,	1,	'app',	'[]',	0,	'2020-12-20 14:03:47',	'2020-12-20 14:03:47',	'2021-12-20 20:03:47'),
('91b0de18d2f9422b342143eba6a74a4c02289023eda91c4d02ea1087b8d734b640797ad6afc1ec3d',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:21:33',	'2020-12-22 12:21:33',	'2021-12-22 18:21:33'),
('96b53280d0731a3188f3bb2ad6324a9c629808b4210abe59ef975b169e8169fafc5b150ab21adf8c',	25,	1,	'app',	'[]',	0,	'2020-12-22 11:29:09',	'2020-12-22 11:29:09',	'2021-12-22 17:29:09'),
('9f52aedc2ffdcf39acc52b6364311efae886a52020933e4ec5449826e3f4f8c6fe2332779cb33088',	25,	1,	'app',	'[]',	0,	'2020-12-24 16:18:46',	'2020-12-24 16:18:46',	'2021-12-24 22:18:46'),
('9f76147493b765b350308d91f15fed3d4cbd6a7caabd5345696aff37a5a120fb0dc8d6cfd82297a2',	25,	1,	'app',	'[]',	0,	'2020-12-24 18:23:23',	'2020-12-24 18:23:23',	'2021-12-25 00:23:23'),
('a92e9abb770ce8937ff1e3b9e55d844b70bfa752d0d9c09d2129685cdfec6413511ae7786498f491',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:41:40',	'2020-12-19 14:41:40',	'2021-12-19 20:41:40'),
('a9b5f164542c6bdf19b2ff7a0f44f1b82e6b9bf92570fbf73548f0c198c3315b337dda9976d3c689',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:45:45',	'2020-12-19 14:45:45',	'2021-12-19 20:45:45'),
('b1154bd5cb1077a3290d5f4e5cc1d73220af0a6d439c189bbda04b2fde6bedfbffb82d1b726fada8',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:42:40',	'2020-12-21 13:42:40',	'2021-12-21 19:42:40'),
('b3241c878dc689b71e65e6ddfd1836c4ff4690ce34d21a195981872e78c0878e98bbd4b2c576913f',	2,	1,	'app',	'[]',	0,	'2020-12-19 15:11:09',	'2020-12-19 15:11:09',	'2021-12-19 21:11:09'),
('ba485dc146833cfa8e91a888cab0d06fd92c9dcb97e7cadc44749076aa7013cf501b818eb542c709',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:50:03',	'2020-12-21 13:50:03',	'2021-12-21 19:50:03'),
('c0d6e256860a1ec0b3e635daae2b3c8a63fc036a86660a1b707a98f3b97f3b0cbb17cc4458919208',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:48:38',	'2020-12-19 14:48:38',	'2021-12-19 20:48:38'),
('c17f3294d8254b3f835cc9c65f5b960357795ad86e231a593f2d3be1165e192559ff80877df4042c',	25,	1,	'app',	'[]',	0,	'2020-12-24 15:35:50',	'2020-12-24 15:35:50',	'2021-12-24 21:35:50'),
('c1afec3582a6718a3bf57e1fcc417ea88a8f5c6e44d7ce1acaf38992834a95c8adab62cc3e9d10fa',	25,	1,	'app',	'[]',	0,	'2020-12-20 13:55:16',	'2020-12-20 13:55:16',	'2021-12-20 19:55:16'),
('ca7d827faf8d94f9c6908976014d02108d3609ea5dd6e5f96458a254bc8cef438206f45902dfe346',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:36:47',	'2020-12-24 12:36:47',	'2021-12-24 18:36:47'),
('d46b5835c0c0a933322ec642e5583db566e5ac7807999e11e0f179eea7286e8b29df1df0e74f30d0',	2,	1,	NULL,	'[]',	0,	'2020-12-19 14:48:04',	'2020-12-19 14:48:04',	'2021-12-19 20:48:04'),
('d7d7eb5304f0aac15a9333de1d0eb977e689dff0ef2f56c9d0505e8cb80cc7ad3954db7bfb68b36f',	2,	1,	NULL,	'[]',	0,	'2020-12-19 15:04:44',	'2020-12-19 15:04:44',	'2021-12-19 21:04:44'),
('e4e060ba51e44319fbee7cbd2108fde5c06a21b8874fc110a308c52cf7e5b6cdacf1c189406e75b2',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:38:08',	'2020-12-24 12:38:08',	'2021-12-24 18:38:08'),
('e94af782ae21b999f566e40c6255282845739905116efc6c9404ab209a92f276776214bac12fdcc1',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:28:48',	'2020-12-22 12:28:48',	'2021-12-22 18:28:48'),
('e9df321d02c504a395e8b7264aa40e0f39ba9f080fec8fd3ed12c7f58d357041e270b95ff6786d22',	25,	1,	'app',	'[]',	0,	'2020-12-22 12:25:05',	'2020-12-22 12:25:05',	'2021-12-22 18:25:05'),
('f1d141dc7639a44459e44a6c95f991f02a88fd24071bd62f55bd305dde6bc0c4a10ee081f75c615b',	25,	1,	'app',	'[]',	0,	'2020-12-21 13:13:19',	'2020-12-21 13:13:19',	'2021-12-21 19:13:19'),
('f48460e8a018dec126856cc44b042b93e1381fe1a1a7ae828cc2d6e8901cdcc5c4f862b59b0a48b8',	25,	1,	'app',	'[]',	0,	'2020-12-24 12:36:22',	'2020-12-24 12:36:22',	'2021-12-24 18:36:22');

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Laravel Personal Access Client',	'fO1YdIXG5KEfRuRMiDzqBaFNi1XrOuxV2VCoXu7X',	'http://localhost',	1,	0,	0,	'2020-12-19 14:06:52',	'2020-12-19 14:06:52'),
(2,	NULL,	'Laravel Password Grant Client',	'dSas0MYi5rPcW8msbHxBH1iLVV4IyUCKDYVxI29g',	'http://localhost',	0,	1,	0,	'2020-12-19 14:06:52',	'2020-12-19 14:06:52');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2020-12-19 14:06:52',	'2020-12-19 14:06:52');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `products` json NOT NULL,
  `user_data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `user_id`, `products`, `user_data`, `email`, `phone`, `address`, `order_comments`, `currency`, `price`, `created_at`, `updated_at`) VALUES
(1,	25,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 7}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 10}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 6}, {\"id\": 5, \"info\": {\"id\": 5, \"price\": 57, \"title\": \"Pizza #5\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Sit atque id aspernatur saepe architecto.\", \"availability\": 0}, \"amount\": 7}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Pizza #4\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Distinctio et necessitatibus et repellendus et esse.\", \"availability\": 1}, \"amount\": 7}, {\"id\": 6, \"info\": {\"id\": 6, \"price\": 87, \"title\": \"Pizza #6\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Illo molestiae dolorem ipsum tempora consequatur.\", \"availability\": 0}, \"amount\": 4}, {\"id\": 7, \"info\": {\"id\": 7, \"price\": 71, \"title\": \"Pizza #7\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Nam ullam vero quaerat asperiores enim quo.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 8, \"info\": {\"id\": 8, \"price\": 55, \"title\": \"Pizza #8\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"At consequatur iure temporibus sapiente ut nostrum alias.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 9, \"info\": {\"id\": 9, \"price\": 22, \"title\": \"Pizza #9\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Magni nihil sapiente ut nostrum alias consequatur iure temporibus.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 10, \"info\": {\"id\": 10, \"price\": 84, \"title\": \"Pizza #10\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Eaque aut laboriosam et vitae suscipit alias.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 11, \"info\": {\"id\": 11, \"price\": 59, \"title\": \"Pizza #11\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Cupiditate nesciunt numquam quidem omnis vero.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 12, \"info\": {\"id\": 12, \"price\": 81, \"title\": \"Pizza #12\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Libero voluptas inventore iure ut dolorem.\", \"availability\": 0}, \"amount\": 4}]',	'Ilya Kogan',	'omck-hawk@yandex.ru',	'79658781717',	'Блюхера 22а',	'На блажайше',	'usd',	100,	'2020-12-16 14:58:35',	'2020-12-16 14:58:35'),
(5,	25,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 7}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 10}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 6}, {\"id\": 5, \"info\": {\"id\": 5, \"price\": 57, \"title\": \"Pizza #5\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Sit atque id aspernatur saepe architecto.\", \"availability\": 0}, \"amount\": 7}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Pizza #4\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Distinctio et necessitatibus et repellendus et esse.\", \"availability\": 1}, \"amount\": 7}, {\"id\": 6, \"info\": {\"id\": 6, \"price\": 87, \"title\": \"Pizza #6\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Illo molestiae dolorem ipsum tempora consequatur.\", \"availability\": 0}, \"amount\": 4}, {\"id\": 7, \"info\": {\"id\": 7, \"price\": 71, \"title\": \"Pizza #7\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Nam ullam vero quaerat asperiores enim quo.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 8, \"info\": {\"id\": 8, \"price\": 55, \"title\": \"Pizza #8\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"At consequatur iure temporibus sapiente ut nostrum alias.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 9, \"info\": {\"id\": 9, \"price\": 22, \"title\": \"Pizza #9\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Magni nihil sapiente ut nostrum alias consequatur iure temporibus.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 10, \"info\": {\"id\": 10, \"price\": 84, \"title\": \"Pizza #10\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Eaque aut laboriosam et vitae suscipit alias.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 11, \"info\": {\"id\": 11, \"price\": 59, \"title\": \"Pizza #11\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Cupiditate nesciunt numquam quidem omnis vero.\", \"availability\": 1}, \"amount\": 4}, {\"id\": 12, \"info\": {\"id\": 12, \"price\": 81, \"title\": \"Pizza #12\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Libero voluptas inventore iure ut dolorem.\", \"availability\": 0}, \"amount\": 4}]',	'omck-hawk@ya.ru Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'132',	'usd',	100,	'2020-12-18 09:08:19',	'2020-12-18 09:08:19'),
(6,	0,	'[{\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Pizza #4\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Distinctio et necessitatibus et repellendus et esse.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 6, \"info\": {\"id\": 6, \"price\": 87, \"title\": \"Pizza #6\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Illo molestiae dolorem ipsum tempora consequatur.\", \"availability\": 0}, \"amount\": 1}]',	'Alina Kogan',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'Test',	'usd',	100,	'2020-12-18 13:03:35',	'2020-12-18 13:03:35'),
(7,	0,	'[{\"id\": 6, \"info\": {\"id\": 6, \"price\": 87, \"title\": \"Pizza #6\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Illo molestiae dolorem ipsum tempora consequatur.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 7, \"info\": {\"id\": 7, \"price\": 71, \"title\": \"Pizza #7\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Nam ullam vero quaerat asperiores enim quo.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Pizza #4\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Distinctio et necessitatibus et repellendus et esse.\", \"availability\": 1}, \"amount\": 3}, {\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 2}]',	'кнопа кноповна',	'omckhawk+test@gmail.com',	'+79043203993',	'Andrianova 32',	'вавава',	'usd',	100,	'2020-12-18 13:06:03',	'2020-12-18 13:06:03'),
(8,	0,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 2}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 3}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 5}]',	'omck-hawk@ya.ru Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'123',	'usd',	745,	'2020-12-18 14:15:59',	'2020-12-18 14:15:59'),
(9,	0,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 2}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 3}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 5}]',	'omck-hawk@ya.ru Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'123',	'usd',	745,	'2020-12-18 14:18:16',	'2020-12-18 14:18:16'),
(10,	25,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 2}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 3}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 5}]',	' Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'123',	'usd',	745,	'2020-12-18 14:18:22',	'2020-12-18 14:18:22'),
(11,	0,	'[{\"id\": 1, \"info\": {\"id\": 1, \"price\": 56, \"title\": \"Pizza #1\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Qui rerum beatae maiores dignissimos est quidem.\", \"availability\": 0}, \"amount\": 2}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Pizza #2\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Quia sunt maiores deserunt corrupti sunt iusto.\", \"availability\": 1}, \"amount\": 3}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Pizza #3\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Voluptatum tempore amet dolorum illum voluptas sequi.\", \"availability\": 0}, \"amount\": 5}]',	'omck-hawk@ya.ru Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'-p00',	'usd',	745,	'2020-12-18 17:23:15',	'2020-12-18 17:23:15'),
(12,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	' ',	'usd',	0,	'2020-12-24 09:49:48',	'2020-12-24 09:49:48'),
(13,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	' ',	'usd',	0,	'2020-12-24 09:50:05',	'2020-12-24 09:50:05'),
(14,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 09:50:25',	'2020-12-24 09:50:25'),
(15,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 09:51:18',	'2020-12-24 09:51:18'),
(16,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 09:53:07',	'2020-12-24 09:53:07'),
(17,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 09:54:48',	'2020-12-24 09:54:48'),
(18,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 10:00:09',	'2020-12-24 10:00:09'),
(19,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 10:58:52',	'2020-12-24 10:58:52'),
(20,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 11:00:25',	'2020-12-24 11:00:25'),
(21,	0,	'[{\"id\": 5, \"info\": {\"id\": 5, \"price\": 57, \"title\": \"Carbonara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, parmesan, eggs, bacon.\", \"availability\": 0}, \"amount\": 3}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'First!',	'usd',	171,	'2020-12-24 11:01:55',	'2020-12-24 11:01:55'),
(22,	0,	'[{\"id\": 5, \"info\": {\"id\": 5, \"price\": 57, \"title\": \"Carbonara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, parmesan, eggs, bacon.\", \"availability\": 0}, \"amount\": 3}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'999',	'',	'usd',	171,	'2020-12-24 11:16:19',	'2020-12-24 11:16:19'),
(23,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 11:18:34',	'2020-12-24 11:18:34'),
(24,	0,	'[]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	0,	'2020-12-24 11:19:28',	'2020-12-24 11:19:28'),
(25,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 11:34:20',	'2020-12-24 11:34:20'),
(26,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 11:34:39',	'2020-12-24 11:34:39'),
(27,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 11:35:29',	'2020-12-24 11:35:29'),
(28,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 11:38:37',	'2020-12-24 11:38:37'),
(29,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	232,	'2020-12-24 11:39:21',	'2020-12-24 11:39:21'),
(30,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 11:56:57',	'2020-12-24 11:56:57'),
(31,	0,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	78,	'2020-12-24 11:58:24',	'2020-12-24 11:58:24'),
(32,	0,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	78,	'2020-12-24 11:59:34',	'2020-12-24 11:59:34'),
(33,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 12:01:36',	'2020-12-24 12:01:36'),
(34,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 12:03:05',	'2020-12-24 12:03:05'),
(35,	0,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	151,	'2020-12-24 12:04:02',	'2020-12-24 12:04:02'),
(36,	0,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	151,	'2020-12-24 12:04:21',	'2020-12-24 12:04:21'),
(37,	0,	'[{\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	154,	'2020-12-24 12:06:53',	'2020-12-24 12:06:53'),
(38,	0,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	78,	'2020-12-24 12:11:06',	'2020-12-24 12:11:06'),
(39,	25,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	159,	'2020-12-24 12:12:57',	'2020-12-24 12:12:57'),
(40,	0,	'[{\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	73,	'2020-12-24 12:13:19',	'2020-12-24 12:13:19'),
(41,	25,	'[{\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 2}]',	'Ilya Kogan',	'test@ya.ru',	'+79658781717',	'Андрианова',	'888',	'usd',	146,	'2020-12-24 12:30:54',	'2020-12-24 12:30:54'),
(42,	25,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}, {\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 2}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	310,	'2020-12-24 12:37:50',	'2020-12-24 12:37:50'),
(43,	0,	'[{\"id\": 2, \"info\": {\"id\": 2, \"price\": 81, \"title\": \"Fattoria\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"Tomato sauce, mozzarella, pepper, peas, porchetta.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'',	'usd',	81,	'2020-12-24 13:55:38',	'2020-12-24 13:55:38'),
(44,	25,	'[{\"id\": 3, \"info\": {\"id\": 3, \"price\": 78, \"title\": \"Montanara\", \"price_eur\": \"100\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.\", \"availability\": 0}, \"amount\": 1}, {\"id\": 4, \"info\": {\"id\": 4, \"price\": 73, \"title\": \"Emiliana\", \"price_eur\": \"100\", \"created_at\": \"2020-11-28 21:53:46\", \"updated_at\": \"2020-11-28 21:53:46\", \"description\": \"tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.\", \"availability\": 1}, \"amount\": 1}]',	'Илья Коган',	'omck-hawk@ya.ru',	'+79658781717',	'Андрианова',	'Euro',	'eur',	200,	'2020-12-24 18:22:42',	'2020-12-24 18:22:42');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_eur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `title`, `description`, `price`, `price_eur`, `availability`) VALUES
(1,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Mare e Monti',	'Mozzarella, tomato sauce, seafood and porcini mushrooms.',	56,	'100',	0),
(2,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Fattoria',	'Tomato sauce, mozzarella, pepper, peas, porchetta.',	81,	'100',	1),
(3,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Montanara',	'tomato sauce, mozzarella, mushrooms, pepperoni and Strakkino.',	78,	'100',	0),
(4,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Emiliana',	'tomato sauce, mozzarella, eggplant, boiled potatoes and sausage.',	73,	'100',	1),
(5,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Carbonara',	'Tomato sauce, mozzarella, parmesan, eggs, bacon.',	57,	'100',	0),
(6,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Quattro Formaggi',	'Tomato sauce, mozzarella, parmesan, gorgonzola, artichokes and oregano.',	87,	'100',	0),
(7,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Frutti di Mare',	'Mozzarella, tomato sauce, pepper, seafood.',	71,	'100',	1),
(8,	'2020-11-28 15:53:46',	'2020-11-28 15:53:46',	'Calzone',	'Tomato sauce, mozzarella, ham, mushrooms, artichokes and oregano.',	55,	'100',	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1,	'Bertha',	'Adams',	'prohaska.devonte@example.org',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	'2020-12-19 14:26:15',	'2020-12-19 14:26:15'),
(2,	'Molly',	'Weimann',	'hilma65@example.com',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	'2020-12-19 14:26:15',	'2020-12-19 14:26:15'),
(3,	'Oliver',	'Carroll',	'francisca37@example.net',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	'2020-12-19 14:26:15',	'2020-12-19 14:26:15'),
(4,	'Amparo',	'Huels',	'jacobs.saige@example.com',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	'2020-12-19 14:26:15',	'2020-12-19 14:26:15'),
(5,	'Myra',	'Hyatt',	'amara.casper@example.net',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	'2020-12-19 14:26:15',	'2020-12-19 14:26:15'),
(6,	'Ilya',	'Kogan',	'1@1.com',	'1',	'2020-12-19 16:47:11',	'2020-12-19 16:47:11'),
(8,	'Ilya',	'Kogan',	'123@123.com',	'1',	'2020-12-19 17:03:21',	'2020-12-19 17:03:21'),
(22,	'Ilya',	'Kogan',	'123123123@123.com',	'1',	'2020-12-19 17:25:58',	'2020-12-19 17:25:58'),
(23,	'Ilya',	'Kogan',	'omck-hawk@ya.ru',	'123',	'2020-12-20 07:34:57',	'2020-12-20 07:34:57'),
(24,	'Ilya',	'Kogan',	'omck-hawk2@ya.ru',	'123',	'2020-12-20 07:36:01',	'2020-12-20 07:36:01'),
(25,	'Ilya',	'Kogan',	'test@ya.ru',	'$2y$10$Mns9Sc9srF41B9NHn/wdqulo4qLVdYsvX2JIA6xwjlluc/D4SCi4q',	'2020-12-20 13:54:52',	'2020-12-20 13:54:52'),
(26,	'1',	'2',	'123@121323.ru',	'$2y$10$iLfiOn5nVvPDM31MyzisheA5KJ4cpTSw1hRHt/OiRbiLVGH3sEtju',	'2020-12-24 15:41:38',	'2020-12-24 15:41:38'),
(27,	'Alina',	'Kogan',	'test2@ya.ru',	'$2y$10$mAf.vgga0mA/9suHXiT04.AqpCzHE2N8XWKm4gCPIlvGFgFTCNt.G',	'2020-12-24 15:56:56',	'2020-12-24 15:56:56'),
(28,	'Илья',	'Коган',	'omck-ha3wk@ya.ru',	'$2y$10$impIXzIzDq2FjJUooK9O6uhyPZNPP5.jBG2tw6vw178do5BKAWXIa',	'2020-12-24 16:03:32',	'2020-12-24 16:03:32'),
(29,	'Илья',	'Коган',	'omck-h132awk@ya.ru',	'$2y$10$mVJciZAvkMd6VnV0qzxdJ.QjOeTZjs4BHyWw9YO6Jy6NPCNBw7EB.',	'2020-12-24 16:05:02',	'2020-12-24 16:05:02'),
(30,	'Илья',	'Коган',	'o132mck-hawk@ya.ru',	'$2y$10$5xQY0iWwTCu1xh19lA/.He.qNPwHi4v6yB/KA4B3HKo5bM3Kef8qq',	'2020-12-24 16:05:32',	'2020-12-24 16:05:32'),
(31,	'Илья',	'Коган',	'om132ck-hawk@ya.ru',	'$2y$10$cYlbDLrMShBqfopugdgKY.izT84VSqPTIea5py57yrDlv5yr6PUj.',	'2020-12-24 16:05:56',	'2020-12-24 16:05:56');

-- 2020-12-25 22:12:42

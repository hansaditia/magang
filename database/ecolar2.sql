/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : ecolar

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 17/12/2021 21:08:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Pot', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `categories` VALUES (2, 'Plant', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `categories` VALUES (3, 'Fertilizer', '2021-12-02 03:02:05', '2021-12-02 03:02:05');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_11_10_014151_create_categories_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_11_11_014151_create_products_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Nicolas Lowe II', 26405.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk1.jpeg', NULL);
INSERT INTO `products` VALUES (2, 'Marcellus Rice', 69967.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk2.jpeg', NULL);
INSERT INTO `products` VALUES (3, 'Heidi Torp', 61850.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk3.jpeg', NULL);
INSERT INTO `products` VALUES (4, 'Martina Bernier', 97698.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk4.jpeg', NULL);
INSERT INTO `products` VALUES (5, 'Isabella Altenwerth', 58491.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk5.jpeg', NULL);
INSERT INTO `products` VALUES (6, 'Dr. Lennie Gutkowski I', 37063.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk6.jpeg', NULL);
INSERT INTO `products` VALUES (7, 'Ms. Thelma Connelly', 51931.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk7.jpeg', NULL);
INSERT INTO `products` VALUES (8, 'Wilford Rogahn', 90214.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'benih1.jpeg', NULL);
INSERT INTO `products` VALUES (9, 'Miss Wendy Leannon', 20096.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot1.jpeg', NULL);
INSERT INTO `products` VALUES (10, 'Prof. Ophelia Langosh III', 31636.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot2.jpeg', NULL);
INSERT INTO `products` VALUES (11, 'Allison Ratke', 15224.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot3.jpeg', NULL);
INSERT INTO `products` VALUES (12, 'Lauretta Kiehn', 70403.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot4.jpeg', NULL);
INSERT INTO `products` VALUES (13, 'Mrs. Amalia Kuphal DVM', 48086.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot5.jpeg', NULL);
INSERT INTO `products` VALUES (14, 'Kane Anderson', 66470.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot6.jpeg', NULL);
INSERT INTO `products` VALUES (15, 'Mireille Mayer', 71934.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'polybag1.jpeg', NULL);
INSERT INTO `products` VALUES (16, 'Joelle Okuneva', 96221.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'batu1.jpeg', NULL);
INSERT INTO `products` VALUES (17, 'Kody Wiegand', 31012.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'batu2.jpeg', NULL);
INSERT INTO `products` VALUES (18, 'Prof. Jaunita Bogan', 85525.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'batu3.jpeg', NULL);
INSERT INTO `products` VALUES (19, 'Crawford Stark I', 65310.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot7.jpeg', NULL);
INSERT INTO `products` VALUES (20, 'Shane Harber', 78497.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pot8.jpeg', NULL);
INSERT INTO `products` VALUES (21, 'Celestine Schinner', 31786.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pupuk8.jpeg', NULL);
INSERT INTO `products` VALUES (22, 'Johnathan Mayer Jr.', 92387.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'pupuk9.jpeg', NULL);
INSERT INTO `products` VALUES (23, 'Ramona Erdman', 69340.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'pupuk10.jpeg', NULL);
INSERT INTO `products` VALUES (24, 'Dr. Prudence Braun', 22098.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'pupuk11.jpeg', NULL);
INSERT INTO `products` VALUES (25, 'Donald Schaden', 13434.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pupuk12.jpeg', NULL);
INSERT INTO `products` VALUES (26, 'Tomas Cole', 60808.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'pupuk13.jpeg', NULL);
INSERT INTO `products` VALUES (27, 'Adam Hermiston', 10682.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pupuk14.jpeg', NULL);
INSERT INTO `products` VALUES (28, 'Laura Yost', 28187.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'pupuk15.jpeg', NULL);
INSERT INTO `products` VALUES (29, 'Joel Kautzer', 91048.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'pupuk16.jpeg', NULL);
INSERT INTO `products` VALUES (30, 'Ms. Kellie Kemmer', 20895.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'pupuk17.jpeg', NULL);
INSERT INTO `products` VALUES (31, 'Johnpaul Halvorson DVM', 46170.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'tali1.jpeg', NULL);
INSERT INTO `products` VALUES (32, 'Mr. Howell Toy', 16476.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'teko1.jpeg', NULL);
INSERT INTO `products` VALUES (33, 'Marilyne Schuster', 30250.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'turus 1m.jpeg', NULL);
INSERT INTO `products` VALUES (34, 'Dr. Tremaine Labadie', 85076.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'teko2.jpeg', NULL);
INSERT INTO `products` VALUES (35, 'Pansy Robel DDS', 46988.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'teko 3.jpeg', NULL);
INSERT INTO `products` VALUES (36, 'Martin Kling', 77643.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'semprotan1.jpeg', NULL);
INSERT INTO `products` VALUES (37, 'Otis Kuhic', 44787.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'semprotan2.jpeg', NULL);
INSERT INTO `products` VALUES (38, 'Vella Considine', 85457.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'sumbu1.jpeg', NULL);
INSERT INTO `products` VALUES (39, 'Sven Breitenberg', 95573.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'sprayer.jpeg', NULL);
INSERT INTO `products` VALUES (40, 'Prof. Kaylin Gibson', 55927.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'garpu&skop1.jpeg', NULL);
INSERT INTO `products` VALUES (41, 'Mr. Nicklaus Barton DDS', 54512.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'naturStek1.jpeg', NULL);
INSERT INTO `products` VALUES (42, 'Prof. Myrtle Heller III', 45888.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'natruStek2.jpeg', NULL);
INSERT INTO `products` VALUES (43, 'Laron Batz', 51018.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'naturStek3.jpeg', NULL);
INSERT INTO `products` VALUES (44, 'Juliana Toy', 49878.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'naturStek4.jpeg', NULL);
INSERT INTO `products` VALUES (45, 'Hulda Tromp', 54906.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'naturStek5.jpeg', NULL);
INSERT INTO `products` VALUES (46, 'Miss Sandy Bechtelar', 58098.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'cendana1.jpeg', NULL);
INSERT INTO `products` VALUES (47, 'Prof. Louisa Beahan', 95954.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'rootB.jpeg', NULL);
INSERT INTO `products` VALUES (48, 'Felton Kling', 65257.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 2, 'superAjaib.jpeg', NULL);
INSERT INTO `products` VALUES (49, 'Fermin Monahan', 12774.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 3, 'osmocote.jpeg', NULL);
INSERT INTO `products` VALUES (50, 'Carmelo Simonis', 58067.00, '2021-12-02 03:02:05', '2021-12-02 03:02:05', 1, 'hydroJ.jpeg', NULL);
INSERT INTO `products` VALUES (51, 'Lura Aufderhar', 57899.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'meroke.jpeg', NULL);
INSERT INTO `products` VALUES (52, 'Cleveland Feest', 18733.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang1.jpeg', NULL);
INSERT INTO `products` VALUES (53, 'Prof. Timmy Berge MD', 62754.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang2.jpeg', NULL);
INSERT INTO `products` VALUES (54, 'Maurice Sporer', 43357.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'barang3.jpeg', NULL);
INSERT INTO `products` VALUES (55, 'Ilene Hills', 11037.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang4.jpeg', NULL);
INSERT INTO `products` VALUES (56, 'Lilly Lubowitz', 88800.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'barang5.jpeg', NULL);
INSERT INTO `products` VALUES (57, 'Mrs. Brianne Bruen II', 89264.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang6.jpeg', NULL);
INSERT INTO `products` VALUES (58, 'Stewart Hills', 59548.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'barang7.jpeg', NULL);
INSERT INTO `products` VALUES (59, 'Norene Powlowski', 45209.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'barang8.jpeg', NULL);
INSERT INTO `products` VALUES (60, 'Ivy Cummings PhD', 15890.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang9.jpeg', NULL);
INSERT INTO `products` VALUES (61, 'Sabryna Wunsch', 65386.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang10.jpeg', NULL);
INSERT INTO `products` VALUES (62, 'Dr. Novella Hahn', 90297.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, 'barang11.jpeg', NULL);
INSERT INTO `products` VALUES (63, 'Mr. Keshawn Skiles', 47164.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang13.jpeg', NULL);
INSERT INTO `products` VALUES (64, 'Sierra Schmeler Sr.', 10339.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang14.jpeg', NULL);
INSERT INTO `products` VALUES (65, 'Claire Witting', 66747.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang15.jpeg', NULL);
INSERT INTO `products` VALUES (66, 'Collin Kub', 34115.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang16.jpeg', NULL);
INSERT INTO `products` VALUES (67, 'Aisha Pollich', 84186.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, 'barang17.jpeg', NULL);
INSERT INTO `products` VALUES (68, 'Mr. Simeon Morissette Jr.', 20647.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang18.jpeg', NULL);
INSERT INTO `products` VALUES (69, 'Christophe Padberg', 22772.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang19.jpeg', NULL);
INSERT INTO `products` VALUES (70, 'Kaia Stokes', 34253.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, 'barang20.jpeg', NULL);
INSERT INTO `products` VALUES (71, 'Markus Rogahn', 90644.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (72, 'Prof. Leonor Harvey V', 23701.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (73, 'Mr. Osbaldo Schuster', 65983.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (74, 'Dylan Tremblay', 94117.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (75, 'Antone Considine', 22137.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (76, 'Concepcion Schroeder PhD', 37146.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (77, 'Cordia Stokes', 11929.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (78, 'Cale Schmidt', 91555.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (79, 'Hans Brown', 54554.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (80, 'Jerome Weimann', 49516.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (81, 'Sister Sawayn', 48134.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (82, 'Trenton Wolf', 44503.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (83, 'Yvette Muller II', 78388.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (84, 'Ms. Valentine Schmitt DDS', 33183.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (85, 'Cydney Fahey', 58562.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (86, 'Monserrate Goyette MD', 18705.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (87, 'Jayde Osinski Sr.', 76000.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (88, 'Tina Mertz', 26280.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (89, 'Melody Greenholt', 64874.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (90, 'Jarred Langosh', 57950.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (91, 'Tatyana Murray', 75269.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (92, 'Florida Dare', 51015.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (93, 'Clarabelle Goodwin', 28707.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (94, 'Ms. Maci Swaniawski III', 21344.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (95, 'Osvaldo Friesen', 54321.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);
INSERT INTO `products` VALUES (96, 'Anabel Fisher', 29259.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (97, 'Deanna Hegmann', 93358.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (98, 'Walton Swift', 37922.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 2, NULL, NULL);
INSERT INTO `products` VALUES (99, 'Dr. Garrick Pfeffer', 13043.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 3, NULL, NULL);
INSERT INTO `products` VALUES (100, 'Ms. Karina Monahan PhD', 80781.00, '2021-12-03 14:40:31', '2021-12-03 14:40:31', 1, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Dangelo Oberbrunner', 'isobel57@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'efsvNLixkd', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (2, 'Janice Hayes', 'lubowitz.abbey@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vF0CnRRaCC', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (3, 'Leann Gibson', 'tabitha60@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lZXG78cHGf', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (4, 'Dr. Aylin Huels', 'lesch.sherwood@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'li92BvZsga', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (5, 'Miss Cierra Ortiz', 'rashad29@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JHQwEUJI5A', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (6, 'Maida Metz', 'tyreek89@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LKVj4SRJ42', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (7, 'Norwood Davis', 'iwisozk@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZuhrUhuPAK', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (8, 'Dayne Schmidt', 'della.hand@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5BIonPUt4A', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (9, 'Mr. Constantin Collins II', 'sarah.flatley@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WROEzxZEgf', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (10, 'Ms. Suzanne Collier', 'wolff.elvie@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GPLrens7ei', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (11, 'Marisa Stroman', 'precious70@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '22sGEjoJpN', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (12, 'Krystel O\'Connell', 'vena.jerde@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wVKq57NTSK', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (13, 'Talia Larkin', 'sasha.yundt@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yTp3TzBfXf', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (14, 'Kirsten Gulgowski', 'greenholt.kevin@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UaSgODUK7u', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (15, 'Jany Kautzer', 'fweissnat@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9ma1slOMb1', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (16, 'Miller Klocko', 'zackary.farrell@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BOualtlUp7', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (17, 'Mohamed Tremblay', 'thurman63@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lg0Cln3arb', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (18, 'Prof. Chelsey Nitzsche II', 'grant.ernesto@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LCsLaCXX6z', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (19, 'Robyn Armstrong', 'maybell.daugherty@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h7NnxWjdMF', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (20, 'Magdalen Blanda', 'fyundt@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ra8iveFF5x', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (21, 'Stan Roberts', 'paxton.schmitt@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GhRcZFaIsy', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (22, 'Wilton Abernathy', 'vwatsica@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pOZ2E6YGGW', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (23, 'Carli Schmitt', 'melvina86@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rT5JkGzLOb', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (24, 'Ms. Lila Kihn', 'javier46@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5gbWW9RRp3', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (25, 'Dr. Beulah Auer DDS', 'pollich.howard@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PLuPCgpsnT', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (26, 'Dawson Stehr', 'rodolfo.leannon@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pKNvqA2HMi', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (27, 'Reginald Crooks', 'qdickinson@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JU29EjaTrj', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (28, 'Dr. Ardella Bayer', 'nitzsche.lourdes@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BIa653zjtu', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (29, 'Prof. Loy Dooley DVM', 'dixie.greenholt@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BVt57jkIR5', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (30, 'Amber Price', 'leila.johnson@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pj0Q1Np5MP', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (31, 'Prof. Noel Gorczany Jr.', 'marcus.christiansen@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UjYRPirbXA', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (32, 'Sincere Koch Sr.', 'christy36@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dpzlKqep0X', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (33, 'Mrs. Freida Tillman', 'arau@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'g8rDUGsBIC', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (34, 'Jayme Bernhard DVM', 'pkoelpin@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cY9cOc8JDK', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (35, 'Mr. Manley Botsford Jr.', 'strosin.alanna@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gufInXaJBE', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (36, 'Prof. Dallas Wunsch Sr.', 'lehner.adolphus@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S3EBIC3S9c', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (37, 'Ryley Pouros IV', 'bahringer.elias@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5vtfuh8ksh', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (38, 'Dr. Adrianna Rohan II', 'ebahringer@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EescuPEBaM', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (39, 'Arne Beahan', 'clementine.von@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'V0os4PWmd3', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (40, 'Kaleigh White', 'pgreen@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sGKAo44cxb', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (41, 'Bryce Murphy', 'zturcotte@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mWEPHobYnL', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (42, 'Serena Weimann', 'miles.mcglynn@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YtQUY72L8H', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (43, 'Eleanora Deckow', 'tracy22@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'b7CWfTkMI4', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (44, 'Garret Durgan', 'prosacco.erna@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7Zl8cPMlpE', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (45, 'Dr. Cierra Moen', 'tyson71@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7HSpPxSLbO', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (46, 'Jamel Rowe', 'bridget56@example.org', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'muBNBqqeTe', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (47, 'Prof. Meta Zboncak', 'tremaine87@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'W6v85NSAKe', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (48, 'Keyon Ferry', 'bcormier@example.net', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eUc1bLK8zL', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (49, 'Piper Kris', 'florida.bernier@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GwjQrNZSA0', '2021-12-02 03:02:05', '2021-12-02 03:02:05');
INSERT INTO `users` VALUES (50, 'Brenda McDermott', 'ellis.krajcik@example.com', '2021-12-02 03:02:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gt6puloihu', '2021-12-02 03:02:05', '2021-12-02 03:02:05');

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `user` (
   `id` int AUTO_INCREMENT,
   `name` varchar(255) NOT NULL,
   `created_at` timestamp NULL DEFAULT NULL,
   `updated_at` timestamp NULL DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `task` (
    `id` int AUTO_INCREMENT,
    `user_id` int UNSIGNED,
    `title` varchar(255) NOT NULL,
    `description` varchar(255) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
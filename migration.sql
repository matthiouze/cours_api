-- Création de la table users
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL UNIQUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Création de la table posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Ajout d'utilisateurs
INSERT INTO `users` (`name`, `email`) VALUES 
('Jean Dupont', 'jean.dupont@example.com'),
('Marie Courtois', 'marie.c@test.fr'),
('Thomas Martin', 't.martin@web.com');

-- Ajout de posts (liés aux IDs 1, 2 et 3)
INSERT INTO `posts` (`user_id`, `title`, `content`) VALUES 
(1, 'Bienvenue sur Docker', 'Ceci est mon premier post créé via ma stack Docker !'),
(1, 'Astuce Laravel', 'N''oubliez pas de configurer votre fichier .env pour la DB.'),
(2, 'Le vent se lève', 'Un petit texte poétique sur le développement web.'),
(3, 'Pourquoi MySQL ?', 'Parce que c''est robuste, fiable et facile à orchestrer avec Docker.'),
(3, 'Créer une api avec Laravel', 'Parce que laravel c\'est génial !');
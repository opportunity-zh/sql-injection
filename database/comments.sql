CREATE TABLE `comments` (
  `id` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `comments` (`id`, `comment`, `created_at`) VALUES
(1, 'SQL-Injections können zu Datenbankkompromittierungen führen.', '2024-02-14 10:16:18'),
(2, 'Durch SQL-Injections können Angreifer vertrauliche Daten stehlen.', '2024-02-14 10:16:18'),
(3, 'SQL-Injections können die Integrität der Datenbank gefährden.', '2024-02-14 10:16:18'),
(4, 'Durch SQL-Injections kann ein Angreifer die Anwendung manipulieren und schädlichen Code ausführen.', '2024-02-14 10:16:18'),
(5, 'SQL-Injections können zu erheblichen finanziellen Verlusten führen.', '2024-02-14 10:16:18'),
(6, 'Durch SQL-Injections können Benutzerkonten übernommen werden.', '2024-02-14 10:16:18'),
(7, 'SQL-Injections können zu Datenschutzverletzungen führen.', '2024-02-14 10:16:18'),
(8, 'Durch SQL-Injections können Angreifer das gesamte Datenbanksystem kompromittieren.', '2024-02-14 10:16:18'),
(9, 'SQL-Injections können zu Ausfallzeiten und Betriebsunterbrechungen führen.', '2024-02-14 10:16:18'),
(10, 'Durch SQL-Injections können Angreifer vertrauenswürdige Benutzerdaten verändern oder löschen.', '2024-02-14 10:16:18');


ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

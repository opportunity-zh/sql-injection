CREATE TABLE `answers` (
  `id` int NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `answers` (`id`, `answer`, `is_correct`, `question_id`) VALUES
(1, 'Prince', 0, 1),
(2, 'Elvis Presley', 0, 1),
(3, 'Michael Jackson', 1, 1),
(4, '1960er', 0, 2),
(5, '1970er', 1, 2),
(6, '1980er', 0, 2),
(7, 'Klavier', 0, 3),
(8, 'Flöte', 1, 3),
(9, 'Geige', 0, 3),
(10, 'Freddie Mercury', 1, 4),
(11, 'Mick Jagger', 0, 4),
(12, 'David Bowie', 0, 4),
(13, 'Rock', 0, 5),
(14, 'Jazz', 1, 5),
(15, 'Hip-Hop', 0, 5),
(16, 'Michael Jackson - \"Thriller\"', 0, 6),
(17, 'The Rolling Stones - \"Sticky Fingers\"', 0, 6),
(18, 'Billy Joel - \"52nd Street\"', 1, 6),
(19, 'Hip-Hop', 1, 7),
(20, 'Country', 0, 7),
(21, 'Reggae', 0, 7),
(22, 'Jimmy Page (Led Zeppelin)', 0, 8),
(23, 'Jimi Hendrix', 0, 8),
(24, 'Ritchie Blackmore (Deep Purple)', 1, 8),
(25, 'Die Zauberflöte', 0, 9),
(26, 'La Traviata', 1, 9),
(27, 'Die Meistersinger von Nürnberg', 0, 9),
(28, 'Klarinette', 1, 10),
(29, 'Trompete', 0, 10),
(30, 'Geige', 0, 10),
(31, 'Quentin Tarantino', 0, 11),
(32, 'Steven Spielberg', 1, 11),
(33, 'Martin Scorsese', 0, 11),
(34, 'The Dark Knight', 1, 12),
(35, 'Inception', 0, 12),
(36, 'Brokeback Mountain', 0, 12),
(37, 'Joker', 0, 13),
(38, '1917', 0, 13),
(39, 'Parasite', 1, 13),
(40, 'Titanic', 1, 14),
(41, 'Avatar', 0, 14),
(42, 'Terminator 2: Judgment Day', 0, 14),
(43, 'Chris Evans', 0, 15),
(44, 'Chris Hemsworth', 0, 15),
(45, 'Robert Downey Jr.', 1, 15),
(46, 'Bruce', 1, 16),
(47, 'Jaws', 0, 16),
(48, 'Moby', 0, 16),
(49, 'Orlando Bloom', 0, 17),
(50, 'Elijah Wood', 1, 17),
(51, 'Sean Connery', 0, 17),
(52, 'Reservoir Dogs', 1, 18),
(53, 'Pulp Fiction', 0, 18),
(54, 'Jackie Brown', 0, 18),
(55, '1977', 1, 19),
(56, '1983', 0, 19),
(57, '1990', 0, 19),
(58, 'Christopher Nolan', 1, 20),
(59, 'David Fincher', 0, 20),
(60, 'Ridley Scott', 0, 20);


CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `questions` (`id`, `question`, `topic`) VALUES
(1, 'Welcher dieser Künstler ist als \"King of Pop\" bekannt?', 'MUSIC'),
(2, 'In welchem Jahrzehnt erlebte die Disco-Musik ihre Blütezeit?', 'MUSIC'),
(3, 'Welches Instrument spielt der Protagonist in der berühmten Mozart-Oper \"Die Zauberflöte\"?', 'MUSIC'),
(4, 'Wer ist der Leadsänger der Band \"Queen\"?', 'MUSIC'),
(5, 'Welches Genre ist mit Künstlern wie John Coltrane und Miles Davis verbunden?', 'MUSIC'),
(6, 'Welches Album wurde als erstes auf CD veröffentlicht?', 'MUSIC'),
(7, 'Welche Musikrichtung ist eng mit dem New Yorker Stadtteil Bronx verbunden?', 'MUSIC'),
(8, 'Wer ist für das berühmte Gitarrenriff in \"Smoke on the Water\" verantwortlich?', 'MUSIC'),
(9, 'Welche Oper wurde von Giuseppe Verdi komponiert?', 'MUSIC'),
(10, 'Welches dieser Musikinstrumente gehört zur Familie der Holzblasinstrumente?', 'MUSIC'),
(11, 'Wer führte Regie bei \"Forrest Gump\"?', 'MOVIES'),
(12, 'In welchem Film spielte Heath Ledger die ikonische Rolle des Jokers?', 'MOVIES'),
(13, 'Welcher Film gewann den Oscar für den besten Film im Jahr 2020?', 'MOVIES'),
(14, 'In welchem James Cameron Film spielt Leonardo DiCaprio die Hauptrolle?', 'MOVIES'),
(15, 'Welcher Schauspieler porträtiert den Charakter Iron Man im Marvel Cinematic Universe?', 'MOVIES'),
(16, 'Was ist der Name des weißen Hais im Film \"Der Weiße Hai\"?', 'MOVIES'),
(17, 'Wer spielte die Hauptrolle in der Trilogie \"Der Herr der Ringe\"?', 'MOVIES'),
(18, 'Welcher Film wurde von Quentin Tarantino inszeniert und handelt von einer Gruppe von Verbrechern, die einen Diamantenraub planen?', 'MOVIES'),
(19, 'In welchem Jahr wurde der erste Star Wars Film veröffentlicht?', 'MOVIES'),
(20, 'Wer ist der Regisseur des Films \"Inception\"?', 'MOVIES');


ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Question` (`question_id`);


ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;


ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


ALTER TABLE `answers`
  ADD CONSTRAINT `Question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;



/*
  CREATE delete_this_table
*/

CREATE TABLE `delete_this_table` (
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `delete_this_table` (`text`) VALUES
('Diese Tabelle wird mit der Hilfe von einer SQL Injection gelöscht. Sei gespannt.');
COMMIT;
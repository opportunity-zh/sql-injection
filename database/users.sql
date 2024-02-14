CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password1'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password2'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'password3'),
(4, 'Bob', 'Williams', 'bob.williams@example.com', 'password4'),
(5, 'Emily', 'Brown', 'emily.brown@example.com', 'password5'),
(6, 'Michael', 'Jones', 'michael.jones@example.com', 'password6'),
(7, 'Emma', 'Davis', 'emma.davis@example.com', 'password7'),
(8, 'William', 'Taylor', 'william.taylor@example.com', 'password8'),
(9, 'Olivia', 'Miller', 'olivia.miller@example.com', 'password9'),
(10, 'Daniel', 'Wilson', 'daniel.wilson@example.com', 'password10');


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;


<?php if(session_status() === PHP_SESSION_NONE) session_start();

include 'utils/db.php';
include 'utils/helper.php';

if(!isset($_SESSION['quiz'])){
    header('Location: index.php');
}


$answers = getAnswersByIds($dbConn, array_column($_SESSION['quiz'], 'answer'));


?>



<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
</head>
<body>
    <h1><?= 'Punkte: ' . $answers[0]['correct']; ?></h1>


    <a href="/">Neu starten</a>
</body>
</html>
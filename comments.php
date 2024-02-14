<?php

if(session_status() === PHP_SESSION_NONE) session_start();
include 'utils/db.php';

if(isset($_SESSION['user'])){
    $user = $_SESSION['user'];
    $comments = getAllComments($dbConn);
}

else{
    header('Location:index.php');
}


function getAllComments($dbConn){
    $query = "SELECT * FROM comments;";
    $stmt = $dbConn->query($query);

    if($stmt->rowCount() > 0){
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kommentare</title>
</head>
<body>

<header>
    <a href="/dashboard.php">&larr; zurück zum Dashboard</a>
</header>
    
<main>


<section>
    <div>
        <ul>
            <?php foreach($comments as $comment): ?>
                <li><?= $comment['comment']; ?></li>
            <?php endforeach ?>
        </ul>
    </div>
</section>
</main>
    
</body>
</html>
<?php if(session_status() === PHP_SESSION_NONE) session_start();

include 'utils/db.php';


if(isset($_SESSION['user'])){
    $user = $_SESSION['user'];
}

else{
    header('Location:index.php');
}



/**
 * POST REQUESTS
*/
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $newComment = $_POST['comment'];
    saveCommentToDB($dbConn, $newComment);
    header('Location: dashboard.php');
}




function saveCommentToDB($dbConn, $new_comment){
    $query = "INSERT INTO comments (comment) VALUES ('" . $new_comment . "')";
    $stmt = $dbConn->query($query);
}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>

<main>

<section>

<h1>Hallo <?= $user['firstname']; ?></h1>

<p>Erstelle hier einen neuen Kommentar zu unserer Applikation</p>

<form
    action="/dashboard.php"
    method="POST"
    style="display: flex; flex-direction: column; max-width: 16rem;"
>

    <div>
        <label for="">Kommentar</label>
        <textarea name="comment" id="" cols="30" rows="10"></textarea>
    </div>

    <button type="submit">Speichern</button>

</form>

</section>

<div style="display: flex; flex-direction: column; gap: 0.5rem;">
    <a href="/comments.php">Alle Kommentare ansehen &rarr;</a>
    <a href="/logout.php">Logout</a>
</div>

</main>
    
</body>
</html>
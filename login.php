<?php if(session_status() === PHP_SESSION_NONE) session_start();

include 'utils/db.php';

/**
 * GET REQUESTS
*/
if($_SERVER['REQUEST_METHOD'] == 'GET'){

    // redirect if user is already logged in
    // if(isset($_SESSION['user'])){
    //     header('Location:dashboard.php');
    // }
}

/**
 * POST REQUESTS
*/
if($_SERVER['REQUEST_METHOD'] == 'POST'){

    $email = $_POST['email'];
    $pw = $_POST['password'];

    // login the user
    loginUser($dbConn, $email ,$pw);
}


function loginUser($dbConn, $email, $pw){
    
    /**
     * ACHTUNG
     * Hier werden Variablen direkt in den Querystring eingegeben
    */
    $query = "SELECT * FROM users WHERE email = '$email' AND password = '$pw';";
    $stmt = $dbConn->query($query);

    // wenn user vorhanden speichere Daten in SESSION
    if ($stmt->rowCount() > 0) {
        $userData = $stmt->fetch(PDO::FETCH_ASSOC);
        $_SESSION['user']['id'] = $userData['id'];
        $_SESSION['user']['email'] = $userData['email'];
        $_SESSION['user']['firstname'] = $userData['firstname'];
        $_SESSION['user']['lastname'] = $userData['lastname'];
        header('Location:dashboard.php');
    }
    
    // wenn kein user refresh page
    else{
        header('Location: login.php');
    }
    
}


?>


<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

<main>
<section>

<form action="/login.php" method="POST">

<div>
    <label for="">E-Mail</label>
    <input type="text" name="email">
</div>

<div>
    <label for="">Passwort</label>
    <input type="text" name="password">
</div>


<button type="submit">Login</button>


</form>
</section>


</main>
    
</body>
</html>
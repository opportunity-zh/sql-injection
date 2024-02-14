<?php if(session_status() === PHP_SESSION_NONE) session_start();



if(isset($_SESSION['user'])){
    session_unset();
    header('Location:login.php');
} else{
    header('Location:login.php');
}
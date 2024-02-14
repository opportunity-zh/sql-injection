<?php
include 'utils/helper.php';
include 'utils/db.php';

/**
 * GET REQUESTS
*/
if($_SERVER['REQUEST_METHOD'] == 'GET'){
    if(isset($_GET['question'])){
        $id = $_GET['question'];
        $questions = '';

        /**
         * ACHTUNG: Variablen werden direkt in den Query geschrieben
        */
        $query = "SELECT * FROM questions INNER JOIN answers ON questions.id = answers.question_id WHERE questions.id = $id;";
        // var_dump($query);
        // exit;
        
        $stmt = $dbConn->query($query);

        if($stmt->rowCount() > 0){
            $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>


<?php if(!empty($questions)): ?>
    <table>
        <thead>
            <tr>
                <th>Frage</th>
                <th>Mögliche Antwort</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($questions as $question): ?>
                <tr>
                    <td><?= $question['question'] ?></td>
                    <td><?= $question['answer'] ?></td>
                </tr>
            <?php endforeach ?>
        </tbody>

    </table>

<?php else: ?>

    <h1>Füge in der URL folgende Zeilen hinzu: <span style="color: red;">?question=1</span></h1>


<?php endif ?>
    
</body>
</html>
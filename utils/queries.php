<?php
/*
    INCLUDE DATABASE CONNECTION
*/
include('utils/db.php');

/*
    SCHREIBE HIER DIE QUERIES
    Speichere diese immer in der Variable $queryString ab
    Bsp: SELECT * FROM books
*/

$queryString = "";



/*
    DATEN
    Hier kannst Du Platzhalter im Query mit Daten füllen
    Bsp: ':id' => 1
*/

$data = [];



/*
    DER QUERY WIRD AUSGEFÜHRT
    Die verschiedenen Schritte für PDO
*/

try{

    // überprüfe, ob Abfrage vorhanden ist
    if($queryString == ''){
        throw new \Exception('keine Abfrage in $queryString vorhanden');
    }

    // bereite die Abfrage vor
    $query = $dbConn->prepare($queryString);

    // füge Daten für Platzhalter ein, falls vorhanden
    $query->execute($data);

    // überprüfe, ob Daten zurück gegeben werden
    if($query->rowCount() == 0) {
        throw new \Exception('Deine Abfrage gibt keine Daten zurück');
    }

    // alle Daten werden aus der DB geholt und in einem assoziativen Array gespeichert
    $books = $query->fetchAll(PDO::FETCH_ASSOC);

    

} catch (PDOException $e) {
    die("Fehler: " . $e->getMessage());
}

catch (\Exception $e) {
    die("Fehler: " . $e->getMessage());
}


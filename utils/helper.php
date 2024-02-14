<?php



    // prettyPrint function to output variables in a readable format
    function prettyPrint($var) {
        echo '<pre>';
            print_r($var);
        echo '</pre>';
    }

    function dd($data){
        var_dump($data);
        exit;
    }






    function runQuery($dbConn, $queryString, $data){
        
        try{

            // überprüfe, ob Abfrage vorhanden ist
            if($queryString == ''){
                throw new \Exception('keine Abfrage in $queryString vorhanden');
            }
        
            // bereite die Abfrage vor
            $query = $dbConn->prepare($queryString);
            $query->execute($data);
        
            // überprüfe, ob Daten zurück gegeben werden
            if($query->rowCount() == 0) {
                throw new \Exception('Deine Abfrage gibt keine Daten zurück');
            }
        
            // alle Daten werden aus der DB geholt und in einem assoziativen Array gespeichert
            $result = $query->fetchAll(PDO::FETCH_ASSOC);

            // gib die Daten zurück
            return $result;
        
            
        
        } catch (PDOException $e) {
            die("Fehler: " . $e->getMessage());
        }
        
        catch (\Exception $e) {
            die("Fehler: " . $e->getMessage());
        }
    }



?>
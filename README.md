# Übung zu MySQL Injection

## ACHTUNG

Dieser Code ist absichtlich vulnerabel gestaltet und sollte unter keinen Umständen in Produktion verwendet werden. Passwörter sollten immer gehashed und niemals als Klartext gespeichert werden. SQL Queries müssten immer parametrisiert werden.

## Vorbereiten

Lade das Repository herunter und starte die Docker Container mit docker compose up.
Öffne PHPMyAdmin (localhost:8080) und die Applikation (localhost:8000)

## Erklärung

In diesem Projekt gibt es vier Hauptbereiche, die Seiten question.php, login.php, dashboard.php und comments.php. In jeder dieser Seiten lernst Du, wie Du SQL Injections durchführen kannst.

## Korrekte Antwort erhalten

Importiere für diese Übung die quiz.sql Datei in die Datenbank. Es werden die Tabellen questions, answers und delete_this_table erstellt und befüllt.

Stell Dir vor, Du hast ein Quiz programmiert und holst Du die Fragen mit den Antworten mit Hilfe von URL Parametern:

```bash
localhost:8000/question.php/question=1
```

Dieser Aufruf gibt Dir die Frage mit ID 1 mit den möglichen Antworten zurück.

Öffne dazu die Datei question.php und schaue dazu den GET Request an. Auch in diesem Beispiel wir er Query **nicht parametrisiert**. Deshalb kannst Du die URL so manipulieren, dass Du nur die korrekte Frage zurück erhälst. Ergänze die URL mit folgendem:

```bash
localhost:8000/question.php?question=1+AND+answers.is_correct+=+1
```

Das einzige was hier passiert ist, dass du den bestehenden SQL Befehl um eine **WHERE Klausel erweiterst**. Das funktioniert, weil die Variablen nicht parametrisiert werden.

## Tabelle löschen

Mit dieser Technik ist es sogar möglich, eine Tabelle zu löschen. Füge folgenden Befehl ein und schaue, was passiert.

```bash
localhost:8000/question.php?question=1;DROP+TABLE+delete_this_table#
```

Dies funktioniert nur, weil wir in Einstellungen für PDO (utils/db.php) das Attribut auf **PDO::ATTR_EMULATE_PREPARES auf true gesetzt** haben. Ändere es auf false und das Löschen wird nicht mehr möglich sein.

**Löse das Problem, indem Du den Query parametrisierst und solche Injections verhinderst**

## Einloggen ohne Angaben

Damit diese Übung funktioniert, musst du users.sql in deine Datenbank importieren.

Du kannst dich ohne eine E-Mail oder ein Passwort zu kennen einloggen, indem Du das E-Mail Feld leer lässt und ins Passwortfeld (ist extra als type="text", damit du deinen input siehst) folgendes eingibst:

```bash
' OR 1=1 #
```

Wenn Du auf Login klickst, wird es die erste Person eingeloggt, die im users Table vorhanden ist.

Der Befehl macht folgendes:

- Mit dem Anführungzeichen wird die Abfrage nach dem Passwort als leerer String abgeschlossen
- Der Query wird dann mit der OR Klausel ergänzt. Dank dieser werden die anderen WHERE Klauseln ignoriert.
- Denn weil 1=1 immer true ergibt wird das OR verwendet anstatt dass Email und Passwort abgefragt werden
- Der Hashtag am Schluss hilft dabei, dass das schliessende Anführungszeichen als Kommentar interpretiert wird und kein Fehler ausgegeben wird

Deshalb wird die erste Person aus der DB ausgegeben.

Eine weitere nützliche Funktion ist, wenn Du Dich mit einem bestimmten E-Mail Adresse einloggen willst und Du das Passwort nicht kennst.

Gehe dazu in die DB und finde eine E-Mail Adresse, mit welcher Du Dich einloggen willst. Kopiere die Adresse ins Inputfeld und ergänze folgendermassen, während Du das Passwortfeld leer lässt:

```bash
emily.brown@example.com' #
```

Diese Injection ändert den Query so ab, dass alles was nach der Überprüfung der E-Mail Adresse als Kommentar interpretiert wird und somit nur die E-Mail Adresse vorhanden sein muss.

**Verbessere den Code so, dass das nicht mehr geht**

### So kannst Du dich schützen

- Validierung der Felder, damit leere Felder nicht akzeptiert werden
- Parametrisierung des SQL Queries
- Prüfen, ob übergebene E-Mail und PW mit Daten aus Datenbank übereinstimmen

## Script einschleusen

Nun hast Du Dich mit einem Account eingeloggt, der nicht dir gehört und du kannst noch ein Bisschen weiter machen.

Du wurdest auf das Dashboard weitergeleitet und siehst, dass es dort ein Formular zum Erfassen von Kommentaren hat.

Bevor du etwas machst: **Importiere comments.sql.**

Füge ein Javascript Skript ein, das nur mal "Hallo Welt" ausgibt. Wenn das funktioniert, bist Du in der Lage, von Dir geschriebenen Javascript Code auf anderen Computern auszuführen.

Füge also folgendes Script in die Textarea im Dashboard ein.

```bash
<script>alert(\'Hallo Welt\');</script>
```

Was passiert, wenn Du auf "Kommentare ansehen" klickst?

## Weitere Scripts einfügen

Öffne PHPMyAdmin um das eingefügte script wieder aus der DB zu löschen, damit sich nicht bei jedem Refresh ein Alert öffnet.

Weil Du nun weisst, dass Du in der Lage bist, Javascript auszuführen, kannst Du folgendes probieren:

- Füge ein Script in die DB, das dich auf eine andere Website weiterleitet
- Speichere das folgende Script über das Formular, besuche die Seite comments.php, öffne die Console und schau was passiert, wenn Du tippst

```bash
<script>document.onkeydown = function(e){console.log(e.key);};</script>
```

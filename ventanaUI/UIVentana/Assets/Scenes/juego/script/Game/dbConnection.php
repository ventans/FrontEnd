<?php

try
{
    $pdo = new PDO('mysql:host=localhost;dbname=ventanachile', 'unity', '1234');
    $pdo->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');
}
catch(PDOException $e)
{
    echo "ERROR CONECTING TO DATABASE" . $e->getMessage();
    exit();
}

echo "se ha conectado a la base de datos";

?>
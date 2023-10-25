<?php

include "dbConnection.php";

$userName = $_POST['userName'];
$email = $_POST['email'];
$pass = hash("sha256", $_POST['pass']);

$sql = "SELECT userName from usuarios WHERE userName = '$userName'";
$result = $pdo->query($sql);

if($result->rowCount() > 0)
{
    $data = array('done' => false, 'message' => "error nombre de usuario ya existe");
    Header('Content-Type: application/json');
    echo json_encode($data);
    exit();
}
else
{
    $sql = "SELECT email from usuarios WHERE email = '$email'";
    $result = $pdo->query($sql);

    if($result->rowCount() > 0)
    {
        $data = array('done' => false, 'message' => "error email ya existe");
        Header('Content-Type: application/json');
        echo json_encode($data);
        exit();
    }
    else
    {
        $sql = "INSERT INTO usuarios SET UserName = '$userName', email = '$email', password = '$pass' " ;
        $pdo->query($sql);

        $data = array('done' => true, 'message' => "usuario nuevo creado");
        Header('Content-Type: application/json');
        echo json_encode($data);
        exit();
    }
}

?>
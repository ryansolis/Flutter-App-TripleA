<?php

include 'conn.php';

    $idnumber = $_POST['id_number'];
    $password = $_POST['password'];

    $queryResult = $connect->query("SELECT * FROM accounts WHERE BINARY id_number ='".$idnumber."' and BINARY password='".$password."'");

    $result = array();

    while($fetchData = $queryResult->fetch_assoc()){
        $result[]=$fetchData;
    }

echo json_encode($result);
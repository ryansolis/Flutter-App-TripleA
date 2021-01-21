<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "triple_a";
    $table = "evacuationtable";

    $action = $_POST["action"];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if($conn->connect_error){
        die("Connection failed : " . $conn->connect_error);
        return;
    }

    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT * FROM $table";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }



?>
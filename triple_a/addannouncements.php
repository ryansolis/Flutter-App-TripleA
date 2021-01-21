<?php

    include 'conn.php';
    
    $action = $_POST["action"];
    $table = announcements;

    if("ADD_ANN" == $action){
        $_title = $_POST["title"];
        $_description = $_POST["description"];
        $_snippet = $_POST["snippet"];
        $_image = $_POST["image"];
        $sql = "INSERT INTO announcements (title, snippet, description, image) VALUES ('$_title','$_snippet','$_description','$_image')";
        $result = $connect->query($sql);
        echo "success";
        $connect->close();
        return;
    }
?>
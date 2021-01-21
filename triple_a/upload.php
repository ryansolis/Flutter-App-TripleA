<?php

    include 'conn.php';
    
    $image = $_FILES['image']['name'];
    $imagePath = "images/".$image;
    $title = $_POST['title'];
    $snippet = $_POST['snippet'];
    $description = $_POST['description'];

    move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);

    $connect->query("INSERT INTO announcements (title, snippet, description, image) VALUES ('".$title."','".$snippet."','".$description."','".$image."')");
?>
<?php

$connect = new mysqli("localhost", "root", "", "triple_a");

if($connect){
}
else{
    echo "Connection Failed";
    exit();
}
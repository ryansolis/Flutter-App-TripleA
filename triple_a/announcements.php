<?php


class Ann{

 public function select(){
    include 'conn.php';
     if($connect != null){
         $result = $connect->query("SELECT * FROM announcements");
         if($result->num_rows>0){
             $ann = array();
             while($row = $result->fetch_array()){
                 array_push($ann, array("id"=>$row['id'],"title"=>$row['title'],
                 "description"=>$row['description'], "snippet"=>$row['snippet'],
                 "image"=>$row['image']));
             }
             print(json_encode(array_reverse($ann)));
         }
     }
     else{
         print(json_encode(array("PHP EXCEPTION : CANT RETRIEVE FROM MYSQL")));
     }
 }
}
$ann=new Ann();
$ann->select();

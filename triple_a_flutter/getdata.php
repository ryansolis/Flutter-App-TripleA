<?php
	
	include 'conn.php';

	$sql=$db->query("SELECT * FROM students JOIN classlist ON students.studentid = classlist.studentid");

	$res=array();

	while($row=$sql->fetch_assoc()){
		$res[]=$row;
	}

	echo json_encode($res);

?>
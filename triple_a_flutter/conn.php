<?php

	$db = new mysqli("localhost", "root", "", "triple_a");

	if($db){
	}
	else{
		echo "Connection Failed";
		exit();
	}

?>
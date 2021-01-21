<?php
	
	include 'conn.php';

	$db->query("UPDATE `classlist` SET emergencystatus='help' WHERE studentid= 103");

?>

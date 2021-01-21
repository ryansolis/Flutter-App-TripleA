<?php
	
	include 'conn.php';

	$db->query("UPDATE `classlist` SET emergencystatus='safe' WHERE studentid= 103");

?>

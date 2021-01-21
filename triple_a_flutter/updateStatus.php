<?php
	
	include 'conn.php';

	$status = $_POST['status'];

	$db->query("UPDATE `classlist` SET =`emergencystatus`=".$status." WHERE studentid= 103");


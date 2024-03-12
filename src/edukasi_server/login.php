<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
	$response = array();
	$username = $_POST['username'];
	$password = md5($_POST['password']);

	$cek = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";
	$result = mysqli_fetch_array(mysqli_query($koneksi, $cek));

	if(isset($result)){
		$response['value'] = 1;
		$response['message'] = "berhasil login";
		$response['username'] = $result['username'];
		$response['nama'] = $result['nama'];
		$response['id'] = $result['id'];
		echo json_encode($response);
	} else {
		$response['value'] = 0;
		$response['message'] = "Gagal login";
		echo json_encode($response);
	}
}

?>
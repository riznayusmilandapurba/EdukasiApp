<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    $nama = $_POST['nama'];
    $username = $_POST['username'];
    $password = md5($_POST['password']); 
    $email = $_POST['email'];
    $nohp = $_POST['nohp'];

    $cek = "SELECT * FROM user WHERE username = '$username' OR email = '$email'";
    $result = mysqli_query($koneksi, $cek);

    if(mysqli_num_rows($result) > 0){
        // Jika sudah digunakan, kirim respons
        $response['value'] = 2;
        $response['message'] = "Username atau email telah digunakan";
    } else {
   
        $insert = "INSERT INTO user (nama, username, password, email, nohp) 
                   VALUES ('$nama', '$username', '$password', '$email', '$nohp')";

        if(mysqli_query($koneksi, $insert)){
            $response['value'] = 1;
            $response['message'] = "Berhasil didaftarkan";
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal didaftarkan";
        }
    }
} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
}

echo json_encode($response);

?>

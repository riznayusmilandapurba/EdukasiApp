<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    $nama = $_POST['nama'];
    $nobp = $_POST['nobp'];
    $nohp = $_POST['nohp'];
    $email = $_POST['email'];

    $insert = "INSERT INTO pegawai (nama, nobp, nohp, email) 
               VALUES ('$nama', '$nobp', '$nohp', '$email')";

    if (mysqli_query($koneksi, $insert)) {
        $response['value'] = 1;
        $response['message'] = "Berhasil Tambah Data";
    } else {
        $response['value'] = 0;
        $response['message'] = "Tambah Data: " . mysqli_error($koneksi);
    }
} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
}

echo json_encode($response);

?>

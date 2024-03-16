<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$id = $_POST['id'];
$nama = $_POST['nama'];
$email = $_POST['email'];
$nohp = $_POST['nohp'];

$sql = "UPDATE user SET nama = '$nama', email = '$email', nohp = '$nohp' WHERE id=$id";
$isSuccess = $koneksi->query($sql);

$res = [];
if ($isSuccess) {

    $cek = "SELECT * FROM user WHERE id = $id";
    $result = mysqli_fetch_assoc(mysqli_query($koneksi, $cek));

    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil edit data user";
    $res['nama'] = $result['nama'];
    $res['email'] = $result['email'];
    $res['nohp'] = $result['nohp'];
    $res['id'] = $result['id'];
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal edit data user";
}

// Mengirim respon dalam format JSON
echo json_encode($res);

?>

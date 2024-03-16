<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$id = $_POST['id'];

$sql = "DELETE FROM pegawai WHERE id= $id";
$isSuccess = $koneksi->query($sql);

$res = [];
if ($isSuccess) {
    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil menghapus data user dengan ID $id";
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal menghapus data user dengan ID $id";
}

// Mengirim respon dalam format JSON
echo json_encode($res);

?>

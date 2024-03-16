<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

// Ambil data yang dikirimkan melalui metode POST
$id = $_POST['id'];
$nama = $_POST['nama'];
$nobp = $_POST['nobp'];
$nohp = $_POST['nohp'];
$email = $_POST['email'];

// Lakukan kueri untuk mengupdate data pegawai
$sql = "UPDATE pegawai SET nama = '$nama', nobp = '$nobp', nohp = '$nohp', email = '$email' WHERE id=$id";
$isSuccess = $koneksi->query($sql);

// Buat respon JSON sesuai dengan hasil operasi update
$res = [];
if ($isSuccess) {
    // Jika update berhasil, ambil data pegawai yang telah diupdate
    $cek = "SELECT * FROM pegawai WHERE id = $id";
    $result = mysqli_fetch_assoc(mysqli_query($koneksi, $cek));

    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil edit data pegawai";
    $res['nama'] = $result['nama'];
    $res['nobp'] = $result['nobp'];
    $res['nohp'] = $result['nohp'];
    $res['email'] = $result['email'];
    $res['id'] = $result['id'];
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal edit data pegawai";
}

// Mengirim respon dalam format JSON
echo json_encode($res);

?>

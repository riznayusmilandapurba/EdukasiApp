<?php

header("Access-Control-Allow-Origin: *"); // Mengizinkan permintaan dari semua domain
include 'koneksi.php'; // Mengimpor file koneksi.php

// Pastikan metode permintaan adalah POST
if($_SERVER['REQUEST_METHOD'] === "POST") {

    // Inisialisasi respons
    $response = array();

    // Mendapatkan data dari permintaan POST dan melakukan sanitasi input
    $id = isset($_POST['id']) ? intval($_POST['id']) : null;
    $nama = isset($_POST['nama']) ? htmlspecialchars($_POST['nama']) : null;
    $username = isset($_POST['username']) ? htmlspecialchars($_POST['username']) : null;
    $password = isset($_POST['password']) ? password_hash($_POST['password'], PASSWORD_DEFAULT) : null; // Menggunakan password_hash untuk enkripsi password
    $email = isset($_POST['email']) ? filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) : null;
    $nohp = isset($_POST['nohp']) ? htmlspecialchars($_POST['nohp']) : null;

    // Memastikan bahwa ID tidak kosong dan memiliki nilai yang valid
    if ($id === null || $id <= 0) {
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal edit user: ID user tidak valid";
        echo json_encode($response);
        exit; // Keluar dari skrip
    }

    // Memastikan bahwa email yang diberikan valid
    if ($email === false) {
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal edit user: Email tidak valid";
        echo json_encode($response);
        exit; // Keluar dari skrip
    }

    // Membuat prepared statement untuk memperbarui data user
    $stmt = $koneksi->prepare("UPDATE user SET nama = ?, username = ?, password = ?, email = ?, nohp = ? WHERE id = ?");
    $stmt->bind_param("sssssi", $nama, $username, $password, $email, $nohp, $id);

    // Menjalankan prepared statement
    $isSuccess = $stmt->execute();

    // Memeriksa apakah query berhasil dijalankan
    if ($isSuccess) {
        // Menutup prepared statement
        $stmt->close();

        // Mengambil data user yang diperbarui dari database
        $result = $koneksi->query("SELECT * FROM user WHERE id = $id");

        // Memeriksa apakah data user ditemukan
        if ($result && $result->num_rows > 0) {
            $user = $result->fetch_assoc();

            // Menyiapkan respons dengan data user yang diperbarui
            $response['is_success'] = true;
            $response['value'] = 1;
            $response['message'] = "Berhasil edit user";
            $response['data'] = $user;
        } else {
            // Jika data user tidak ditemukan, kirim respons error
            $response['is_success'] = false;
            $response['value'] = 0;
            $response['message'] = "Gagal edit user: Data user tidak ditemukan setelah pengeditan";
        }
    } else {
        // Jika query gagal dijalankan, kirim respons error
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal edit user: Terjadi kesalahan pada server";
    }

    // Mengubah array respons menjadi format JSON dan mencetaknya
    echo json_encode($response);
} else {
    // Jika metode permintaan bukan POST, kirim respons error
    $response['is_success'] = false;
    $response['value'] = 0;
    $response['message'] = "Gagal edit user: Metode permintaan tidak valid";
    echo json_encode($response);
}

?>

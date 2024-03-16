<?php

$koneksi = mysqli_connect("localhost", "root", "", "edukasiapp");

if($koneksi){

	// echo "Database berhasil konek";
	
} else {
	echo "gagal Connect";
}

?>
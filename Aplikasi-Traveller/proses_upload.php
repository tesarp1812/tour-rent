<?php
include 'class/bukti.php';

$db = new bukti();

// Pastikan aksi telah didefinisikan dan bernilai 'input'
if (isset($_GET['aksi']) && $_GET['aksi'] == "input") {
    // Periksa apakah file berhasil diupload dan tidak ada error
    if (isset($_FILES['file']) && $_FILES['file']['error'] == UPLOAD_ERR_OK) {
        // Mendapatkan nama file yang diupload
        $fileName = $_FILES['file']['name'];

        // Panggil fungsi insert dari objek bukti dan kirimkan id_pesan serta nama file
        $db->insert($_POST['id_pesan'], $fileName);

        // Tampilkan pesan sukses dengan menggunakan alert JavaScript
        echo '<script>alert("Data berhasil diupload!");</script>';
    } else {
        // Tampilkan pesan error jika file gagal diupload
        echo '<script>alert("Upload gagal, silakan coba lagi.");</script>';
    }
} else {
    // Tampilkan pesan error jika aksi tidak didefinisikan atau tidak bernilai 'input'
    echo '<script>alert("Aksi tidak valid.");</script>';
}
?>

<?php 

include '../class/review.php';

$db= new review();



$aksi = $_GET['aksi'];
if ($aksi == "tambah") {
    $nama = $_POST['nama'];
    $konten = $_POST['konten'];
    $gambar = $_FILES['gambar']['name'];

    // Panggil fungsi input dengan parameter yang sesuai
    $db->input($nama, $konten, $gambar);
	
 	header("location:admin.php#ajax/review.php");

 }elseif($aksi == "hapus"){ 	
 	$db->hapus($_GET['id']);
	header("location:admin.php#ajax/review.php");

}elseif($aksi == "update"){
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $konten = $_POST['konten'];
    $gambar = $_FILES['gambar']['name'];

 	$db->update($id, $nama, $konten, $gambar);
 	header("location:admin.php#ajax/review.php");
 }
?>
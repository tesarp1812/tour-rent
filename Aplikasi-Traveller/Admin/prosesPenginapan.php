<?php

include '../class/penginapan.php';

$db = new penginapan();



$aksi = $_GET['aksi'];
if ($aksi == "tambah") {
	$hotel = $_POST['hotel'];
	$harga = $_POST['harga'];
	$ket_hotel = $_POST['ket_hotel'];
	$foto = $_FILES['foto']['name'];

	// Panggil fungsi input dengan parameter yang sesuai
	$db->input($hotel, $harga, $ket_hotel, $foto);

	header("location:admin.php#ajax/penginapan.php");
} elseif ($aksi == "hapus") {
	$db->hapus($_GET['id']);
	header("location:admin.php#ajax/penginapan.php");
} elseif ($aksi == "update") {
	$id_hotel = $_POST['id_hotel'];
    $hotel = $_POST['hotel'];
    $harga = $_POST['harga'];
    $ket_hotel = $_POST['ket_hotel'];
    $foto = $_FILES['foto'];

    $db->update($id_hotel, $hotel, $harga, $ket_hotel, $foto);
	
	header("location:admin.php#ajax/penginapan.php");
}

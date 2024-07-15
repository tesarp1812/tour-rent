<?php

include '../class/admin.php';

$db = new admin();



$aksi = $_GET['aksi'];
if ($aksi == "tambah") {
	$foto = $_FILES['foto']['name'];
	$user_admin = $_POST['user_admin'];
	$pass_admin = $_POST['pass_admin'];
	$level = $_POST['level'];
	$nama = $_POST['nama'];

	// Panggil fungsi input dengan parameter yang sesuai
	$db->input($foto, $user_admin, $pass_admin, $level, $nama);

	header("location:admin.php#ajax/data_admin.php");
} elseif ($aksi == "hapus") {
	$db->hapus($_GET['id']);
	header("location:admin.php#ajax/data_admin.php");
} elseif ($aksi == "update") {
	$id = $_POST['id'];
	$foto = $_FILES['foto'];
	$user_admin = $_POST['user_admin'];
	$pass_admin = $_POST['pass_admin'];
	$level = $_POST['level'];
	$nama = $_POST['nama'];

	$db->update($id, $foto, $user_admin, $pass_admin, $level, $nama);
	header("location:admin.php#ajax/data_admin.php");
}

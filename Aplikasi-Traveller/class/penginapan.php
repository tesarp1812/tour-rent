<?php

include "koneksi.php";


class penginapan extends database
{

	function __construct()
	{
		$this->getConnection();
	}


	function tampil_data()
	{
		$sql = "SELECT * FROM tbl_hotel";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}

	function hapus($id_hotel)
	{
		$sql = "DELETE from tbl_hotel where id_hotel='$id_hotel'";
		$result = mysqli_query($this->getConnection(), $sql);
	}

	function input($hotel, $harga, $ket_hotel, $foto)
	{

		$sql = "insert into tbl_hotel( `hotel`, `harga`,`ket_hotel`, `foto`) values('$hotel','$harga','$ket_hotel','$foto')";
		$result = mysqli_query($this->getConnection(), $sql);

		// Pastikan direktori target ada
		$targetDir = __DIR__ . "/../images/hotel/";
		if (!file_exists($targetDir)) {
			mkdir($targetDir, 0777, true); // Buat direktori jika belum ada
		}

		// Pindahkan file yang diunggah ke direktori target
		$targetFile = $targetDir . basename($foto);
		if (move_uploaded_file($_FILES['foto']['tmp_name'], $targetFile)) {
			echo "<script>alert('Gambar Berhasil diupload!');history.go(-1);</script>";
		} else {
			echo "<script>alert('Gambar gagal diupload!');history.go(-1);</script>";
		}
	}

	function edit($id_hotel)
	{
		$sql = "SELECT * from tbl_hotel where id_hotel='$id_hotel'";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}


	function update($id_hotel, $hotel, $harga, $ket_hotel, $foto)
	{


		if (empty($foto['name'])) {
			// Jika tidak ada gambar baru yang diunggah, hanya perbarui nama hotel, harga, dan keterangan
			$sql = "UPDATE tbl_hotel SET hotel='$hotel', harga=$harga, ket_hotel='$ket_hotel' WHERE id_hotel='$id_hotel'";
			$result = mysqli_query($this->getConnection(), $sql);
		} else {
			// Jika ada gambar baru, perbarui semua data termasuk gambar
			$sql = "UPDATE tbl_hotel SET hotel='$hotel', harga=$harga, ket_hotel='$ket_hotel', foto='$foto[name]' WHERE id_hotel='$id_hotel'";
			$result = mysqli_query($this->getConnection(), $sql);

			// Pastikan direktori target ada
			$targetDir = __DIR__ . "/../images/hotel/";
			if (!file_exists($targetDir)) {
				mkdir($targetDir, 0777, true); // Buat direktori jika belum ada
			}

			// Pindahkan file yang diunggah ke direktori target
			$targetFile = $targetDir . basename($foto['name']);
			if (move_uploaded_file($foto['tmp_name'], $targetFile)) {
				echo "<script>alert('Gambar Berhasil diupload!');history.go(-1);</script>";
			} else {
				// Jika gagal diunggah, tampilkan pesan error
				echo "<script>alert('Gambar gagal diupload!');history.go(-1);</script>";
			}
		}
	}
}

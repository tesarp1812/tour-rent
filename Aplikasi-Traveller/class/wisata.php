<?php

include "koneksi.php";


class wisata extends database
{

	function __construct()
	{
		$this->getConnection();
	}



	function tampil_data()
	{
		$sql = "SELECT * FROM tempat";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}

	function input($nama, $konten, $gambar)
	{

		$sql = "insert into tempat ( `nama`, `konten`, `gambar`) values('$nama','$konten','$gambar')";
		$result = mysqli_query($this->getConnection(), $sql);

		// Pastikan direktori target ada
		$targetDir = __DIR__ . "/../images/index/";
		if (!file_exists($targetDir)) {
			mkdir($targetDir, 0777, true); // Buat direktori jika belum ada
		}

		// Pindahkan file yang diunggah ke direktori target
		$targetFile = $targetDir . basename($gambar);
		if (move_uploaded_file($_FILES['gambar']['tmp_name'], $targetFile)) {
			echo "<script>alert('Gambar Berhasil diupload!');history.go(-1);</script>";
		} else {
			echo "<script>alert('Gambar gagal diupload!');history.go(-1);</script>";
		}
	}

	function hapus($id)
	{
		$sql = "DELETE from tempat where id='$id'";
		$result = mysqli_query($this->getConnection(), $sql);
	}

	function edit($id)
	{
		$sql = "SELECT * from tempat where id='$id'";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}





	function update($id, $nama, $konten, $gambar)
	{


		// Cek apakah ada file gambar yang diunggah
		if (empty($gambar['name'])) {
			// Jika tidak ada gambar baru yang diunggah, hanya perbarui nama dan konten
			$sql = "UPDATE tempat SET nama='$nama', konten='$konten' WHERE id='$id'";
			$result = mysqli_query($this->getConnection(), $sql);
		} else {
			// Jika ada gambar baru, perbarui semua data termasuk gambar
			$sql = "UPDATE tempat SET nama='$nama', konten='$konten', gambar='$gambar[name]' WHERE id='$id'";
			$result = mysqli_query($this->getConnection(), $sql);
	
			// Pastikan direktori target ada
			$targetDir = __DIR__ . "/../images/index/";
			if (!file_exists($targetDir)) {
				mkdir($targetDir, 0777, true); // Buat direktori jika belum ada
			}
	
			// Pindahkan file yang diunggah ke direktori target
			$targetFile = $targetDir . basename($gambar['name']);
			if (move_uploaded_file($gambar['tmp_name'], $targetFile)) {
				echo "<script>alert('Gambar Berhasil diupload!');history.go(-1);</script>";
			} else {
				echo "<script>alert('Gambar gagal diupload!');history.go(-1);</script>";
			}
		}
	}
}

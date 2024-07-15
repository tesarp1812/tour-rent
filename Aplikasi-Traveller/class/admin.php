<?php

include "koneksi.php";


class admin extends database
{

	function __construct()
	{
		$this->getConnection();
	}

	public function login_admin($username, $password, $level)
	{

		$sql = "SELECT * from tbl_admin
						WHERE user_admin = '$username' AND pass_admin = '$password' ";
		$result = mysqli_query($this->getConnection(), $sql);
		$user_data	= mysqli_fetch_array($result);
		$no_rows	= mysqli_num_rows($result);

		if ($no_rows == 1) {
			$_SESSION['login'] = true;
			$_SESSION['nama'] = $user_data['nama'];
			$_SESSION['foto'] = $user_data['foto'];
			$_SESSION['level'] = $user_data['level'];



			return TRUE;
		} else {
			return FALSE;
		}
	}

	function tampil_data()
	{
		$sql = "SELECT * FROM tbl_admin";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}

	function input($foto, $user_admin, $pass_admin, $level, $nama)
	{

		$sql = "insert into tbl_admin ( `foto`, `user_admin`, `pass_admin`,`level`,`nama`) values('$foto','$user_admin','$pass_admin','$level','$nama')";
		$result = mysqli_query($this->getConnection(), $sql);

		// Pastikan direktori target ada
		$targetDir = __DIR__ . "/../foto/admin/";
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

	function hapus($id)
	{
		$sql = "DELETE from tbl_admin where id='$id'";
		$result = mysqli_query($this->getConnection(), $sql);
	}

	function edit($id)
	{
		$sql = "SELECT * from tbl_admin where id='$id'";
		$result = mysqli_query($this->getConnection(), $sql);
		while ($row = mysqli_fetch_array($result)) {
			$hasil[] = $row;
		}
		return $hasil;
	}





	function update($id, $foto, $user_admin, $pass_admin, $level, $nama)
	{


		if (empty($foto['name'])) {
			$sql = "UPDATE tbl_admin SET   user_admin='$user_admin', pass_admin='$pass_admin', level='$level', nama='$nama' WHERE id='$id'";
			$result = mysqli_query($this->getConnection(), $sql);
		} else {
			// Jika ada gambar baru, perbarui semua data termasuk gambar
			$sql = "UPDATE tbl_admin SET   foto='$foto[name]', user_admin='$user_admin', pass_admin='$pass_admin', level='$level', nama='$nama' WHERE id='$id'";
			$result = mysqli_query($this->getConnection(), $sql);

			// Pastikan direktori target ada
			$targetDir = __DIR__ . "/../foto/admin/";
			if (!file_exists($targetDir)) {
				mkdir($targetDir, 0777, true); // Buat direktori jika belum ada
			}

			// Pindahkan file yang diunggah ke direktori target
			$targetFile = $targetDir . basename($foto['name']);
			if (move_uploaded_file($foto['tmp_name'], $targetFile)) {
				// Jika berhasil diunggah, tampilkan pesan sukses
				echo "<script>alert('Gambar berhasil diupload!');history.go(-1);</script>";
			} else {
				// Jika gagal diunggah, tampilkan pesan error
				echo "<script>alert('Gambar gagal diupload!');history.go(-1);</script>";
			}
		}
	}
}

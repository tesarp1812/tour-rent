<?php
session_start();


// Memuat autoloader Composer untuk Dompdf
require_once 'vendor/autoload.php';

use Dompdf\Dompdf;

// Memuat kelas koneksi database
require_once 'class/koneksi.php';

if(isset($_SESSION['id_user'])){
    // Membuat objek koneksi database
    $db = new database();
    $connection = $db->getConnection();

    // Memeriksa koneksi database
    if ($connection->connect_errno) {
        echo "Koneksi ke database gagal: " . $connection->connect_errno;
        exit;
    }

    // Ambil data dari database menggunakan koneksi
    $id_pesan = $_GET['id'];
    $stmt = $connection->prepare("SELECT * FROM tbl_pesan 
                                  INNER JOIN tbl_paket ON tbl_pesan.id_paket = tbl_paket.id_paket
                                  INNER JOIN tbl_hotel ON tbl_pesan.id_hotel = tbl_hotel.id_hotel
                                  INNER JOIN tbl_user ON tbl_pesan.id_user = tbl_user.id_user
                                  WHERE id_pesan = ?");
    $stmt->bind_param('i', $id_pesan);
    $stmt->execute();
    $result = $stmt->get_result();

    // Memeriksa apakah data ditemukan
    if ($result->num_rows == 0) {
        echo "Data tidak ditemukan.";
        exit;
    }

    // Mengambil data dari hasil query
    $isi_tbl = $result->fetch_assoc();

    // Menutup statement
    $stmt->close();

    // Membuat HTML untuk PDF
    ob_start();
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <style type="text/css">
        
        div.zone { border: none; border-radius: 6mm; background: #FFFFFF; border-collapse: collapse; padding:3mm; font-size: 2.7mm;}
        h1 { padding: 0; margin: 0; color: #DD0000; font-size: 7mm; }
        h2 { padding: 0; margin: 0; color: #222222; font-size: 5mm; position: relative; }
        
    </style>
    </head>
    <body>
    <page format="105x200" orientation="L" backcolor=" #800000 " style="font: arial;">
        <div style="rotate: 90; position: absolute; width: 100mm; height: 4mm; left: 195mm; top: 0; font-style: italic; font-weight: normal; text-align: center; font-size: 2.5mm;">

        </div>
        <table style="width: 99%;border: none;" cellspacing="4mm" cellpadding="0">
            <tr>
                <td colspan="2" style="width: 100%">
                    <div class="zone" style="height: 34mm;position: relative;font-size: 5mm;">
                        <div style="position: absolute; right: 3mm; top: 3mm; text-align: right; font-size: 4mm; ">
                            <b><?= $isi_tbl['nama_user'] ?></b><br>
                        </div>
                        <div style="position: absolute; right: 3mm; bottom: 3mm; text-align: right; font-size: 4mm; ">
                            Jenis Paket : <b><?= $isi_tbl['nama_paket'] ?></b><br>
                            Total Biaya : <b><?= $isi_tbl['harga_paket'] + $isi_tbl['harga'] ?> IDR</b><br>
                            Code Booking : <b><?= 'BT00'.$isi_tbl['id_pesan'].' - ('.$isi_tbl['tgl_pesan'].')' ?></b><br>
                            Tanggal Tour : <b><?= $isi_tbl['tgl_tour'] ?></b><br>
                        </div>
                        <!-- <img src="images/garden.png" width="100" height="99" /> -->
                        <span style="position: absolute; left: 32mm; top: 10mm; font-size: 28px; color: red">BRV Tour</span><br />
                        <span style="position: absolute; left: 32mm; top: 18mm; font-size: 16px;">mataloko, <?= date("d M Y") ?></span>

                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 25%;">
                    <div class="zone" style="height: 40mm;vertical-align: middle;text-align: center;">
                        <qrcode value="<?= 'BT00'.$isi_tbl['id_pesan']."\n".$isi_tbl['nama_user']."\n".date("d M Y") ?>" ec="Q" style="width: 37mm; border: none;"></qrcode>
                    </div>
                </td>
                <td style="width: 75%">
                    <div class="zone" style="height: 40mm;vertical-align: middle; text-align: justify">
                        <b>Ketentuan :</b><br>
                        1. Perubahan Peket dan Penginapan silahkan hubungi contact person kami yang ada pada website, dan hanya bisa dilakukan 5 hari sebelum hari keberangkatan tour. Kurang dari itu perubahan tidak bisa dilakukan.<br>
                        2. Pembatalan booking dapat dilakukan 7 hari sebelum tanggal keberangkatan tour yang telah di booking. Biaya yang telah ditranfer akan dikembalikan dengan potongan 10% dari total biaya dan harus melakukan konfirmasi terlebih dahulu melalui contact person kami.<br>

                    </div>
                </td>
            </tr>
        </table>
    </page>
    </body>
    </html>

    <?php
    $content = ob_get_clean();

    // Konversi HTML ke PDF menggunakan Dompdf
    $dompdf = new Dompdf();
    $dompdf->loadHtml($content);
    $dompdf->setPaper('A4', 'landscape');
    $dompdf->render();

    // Simpan PDF ke file
    $filename = 'output.pdf';
    file_put_contents($filename, $dompdf->output());

    // Render PDF ke browser
    $dompdf->stream($filename);

} else {
    session_destroy();
    header('Location:formRegistrasi.php?status=Silahkan Login');
}
?>

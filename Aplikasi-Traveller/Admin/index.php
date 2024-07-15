<?php
// Menampilkan kesalahan untuk debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

try {
    // Memulai sesi jika belum dimulai
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Jika sudah ada sesi aktif, arahkan ke halaman sesuai level pengguna
    if (isset($_SESSION['level'])) {
        if ($_SESSION['level'] == "1") {
            header("Location: admin.php");
            exit();
        } elseif ($_SESSION['level'] == "2") {
            header("Location: operator.php");
            exit();
        }
    }

    include '../class/admin.php';

    $admin = new admin();

    $login_failed = false; // Tambahkan variabel ini untuk melacak status login

    // Periksa apakah form login telah dikirim
    if (isset($_POST['Login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $extraArg = "nilai_tambahan"; // Sesuaikan dengan kebutuhan fungsi login_admin

        $login = $admin->login_admin($username, $password, $extraArg);

        if ($login) {
            // Arahkan pengguna berdasarkan level mereka
            if ($_SESSION['level'] == "1") {
                header("Location: admin.php");
                exit();
            } elseif ($_SESSION['level'] == "2") {
                header("Location: operator.php");
                exit();
            }
        } else {
            // Login gagal
            $login_failed = true; // Set variabel ke true jika login gagal
        }
    }
} catch (Exception $e) {
    // Menangkap dan menampilkan pesan kesalahan
    echo 'Kesalahan: ',  $e->getMessage(), "\n";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin BT</title>
    <meta name="description" content="description">
    <meta name="author" content="Evgeniya">
    <meta name="keyword" content="keywords">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="plugins/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
        <script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container-fluid">
    <div id="page-login" class="row">
        <div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="text-right"></div>
            <div class="box">
                <div class="box-content">
                    <div class="text-center">
                        <h3 class="page-header">Login</h3>
                    </div>
                    <form role="form" action="" method="post">
                        <div class="form-group">
                            <label class="control-label">Username</label>
                            <input type="text" class="form-control" name="username" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Password</label>
                            <input type="password" class="form-control" name="password" />
                        </div>
                        <input type="submit" name="Login" class="btn btn-primary btn-block" value="Log in" />
                        <?php
                        if ($login_failed) {
                            echo '<div class="alert alert-danger" role="alert">Login failed. Please check your username and password.</div>';
                        }
                        ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

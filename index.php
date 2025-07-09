<?php
include 'config.php';

$result = mysqli_query($conn, "SELECT * FROM produk ORDER BY id DESC LIMIT 5");
$whs = [];
while ($wh = mysqli_fetch_assoc($result)) {
    $whs[] = $wh;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Style Heaven</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="style/index.css">
    <link rel="stylesheet" href="style/header.css">
    <style>
        .tim {
            background-color: rgb(204, 204, 204);
            margin-bottom: -40px;
            text-align: center;
            padding: 50px 10vw;

            p {
                margin-top: -20px;
                color:rgb(47, 47, 47);
            }
        }

        @media (max-width: 1000px) {
            footer p {
                font-size: 12px !important;
            }
        }
    </style>
</head>
<script src="js/functions.js"></script>

<body>
    <?php session_start(); ?>
    <?php include 'header.php' ?>
    <main>
        <section id="hero">
            <div class="hero-background">
            </div>
            <h2 style="font-size: 2rem; margin-top: 150px; margin-bottom: 0.1em;">WELCOME TO BATIK GIRI JATI </h2>
            <p>Dress Like a Dream, Live in Style.</p>
            <a href="new.php" class="btn">Shop Now →</a>
        </section>

                <section id="whatshot">
            <h1>Terbaru</h1>
            <div class="grid">
                <?php foreach ($whs as $w) { ?>
                    <div class="grid-item">
                        <img alt="Product" src="uploads/<?= $w['gambar'] ?>" />
                        <h2><?php $words = explode(" ", $w['nama']);
                            $short_desc = count($words) > 6 ? implode(" ", array_slice($words, 0, 6)) . "..." : $w['nama'];
                            echo $short_desc; ?></h2>
                        <p><?php $words = explode(" ", $w['deskripsi']);
                            $short_desc = count($words) > 10 ? implode(" ", array_slice($words, 0, 10)) . "..." : $w['deskripsi'];
                            echo $short_desc; ?></p>
                        <a href="viewproduk.php?id=<?= $w['id'] ?>">SHOP NOW</a>
                    </div>
                <?php } ?>
            </div>
        </section>
        <div class="wa">
            <a href="https://wa.me/6287733803742" target="_blank"><i class="bi bi-whatsapp"></i></a>
        </div>
        <div class="tim">
            <h1>ABOUT WEBSITE</h1>
            <p>Batik Giri Jati merupakan platform E-Commerce yang mempermudah customer dalam berbelanja secara online. Dalam proses belanja, customer tidak perlu mengunjungi toko fisik maupun mencoba langsung produk yang diinginkan.</p>
            <p style="margin-top: 10px;">Developed by - <span style="font-weight: bold;">Kelompok Hebat</span></p>
            <p>Felix Joko Nugroho <br>Mugiartono <br>Indah Oktavia <br>Salma Nur</p>
        </div>
    </main>
    <footer>
        <p>Copyright &copy; 2025 Batik Giri Jati. All rights reserved.</p>
    </footer>
</body>

</html>
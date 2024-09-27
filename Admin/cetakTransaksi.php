<?php 

$title = 'Transaksi Belanja';

require 'adminControl.php';
require 'template/headerAdmin.php';
require 'template/sidebarAdmin.php';

$idTransaksi = $_GET["idTransaksi"];
$username = $_GET["username"];

$detailTransaksi = query("SELECT * FROM transaksi JOIN customer ON transaksi.username = customer.username WHERE transaksi.idTransaksi = '$idTransaksi' AND transaksi.username = '$username'")[0];

$keranjangUser = query("SELECT * FROM keranjang
JOIN produk ON keranjang.idProduk = produk.idProduk
WHERE keranjang.username = '$username' AND keranjang.idTransaksi = '$idTransaksi'");

$tanggalTransaksi = strtotime($detailTransaksi["tanggalTransaksi"]);
$tanggalFormatted = date("j F Y", $tanggalTransaksi);

?>

<main id="main" class="main">
    <div class="pagetitle">
      <h1 class="text-primary">Detail Transaksi</h1>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="container-fluid">
            <div class="row">

                <div class="col">
                    
                    <div class="container mt-3">
                        <div class="row align-items-center">
                            <center>
                                <img src="../favicon.png" width="60px" class="mb-1">
                                <div class="col-md-10">
                                    <h2 class="mb-1"><strong style="color: #0C3457">PharmEase </strong></h2>
                                    <h4 class="mb-2">Laporan Belanja <?= $detailTransaksi["username"]; ?></h4>
                                </div>
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <ul class="list-group">
                                <li class="list-group-item"><strong>Username:</strong> <?= $detailTransaksi["username"]; ?></li>
                                <li class="list-group-item"><strong>Nama:</strong> <?= $detailTransaksi["namaLengkap"]; ?></li>
                                <li class="list-group-item"><strong>Alamat:</strong> <?= $detailTransaksi["alamat"]; ?></li>
                                <li class="list-group-item"><strong>No. Telp:</strong> <?= $detailTransaksi["contact"]; ?></li>
                                <li class="list-group-item"><strong>Tanggal Transaksi:</strong> <?= $tanggalFormatted; ?></li>
                                <li class="list-group-item"><strong>Nama Bank:</strong> <?= $detailTransaksi["bank"]; ?></li>
                                <li class="list-group-item"><strong>Cara Bayar:</strong> <?= $detailTransaksi["caraBayar"]; ?></li>
                                <!-- Status Transaksi -->
                                <li class="list-group-item"><strong>Status Transaksi:</strong> <?= $detailTransaksi["statusTransaksi"]; ?></li>
                                <!-- Status Pengiriman -->
                                <li class="list-group-item"><strong>Status Pengiriman:</strong> <?= $detailTransaksi["statusPengiriman"]; ?></li>
                            </ul>
                        </div>
                        
                        <div class=" card col">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">ID Produk</th>
                                        <th scope="col">Nama Produk</th>
                                        <th scope="col">Jumlah</th>
                                        <th scope="col">Harga</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1; ?>
                                    <?php foreach($keranjangUser as $keranjang) : ?>
                                    <tr>
                                        <td><?= $i; ?></td>
                                        <td><?= $keranjang["idProduk"]; ?></td>
                                        <td><?= $keranjang["namaProduk"]; ?></td>
                                        <td><?= $keranjang["jumlah"]; ?></td>
                                        <td>Rp<?= number_format($keranjang["harga"], 0, ',', '.'); ?></td>
                                    </tr>
                                    <?php $i++; ?>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                            <div class="fw-bold">Total Harga: Rp<?= number_format($detailTransaksi["totalHarga"], 0, ',', '.'); ?></div>
                            <div class="mt-3 text-end">
                                <h5>Pemilik Toko</h5>
                                <img src="../ttd.png" alt="Tanda Tangan" style="width: 200px; height: 200px;">
                                <p class="fw-bold">PharmEase</p>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4">
                        <div class="fw-bold">Feedback:</div>
                        <?= $detailTransaksi["feedBack"] ? $detailTransaksi["feedBack"] : "Belum ada feedback."; ?>
                    </div>

                    <div class="text-center mt-3">
                        <button id="printButton" class="btn btn-secondary mx-2">Cetak</button>
                        <a href="viewTransaksi.php" style="text-decoration: none;">
                            <button id="kembali" class="btn btn-warning mx-2">Kembali</button>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section><!-- End Section -->  
</main><!-- End #main -->

<script>
    // Saat tombol cetak halaman ditekan
    document.getElementById("printButton").addEventListener("click", function() {
        // Sembunyikan tombol kembali dan cetak halaman
        document.getElementById("printButton").style.display = "none";
        document.getElementById("kembali").style.display = "none";

        // Cetak halaman
        window.print();
    });

    // Event yang dipicu setelah pencetakan selesai
    window.onafterprint = function() {
        // Kembalikan tata letak tombol-tombol cetak dan kembali ke posisi awal setelah pencetakan selesai
        document.getElementById("printButton").style.display = "inline-block";
        document.getElementById("kembali").style.display = "inline-block";
    };

    // Event yang dipicu sebelum pencetakan dimulai
    window.onbeforeprint = function() {
        // Sembunyikan tombol cetak dan kembali saat pencetakan dimulai
        document.getElementById("printButton").style.display = "none";
        document.getElementById("kembali").style.display = "none";
    };
</script>

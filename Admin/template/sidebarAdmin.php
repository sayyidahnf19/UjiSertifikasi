<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

<ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
        <a class="nav-link <?php echo($title == 'Dashboard') ? 'text-primary' : 'collapsed'; ?>" href="dashboard.php">
            <i class="bi bi-house-door-fill"></i>
            <span>Dashboard</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link <?php echo($title == 'Daftar Produk') ? 'text-primary' : 'collapsed'; ?>" href="produkAdmin.php">
            <i class="bi bi-grid"></i>
            <span>Daftar Produk</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link <?php echo($title == 'Customer') ? 'text-primary' : 'collapsed'; ?>" href="viewCustomer.php">
            <i class="bi bi-person-fill"></i>
            <span>Customer</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link <?php echo($title == 'Transaksi Belanja') ? 'text-primary' : 'collapsed'; ?>" href="viewTransaksi.php">
            <i class="bi bi-file-text"></i><span>Transaksi Belanja</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link <?php echo($title == 'Guest Book') ? 'text-primary' : 'collapsed'; ?>" href="viewGuestBook.php">
            <i class="bi bi-book-half"></i><span>Guest Book</span>
        </a>
    </li>
    
</ul>

</aside><!-- End Sidebar-->

<?php

session_start();
include('includes/config.php');
error_reporting(0);

if (strlen($_SESSION['login']) == 0) {
    header('location:index.php');
} else {
    if (isset($_POST['submit'])) {

        include '../analisis/lib/PHPInsight/dictionaries/source.positif.php';
        include '../analisis/lib/PHPInsight/dictionaries/source.negatif.php';
        include '../analisis/lib/PHPInsight/dictionaries/source.netral.php';

        // Nilai yang dimasukkan
        $category_id = $_POST['category_id'];
        $title = $_POST['title'];
        $slug = generateSlug($title);
        $source = $_POST['source'];
        $description = $_POST['description'];

        // Membuat Slug dari Judul
        function generateSlug($title)
        {
            // Konversi ke huruf kecil
            $slug = strtolower($title);

            // Ganti spasi dengan garis bawah
            $slug = str_replace(' ', '_', $slug);

            // Hapus karakter yang tidak valid untuk URL
            $slug = preg_replace('/[^A-Za-z0-9\-_]/', '', $slug);

            return $slug;
        }

        $analyzePositif = array();
        $analyzeNegatif = array();
        $analyzeNetral = array();

        // Memeriksa $title
        $titleWords = explode(' ', $title);
        foreach ($titleWords as $word) {
            if (in_array($word, $pos)) {
                $analyzePositif[] = $word;
            }
        }

        // Memeriksa $description
        $detailsText = strip_tags($description);
        $detailsWords = explode(' ', $detailsText);
        foreach ($detailsWords as $word) {
            if (in_array($word, $pos)) {
                $analyzePositif[] = $word;
            }
        }

        // Memeriksa $title
        $titleWords = explode(' ', $title);
        foreach ($titleWords as $word) {
            if (in_array($word, $neg)) {
                $analyzeNegatif[] = $word;
            }
        }

        // Memeriksa $description
        $detailsText = strip_tags($description);
        $detailsWords = explode(' ', $detailsText);
        foreach ($detailsWords as $word) {
            if (in_array($word, $neg)) {
                $analyzeNegatif[] = $word;
            }
        }

        // Memeriksa $title
        $titleWords = explode(' ', $title);
        foreach ($titleWords as $word) {
            if (in_array($word, $net)) {
                $analyzeNetral[] = $word;
            }
        }

        // Memeriksa $description
        $detailsText = strip_tags($description);
        $detailsWords = explode(' ', $detailsText);
        foreach ($detailsWords as $word) {
            if (in_array($word, $net)) {
                $analyzeNetral[] = $word;
            }
        }

        $jumlahPositif = count($analyzePositif);
        $jumlahNegatif = count($analyzeNegatif);
        $jumlahNetral = count($analyzeNetral);

        // Calculate the differences
        $jumlah = $jumlahNegatif - $jumlahPositif - $jumlahNetral;

        // Determine the category with the highest count
        if ($jumlahNegatif >= $jumlahPositif && $jumlahNegatif >= $jumlahNetral) {
            $hasil = 'negatif';
        } elseif ($jumlahPositif >= $jumlahNegatif && $jumlahPositif >= $jumlahNetral) {
            $hasil = 'positif';
        } else {
            $hasil = 'netral';
        }

        // Prepare the SQL statement with placeholders
        $query = "INSERT INTO offline_post_analyze (positif, negatif, netral, jumlah, hasil) VALUES ('$jumlahPositif', '$jumlahNegatif', '$jumlahNetral', '$jumlah', '$hasil')";
        echo $query;
        echo " skip <br> ";

        // Menjalankan query dan memeriksa apakah berhasil
        if ($con->query($query) === TRUE) {
            $msg = "Data berhasil diinsert.";
        } else {
            $error = "Error: " . $sql . "<br>" . $con->error;
        }

        // Check for errors and provide appropriate feedback
        if ($result) {
            $msg = "Post successfully added. Negative Words Found: " . implode(', ', $analyzeNegatif);
        } else {
            $error = "Something went wrong. Please try again. Error: " . mysqli_error($con);
        }

        $analyzeIdQuery = "SELECT id FROM `offline_post_analyze` ORDER BY id DESC LIMIT 1";

        $result = mysqli_query($con, $analyzeIdQuery);

        if ($result) {
            $row = mysqli_fetch_assoc($result);
            // Extract data from the selected record
            $id_analyze = $row['id'];
        } else {
            // Handle kesalahan jika query SELECT gagal dijalankan
            echo "Error: " . mysqli_error($con);
            // Atau sesuaikan dengan penanganan kesalahan yang sesuai
        }

        $analyze_id = $id_analyze;

        // Query untuk melakukan insert
        $sql = "INSERT INTO `offline_posts` (`category_id`, `analyze_id`, `title`, `slug`, `source`, `description`) VALUES ('$category_id', '$analyze_id', '$title', '$slug', '$source', '$description')";

        // Menjalankan query dan memeriksa apakah berhasil
        if ($con->query($sql) === TRUE) {
            $msg = "Data berhasil diinsert.";
        } else {
            $error = "Error: " . $sql . "<br>" . $con->error;
        }
    }
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <!-- App title -->
        <title>Tambah Berita Offline</title>
        <link rel="icon" type="image/x-icon" href="../asset/Logo.png">

        <!-- Summernote css -->
        <link href="../plugins/summernote/summernote.css" rel="stylesheet" />

        <!-- Select2 -->
        <link href="../plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />

        <!-- Jquery filer css -->
        <link href="../plugins/jquery.filer/css/jquery.filer.css" rel="stylesheet" />
        <link href="../plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css" rel="stylesheet" />

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../plugins/switchery/switchery.min.css">
        <script src="assets/js/modernizr.min.js"></script>
    </head>

    <body class="fixed-left">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Top Bar Start -->
            <?php include('includes/topheader.php'); ?>
            <!-- ========== Left Sidebar Start ========== -->
            <?php include('includes/leftsidebar.php'); ?>
            <!-- Left Sidebar End -->

            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Tambah Berita Offline </h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Admin</a>
                                        </li>
                                        <li>
                                            <a href="#">Berita Offline</a>
                                        </li>
                                        <li class="active">
                                            Tambah Berita Offline
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-sm-6">
                                <!---Success Message--->
                                <?php if ($msg) { ?>
                                    <div class="alert alert-success" role="alert">
                                        <strong>Well done!</strong> <?php echo htmlentities($msg); ?>
                                    </div>
                                <?php } ?>

                                <!---Error Message--->
                                <?php if ($error) { ?>
                                    <div class="alert alert-danger" role="alert">
                                        <strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="p-6">
                                    <div class="">
                                        <form name="addpost" method="post" enctype="multipart/form-data">
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Judul Berita</label>
                                                <input type="text" class="form-control" id="title" name="title" placeholder="Masukkan Judul Berita" required>
                                            </div>
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Sumber Berita</label>
                                                <input type="text" class="form-control" id="source" name="source" placeholder="Masukkan Sumber Berita" required>
                                            </div>
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Kategori</label>
                                                <select class="form-control" name="category_id" id="category_id" onChange="getSubCat(this.value);" required>
                                                    <option value="">Pilih Kategori</option>
                                                    <?php
                                                    // Feching active categories
                                                    $ret = mysqli_query($con, "select id,CategoryName from  tblcategory where Is_Active=1");
                                                    while ($result = mysqli_fetch_array($ret)) {
                                                    ?>
                                                        <option value="<?php echo htmlentities($result['id']); ?>"><?php echo htmlentities($result['CategoryName']); ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Deskripsi Berita</b></h4>
                                                        <textarea class="summernote" name="description" required></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Gambar Terkait</b></h4>
                                                        <input type="file" class="form-control" id="images" name="images" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" name="submit" class="btn btn-success waves-effect waves-light">Save and Post</button>
                                            <button type="button" class="btn btn-danger waves-effect waves-light">Discard</button>
                                        </form>
                                    </div>
                                </div> <!-- end p-20 -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <?php include('includes/footer.php'); ?>
            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->



        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="../plugins/switchery/switchery.min.js"></script>

        <!--Summernote js-->
        <script src="../plugins/summernote/summernote.min.js"></script>
        <!-- Select 2 -->
        <script src="../plugins/select2/js/select2.min.js"></script>
        <!-- Jquery filer js -->
        <script src="../plugins/jquery.filer/js/jquery.filer.min.js"></script>

        <!-- page specific js -->
        <script src="assets/pages/jquery.blog-add.init.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

        <script>
            jQuery(document).ready(function() {

                $('.summernote').summernote({
                    height: 240, // set editor height
                    minHeight: null, // set minimum height of editor
                    maxHeight: null, // set maximum height of editor
                    focus: false // set focus to editable area after initializing summernote
                });
                // Select2
                $(".select2").select2();

                $(".select2-limiting").select2({
                    maximumSelectionLength: 2
                });
            });
        </script>
        <script src="../plugins/switchery/switchery.min.js"></script>

        <!--Summernote js-->
        <script src="../plugins/summernote/summernote.min.js"></script>
    </body>

    </html>
<?php } ?>
<?php 
    session_start();
    include('includes/config.php');
    error_reporting(0);
    if(strlen($_SESSION['login'])==0) { 
        header('location:index.php');
    } else {
        if(isset($_POST['update'])) {
            $title = $_POST['title'];
            $category_id = $_POST['category_id'];
            $description = $_POST['description'];
            // $posttitle=$_POST['posttitle'];
            // $catid=$_POST['category'];
            // $postdetails=$_POST['postdescription'];
            $source = $_POST['source'];
            $lastuptdby=$_SESSION['login'];
            $arr = explode(" ",$title);
            $url=implode("-",$arr);
            $status=1;
            $postid=intval($_GET['pid']);
            $query=mysqli_query($con,"update offline_posts set title='$title',source='$source',category_id='$category_id',description='$description',active='$status',last_updated_by='$lastuptdby' where id='$postid'");
            // $query=mysqli_query($con,"update tblposts_offline set PostTitle='$posttitle',CategoryId='$catid',PostDetails='$postdetails',PostUrl='$url',Is_Active='$status',lastUpdatedBy='$lastuptdby' where id='$postid'");
            
            if($query) {
                $msg="Post updated ";
            } else {
                $error="Something went wrong . Please try again.";    
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
        <title>Sunting Berita Offline</title>
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
           <?php include('includes/topheader.php');?>
            <!-- ========== Left Sidebar Start ========== -->
             <?php include('includes/leftsidebar.php');?>
            <!-- Left Sidebar End -->


            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
                        <div class="row">
							<div class="col-xs-12">
								<div class="page-title-box">
                                    <h4 class="page-title">Sunting Berita Offline</h4>
                                    <!-- <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Admin</a>
                                        </li>
                                        <li>
                                            <a href="#">Berita Offline</a>
                                        </li>
                                        <li class="active">
                                            Sunting Berita Offline
                                        </li>
                                    </ol> -->
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        
                        <div class="row">
                            <div class="col-sm-6">  
                                <!---Success Message--->  
                                <?php if($msg){ ?>
                                <div class="alert alert-success" role="alert">
                                    <strong>Well done!</strong> <?php echo htmlentities($msg);?>
                                </div>
                                <?php } ?>

                                <!---Error Message--->
                                <?php if($error){ ?>
                                <div class="alert alert-danger" role="alert">
                                    <strong>Oh snap!</strong> <?php echo htmlentities($error);?>
                                </div>
                                <?php } ?>
                            </div>
                        </div>

                        <?php
                            $postid=intval($_GET['pid']);
                            $query=mysqli_query($con,"select offline_posts.id as postid,offline_posts.title as title,offline_posts.source as source,offline_posts.description as description,categories.name as category,categories.id as category_id from offline_posts left join categories on categories.id=offline_posts.category_id where offline_posts.id='$postid' and offline_posts.active=1 ");
                            // $query=mysqli_query($con,"select tblposts_offline.id as postid,tblposts_offline.PostImage,tblposts_offline.PostTitle as title,tblposts_offline.PostDetails,tblcategory.CategoryName as category,tblcategory.id as catid from tblposts_offline left join tblcategory on tblcategory.id=tblposts_offline.CategoryId where tblposts_offline.id='$postid' and tblposts_offline.Is_Active=1 ");
                            while($row=mysqli_fetch_array($query))
                            {
                        ?>
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="p-6">
                                    <div class="">
                                        <form name="addpost" method="post">
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Judul Berita</label>
                                                <input type="text" class="form-control" id="title" value="<?php echo htmlentities($row['title']);?>" name="title" placeholder="Enter title" required>
                                            </div>
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Sumber Berita</label>
                                                <input type="text" class="form-control" id="source" value="<?php echo htmlentities($row['source']);?>" name="source" placeholder="Enter Source" required>
                                            </div>
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Kategori</label>
                                                <select class="form-control" name="category" id="category" onChange="getSubCat(this.value);" required>
                                                    <option value="<?php echo htmlentities($row['category_id']);?>"><?php echo htmlentities($row['category']);?></option>
                                                    <?php
                                                        // Feching active categories
                                                        $ret=mysqli_query($con,"select id,name from  categories where active=1");
                                                        while($result=mysqli_fetch_array($ret))
                                                        {    
                                                    ?>
                                                    <option value="<?php echo htmlentities($result['id']);?>"><?php echo htmlentities($result['name']);?></option>
                                                    <?php } ?>
                                                </select> 
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Deskripsi Berita</b></h4>
                                                        <textarea class="summernote" name="description" id='description' required><?php echo htmlentities($row['description']);?></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Gambar Terkait</b></h4>
                                                        <img src="postimages/<?php echo htmlentities($row['PostImage']);?>" width="300"/>
                                                        <br />
                                                        <a href="change-image.php?pid=<?php echo htmlentities($row['postid']);?>">Perbarui Gambar</a>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <!-- <form name="addpost" method="post" enctype="multipart/form-data">
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
                                                    $ret = mysqli_query($con, "select id,name from  categories where active=1");
                                                    while ($result = mysqli_fetch_array($ret)) {
                                                    ?>
                                                        <option value="<?php echo htmlentities($result['id']); ?>"><?php echo htmlentities($result['name']); ?></option>
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
                                            </div> -->
                                            <!-- <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Gambar Terkait</b></h4>
                                                        <img src="postimages/<?php echo htmlentities($row['url']);?>" width="300"/>
                                                        <br />
                                                        <a href="change-image.php?pid=<?php echo htmlentities($row['postid']);?>">Perbarui Gambar</a>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <?php } ?>
                                            
                                            <button type="submit" name="update" class="btn btn-success waves-effect waves-light">Update </button>
                                        </form>
                                    </div>
                                </div> <!-- end p-20 -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <?php include('includes/footer.php');?>

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

            jQuery(document).ready(function(){

                $('.summernote').summernote({
                    height: 240,                 // set editor height
                    minHeight: null,             // set minimum height of editor
                    maxHeight: null,             // set maximum height of editor
                    focus: false                 // set focus to editable area after initializing summernote
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
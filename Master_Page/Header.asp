<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Page ?</title>

    <meta charset="utf-8" />
    <script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Script/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../Script/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Script/parallax.min.js"></script>
    <script type="text/javascript" src="../Script/jquery.twbsPagination.min.js"></script>

    <link rel="stylesheet" href="../Css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Css/jquery-ui.min.css" />
    <link rel="stylesheet" href="../Css/my_style.css" />

    <!-- Jquery Runtime -->

    <script type="text/javascript">
        $(document).ready(function () {

            ////Sự kiện droplist LoaiSP change

            //$("#dropListLoaiSP").change(function () {

            //    var valueLoai = ($("#dropListLoaiSP option:selected").val());

            //    //window.location.href = "/NguoiDung/SanPham?page=1&loai=" + valueLoai;
            //    window.location.href = "/NguoiDung/SanPham/1/" + valueLoai;

            //});

            ////Live-Search cho droplist
            //$("#dropListLoaiSP").attr("data-live-search", true);

            ////dropdown list live-search

            //$('.selectpicker').selectpicker();

            ////set trắng textbox tìm kiếm

            //$("#tbTimKiem").focus(function () {

            //    $("#tbTimKiem").val("");

            //});

            ////autocomplete tbTimKiem

            //$("#tbTimKiem").autocomplete({
            //    source: '@Url.Action("AutoCompleteSanPham", "NguoiDung")'

            //});

            ////của slideshow
            //$('.flexslider').flexslider({
            //    animation: "slide",
            //    slideshow: true,
            //    thumbCaptions: true
            //});

            //var unslider = $('.banner').unslider();

            //$('.unslider-arrow').click(function () {
            //    var fn = this.className.split(' ')[1];

            //    //  Either do unslider.data('unslider').next() or .prev() depending on the className
            //    unslider.data('unslider')[fn]();
            //});

            //Magnify ảnh
            //$('img').magnify(
            //{
            //    speed: 200
            //});

            //Menu tự co vào khi scroll
            $(window).scroll(function () {
                if ($(document).scrollTop() > 50) {
                    $('nav').addClass('shrink');
                    $('#formSearch').addClass('shrink');
                } else {
                    $('nav').removeClass('shrink');
                    $('#formSearch').removeClass('shrink');
                }
            });

        });
    </script>
</head>
<body>

    <nav class="navbar navbar-default navbar-fixed-top normal" role="navigation">
        <div class="container">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="../Index.asp">
                    <img title="Cơ khí Minh Sơn" alt="Minh Sơn" src="../Images/logo.png" />
                </a>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">

                    <li><a href="Index.asp"><i class="fa fa-home fa-lg"></i>&nbsp Trang Chủ</a></li>
                    <li><a href="Products.asp"><i class="fa fa-gears fa-lg"></i>&nbsp Sản phẩm</a></li>
                    <li><a><i class="fa fa-users fa-lg"></i>&nbsp Về chúng tôi</a></li>

                    <li><a><i class="fa fa-user-plus fa-lg"></i>&nbsp Về chúng tôi</a></li>
                </ul>

                <div class="navbar-form navbar-right normal" id="formSearch" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" id="tbTimKiem" style="z-index: 999; display: inline;" name="tensp" placeholder="Tên máy" />
                        <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container body-content" id="divBaoBocBody">
        <br />
        <br />
        <br />
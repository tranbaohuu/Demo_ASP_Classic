<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Page ?</title>

    <meta charset="utf-8" />
    <script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Script/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../Script/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Script/parallax.min.js"></script>
    <script type="text/javascript" src="Script/jquery.flexslider-min.js"></script>

    <link rel="stylesheet" href="../Css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Css/jquery-ui.min.css" />
    <link rel="stylesheet" href="Css/flexslider.css" />
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
            $('.flexslider').flexslider({
                animation: "slide",
                slideshow: true,
                thumbCaptions: true
            });

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
    <!--#include file="Processes/ConnectionDB.asp"-->
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

                    <li><a href="Index.asp"><i class="fa fa-home fa-lg"></i>&nbsp Home</a></li>
                    <li><a href="Products.asp"><i class="fa fa-gears fa-lg"></i>&nbsp Products</a></li>
                    <li><a href="About_Us.asp"><i class="fa fa-users fa-lg"></i>&nbsp About us</a></li>

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

    <br />
    <br />

    <div class="container body-content">
        <div class="jumbotron" style="background-color: #fafafa;">
            <h1>Lời chào từ Minh Sơn</h1>
            <p>Thành lập từ năm 2003 đến nay sau hơn 12 năm kinh nghiệm chúng tôi tự tin với khả năng của mình có thể gia công và chế tạo ra những sản phẩm tốt với giá cả hợp lý nhất đến cho khách hàng.</p>
        </div>
    </div>
    <div class="parallax-window full-width-div" data-parallax="scroll" style="width: 100%" data-image-src="/IMAGES/parallax-engine.jpg"></div>

    <br />
    <br />
    <br />
    <div class="container body-content">

        <div class="jumbotron" style="background-color: #fafafa;">

            <div class="row">

                <div class="col-md-4">
                    <div style="text-align: center;">
                        <i class="fa fa-users fa-5x" style="color: #0e1752;"></i>
                        <p>Con người</p>
                        <p style="text-align: left; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp;Với đội ngũ trên 30 thợ lành nghề trong số đó cao nhất có trên 10 năm kinh nghiệm, luôn luôn không ngừng nâng cao tay nghề, học hỏi để luôn thích ứng được với sự thay đổi của yêu cầu công việc.</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div style="text-align: center;">
                        <i class="fa fa-plug fa-5x" style="color: #ff0c3e;"></i>
                        <p>Máy móc</p>
                        <p style="text-align: left; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp;Được đầu tư các loại máy tiện, phay CNC và mới đây là máy cắt Lassert. Có thể đáp ứng từng tiêu chí đề ra cho từng sản phẩm.</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div style="text-align: center;">
                        <i class="fa fa-eye fa-5x" style="color: #00a9ff;"></i>
                        <p>Sứ mệnh</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="parallax-window" data-parallax="scroll" data-image-src="/IMAGES/parralax-escalator.jpg"></div>
    <br />
    <br />
    <br />
    <div class="container body-content">

        <div class="jumbotron" style="background-color: #fafafa;">
            <div class="row">

                <div class="col-md-12">
                    <div style="text-align: center;">
                        <i class="fa fa-briefcase fa-5x" style="color: #0e1752;"></i>
                        <p>Đối tác</p>
                    </div>
                </div>

                <div class="row">

                    <div class="col-md-4">
                        <a href="http://www.taekwang.co.kr/">
                            <img src="Images/logo-doitac/taekwang-logo.png" width="200" height="200" />
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="http://www.pouchen.com/index.php/en/">
                            <img src="Images/logo-doitac/puchen-logo.png" width="200" height="200" />
                        </a>
                    </div>

                    <div class="col-md-4">
                        <a href="https://www.facebook.com/pages/Changshin-Vietnam-CoLTD/444869092253076">
                            <img src="Images/logo-doitac/changsin-logo.png" style="margin-top: 30px;" width="400" height="150" />
                        </a>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-4">
                        <a href="http://www.cropscience.bayer.com.vn/">
                            <img src="Images/logo-doitac/bayer-logo.png" width="170" height="170" />
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="https://www.toshiba.com.vn/">
                            <img src="Images/logo-doitac/toshiba-logo.png" width="200" height="200" />
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="http://www.sanor-e.com/">
                            <img src="Images/logo-doitac/sanore-logo.png" width="350" height="200" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="parallax-window" data-parallax="scroll" data-image-src="/IMAGES/parallax-air.jpg"></div>
    <br />
    <br />
    <br />
    <div class="container body-content">

        <div class="jumbotron" style="background-color: #fafafa;">
            <div class="row">

                <div class="col-md-12">
                    <div style="text-align: center;">
                        <i class="fa fa-star fa-5x" style="color: #F8D808;"></i>
                        <p>Sản phẩm tiêu biểu</p>
                    </div>
                </div>
            </div>
        </div>





        <div class="flexslider">
            <ul class="slides">

                <%

    Dim conn
    Dim recordSet
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.ConnectionTimeout = 10

    Set recordSet = Server.CreateObject("ADODB.Recordset")

    query = "select top 5 * from sanpham"

    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else

       do while not  recordSet.EOF

                %>

                <li>
                    <a href="#">
                        <img class="" src="IMAGES/<%=recordSet("IMG_URL") %>" /></a>
                    <p class="flex-caption"><%=recordSet("TEN")  %></p>
                </li>

                <%

    recordSet.MoveNext
    loop

                    recordSet.Close()
                    conn.Close()

    end if
                %>
            </ul>
        </div>


        <div class="page-header header-mathang">
            <h1>Molds
                    <small id="smalltest"><a class="btn btn-success">More</a></small>
            </h1>
        </div>
        <div class="row">

            <%
                     query = "select top 4 * from sanpham where ID_LOAIHANG = 1"

    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else

       do while not  recordSet.EOF
                 
            %>

            <div class="col-md-3">
                <div class="thumbnail">
                    <div>

                        <p class="text-center">
                            <a href="#"><%=recordSet("TEN") %></a>
                        </p>
                    </div>

                    <img class="img-thumbnail" data-original="#" width="320" height="240" alt="Không có hình" src='/IMAGES/<%=recordSet("IMG_URL") %>' style="display: block; width: 320px; height: 240px;">
                    <div class="caption">
                        <p>
                            <a href="#" class="btn btn-primary btn-lg btn-block">Detail</a>
                        </p>
                    </div>
                </div>
            </div>
            <%
                    
                       
       recordSet.MoveNext
       loop



                    recordSet.Close()
                    conn.Close()

    end if
            %>
        </div>

        <div class="page-header header-mathang">
            <h1>Machines
                    <small id=""><a class="btn btn-success">More</a></small>
            </h1>
        </div>
        <div class="row">

            <%
                     query = "select top 4 * from sanpham where ID_LOAIHANG = 2"

    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else

       do while not  recordSet.EOF
                 
            %>

            <div class="col-md-3">
                <div class="thumbnail">
                    <div>

                        <p class="text-center">
                            <a href="#"><%=recordSet("TEN") %></a>
                        </p>
                    </div>

                    <img class="img-thumbnail" data-original="#" width="320" height="240" alt="Không có hình" src='/IMAGES/<%=recordSet("IMG_URL") %>' style="display: block; width: 320px; height: 240px;">
                    <div class="caption">
                        <p>
                            <a href="#" class="btn btn-primary btn-lg btn-block">Detail</a>
                        </p>
                    </div>
                </div>
            </div>
            <%
                    
                       
       recordSet.MoveNext
       loop



                    recordSet.Close()
                    conn.Close()

    end if
            %>
        </div>
    </div>

    <footer class="footer" style="background-color: #333333; width: 100%; height: 100%; color: white; bottom: 0; left: 0;">
        <div class="container">
            <br />
            <p class="text-muted" style="color: white;">Công ty TNHH-MTV Cơ khí chế tạo Minh Sơn - MST: 3602477324 - Địa chỉ: 20A/4 phường Tam Hòa, Biên Hòa, Đồng Nai</p>

            <p class="text-muted" style="color: white;">&copy; @DateTime.Now.Year -Thiết kế và phát triển Trần Bảo Hữu</p>
        </div>
    </footer>
</body>
</html>

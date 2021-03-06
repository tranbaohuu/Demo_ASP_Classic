﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<!-- Cắt chuỗi để lấy header title -->
	<% tempArr = Split(GetPath(),"/") 
	   tempArray2 = Split(tempArr(3),".")
	   
	   
	   
	%>

	<title><%= tempArray2(0) %></title>
	<link rel="shortcut icon" href="Images/logo.png" />
	<meta charset="utf-8" />
	<script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../Script/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../Script/bootstrap.min.js"></script>
	<script type="text/javascript" src="../Script/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="../Script/jquery.twbsPagination.min.js"></script>

	<link rel="stylesheet" href="../Css/bootstrap.min.css" />
	<link rel="stylesheet" href="../Css/font-awesome.min.css" />
	<link rel="stylesheet" href="../Css/jquery-ui.min.css" />
	<link rel="stylesheet" href="../Css/bootstrap-select.min.css" />
	<link rel="stylesheet" href="../Css/my_style.css" />

	<%function GetPath()
	query_string = request.ServerVariables("QUERY_STRING")
	if query_string <> "" then
		query_string = "?" & query_string
	end if

	GetPath = "http://" & request.ServerVariables("SERVER_NAME") & request.ServerVariables("URL") & query_string
end function %>

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
			//    source: "GetProductName_Autocomplete()",

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

					<li><a href="Index.asp"><i class="fa fa-home fa-lg"></i>&nbsp Home</a></li>
					<li><a href="Products.asp"><i class="fa fa-gears fa-lg"></i>&nbsp Products</a></li>
					<li><a href="About_Us.asp"><i class="fa fa-users fa-lg"></i>&nbsp About us</a></li>
				</ul>
				<% if InStr(GetPath(),"Products") > 0 then %>
				<div class="navbar-form navbar-right normal" id="formSearch" role="search">
					<div class="form-group">
						<form action="../Products.asp" method="get">
							<input type="text" class="form-control" id="tbTimKiem" style="z-index: 999; display: inline;" name="pName" placeholder="Tên máy" />
							<button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
						</form>
					</div>
				</div>
				<% end if %>
			</div>
		</div>
	</nav>

	<div class="container body-content" id="divBaoBocBody">
		<br />
		<br />
		<br />

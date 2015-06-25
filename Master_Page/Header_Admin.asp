<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page</title>

    <script type="text/javascript" src="../Script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../Script/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../Script/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Script/parallax.min.js"></script>
    <script type="text/javascript" src="../Script/jquery.twbsPagination.min.js"></script>

    <link rel="stylesheet" href="../Css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Css/jquery-ui.min.css" />
    <link rel="stylesheet" href="../Css/my_style.css" />
</head>
<body>
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Control Panel</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="../ControlPanel.asp">Products Manage</a></li>
                    <!--      @if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;

                        if (username.Equals("admin"))
                        {

                            <li>@Html.ActionLink("Quản lý người dùng", "QuanLyNguoiDung", "HeThong")</li>

                        }
                    }-->
                </ul>

                <% if not IsEmpty(Session("username")) then %>

                <ul class="nav navbar-nav pull-right ">
                    <li><a href="Processes/processAdmin.asp?action=logout">Logout</a></li>
                </ul>
                <% end if %>
            </div>
        </div>
    </div>
    <div class="container body-content">
        <br />
        <br />
        <br />
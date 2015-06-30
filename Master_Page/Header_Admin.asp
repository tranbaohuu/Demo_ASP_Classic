<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="Images/logo.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Cắt chuỗi để lấy header title -->
    <% tempArr = Split(GetPath(),"/")
	   tempArray2 = Split(tempArr(3),".")

    %>

    <title><%= tempArray2(0) %></title>

    <%function GetPath()
	query_string = request.ServerVariables("QUERY_STRING")
	if query_string <> "" then
		query_string = "?" & query_string
	end if

	GetPath = "http://" & request.ServerVariables("SERVER_NAME") & request.ServerVariables("URL") & query_string
end function %>

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
                    <%
                        if not IsEmpty(Session("username"))  then
                        u = Session("username")
                         if InStr(u,"admin") > 0 then %>
                    <li><a href="../Employee_Manage.asp">Employee Manage</a></li>
                    <% end if
                        end if %>
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
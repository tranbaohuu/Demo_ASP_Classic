<!--#include file="Master_Page/Header.asp"-->
<!--#include file="Processes/ConnectionDB.asp"-->


<br />
<br />
<br />
<br />
<br />


<%
    
    Dim conn
    Dim recordSet
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.ConnectionTimeout = 10

    Set recordSet = Server.CreateObject("ADODB.Recordset")


    query = "select * from sanpham"

    conn.Open connectionString

    recordSet.Open query,conn


    if recordSet.EOF then
    
    Response.Write("No Record")

    else

%>


<div id="zoneUpdateAjax">
    <div class="row">
        <%

    do while not  recordSet.EOF
        %>




        <div class="col-md-4">
            <div class="thumbnail">
                <div>

                    <p class="text-center" style="font-size: large;">
                        <a href="#"><%=recordSet("TEN") %></a>
                    </p>

                </div>

                <img class="img-thumbnail" data-original="#" width="320" height="240" alt="Không có hình" src="IMAGES/<%=recordSet("IMG_URL")%>" style="display: block; width: 320px; height: 240px;">
                <div class="caption">
                    <p style="width: 100%;">
                        <a class="btn btn-primary btn-lg btn-block" href="#">Xem</a>
                    </p>
                </div>
            </div>
        </div>






        <%
  


    recordSet.MoveNext
    loop
        %>
    </div>


</div>

<%
    end if
    









%>







<!--#include file="Master_Page/Footer.asp"-->

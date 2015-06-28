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

    tempPage = 1

    'get Query String to select, check null or not

    if not   IsEmpty(Request("page")) then
    tempPage = Request("page")
    end if

    'query = "select * from sanpham"
    query = "SELECT * FROM dbo.sanpham ORDER BY ID OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS only"
    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else

%>

<div id="">
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

    recordSet.Close()

    conn.Close()

    'đang dính lỗi tính phân trang, hiện cần 1 câu select để lấy ra tổng số record đang có /12 (12 sản phẩm 1 trang) để tính ra số trang sẽ có

%>

<ul id="pagination-demo" class="pagination-sm"></ul>

<!--#include file="Processes/Proccess_SanPham.asp"-->

<%

   
    'Call function from Process_SanPham.asp to get total records on select


    tempCountRecord =  Count_SanPham("")

    tempCountRecord = Round(tempCountRecord/12)

conn.Close()



     Dim temparr
     temparr =  Products_AutoComplete()

    giatri_1 = temparr(0)
    giatri_2 = temparr(1)
    giatri_3 = temparr(2)
    giatri_4 = temparr(3)
    giatri_5 = temparr(4)
%>

<script type="text/javascript">

    $(document).ready(function () {
        //Pagination

        $('#pagination-demo').twbsPagination({
            //thẻ asp <% %> báo lỗi nhưng vẫn chạy được
            totalPages: <%=tempCountRecord  %>,
            visiblePages: 5,
            href: '?page={{number}}'
        });


        $("#tbTimKiem").focus(function () {

            $("#tbTimKiem").val("");

        });

        //autocomplete tbTimKiem

        var arr = ["<%=giatri_1%>","<%=giatri_2%>","<%=giatri_3%>","<%=giatri_4%>","<%=giatri_5%>"];


        $("#tbTimKiem").autocomplete({
            source: arr


        });
        

    });
</script>


<!--#include file="Master_Page/Footer.asp"-->

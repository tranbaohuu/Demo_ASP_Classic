<!--#include file="Master_Page/Header_Admin.asp"-->
<!--#include file="Processes/ConnectionDB.asp"-->

<%

    if IsEmpty(Session("username")) then

    Response.Redirect("Admin_Login.asp")

    end if

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

    query = "SELECT sp.ID as ProductID,sp.TEN,sp.MOTA,sp.NGAYNHAP,sp.ID_LOAIHANG,sp.IMG_URL,lh.TENLOAI FROM dbo.sanpham sp,dbo.loaihang lh WHERE ID_LOAIHANG = lh.ID  ORDER BY sp.ID OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS ONLY"

    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else

%>

<h2>Sản phẩm</h2>

<p>
    <a href="#" class="btn btn-success">Add</a>
</p>

<table class="table">
    <tr>
        <th>Mã sản phẩm
        </th>
        <th>Tên sản phẩm
        </th>

        <th>Ngày nhập
        </th>
        <th>Loại sản phẩm
        </th>
        <th></th>
        <th></th>
    </tr>

    <%

    do while not  recordSet.EOF
    %>

    <tr>

        <td><%=recordSet("ProductID") %>
        </td>
        <td><%=recordSet("TEN") %>
        </td>
        <td><%=recordSet("NGAYNHAP") %>
        </td>
        <td><%=recordSet("TENLOAI") %>
        </td>

        <!-- lỗi khó hiểu nếu chuyển vị trí IMG_URL lên đầu thì nó hiện và bị mất ngày nhập. Còn để ở đây thì ko hiển thị img url -->

        <td>
            <img width="150" height="150" class="img-thumbnail" src="IMAGES/<%=recordSet("IMG_URL")%>" />
        </td>

        <td>
            <a href="#" class="btn btn-primary">Detail</a>
            <a href="#" class="btn btn-warning">Edit</a>
            <a href="#" class="btn btn-danger">Delete</a>
        </td>
    </tr>
    <%

    recordSet.MoveNext
    loop

    end if

    recordSet.Close()

    conn.Close()

    %>
</table>

<ul id="pagination-demo" class="pagination-sm"></ul>

<!--#include file="Processes/Proccess_SanPham.asp"-->

<%

    'Call function from Process_SanPham.asp to get total records on select
    tempCountRecord =  Count_SanPham("")

    tempCountRecord = Round(tempCountRecord/12)

%>

<script type="text/javascript">

    $(document).ready(function () {
        //Pagination

        $('#pagination-demo').twbsPagination({
            //thẻ asp <% %> báo lỗi nhưng vẫn chạy được
            totalPages: <%=tempCountRecord%>,
            visiblePages: 5,
            href: '?page={{number}}'
        });

    });
</script>

<!--#include file="Master_Page/Footer_Admin.asp"-->
<!--#include file="Master_Page/Header.asp"-->
<!--#include file="Processes/ConnectionDB.asp"-->

<br />
<br />
<br />
<br />
<br />

<%
    Dim pType
    pType = 0
    Dim conn
    Dim recordSet
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.ConnectionTimeout = 10

    Set recordSet = Server.CreateObject("ADODB.Recordset")

%>
<div class="form-group">
    <label>Product type: </label>
    <select class="selectpicker" name="pType" id="dropListLoaiSP">
        <option value="0">All</option>
        <option value="1">Mold</option>
        <option value="2">Machine</option>
    </select>
</div>
<br />
<br />
<%

tempPage = 1

    'get Query String to select, check null or not

    if not   IsEmpty(Request("page")) then
    tempPage = Request("page")
    end if

    query = "SELECT * FROM dbo.sanpham ORDER BY ID OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS only"

    if not IsEmpty(Request("pName")) then
    pName = Request("pName")

    query = "SELECT * FROM dbo.sanpham where TEN LIKE N'%" & pName & "%'  ORDER BY ID OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS only"
    end if

    if not IsEmpty(Request("pType")) then
    pType = Request("pType")

if pType <> 0 then
    query = "SELECT * FROM dbo.sanpham where ID_LOAIHANG = '" & pType & "'  ORDER BY ID OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS only"
    end if
    end if

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
    tempCountRecord = 0

    'kiểm tra pName có không nếu có thì là đang search sản phẩm
    if not IsEmpty(Request("pName")) then
    pName = Request("pName")
    tempCountRecord =  Count_SanPham_By_Name(pName)

    'Vì chia cho 12 nên khi tim dc 1 2 3 sản phẩm / 12 dc 0.xxx làm tròn thành 0 nên sẽ bị lỗi phân trang
    tempCountRecord = Round(tempCountRecord/12) + 1

    Response.Write tempCountRecord
    conn.Close()

    else
    'Kiểm tra kiểu sản phẩm, dùng cho dropdownlist kiểu sản phẩm hiển thị
      if pType <> 0 then
    tempCountRecord =  Count_SanPham(pType)
    else
    tempCountRecord =  Count_SanPham("")
    end if

    tempCountRecord = Round(tempCountRecord/12)
    conn.Close()

    end if

     Dim temparr
     temparr =  Products_AutoComplete()

    giatri_1 = temparr(0)
    giatri_2 = temparr(1)
    giatri_3 = temparr(2)
    giatri_4 = temparr(3)
    giatri_5 = temparr(4)
%>

<script type="text/javascript">
    //jquery get parameter url
    //$.urlParam = function(name){
    //    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
    //    return results[1] || 0;
    //}

    function getUrlParameter(sParam)
    {
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++)
        {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam)
            {
                return sParameterName[1];
            }
        }
    }

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

        //set index cho droplist loại sản phâm

        $("#dropListLoaiSP option:eq(" + getUrlParameter('pType') + ")").prop('selected', true);

        //Sự kiện droplist LoaiSP change

        $("#dropListLoaiSP").change(function () {

            var valueLoai = ($("#dropListLoaiSP option:selected").val());

            //window.location.href = "/NguoiDung/SanPham?page=1&loai=" + valueLoai;
            window.location.href = "/Products.asp?pType=" + valueLoai;

        });

    });
</script>

<!--#include file="Master_Page/Footer.asp"-->

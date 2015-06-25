<%
    'function count record sanpham for pagination
public function Count_SanPham(id_loai)
    query = ""
    if id_loai <> "" then
    query = "select * from sanpham where id_loaihang = " & id_loai
    else
    query = "select * from sanpham"
    end if
    conn.Open connectionString

    recordSet.Open query,conn

    tempCountRecord = 0

    if recordSet.EOF then

    Response.Write("No Record")

    else

       do while not  recordSet.EOF
            tempCountRecord = tempCountRecord + 1

    recordSet.MoveNext
    loop

    end if

    Count_SanPham = tempCountRecord

end function

%>
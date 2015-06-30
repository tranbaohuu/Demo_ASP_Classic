<%
    'function count record sanpham for pagination
public function Count_NguoiDung()
    query = "select * from nguoidung"

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

    Count_NguoiDung = tempCountRecord

end function



%>
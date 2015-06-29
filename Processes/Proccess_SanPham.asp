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


    public function Count_SanPham_By_Name(pName)
    query = "select * from sanpham where TEN like N'%" & pName & "%'"
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

    Count_SanPham_By_Name = tempCountRecord

end function

    public function Products_AutoComplete()

     Dim tempArrayComplete(5)
    tempI = 0
    'Select Ten for Autocomplete
     query = "Select top 5 TEN from sanpham"
    conn.Open connectionString

    recordSet.Open query,conn

    if recordSet.EOF then

    Response.Write("No Record")

    else
        do while not  recordSet.EOF

    tempArrayComplete(tempI) = recordSet("TEN")

    tempI = tempI + 1
       recordSet.MoveNext
    loop
        end if

    recordSet.Close()

    conn.Close()


       ' Response.Write(tempArrayComplete(1))
    Products_AutoComplete = tempArrayComplete

    end function

%>
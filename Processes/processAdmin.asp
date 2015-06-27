<!--#include file="ConnectionDB.asp"-->

<%
	'Constructor create connection string
Dim conn
Dim recordSet
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionTimeout = 10
Set recordSet = Server.CreateObject("ADODB.Recordset")

if not IsEmpty(Request("action"))   then

    action = Request("action")
    Select Case action
   Case "logout"
        Session.Contents.Remove("username")
		Session.Contents.Remove("password")
		Response.Redirect("../Admin_Login.asp")
   Case "deleteProduct"
    	id = Request("id")
		Call DeleteProduct(id)
   Case "addProduct"
    On Error Resume Next
     	pName = Request("pName")
		des = Request("des")
		dateIN = Request("dateIN")
		pType = Request("pType")
        imgURL = "abcURL"
		Call AddProduct(pName,des,dateIN,pType,imgURL)
    If err = 0 Then
	Response.Write "Record Added"
Else
	Response.Write "Error can't add product"
End If
End Select
end if

'get Query String to select, check null or not

'Check Login
public function CheckLogin(username,pass)

	query = "Select * from nguoidung where tendangnhap = '" & username & "' and matkhau = '" & Encrypt(pass) & "'"
	conn.Open connectionString

	recordSet.Open query,conn

	if recordSet.EOF then

		CheckLogin=false

	else

		CheckLogin=true

	end if

	recordSet.Close()

	conn.Close()

end function

'Encrypt password user
public function Encrypt(str)

	dim i
	for i=1 to Len(str)
		c = c &  Asc(Mid(str,i,1))^2

	next

	Encrypt=c

end function

    'Sub Delete product
public sub DeleteProduct(id)

	query = "Delete sanpham where id = '" & id & "'"
	conn.Open connectionString

	conn.Execute(query)

	conn.Close()

	Response.Redirect("../ControlPanel.asp")

end sub

    'Sub AddProduct
	 sub AddProduct(pName,des,dateIN,pType,imgURL)

	query = "INSERT INTO dbo.sanpham( TEN ,MOTA ,NGAYNHAP ,ID_LOAIHANG ,IMG_URL) VALUES  ( N'"& pName &"' , N'"& des &"' ,  '"& dateIN &"' , '"& pType &"' , N'"& imgURL &"' )"
	conn.Open connectionString
	Call conn.Execute(query,ra)
    
	conn.Close()

	Response.Redirect("../ControlPanel.asp?ra=" & ra)

end sub

%>
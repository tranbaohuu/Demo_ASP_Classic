<!--#include file="ConnectionDB.asp"-->



<%

	'Constructor create connection string
Dim conn
Dim recordSet
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionTimeout = 10
Set recordSet = Server.CreateObject("ADODB.Recordset")
'get Query String to select, check null or not

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
		imgURL = Request("imgURL")
		Call AddProduct(pName,des,dateIN,pType,imgURL)
	If err = 0 Then
	Response.Write "Record Added"
Else
	Response.Write "Error can't add product"
End If
	   Case "editProduct"
On Error Resume Next
		id = Request("id")
		pName = Request("pName")
		des = Request("des")
		dateIN = Request("dateIN")
		pType = Request("pType")
		imgURL = Request("imgURL")
		Call EditProduct(id,pName,des,dateIN,pType,imgURL)
	If err = 0 Then
	Response.Write "Record Edited"
Else
	Response.Write "Error can't edit product"
End If
    Case "addEmployee"
	On Error Resume Next
		eUsername = Request("eUsername")
		ePassword = Request("ePassword")
		dateIN = Request("dateIN")
		Call AddEmployee(eUsername,ePassword,dateIN)
	If err = 0 Then
	Response.Write "Record Added"
Else
	Response.Write "Error can't add product"
End If

       Case "deleteEmployee"
		eUsername = Request("eUsername")
		Call DeleteEmployee(eUsername)


End Select
end if

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

	query = "INSERT INTO dbo.sanpham( TEN ,MOTA ,NGAYNHAP ,ID_LOAIHANG ,IMG_URL) VALUES  ( N'"& pName &"' , N'"& des &"' ,  CONVERT(DATETIME, '" & dateIN & "', 103) , '"& pType &"' , N'"& imgURL &"' )"
	conn.Open connectionString
	Call conn.Execute(query,ra)

	conn.Close()

	Response.Redirect("../ControlPanel.asp?raAdd=" & ra)

end sub

	'Sub Edit PRoduct
sub EditProduct(id,pName,des,dateIN,pType,imgURL)

	query = "UPDATE sanpham SET	TEN= N'" & pName & "', MOTA=N'" & des & "',NGAYNHAP= CONVERT(DATETIME, '" & dateIN & "', 103),ID_LOAIHANG='" & pType & "',IMG_URL='"  & imgURL & "' WHERE ID = '" & id & "'"
	conn.Open connectionString
	Call conn.Execute(query,ra)

	conn.Close()

	Response.Redirect("../ControlPanel.asp?raEdit=" & ra)

end sub




		'Sub Delete Employee
public sub DeleteEmployee(eUsername)

	query = "Delete nguoidung where tendangnhap = '" & eUsername & "'"
	conn.Open connectionString

	conn.Execute(query)

	conn.Close()

	Response.Redirect("../Employee_Manage.asp")

end sub

	'Sub Add Employee
	 sub AddEmployee(eUsername,ePassword,dateIN)

	ePassword = Encrypt(ePassword)

	query = "INSERT INTO dbo.nguoidung( tendangnhap ,matkhau ,ngaynhap) VALUES  ( N'"& eUsername &"' , N'"& ePassword &"' ,  CONVERT(DATETIME, '" & dateIN & "', 103))"
	conn.Open connectionString
	Call conn.Execute(query,ra)

	conn.Close()

	Response.Redirect("../Employee_Manage.asp?raAdd=" & ra)

end sub

%>
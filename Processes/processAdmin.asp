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

	Response.Redirect("../ControlPanel.asp?ra=" & ra)

end sub

	'Sub Edit PRoduct
sub EditProduct(id,pName,des,dateIN,pType,imgURL)

	query = "UPDATE sanpham SET	TEN= N'" & pName & "', MOTA=N'" & des & "',NGAYNHAP= CONVERT(DATETIME, '" & dateIN & "', 103),ID_LOAIHANG='" & pType & "',IMG_URL='"  & imgURL & "' WHERE ID = '" & id & "'"
	conn.Open connectionString
	Call conn.Execute(query,ra)

	conn.Close()

	Response.Redirect("../ControlPanel.asp?ra=" & ra)

end sub
%>
<!-- #include file="upload.asp" -->
<%

	sub UploadImage()
'NOTE - YOU MUST HAVE VBSCRIPT v5.0 INSTALLED ON YOUR WEB SERVER
'	   FOR THIS LIBRARY TO FUNCTION CORRECTLY. YOU CAN OBTAIN IT
'	   FREE FROM MICROSOFT WHEN YOU INSTALL INTERNET EXPLORER 5.0
'	   OR LATER.

' Create the FileUploader
Dim Uploader, File
Set Uploader = New FileUploader

' This starts the upload process
Uploader.Upload()

'******************************************
' Use [FileUploader object].Form to access
' additional form variables submitted with
' the file upload(s). (used below)
'******************************************
Response.Write "<b>Thank you for your upload " & Uploader.Form("fullname") & "</b><br>"

' Check if any files were uploaded
If Uploader.Files.Count = 0 Then
	Response.Write "File(s) not uploaded."
Else
	' Loop through the uploaded files
	For Each File In Uploader.Files.Items

		' Check where the user wants to save the file
		If Uploader.Form("saveto") = "disk" Then

			' Save the file to current path
			File.SaveToDisk Server.MapPath("/Images")

		End If

		' Output the file details to the browser
		Response.Write "File Uploaded: " & File.FileName & "<br>"
		Response.Write "Size: " & File.FileSize & " bytes<br>"
		Response.Write "Type: " & File.ContentType & "<br><br>"
	Next
End If

	end sub

%>
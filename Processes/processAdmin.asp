<!--#include file="ConnectionDB.asp"-->

<%

if not IsEmpty(Request("action")) then

	if Request("action") = "logout" then

		Session.Contents.Remove("username")
		Session.Contents.Remove("password")

		Response.Redirect("../Admin_Login.asp")

	end if
end if

Dim conn
Dim recordSet
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionTimeout = 10
Set recordSet = Server.CreateObject("ADODB.Recordset")

'get Query String to select, check null or not

'Check Login
function CheckLogin(username,pass)

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
function Encrypt(str)

	dim i
	for i=1 to Len(str)
		c = c &  Asc(Mid(str,i,1))^2

	next

	Encrypt=c

end function

'Logout

sub Logout()

end sub

%>
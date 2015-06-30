

<%@ Language=VBScript %>
<%Option Explicit%>
<!-- #include file="upload.asp" -->
<%

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
	Dim imageName
	imageName = "IMG_" & Day(Date) & "-" & Month(Date) & "-" & Year(Date) & "_" & Hour(Time) & "-" & Minute(Time) & "-" & Second(Time) & ".jpg"


		Response.Write "File Uploaded: " & imageName & "<br>"
		Response.Write "Size: " & File.FileSize & " bytes<br>"
		Response.Write "Type: " & File.ContentType & "<br><br>"
	Next
End If


%>
<a class="" href="../Upload_Image.asp">Back</a>



<!--#include file="Master_Page/Header_Admin.asp"-->

<%if IsEmpty(Session("username")) then

	Response.Redirect("Admin_Login.asp")

end if %>

<!--#include file="Processes/processAdmin.asp"-->



<form method="POST" enctype="multipart/form-data" action="Processes/uploadexmple.asp">

<div class="form-group">

	<label class="control-label col-md-2">Upload</label>
	<div class="col-md-10">

		<input class="form-control" type="FILE" name="FILE1">
		<input type="hidden" name="saveto" value="disk" />
		<br />
		<input class="btn btn-primary" type="SUBMIT" value="Upload!">

		<!--<input class="form-control" disabled="disabled" type="file" name="FILE1" id="FILE1" value="<%=imgURL %>" style="width: 100%;" />-->
	</div>
</div>
</form>





<!--#include file="Master_Page/Footer_Admin.asp"-->

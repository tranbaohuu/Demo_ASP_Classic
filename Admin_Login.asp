<!--#include file="Master_Page/Header_Admin.asp"-->

<h2>Login</h2>

<form method="post" action="Admin_Login.asp">

	<div class="form-horizontal">
		<hr />
		<input type="hidden" name="action" value="login" />
		<div class="form-group">
			<label class="control-label col-md-2">Username: </label>
			<div class="col-md-10">
				<input type="text" name="u" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-2">Password: </label>

			<div class="col-md-10">
				<input type="password" name="p" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-2 col-md-10">
				<input type="submit" value="Login" class="btn btn-primary" />
			</div>
		</div>
	</div>
</form>

<!--#include file="Master_Page/Footer_Admin.asp"-->

<!--#include file="Processes/processAdmin.asp"-->

<%

if not IsEmpty(Request("action")) then

	if Request("action") = "login" then
		u = Request("u")
		p = Request("p")

		flag =   CheckLogin(u,p)

		if flag = true then
			Session("username") = u
			Session("password") = p

			Response.Redirect("ControlPanel.asp")

		end if

	end if

end if

%>
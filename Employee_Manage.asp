<!--#include file="Master_Page/Header_Admin.asp"-->
<!--#include file="Processes/ConnectionDB.asp"-->

<%

	if IsEmpty(Session("username")) then

	Response.Redirect("ControlPanel.asp")

	else

	  u = Session("username")
	  if InStr(u,"admin") = 0 then
	Response.Redirect("ControlPanel.asp")

	end if

end if

	if not   IsEmpty(Request("raEdit")) then
%>
<div class="alert alert-success">
	<strong>Success!</strong> Edited complete
</div>
<%
end if

		if not   IsEmpty(Request("raAdd")) then
%>
<div class="alert alert-success">
	<strong>Success!</strong> Item added
</div>
<%
end if

Dim conn
Dim recordSet
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionTimeout = 10

Set recordSet = Server.CreateObject("ADODB.Recordset")

tempPage = 1

'get Query String to select, check null or not

if not   IsEmpty(Request("page")) then
	tempPage = Request("page")
end if

'query = "select * from sanpham"

query = "SELECT * FROM nguoidung  ORDER BY tendangnhap DESC OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS ONLY"

conn.Open connectionString

recordSet.Open query,conn

if recordSet.EOF then

	Response.Write("No Record")

else

%>

<h2>Products manage</h2>

<p>

	<button type="button" id="btAddProduct" class="btn btn-success">Add</button>
</p>

<table class="table">
	<tr>
		<th>Username
		</th>
		<th>Date In
		</th>

		<th></th>
		<th></th>
	</tr>

	<%

	do while not  recordSet.EOF
	%>

	<tr>

		<td><%=recordSet("tendangnhap") %>
		</td>
		<td><%=recordSet("ngaynhap") %>
		</td>

		<!-- l&#7895;i khó hi&#7875;u n&#7871;u chuy&#7875;n v&#7883; trí IMG_URL lên &#273;&#7847;u thì nó hi&#7879;n và b&#7883; m&#7845;t ngày nh&#7853;p. Còn &#273;&#7875; &#7903; &#273;ây thì ko hi&#7875;n th&#7883; img url -->

		<td>
			<!--<a href="#" class="btn btn-primary">Detail</a>-->
			<button type="button" title="<%=recordSet("tendangnhap") %>" class="btn btn-danger deleteProduct">Delete</button>
		</td>
	</tr>
	<%

		recordSet.MoveNext
	loop

end if

recordSet.Close()

conn.Close()

	%>
</table>

<ul id="pagination-demo" class="pagination-sm"></ul>

<!--#include file="Processes/Process_NguoiDung.asp"-->

<%

'Call function from Process_NguoiDung.asp to get total records on select
tempCountRecord =  Count_NguoiDung()

tempCountRecord = Round(tempCountRecord/12)

if tempCountRecord = 0 then
	tempCountRecord = tempCountRecord + 1
	end if

conn.Close()

%>

<script type="text/javascript">

	$(document).ready(function () {
		var d = new Date();

		//Pagination


		$('#pagination-demo').twbsPagination({
			//th&#7867; asp <% %> báo l&#7895;i nh&#432;ng v&#7851;n ch&#7841;y &#273;&#432;&#7907;c
			totalPages: <%=tempCountRecord%>,
			visiblePages: 5,
			href: '?page={{number}}'
		});

		$(".deleteProduct").click(function(){
			var eUsername = $(this).attr("title");
			$('#modal-delete').modal();

			$("#modalEUsername").val(eUsername);

		});

		$("#btAddProduct").click(function(){
			$('#modal-add-edit').modal();

		});

		//bộ lịch
		$(".datepicker").datepicker(
		{
			dateFormat: "dd/mm/yy"
			
		});

		$(".datepicker").datepicker("setDate", new Date($.now()));
		//Lấy hình đã chọn

		$(".modal-body").find("img").click(function () {

			var fileName = $(this).prop("alt");

			$("#imgURL").val(fileName);

			$('#myModal').modal("hide");

			$("#imgEditPreview").prop("src", "/IMAGES/" + fileName);
		});

	});
</script>

<!-- Modal Delete -->
<div class="modal fade container" id="modal-delete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close"
					data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="deleteModalLabel">Warning
				</h4>
			</div>
			<form method="post" action="Processes/processAdmin.asp">
				<div class="modal-body">
					Are you want to delete?
					<input name="eUsername" type="hidden" id="modalEUsername" />
					<input name="action" type="hidden" value="deleteEmployee" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">
						Close
					</button>
					<button type="submit" class="btn btn-primary">
						Sure
					</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Add -->
<form method="post" action="Processes/processAdmin.asp">
	<div class="modal fade container" id="modal-add-edit" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"
						data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="addModalLabel">Create Employee
					</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<input type="hidden" name="action" value="addEmployee" />
						<div class="form-group">
							<label class="control-label col-md-2">Employee username: </label>
							<div class="col-md-10">
								<input class="form-control" name="eUsername" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Employee password: </label>
							<div class="col-md-10">
								<input name="ePassword" type="password" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Date In: </label>
							<div class="col-md-10">
								<input class="form-control datepicker" id="dateIN" name="dateIN" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-10">
								<input type="submit" value="Add" class="btn btn-success" />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">
						Close
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</form>

<!--#include file="Master_Page/Footer_Admin.asp"-->
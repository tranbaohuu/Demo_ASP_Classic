<!--#include file="Master_Page/Header_Admin.asp"-->
<!--#include file="Processes/processAdmin.asp"-->

<%

	if IsEmpty(Session("username")) then

	Response.Redirect("Admin_Login.asp")

end if

Dim pname
Dim des
Dim dateIN
Dim pType
Dim imgURL

if not IsEmpty(Request("id")) then

	id = Request("id")

	query = "Select * from sanpham where id = '" & id & "'"
	conn.Open connectionString

	recordSet.Open query,conn

	if recordSet.EOF then

		Response.Write("No Records")

	else
		do while not  recordSet.EOF
			pname = recordSet("TEN")
			des = recordSet("MOTA")
			dateIN = Day(recordSet("NGAYNHAP")) & "/" & Month(recordSet("NGAYNHAP")) & "/" & Year(recordSet("NGAYNHAP"))
			pTyped = recordSet("ID_LOAIHANG")
			imgURL = recordSet("IMG_URL")

			recordSet.MoveNext
		loop

	end if

	recordSet.Close()

	conn.Close()

end if

%>

<h2>Edit Product</h2>
<form action="Processes/processAdmin.asp" enctype="multipart/form-data" method="get">
	<div class="form-horizontal">
		<hr />
		<input type="hidden" name="action" value="editProduct" />
		<input type="hidden" name="id" value="<%=id %>" />

		<div class="form-group">
			<label class="control-label col-md-2">Product Name: </label>
			<div class="col-md-10">
				<input class="form-control" type="text" name="pName" value="<%=pName %>" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-2">Date In: </label>
			<div class="col-md-10">
				<input class="form-control" type="text" name="des" value="<%=des %>" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-2">Date In: </label>
			<div class="col-md-10">
				<input class="form-control datepicker" type="text" name="dateIN" value="<%=dateIN %>" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-2">Product Type</label>
			<div class="col-md-10">
				<select class="form-control" name="pType">
					<%
query = "Select * from loaihang"
conn.Open connectionString

recordSet.Open query,conn

if recordSet.EOF then

	Response.Write("No Records")

else
	do while not  recordSet.EOF
					%>

					<option value="<%=recordSet("ID") %>"><%=recordSet("TENLOAI") %></option>
					<%

		recordSet.MoveNext
	loop

end if

recordSet.Close()

conn.Close()

					%>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-2">Image</label>
			<div class="col-md-10">
					<input type="hidden" id="imgURL" name="imgURL" value="<%=imgURL %>" />

				<img id="imgEditPreview" style="width: 320px; height: 240px;" src="Images/<%=imgURL %>">
			</div>
		</div>

	  <!--  <div class="form-group">

			<label class="control-label col-md-2">Hình t&#7843;i lên</label>
			<div class="col-md-10">

				<div class="input-group">
					<span class="input-group-addon">
						<input type="checkbox" id="checkUpHinh" name="groundHinh" aria-label="...">
					</span>-->
	<!--                <input class="form-control" disabled="disabled" type="file" name="FILE1" id="FILE1" value="<%=imgURL %>" style="width: 100%;" />
				</div>
			</div>
		</div>-->

		<div class="form-group">
			<label class="control-label col-md-2"></label>
			<div class="col-md-10">
				<button type="button" class="btn btn-warning" data-toggle="modal"
					data-target="#myModal">
					Choose Image
				</button>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-2 col-md-10">
				<input type="submit" value="Save" class="btn btn-primary" />
			</div>
		</div>
	</div>

	<div>
		<a class="btn btn-default" href="ControlPanel.asp">Quay l&#7841;i</a>
	</div>

	<!-- Modal Choose Image -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"
						data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">Ch&#7885;n &#7843;nh
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">

						<!--read all file in folder-->
						<%
dim fs,fo,x
set fs=Server.CreateObject("Scripting.FileSystemObject")
set fo=fs.GetFolder(Server.MapPath("/Images"))

for each x in fo.files
  'Print the name of all files in the test folder
 ' Response.write(x.Name & "<br>")
						%>
						<div class="col-md-2">
							<a href="#" class="thumbnail">
								<img style="width: 320px; height: 240px;" src="IMAGES/<%=x.Name %>"
									alt="<%=x.Name %>">
							</a>
						</div>
						<%

next

set fo=nothing
set fs=nothing
						%>


						<!--				@foreach (var item in @ViewBag.listURLHinh)
					{
						<div class="col-md-2">
							<a href="#" class="thumbnail">
								<img style="width: 320px; height: 240px;" src="~/IMAGES/@item"
									alt="@item">
							</a>
						</div>
						}-->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">
							&#272;óng
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
</form>

<script type="text/javascript">

	$(document).ready(function () {

		//bộ lịch
		$(".datepicker").datepicker(
		{
			dateFormat: "dd/mm/yy"
		});

		//kiểm tra radio button upload hình
		$('input[type=checkbox][name=groundHinh]').change(function () {

			if ($("#checkUpHinh").prop("checked")) {

				$("#FILE1").prop("disabled", null);
			}

		});


		//Lấy hình đã chọn

		$(".modal-body").find("img").click(function () {


			var fileName = $(this).prop("alt");


			$("#imgURL").val(fileName);

			$('#myModal').modal("hide");

			$("#imgEditPreview").prop("src", "/IMAGES/" + fileName);
		});


	});

</script>

<!--#include file="Master_Page/Footer_Admin.asp"-->

<!--#include file="Master_Page/Header_Admin.asp"-->
<!--#include file="Processes/ConnectionDB.asp"-->

<%

if IsEmpty(Session("username")) then

	Response.Redirect("Admin_Login.asp")

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

query = "SELECT sp.ID as ProductID,sp.TEN,sp.MOTA,sp.NGAYNHAP,sp.ID_LOAIHANG,sp.IMG_URL,lh.TENLOAI FROM dbo.sanpham sp,dbo.loaihang lh WHERE ID_LOAIHANG = lh.ID  ORDER BY sp.ID DESC OFFSET (" & tempPage -1 & ")*12 ROWS FETCH NEXT 12 ROWS ONLY"

conn.Open connectionString

recordSet.Open query,conn

if recordSet.EOF then

	Response.Write("No Record")

else

%>

<h2>Products manage</h2>

<p>

	<button type="button" id="btAddProduct" class="btn btn-success">Add</button>
							   <a href="Upload_Image.asp" target="_blank" class="btn btn-primary">Upload Image</a>

</p>

<table class="table">
	<tr>
		<th>Product ID
		</th>
		<th>Product name
		</th>

		<th>Date In
		</th>
		<th>Product type
		</th>
		<th></th>
		<th></th>
	</tr>

	<%

	do while not  recordSet.EOF
	%>

	<tr>

		<td><%=recordSet("ProductID") %>
		</td>
		<td><%=recordSet("TEN") %>
		</td>
		<td><%=Day(recordSet("NGAYNHAP")) & "/" & Month(recordSet("NGAYNHAP")) & "/" & Year(recordSet("NGAYNHAP")) %>
		</td>
		<td><%=recordSet("TENLOAI") %>
		</td>

		<!-- l&#7895;i khó hi&#7875;u n&#7871;u chuy&#7875;n v&#7883; trí IMG_URL lên &#273;&#7847;u thì nó hi&#7879;n và b&#7883; m&#7845;t ngày nh&#7853;p. Còn &#273;&#7875; &#7903; &#273;ây thì ko hi&#7875;n th&#7883; img url -->

		<td>
			<img width="150" height="150" class="img-thumbnail" src="IMAGES/<%=recordSet("IMG_URL")%>" />
		</td>

		<td>
			<!--<a href="#" class="btn btn-primary">Detail</a>-->
			<a href="Edit_Product.asp?id=<%=recordSet("ProductID") %>" title="<%=recordSet("ProductID") %>" class="btn btn-warning editProduct">Edit</a>
			<button type="button" title="<%=recordSet("ProductID") %>" class="btn btn-danger deleteProduct">Delete</button>
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

<!--#include file="Processes/Proccess_SanPham.asp"-->

<%

'Call function from Process_SanPham.asp to get total records on select
tempCountRecord =  Count_SanPham("")

tempCountRecord = Round(tempCountRecord/12)
conn.Close()

%>

<script type="text/javascript">

	$(document).ready(function () {
		//Pagination

		$('#pagination-demo').twbsPagination({
			//th&#7867; asp <% %> báo l&#7895;i nh&#432;ng v&#7851;n ch&#7841;y &#273;&#432;&#7907;c
			totalPages: <%=tempCountRecord%>,
			visiblePages: 5,
			href: '?page={{number}}'
		});

		$(".deleteProduct").click(function(){
			var idProduct = $(this).attr("title");
			$('#modal-delete').modal();

			$("#modalID").val(idProduct);

		});

		$("#btAddProduct").click(function(){
			$('#modal-add-edit').modal();

		});

		//bộ lịch
		$(".datepicker").datepicker(
		{
			dateFormat: "dd/mm/yy"
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
					<input name="id" type="hidden" id="modalID" />
					<input name="action" type="hidden" value="deleteProduct" />
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
					<h4 class="modal-title" id="addModalLabel">Create Product
					</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<input type="hidden" name="action" value="addProduct" />
						<div class="form-group">
							<label class="control-label col-md-2">Product Name: </label>
							<div class="col-md-10">
								<input class="form-control" name="pName" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Description: </label>
							<div class="col-md-10">
								<input name="des" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Date In: </label>
							<div class="col-md-10">
								<input class="form-control datepicker" id="dateIN" name="dateIN" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Product type: </label>
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
							<label class="control-label col-md-2">Image URL</label>
							<div class="col-md-10">
								<input type="hidden" id="imgURL" name="imgURL" value="" />
								<img id="imgEditPreview" style="width: 320px; height: 240px;" src="" alt="No Image">
								<!--<input class="form-control" type="file" name="imgURL" id="file" style="width: 100%;" />-->
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Image</label>
							<div class="col-md-10">
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#myModal">
									Choose Image
								</button>
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



<!--#include file="Master_Page/Footer_Admin.asp"-->

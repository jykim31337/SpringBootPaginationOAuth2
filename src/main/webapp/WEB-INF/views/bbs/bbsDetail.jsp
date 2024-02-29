<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/common.jsp" />

<script type="text/javascript">

var isTest = true;

$(document).ready(function() {
	
	if(isTest) {
	
		$('#usrId').val(uuid());
		
		$('#title').val(uuid());
		$('#content').val(uuid());
	}

	$( "#btnWrite" ).on( "click", function() {
		fn_submit();
	} );
	
	$( "#btnCancle" ).on( "click", function() {
		window.location = "bbsList";
	} );
});

function fn_submit() {
	
	try{
		
		var frmData = $("#frmMain").serializeArray();
		console.log(frmData);
		var jsonStr = JSON.stringify(frmData);
		console.log(jsonStr);
		
		$.ajax({
			url: "bbsSubmit"
			, type: "post"
			
			/* When sending data to the server, use this content type. */
			, contentType: "application/json; charset=UTF-8"
			/* Data to be sent to the server. */
			, data: jsonStr
			
			/* The type of data that you're expecting back from the server. */
			, dataType: "json"
			, success: function (res) {
				window.location = "bbsList";
			}
			, error: function (xhr) {
				alert(JSON.stringify(xhr));
			}
		});
		
	} catch(err) {
		alert(err);
	}
}

</script>

<title>BBS DETAIL</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../template/top.jsp" />
		<form id="frmMain" name="frmMain">
			<section>
				<input type="hidden" id="seq" name="seq" value="${seq}"/>
			</section>
			<div class="col-12 mb-4 mt-4">
				<div class="mb-4">
					<label for="title" class="form-label">Title</label>
					<input id="title" name="title" type="text" class="form-control" value="${title}">
				</div>
				<div class="mb-4">
					<label for="content" class="form-label">Content</label>
					<textarea id="content" name="content" class="form-control" rows="10">${content}</textarea>
				</div>
				<div class="mb-4">
					<label for="usrId" class="form-label">ID</label>
					<input id="usrId" name="usrId" type="text" class="form-control" value="${usrId}">
				</div>
				
				<div class="table-settings mb-4 mt-4">
					<div class="d-flex w-100 flex-wrap justify-content-end">
						<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2 me-4" type="button">Write</button>
						<button id="btnCancle" name="btnCancle" class="btn btn-outline-primary col-2" type="button">Cancle</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
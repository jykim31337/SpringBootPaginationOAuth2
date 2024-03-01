<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/common.jsp" />

<script type="text/javascript">

var isTest = true;

$(document).ready(function() {
	
	var user = "${user}";
	
	if(user == null || user == '') {
		var usrId = $('#usrId');
		usrId.prop("placeholder", "Input Your ID");
	}

	$( "#btnWrite" ).on( "click", function() {
		fn_submit();
	} );
	
	$( "#btnCancle" ).on( "click", function() {
		window.location = "bbsList";
	} );

});

	function fn_validation() {
		var title = $('#title');
		var content = $('#content');
		var usrId = $('#usrId');

		if (!isValid(title) || !isValid(content) || !isValid(usrId)) {
			return false;
		}

		return true;
	}

	function fn_submit() {

		try {

			if (!fn_validation()) {
				return;
			}

			var frmData = $("#frmMain").serializeArray();
			console.log(frmData);
			var jsonStr = JSON.stringify(frmData);
			console.log(jsonStr);

			$.ajax({
				url : "bbsSubmit",
				type : "post"

				/* When sending data to the server, use this content type. */
				,
				contentType : "application/json; charset=UTF-8"
				/* Data to be sent to the server. */
				,
				data : jsonStr

				/* The type of data that you're expecting back from the server. */
				,
				dataType : "json",
				success : function(res) {
					window.location = "bbsList";
				},
				error : function(xhr) {
					alert(JSON.stringify(xhr));
				}
			});

		} catch (err) {
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
					<c:choose>
						<c:when test="${not empty user}">
							<input id="title" name="title" type="text" class="form-control" value="${title}">
						</c:when>
						<c:otherwise>
							<input id="title" name="title" type="text" class="form-control" value="${title}" readonly>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-4">
					<label for="content" class="form-label">Content</label>
					<c:choose>
						<c:when test="${not empty user}">
							<textarea id="content" name="content" class="form-control" rows="10">${content}</textarea>
						</c:when>
						<c:otherwise>
							<textarea id="content" name="content" class="form-control" rows="10" readonly>${content}</textarea>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-4">
					<label for="usrId" class="form-label">ID</label>
					<c:choose>
						<c:when test="${not empty user}">
							<input id="usrId" name="usrId" type="text" class="form-control" value="${user.email}" readonly>
						</c:when>
						<c:otherwise>
							<input id="usrId" name="usrId" type="text" class="form-control" value="${usrId}">
						</c:otherwise>
					</c:choose>
					
				</div>
				
				<div class="table-settings mb-4 mt-4">
					<div class="d-flex w-100 flex-wrap justify-content-end">
						<%--
						<input type="text" id="txtTest" name="txtTest">
						<button id="btnTest" name="btnTest">btnTest</button>
						--%>
						<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2 me-4" type="button">Write</button>
						<button id="btnCancle" name="btnCancle" class="btn btn-outline-primary col-2" type="button">Cancle</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
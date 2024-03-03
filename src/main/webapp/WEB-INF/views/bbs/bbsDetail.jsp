<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/common.jsp" />

<script type="text/javascript">

var auth = "${auth}";
var dto = "${dto}";
var dtoSeq = "${dto.seq}";

var email = "${auth.user.email}";
var usrId = "${dto.usrId}";

var isModify = false;

$(document).ready(function() {
	
	if(auth == null || auth == '') {
		$('#usrId').prop("placeholder", "Input Your ID");
	} else if(email == usrId) {
		isModify = true;
	}

	$( "#btnWrite" ).on( "click", function() {
		
		if(isModify) {
			this.textContent = 'Write';
			isModify = false;
			
			$('#title').prop('readonly', false);
			$('#content').prop('readonly', false);
			
		} else {
			submit();
		}
		
	} );
	
	$( "#btnCancle" ).on( "click", function() {
		window.location = "bbsList";
	} );

});

	function validation() {
		var title = $('#title');
		var content = $('#content');
		var usrId = $('#usrId');

		if (!isValid(title) || !isValid(content) || !isValid(usrId)) {
			return false;
		}

		return true;
	}

	function submit() {

		try {

			if (!validation()) {
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
					
					if(res.result == "ok") {
						window.location = "bbsList";
					} else {
						alert(res.message); 
					}
				},
				error : function(xhr, param0, param1) {
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
	<jsp:include page="../template/top.jsp" />
	<jsp:include page="../template/left.jsp" />
	<main class="content">
		<form id="frmMain" name="frmMain">
			<section>
				<input type="hidden" id="bbsCd" name="bbsCd" value="${dto.bbsCd}"/>
				<input type="hidden" id="seq" name="seq" value="${dto.seq}"/>
			</section>
			<div class="col-12 mb-4 mt-4">
				<div class="mb-4">
					<label for="title" class="form-label">Title</label>
					<c:choose>
						<c:when test="${not empty dto.seq}">
							<input id="title" name="title" type="text" class="form-control" value="${dto.title}" readonly>
						</c:when>
						<c:when test="${not empty auth}">
							<input id="title" name="title" type="text" class="form-control" value="${dto.title}">
						</c:when>
						<c:otherwise>
							<input id="title" name="title" type="text" class="form-control" value="${dto.title}" readonly>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-4">
					<label for="content" class="form-label">Content</label>
					<c:choose>
						<c:when test="${not empty dto.seq}">
							<textarea id="content" name="content" class="form-control" rows="10" readonly>${dto.content}</textarea>
						</c:when>
						<c:when test="${not empty auth}">
							<textarea id="content" name="content" class="form-control" rows="10">${dto.content}</textarea>
						</c:when>
						<c:otherwise>
							<textarea id="content" name="content" class="form-control" rows="10" readonly>${dto.content}</textarea>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-4">
					<label for="usrId" class="form-label">ID</label>
					<c:choose>
						<c:when test="${not empty dto.seq}">
							<input id="usrId" name="usrId" type="text" class="form-control" value="${dto.usrId}" readonly>
						</c:when>
						<c:when test="${not empty auth}">
							<input id="usrId" name="usrId" type="text" class="form-control" value="${dto.usrId}" readonly>
						</c:when>
						<c:otherwise>
							<input id="usrId" name="usrId" type="text" class="form-control" value="${dto.usrId}">
						</c:otherwise>
					</c:choose>
					
				</div>
				
				<div class="table-settings mb-4 mt-4">
					<div class="d-flex w-100 flex-wrap justify-content-end">
						<c:choose>
							<c:when test="${not empty dto.seq}">
								<c:choose>
									<c:when test="${dto.usrId eq auth.user.email}">
										<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2 me-4" type="button">Modify</button>
										<button id="btnCancle" name="btnCancle" class="btn btn-outline-primary col-2" type="button">Back</button>
									</c:when>
									<c:otherwise>
										<button id="btnCancle" name="btnCancle" class="btn btn-outline-primary col-2" type="button">Back</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2 me-4" type="button">Write</button>
								<button id="btnCancle" name="btnCancle" class="btn btn-outline-primary col-2" type="button">Cancle</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../template/bottom.jsp" />
	</main>
</body>
</html>
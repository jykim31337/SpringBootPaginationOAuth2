<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/common.jsp" />

<script type="text/javascript">

function movePage(ctl) {
	
	var gotoNaviIdx;
	var naviIdxCtl;
	var naviIdxCtlVal;
	
	try{
		
		naviIdxCtl = $('#naviIdx');
		naviIdxCtlVal = naviIdxCtl.val();
		
		if(ctl.id != null && ctl.id != '') {
			
			var nNaviSize = Number($('#naviSize').val());
			var nNaviStIdx = Number($('#naviStIdx').val());
			
			if(ctl.id == 'naviNext') {
				
				gotoNaviIdx = nNaviStIdx + nNaviSize;
				
			} else if(ctl.id == 'naviPrev') {
				
				gotoNaviIdx = nNaviStIdx - 1;
				
			} else {
				alert(ctl.id);
			}
			
		} else {
			gotoNaviIdx = ctl.innerText;
		}
		
		naviIdxCtl.val(gotoNaviIdx);
		
		$('#frmSearch').submit();
	} catch(err) {
		console.log(JSON.stringify(err));
		alert(JSON.stringify(err));
	}
}

<%--
function trClick(ctl) {
	/*
	ctl.childNodes.forEach((node, idx) => {
			console.log(node);
			console.log(idx);
		}
	);
	*/
	
	//var seq = ctl.children[0].children[0].value;
	var seq = ctl.children.tdSeq.children.seq.value;
	
	console.log('seq: ' + seq);
	
	var detailLink = './bbsDetail?seq=' + seq;
	location.href = detailLink;
}
--%>

<%--
function trClickSeq(seq) {
	
	console.log('seq: ' + seq);
	
	var detailLink = './bbsDetail?seq=' + seq;
	location.href = detailLink;
}
--%>

$(document).ready(function() {
	
	$( "#btnWrite" ).on( "click", function() {
		window.location = 'bbsWrite';
	} );
	
	$("#btnRequest").on("click", function() {
		//window.location = "bbsList";
		$('#frmSearch').submit();
	});
	
	/*
	$("#searchText").on('keyup', function() {
		debugger;
	});
	*/
	
});

</script>

<title>BBS LIST</title>
</head>
<body>
		<jsp:include page="../template/top.jsp" />
		<jsp:include page="../template/left.jsp" />
		
		<main class="content">
			<input type="hidden" id="itemTotCnt" name="itemTotCnt" value="${dto.itemTotCnt}"/>
			<input type="hidden" id="itemPerPage" name="itemPerPage" value="${dto.itemPerPage}"/>
			
			<input type="hidden" id="itemStIdx" name="itemStIdx" value="${dto.itemStIdx}"/>
			<input type="hidden" id="itemEdIdx" name="itemEdIdx" value="${dto.itemEdIdx}"/>
			
			<input type="hidden" id="naviLstIdx" name="naviLstIdx" value="${dto.naviLstIdx}"/>
			
			<input type="hidden" id="naviSize" name="naviSize" value="${dto.naviSize}"/>
			<input type="hidden" id="naviStIdx" name="naviStIdx" value="${dto.naviStIdx}"/>
			<input type="hidden" id="naviEdIdx" name="naviEdIdx" value="${dto.naviEdIdx}"/>
			
			<!--
			<form id="frmSearch" name="frmSearch" method="post" action="bbsList">
			-->
			<form id="frmSearch" name="frmSearch" method="get" action="bbsList">
				<input type="hidden" id="naviIdx" name="naviIdx" value="${dto.naviIdx}"/>
				
				<div class="table-settings mb-4 mt-4">
					<div class="d-flex w-100 flex-wrap justify-content-between">
					<!--
					<div class="row align-items-center justify-content-between">
					-->
						<div class="col">
							<%--
							<div class="input-group me-2 me-lg-3 fmxw-600">
							--%>
							<div class="input-group">
								<div class="col-4 me-2 fmxw-100">
									<select id="searchType" name="searchType" class="form-select" aria-label="Search Options">
										<c:choose>
											<c:when test="${dto.searchType eq 'TITLE'}">
												<option value="TITLE" selected>Title</option>
												<option value="CONTENT">Content</option>
												<option value="ID">Id</option>
											</c:when>
											<c:when test="${dto.searchType eq 'CONTENT'}">
												<option value="TITLE">Title</option>
												<option value="CONTENT" selected>Content</option>
												<option value="ID">Id</option>
											</c:when>
											<c:when test="${dto.searchType eq 'ID'}">
												<option value="TITLE">Title</option>
												<option value="CONTENT">Content</option>
												<option value="ID" selected>Id</option>
											</c:when>
											<c:otherwise>
												<option value="TITLE" selected>Title</option>
												<option value="CONTENT">Content</option>
												<option value="ID">Id</option>
											</c:otherwise>
										</c:choose>
										
									</select>
								</div>
								<div class="col-6">
									<input type="text" id="searchText" name="searchText" value="${dto.searchText}" class="form-control" placeholder="Search Text Enter">
								</div>
										
							</div>
						</div>
						<button id="btnRequest" name="btnRequest" class="btn btn-outline-primary col-2 mx-2" type="button">Request</button>
						<%--
						<c:choose>
							<c:when test="${not empty user}">
								<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2" type="button">Write</button>
							</c:when>
							<c:otherwise>
								<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2" type="button" disabled>Write</button>
							</c:otherwise>
						</c:choose>
						--%>
						<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2" type="button">Write</button>
					</div>
				</div>
			</form>
			
			<div class="card card-body border-0 shadow table-wrapper table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="border-gray-200 col-1">Idx</th>
							<th class="border-gray-200">Title</th>
							<th class="border-gray-200 col-1">Id</th>
							<th class="border-gray-200 col-1">Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${dto.list}" varStatus="status">
							<%--
							<tr onclick="trClick(this)" style="cursor:pointer;">
							--%>
							<tr>
								<%--
								<td id="tdSeq" style="display:none;">
									<input type="hidden" id="seq" name="seq" value="${item.seq}"/>
								</td>
								--%>
								<td>${item.idx}</td>
								<td>
									<%--
									<a href="javascript:void(0)" onclick="trClickSeq(${item.seq})">${item.title}</a>
									--%>
									<a href="./bbsDetail?seq=${item.seq}&bbsCd=${item.bbsCd}">${item.title}</a>
								</td>
								<td>${item.usrId}</td>
								<td>${item.lstDtFormat}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="card-footer px-3 border-0 d-flex flex-column flex-lg-row align-items-center justify-content-between">
					<nav aria-label="Page navigation example">
						<ul class="pagination mb-0">
							<li class="page-item">
								<c:choose>
									<c:when test="${dto.naviStIdx eq '1'}">
										<a class="page-link disabled" id="naviPrev"	href="javascript:void(0)" onclick="movePage(this)">Prev</a>
									</c:when>
									<c:otherwise>
										<a class="page-link" id="naviPrev" href="javascript:void(0)" onclick="movePage(this)">Prev</a>
									</c:otherwise>
								</c:choose>
							</li>
							
							<c:forEach var="i" begin="${dto.naviStIdx}" end="${dto.naviEdIdx}">
								<li class="page-item">
									<c:choose>
										<c:when test="${i eq dto.naviIdx}">
											<a class="page-link active" href="javascript:void(0)" onclick="movePage(this)">${i}</a>
										</c:when>
										<c:otherwise>
											<a class="page-link" href="javascript:void(0)" onclick="movePage(this)">${i}</a>
										</c:otherwise>
									</c:choose>
									
								</li>
							</c:forEach>
							
							<li class="page-item">
								<c:choose>
									<c:when test="${dto.naviEdIdx eq dto.naviLstIdx}">
										<a class="page-link disabled" id="naviNext" href="javascript:void(0)" onclick="movePage(this)">Next</a>
									</c:when>
									<c:otherwise>
										<a class="page-link" id="naviNext" href="javascript:void(0)" onclick="movePage(this)">Next</a>
									</c:otherwise>
								</c:choose>
							</li>
							
						</ul>
					</nav>
					<div class="fw-normal small mt-4 mt-lg-0">
						Showing <b>${dto.itemPerPage}</b> out of <b>${dto.itemTotCnt}</b> entries
					</div>
				</div>
			</div>
			<footer class="bg-white rounded shadow px-5 py-3 mb-4 mt-4">
				<div class="row">
					<div class="col-12 col-md-4 col-xl-6 mb-4 mb-md-0">
						<p class="mb-0 text-center text-lg-start">Sample by <a class="text-primary fw-normal" href="https://skywhalelab.com" target="_blank">SkyWhaleLab</a></p>
					</div>
					<div class="col-12 col-md-8 col-xl-6 text-center text-lg-start">
						<!-- List -->
						<ul class="list-inline list-group-flush list-group-borderless text-md-end mb-0">
							<li class="list-inline-item px-0 px-sm-2">
								<a href="../">Home</a>
							</li>
							<li class="list-inline-item px-0 px-sm-2">
								<a href="https://skywhalelab.com">About</a>
							</li>
							<li class="list-inline-item px-0 px-sm-2">
								<a href="mailto:jykim31337@gmail.com">Mail</a>
							</li>
							<li class="list-inline-item px-0 px-sm-2">
								<a href="https://github.com/jykim31337">GitHub</a>
							</li>
						</ul>
					</div>
				</div>
			</footer>
		</main>
</body>
</html>
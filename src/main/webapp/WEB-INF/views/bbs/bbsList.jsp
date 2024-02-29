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

$(document).ready(function() {
	
	$( "#btnWrite" ).on( "click", function() {
		window.location = 'bbsWrite';
	} );
	
	$("#btnRequest").on("click", function() {
		//window.location = "bbsList";
		$('#frmSearch').submit();
	});
	
});

</script>

<title>BBS LIST</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../template/top.jsp" />
		
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
						<div class="input-group me-2 me-lg-3 fmxw-400">
							<span class="input-group-text"><svg class="icon icon-xs" x-description="Heroicon name: solid/search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
									<path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg> </span>
									<input type="hidden" id="searchType" name="searchType" value="${dto.searchType}"/>
									<input type="text" id="searchText" name="searchText" value="${dto.searchText}" class="form-control" placeholder="Search Title">
						</div>
					</div>
					<button id="btnRequest" name="btnRequest" class="btn btn-outline-primary col-2 mx-2" type="button">Request</button>
					<button id="btnWrite" name="btnWrite" class="btn btn-outline-primary col-2" type="button">Write</button>
				</div>
			</div>
		</form>
		
		<div class="card card-body border-0 shadow table-wrapper table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="border-gray-200">Idx</th>
						<th class="border-gray-200">Title</th>
						<th class="border-gray-200">Id</th>
						<th class="border-gray-200">Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${dto.list}" varStatus="status">
						<tr>
							<td style="display:none;">
								<input type="hidden" id="seq" name="seq" value="${item.seq}"/>
							</td>
							<td>
								${item.idx}
							</td>
							<td>
								${item.title}
							</td>
							<td>
								${item.usrId}
							</td>
							<td>
								${item.lstDtFormatDt}
							</td>
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
									<a class="page-link disabled" id="naviPrev"  href="javascript:void(0)" onclick="movePage(this)">Prev</a>
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
	</div>
</body>
</html>
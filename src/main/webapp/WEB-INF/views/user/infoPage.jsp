<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/common.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
});

</script>

<title>INFO</title>
</head>
<body>
	<jsp:include page="../template/top.jsp" />
	<jsp:include page="../template/left.jsp" />
	<main class="content">
		<div style="min-height:80vh;" class="mt-4">
			<h1>INFO</h1><br>
			ROLE_USER ONLY<br>
			<br>
			<br>
			<br>
			<img src="${auth.user.picture}"/><br>
			<p>${auth.user.email}</p>
			
		</div>
		<jsp:include page="../template/bottom.jsp" />	
	</main>
</body>
</html>
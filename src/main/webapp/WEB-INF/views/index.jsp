<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./template/commonRoot.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	var date = new Date();
	console.log(date);
});

</script>

<title>INDEX</title>
</head>
<body>
	<a href="./bbs/bbsList">/bbs/bbsList</a><br>
	<a href="./bbs/bbsDetail">/bbs/bbsDetail</a><br>
	<br>
	<a href="./admin/manageGet">/admin/manageGet</a><br>
	<a href="./user/infoGet">/user/infoGet</a><br>
	<br>
	<a href="loginGet">loginGet</a><br>
	<br>
	<a href="logout">logout</a><br>
</body>
</html>
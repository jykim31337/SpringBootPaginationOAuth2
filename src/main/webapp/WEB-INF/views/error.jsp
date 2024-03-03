<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">

</script>

<jsp:include page="./template/common.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	var date = new Date();
	console.log(date);
});

</script>

<title>ERROR</title>
</head>
<body>
	<h1>ERROR</h1>
	<h1>${errMsg}</h1>
</body>
</html>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./template/common.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	var date = new Date();
	console.log(date);
});

</script>

<title>INDEX</title>

</head>
<body>
	<jsp:include page="./template/top.jsp" />
	<jsp:include page="./template/left.jsp" />
	<main class="content">
		<div style="min-height:80vh;">
			<h1>INDEX</h1>
			Fix to give ROLE_ADMIN permission to the account if the google id has a
			<br>
			case-insensitive "admin" string
		</div>
		<jsp:include page="./template/bottom.jsp" />	
	</main>
</body>
</html>
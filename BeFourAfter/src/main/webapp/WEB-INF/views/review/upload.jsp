<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/upload.jsp</title>
</head>
<body>
	<script>
		alert("리뷰 업로드에 성공했습니다.");
		location.href = "${pageContext.request.contextPath}/review/list.do";
	</script>
</body>
</html>
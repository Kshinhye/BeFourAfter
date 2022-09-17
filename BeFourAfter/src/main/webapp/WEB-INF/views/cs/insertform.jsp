<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cs/insertform.jsp</title>
</head>
<body>
<div class="container">
   <h1>새글 작성 폼</h1>
   <form action="${pageContext.request.contextPath}/cs/insert.do" method="post" id="insertForm">
      <div>
         <label for="title">제목</label>
         <input type="text" name="title" id="title"/>
      </div>
      <div>
         <label for="content">내용</label>
         <textarea name="content" id="content"></textarea>
      </div>
      <div>
         <label for="isSecret">비밀글로 문의하기</label>
         <input type="hidden" name="isSecret" id="isSecret"/>
         <input type="checkbox" id="isSecretchbox"/>
      </div>
      <button type="submit">등록</button>
   </form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
		$("#isSecretchbox").change(function(){
			if($("#isSecretchbox").is(":checked")){
				$("#isSecret").val('Yes');
			}else{
				$("#isSecret").val('No');
			}
		})
   </script>
</div>

</body>
</html>
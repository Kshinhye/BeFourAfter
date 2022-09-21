<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cs/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/></head>
<body>
   <div class="container">
		<div class="p-5">
		</div>
		<h1 class="text-center">문의하기</h1>
	   <table class="table">
	      <c:choose>
	      	<c:when test="${dto.isSecret eq 'Yes'}">
				<tr >
					<th style="width:100px;">제목</th>
					<td colspan="3"><span class="text-muted" style="font-size:12px;"><i class="bi bi-lock-fill"></i>비밀글</span> ${dto.title }</td>
	    		</tr>
	      	</c:when>
	      	<c:otherwise>
				<tr>
					<th style="width:100px;">제목</th>
					<td colspan="5">${dto.title }</td>
	    		</tr>
	      	</c:otherwise>
	      </c:choose>

	      <tr>
	         <th style="width:100px;">작성자</th>
	         <td>${dto.writer }</td>
	         <th style="width:100px;">등록일</th>
	         <td>${dto.regdate }</td>
	         <th style="width:100px;">문의 내용</th>
	         <c:choose>
	         	<c:when test="${dto.reserveType == 'ent'}">
		         	<td>[입국 예약]</td>	         	
	         	</c:when>
	         	<c:when test="${dto.reserveType == 'leave'}">
		         	<td>[출국 예약]</td>	         	
	         	</c:when>
	         	<c:when test="${dto.reserveType == 'delivery'}">
		         	<td>[배송 예약]</td>	         	
	         	</c:when>
	         	<c:when test="${dto.reserveType == 'etc'}">
		         	<td>[기타]</td>	         	
	         	</c:when>
	         	<c:otherwise>
					<td>[선택안함]</td>									
				</c:otherwise>
	         </c:choose>
	      </tr>	
	      <tr style="height:300px;">
	         <td colspan="6">
	            <div >${dto.content }</div>
	         </td>
	      </tr>
	   </table>
	   <div class="text-end">
	      <span><a class="btn text-decoration-none text-dark btn-outline-secondary" href="${pageContext.request.contextPath}/cs/ask.do"><i class="bi bi-list"></i>목록보기</a></span>
	      <c:if test="${dto.writer eq id }">
	         <sapn><a class="btn text-decoration-none text-dark btn-outline-secondary" href="${pageContext.request.contextPath}/cs/updateform.do?num=${dto.num }"><i class="bi bi-pencil-fill"></i>수정</a></span>
	         <span><a class="btn text-decoration-none text-dark btn-outline-secondary" href="${pageContext.request.contextPath}/cs/delete.do?num=${dto.num }"><i class="bi bi-trash3"></i>삭제</a></span>
	      </c:if>
	   </div>
	   
</div>
</body>
</html>
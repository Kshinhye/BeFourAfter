<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>가입 정보 수정 폼 입니다.</h1>
	<a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" 
					src="${pageContext.request.contextPath}${dto.profile}" />
			</c:otherwise>
		</c:choose>
	</a>
	<form action="${pageContext.request.contextPath}/users/update.do" method="post">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? '' : dto.profile}"/>
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="${id }" disabled/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="${dto.email }"/>
		</div>
		<button type="submit">수정반영</button>
	</form>
	
	<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input type="file" name="image" id="image" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			
			//let img='<img id="profileImage" src="${pageContext.request.contextPath}'+data.imagePath+'"/>';
			// img 변수에 들어있는 문자열HTML로 해석하면서 링크에 넣어주세요 뜻, 위에랑 같은 코드이다
			/*
				${pageContext.request.contextPath}\${data.imagePath}여기에서
				\ 역슬래시가 들어가는 이유는 (\빼면 오류난다 - 사진 안나옴)
				${pageContext.request.contextPath}, ${data.imagePath} 둘다
				jsp페이지가 해석하지만 ``(백틱)은 자바스크립트에서 사용된다.
				``안에서 ${}중요한 문자로 해석하기 때문에 
				``백틱안에 ${data.imagePath}이 부분을 문자그대로 해석하기위해 \를 앞에 붙여야 한다.
			*/
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			
			/*
				document.querySelector("css 선택자")
				document.querySelectorAll("css 선택자")
				
				# => 아이디 선택자
				. => 클래스 선택자
				[] => 속성 선택자
				ex) [속성명=속성값]
				
				[id=one] : id 속성의 값이 one인 요소 선택 : <xxx id="one">
				[class=my-class] : class 속성의 값이 my-class 인 요소 선택 : <xxx class="my-class">
				[name=profile] : <xxx name="profile">
				
				input[name=profile] : input 요소 이면서 name 속성의 값이 profile 인 요소 선택
				
				<input name="profile">
			*/
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>










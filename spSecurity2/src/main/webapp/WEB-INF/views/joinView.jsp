<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session= "false" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<meta id="_csrf" name="_csrf" content="${_csrf.token}"> <!-- 페이지위조요청을 방지를 위한 태그 -->
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	
<h3 class="container mt-5" id="result"></h3><br/>
<div class="container mt-5">
	<h3 class="text-center text-danger">회원가입</h3>
	<form action="join" method="post" id="frm1" name="frm1">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<label for="uId">아이디</label>
			<input type="email" placeholder="이메일 주소 입력" class="form-control" id="uId" required="required" name="pid">
		</div>
		<div class="form-group">
			<label for="uPw">비번</label>
			<input type="password" placeholder="비번 입력" class="form-control" id="uPw" required="required" name="ppw">
		</div>
		<div class="form-group">
			<label for="uAddress">주소</label>
			<input type="text" placeholder="주소 입력" class="form-control" id="uAddress" required="required" name="paddress">
		</div>
		<div class="form-group">
			<label for="uHobby">취미</label>
			<input type="text" placeholder="취미 입력" class="form-control" id="uHobby" required="required" name="phobby">
		</div>
		<div class="form-group">
			<label for="uProfile">자기소개:</label>
			<textarea rows="10" cols="" placeholder="자기소개작성" id="uProfile" name="pprofile" class="form-control" required="required"></textarea>
		</div>
		<button type="submit" class="btn btn-success">회원가입</button>&nbsp;&nbsp;
		<button type="reset" class="btn btn-danger">취 소</button>&nbsp;&nbsp;
		<a href="login_view" class="btn btn-primary">로그인</a>
		
	</form>
</div>
<script type="text/javascript">
$(document).ready(function name() {
	$("#frm1").submit(function name(e) {
		e.preventDefault(); // 원래 form의 기능인 submit을 ajax로 처리
		$.ajax({
			url : $("#frm1").attr("action"),
			type : $("#frm1").attr("method"),
			data : $("#frm1").serialize(),
			success : function name(data) {
				if(data.search("join-success") > -1) {
					$("#result").text("가입을 축하합니다.");
				}
				else{
					$("#result").text("가입이 실패 했습니다 다시가입하세요");
				}
			},
			error : function name() {
				$("#result").text("서버에 접속 실패 입니다");
			}
		})
	})
	
})
</script>

</body>
</html>
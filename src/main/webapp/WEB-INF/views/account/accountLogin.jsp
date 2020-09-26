<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>L O G I N</title>
<script type="text/javascript">
	function loginForm() {
		var acc_id = document.getElementById("acc_id").value;
		var acc_pw = document.getElementById("acc_pw").value;

		var flag = true;
		
		if(acc_id == '') {
			alert("아이디를 입력해주세요.");
			return false;
		} 
		if(acc_id.length < 3 || acc_id.length > 8) {
			alert("아이디를 3~8글자로 입력해주세요.");
			return false;
		} 
		if(acc_pw == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		} 
		if(acc_pw.length < 5 || acc_pw.length > 10) {
			alert("비밀번호는 5~10글자로 입력해주세요.");
			return false;
		} 
		
		if(flag) document.getElementById("loginForm").submit();
	}	
</script>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">家計簿</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">main</a></li>
				
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form id="loginForm" action="/account/login" method="post">
					<h3 style="text-align: center;">ログイン</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="acc_id" id="acc_id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="password"
							name="acc_pw" id="acc_pw" maxlength="20">
					</div>


					 <input type="button"class="btn btn-primary form-control" value="로그인" onclick="loginForm();">
				</form>
					</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>
</body>
</html>
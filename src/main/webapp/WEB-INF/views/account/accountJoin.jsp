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
<title>J O I N</title>
<script type="text/javascript">
	function joinForm(){
		var acc_id = document.getElementById("acc_id").value;
		var acc_pw = document.getElementById("acc_pw").value;
		var acc_pw_ck = document.getElementById("acc_pw_ck").value;
		var acc_nm = document.getElementById("acc_nm").value;

		var flag = true;
		
		if(acc_id == '') {
			alert("아이디를 입력해주세요.");
			return false;
		}

		if (acc_id.length < 3 || acc_id.length > 8){
			alert("아이디는 3~8글자로 입력해 주세요.");
			return false;
		}

		if(acc_pw == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		} 
		if(acc_pw.length < 5 || acc_pw.length > 10) {
			alert("비밀번호는 5~10글자로 입력해 주세요.");
			return false;
		}
		if(acc_pw != acc_pw_ck) {
			alert("동일한 비밀번호를 입력해주세요.");
			return false;
		}
		if(acc_nm == '') {
			alert("이름을 입력해주세요.");
			return false;
		}

		if(flag) document.getElementById("joinForm").submit();
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
			<a class="navbar-brand" href="#">board web site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">main</a></li>
				<li><a href="board/list">board</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form id="joinForm" action="/account/join" method="post">

					<h3 style="text-align: center;">会員加入</h3>
					<div class="form-group">
						<input type="text" name="acc_id" id="acc_id" maxlength="10"
							placeholder="ID" class="form-control" value="${member.id}">
					</div>
					<div class="form-group">
						<input type="password" name="acc_pw" id="acc_pw"
							placeholder="パスワード入力" class="form-control"
							value="${member.password}"><br> <input
							type="password" id="acc_pw_ck" placeholder="パスワードを再"
							class="form-control" value="${member.password}">
					</div>
					<div class="form-group">
						<input type="text" name="acc_nm" id="acc_nm" placeholder="名前"
							class="form-control" value="${member.name}">
					</div>


					<input type="button" class="btn btn-primary form-control"
						value="가입하기" onclick="joinForm();">
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-4"></div>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>H O M E</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
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
				<li><a href="#">main</a></li>

			</ul>

	

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginID == null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 接続<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/account/accountJoin">회원가입</a></li>
						<li><a href="/account/accountLogin">로그인</a></li>
						</ul></li>
				</c:if>
			</ul>




			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginID != null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> hello<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/moneybook/myMoneybook">내 가계부</a></li>
						<li><a href="/account/accountLogout">로그아웃</a></li>

						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>
	
	<div class="container" >
		<div class="jumbotron">
			<div class="container">
				<h1>家 計 簿</h1>
				<p ><br>
					
				</p>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>

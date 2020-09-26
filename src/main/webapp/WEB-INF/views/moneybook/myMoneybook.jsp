<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M Y M O N E Y B O O K</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function moneybookWriteForm() {
		location.href = "/moneybook/moneybookWriteForm";
	}

	function searchMoneybook() {
		var searchType = document.getElementById('searchType').value;
		var searchText = document.getElementById('searchText').value;

		if (searchText == '') {
			alert("검색어를 입력해주세요.");
			return false;
		}

		document.getElementById('type').value = searchType;
		document.getElementById('text').value = searchText;

		document.getElementById('searchForm').submit();
	}

	function allIncome() {
		$.ajax({
			url : "/moneybook/allIncome",
			type : "post",
			data : {
				moneybook_type : "수입"
			},
			success : function(data) {
				$("#resultMoney1").val(data);
			},
			error : function(e) {
				alert("통신실패...");
				console.log(e);
			}

		});
	}

	function allPay() {
		$.ajax({
			url : "/moneybook/allPay",
			type : "post",
			data : {
				moneybook_type : "지출"
			},
			success : function(data) {
				$("#resultMoney1").val(data);
			},
			error : function(e) {
				alert("통신실패...");
				console.log(e);
			}

		});
	}
	function minMoney() {
		$.ajax({
			url : "/moneybook/minMoney",
			type : "post",
			success : function(data) {
				$("#resultMoney2").val(data);
			},
			error : function(e) {
				alert("통신실패...");
				console.log(e);
			}

		});
	}

	function maxMoney() {
		$.ajax({
			url : "/moneybook/maxMoney",
			type : "post",
			success : function(data) {
				$("#resultMoney2").val(data);
			},
			error : function(e) {
				alert("통신실패...");
				console.log(e);
			}

		});
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
				<li><a href="/">main</a></li>

			</ul>
			
		</div>
	</nav>

	<div class="btn-toolbar">
		<button class="btn btn-primary" onclick="moneybookWriteForm();">家計簿作成</button>
		<button class="btn btn-primary" onclick="allIncome();">総収入</button>
		<button class="btn btn-primary" onclick="allPay();">総支出</button>
		<button class="btn btn-primary" onclick="minMoney();">最小金額</button>
		<button class="btn btn-primary" onclick="maxMoney();">最高金額</button>
	</div>
	<div class="well">
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>メモ</th>
					<th>タイプ</th>
					<th>金額</th>
					<th>作成日</th>
					<th></th>
					<th></th>
					<th style="width: 36px;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="data" varStatus="status">
					<tr>
						<td>${status.index }</td>
						<td>${data.moneybook_memo }</td>
						<td>${data.moneybook_type }</td>
						<td>${data.moneybook_amount }</td>
						<td>${data.moneybook_indate }</td>
						<td><a
							href="/moneybook/moneybookUpdateForm?moneybook_no=${data.moneybook_no }"><i
								class="icon-pencil"></i></a> <a
							href="/moneybook/moneybookDelete?moneybook_no=${data.moneybook_no }"
							role="button" data-toggle="modal"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<br>
	<form class="form-inline" role="form">
		<span>総収入 or 総支出 : </span><input type="text" class="form-control" id="resultMoney1"
			placeholder="総収入 or 総支出"> <br> <br> 
		<span>最小 or 最高金額 : </span><input
			type="text" class="form-control" id="resultMoney2"
			placeholder="最小 or 最高金額">

	</form>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>
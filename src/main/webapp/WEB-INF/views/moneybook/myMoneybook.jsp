<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M Y M O N E Y B O O K</title>
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
	<div class="btn-toolbar">
		<button class="btn btn-primary" onclick="moneybookWriteForm();">가계부
			작성</button>
		<button class="btn btn-primary" onclick="allIncome();">총 수입
			구하기</button>
		<button class="btn btn-primary" onclick="allPay();">총 지출 구하기</button>
		<button class="btn btn-primary" onclick="minMoney();">최소 금액
			구하기</button>
		<button class="btn btn-primary" onclick="maxMoney();">최대 금액
			구하기</button>
	</div>
	<div class="well">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>메모</th>
					<th>종류</th>
					<th>금액</th>
					<th>작성일</th>
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
		<input type="text" class="form-control" id="resultMoney1"
			placeholder="총 수입 또는 지출"> <br> <br> <input
			type="text" class="form-control" id="resultMoney2"
			placeholder="최소 또는 최대 금액">

	</form>




</body>
</html>
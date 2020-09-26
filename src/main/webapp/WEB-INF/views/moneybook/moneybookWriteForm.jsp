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
<title>W R I T E F O R M</title>
<script type="text/javascript">
	function writeform() {
		var moneybook_memo = document.getElementById("moneybook_memo").value;
		var moneybook_amount = document.getElementById("moneybook_amount").value;

		var flag = true;

		if(moneybook_memo == '') {
			alert("메모를 입력해주세요.");
			return false;
		}
		
		if(moneybook_amount == '') {
			alert("금액을 입력해주세요.");
			return false;
		} 
		
		if(flag) document.getElementById("writeform").submit();
	}
</script>
</head>
<body>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			<h2>[가계부 입력]</h2>
	<form id="writeform" action="/moneybook/write" method="post">
	<input type="hidden" value="${sessionScope.loginID }" name="acc_id">
	
	<div class="form-group">
						<input type="text" name="moneybook_memo" id="moneybook_memo" 
							placeholder="메모" class="form-control">
					</div>
		
		
		
					<select name="moneybook_type" class="selectpicker" style="height:30px">
						<option value="수입">수입</option>
						<option value="지출">지출</option>
					</select>
					<br>
					<br>
			
			<div class="form-group">
					<input type="number" name="moneybook_amount" id="moneybook_amount"
							placeholder="금액" class="form-control">
					</div>	
			
		
		<input type="button" value="입력하기" class="btn btn-primary form-control" onclick="writeform();">
	</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>
</body>
</html>
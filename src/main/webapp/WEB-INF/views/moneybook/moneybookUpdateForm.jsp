<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>U P D A T E F O R M </title>
<script type="text/javascript">
	function updateform(){
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

		if(flag) document.getElementById("updateform").submit();
	}
</script>
</head>
<body>
	<h1>[가계부 수정]</h1>
	
	<form id="updateform" action="/moneybook/update" method="post">
		<input type="hidden" value="${sessionScope.loginID }" name="acc_id">
		<input type="hidden" name="moneybook_no" value="${moneybook.moneybook_no }">
		<table>
			<tr>
				<td>메모</td>
				<td><input type="text" name="moneybook_memo" id="moneybook_memo" value="${moneybook.moneybook_memo }"></td>
			</tr>
			<tr>
				<td>분류</td>
				<td>
					<select name="moneybook_type">
						<c:choose>
							<c:when test="${moneybook.moneybook_type == '수입'}">
								<option value="수입" selected="selected">수입</option>
								<option value="지출">지출</option>													
							</c:when>
							<c:otherwise>
								<option value="수입">수입</option>
								<option value="지출" selected="selected">지출</option>													
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>		
			<tr>
				<td>금액</td>
				<td><input type="number" name="moneybook_amount" id="moneybook_amount" value="${moneybook.moneybook_amount }"></td>
			</tr>
		</table>
		<input type="button" value="수정하기" onclick="updateform();">
	</form>
</body>
</html>
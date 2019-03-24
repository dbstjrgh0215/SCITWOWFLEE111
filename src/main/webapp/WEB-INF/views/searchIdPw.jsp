<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${type=='id'}">
	<div id="dialog" title="Dialog Title">
	    <table>
	    	<tr>
	    		<td>이름</td>
	    		<td><input type="text" id="searchIdName"></td>
	    	</tr>
	    	<tr>
	    		<td><h4>이메일</h4></td>
				<td><span class="inputNorm"><input type="text" id="signEmail">@<select id="signMailaddr">
		 			<option value="naver.com">naver.com</option><option value="nate.com">nate.com</option><option value="daum.net">daum.net</option><option value="google.com">google.com</option>
		 			</select></span></td>
	    	</tr>
	    </table>
	    <button id="btnFindId">검색</button>
	</div>
	</c:if>
	<c:if test="${type=='pw'}">
	<div id="dialog" title="Dialog Title">
	    <table>
	    	<tr>
	    		<td>아이디</td>
	    		<td><input type="text" id="searchPwId"></td>
	    	</tr>
	    	<tr>
	    		<td>이름</td>
	    		<td><input type="text" id="searchPwName"></td>
	    	</tr>
	    	<tr>
	    		<td><h4>이메일</h4></td>
				<td><span class="inputNorm"><input type="text" id="signEmail">@<select id="signMailaddr">
		 			<option value="naver.com">naver.com</option><option value="nate.com">nate.com</option><option value="daum.net">daum.net</option><option value="google.com">google.com</option>
		 			</select></span></td>
	    	</tr>
	    </table>
	    <button id="btnFindPw">검색</button>
	</div>
	</c:if>
	<div id="searchIdPwResult">
	</div>
</body>

	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
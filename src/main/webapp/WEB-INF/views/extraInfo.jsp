<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
<header class="site-header">
	<div class="main-header">
		<div class="logo">
			<img src="resources/images/logo.png">
			<a href="goHome">WOWFLEE</a>
		</div>
		<div class="btn-header">
	        <button id="btnSearchM"><i class="fas fa-search"></i></button>
	        <button id="btnNotice"><i class="fas fa-bell"></i></button>
	        <button id="btnSlide"><i class="fas fa-bars"></i></button> 
        </div>
	</div>
	
	<div id="sidenav" class="sidenav">
		<div class="side-login">
			<i class="fas fa-user-circle"></i><br>
			<c:if test="${sessionMember==null}">
				<a class="login-btn" href="goLogin">로그인해주세요!</a>
			</c:if>   
			<c:if test="${sessionMember!=null}">
				${sessionMember.nickname}님
				<button class="logout-btn" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="sidenav-btn">
			<a class="slide-btn" href="#">계약관리</a>
			<a class="slide-btn" href="#">지원관리</a>
			<a class="slide-btn" href="goProposal">제안서관리</a>
			<a class="slide-btn" href="goUserBoard">내가쓴글</a>
		</div>
		<div class="sidenav-menu">
			<a href="#">이용후기</a>
			<a href="#">찜목록</a>
			<a href="#">1:1문의</a>
			<a href="#">FAQ</a>
			<a href="#">공지사항</a>
			<a href="#">서비스정보</a>
		</div>
	</div>
	
	<div id="notice" class="notice">
		<div class="notice-header">
			<font class="notice-name">알림</font>
		</div>
		
	</div>
</header>
<div class="wrap">     
    <div class="main-content" id="main-content">
	    <div class="signUp">
	    	<div class="signUpProgress">
	   			<table class="progressTable">
	   				<tr>
	   					<td class="td-prog">
						<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp1.png"></li>
	   						<li><h4>기본정보입력</h4></li>
    					</ul>
						</td>
	   					<td class="td-prog" style="background-color:yellow">
   						<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp2.png"></li>
	   						<li><h4>추가정보입력</h4></li>
    					</ul>
	   					</td>
	   					<td class="td-prog">
	   					<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp3.png"></li>
	   						<li><h4>회원가입완료</h4></li>
    					</ul>
	   					</td>
	   				</tr>
	   			</table>
	   			<h3>추가정보입력(셀러/공간제공자)</h3><hr class="progressLine">
	   		</div>
			<div class="signUpDiv">
				<form id="imgForm" class="extraForm" action="insertExtraInfo" method="post" enctype="multipart/form-data">
				<input type="hidden" id="id" name="id" value="${id}">
				<input type="hidden" id="membertype" name="membertype" value="${memtype}">
				<table class="signUpTable">
				<c:if test="${memtype=='seller'}">
					<tr>
						<td class="td-1"><h4>셀러이름</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="sellername"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>TEL</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="tel"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>제품이름</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="productname" placeholder="대표제품을 1개 등록해주세요!"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>제품분류</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="type" name="prod_type"></span>
						<button id="typeRegist" type="button">등록</button></td>
					</tr>
					<tr id="typeSelected">
   						<td class="td-1"><h4>제품분류</h4></td>
   						<td class="td-2"><input type="hidden" id="typeContent1" value="">
   						<input type="hidden" id="typeContent2" value=""><input type="hidden" id="typeContent4" value="">
   						<input type="hidden" id="typeContent3" value=""><input type="hidden" id="typeContent5" value=""></td>
   					</tr>
					<tr>
   						<td class="td-1"><h4>키워드</h4></td>
   						<td class="td-2">
   						<input type="hidden" id="selectedKeyword" name="keyword">
   						<span class="inputNorm"><input type="text" id="keyword" value="${udtProposal.keyword}"></span>
   						<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button></td>
   					</tr>
   					<tr id="keywordFilter">
   						
   					</tr>
   					<tr id="keywordSelected">
   						<td class="td-1"><h4>나의 키워드</h4><h5>(<font id="keywordCount">0</font> / 5)</h5></td>
   						<td class="td-2"><input type="hidden" id="keywordContent1" value="">
   						<input type="hidden" id="keywordContent2" value=""><input type="hidden" id="keywordContent4" value="">
   						<input type="hidden" id="keywordContent3" value=""><input type="hidden" id="keywordContent5" value=""></td>
   					</tr>
					<tr>
						<td class="td-1"><h4>간략한 소개</h4></td>
						<td class="td-2"><textarea rows="10" cols="50" name="comments"></textarea></td>
					</tr>
				</c:if>
				<c:if test="${memtype=='space'}">
					<tr>
						<td class="td-1"><h4>공간이름</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="spacename"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>TEL</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="tel"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>공간분류</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="type" name="space_type"></span>
						<button id="typeRegist" type="button">등록</button></td>
					</tr>
					<tr id="typeSelected">
   						<td class="td-1"><h4>공간분류</h4></td>
   						<td class="td-2"><input type="hidden" id="typeContent1" value="">
   						<input type="hidden" id="typeContent2" value=""><input type="hidden" id="typeContent4" value="">
   						<input type="hidden" id="typeContent3" value=""><input type="hidden" id="typeContent5" value=""></td>
   					</tr>
					<tr>
   						<td class="td-1"><h4>키워드</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="keyword" value="${udtProposal.keyword}"></span>
   						<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button></td>
   					</tr>
   					<tr id="keywordFilter">
   						
   					</tr>
   					<tr id="keywordSelected">
   						<td class="td-1"><h4>나의 키워드</h4><h5>(<font id="keywordCount">0</font> / 5)</h5></td>
   						<td class="td-2">
   						<input type="hidden" id="selectedKeyword" name="keyword">
   						<input type="hidden" id="keywordContent1" value="">
   						<input type="hidden" id="keywordContent2" value=""><input type="hidden" id="keywordContent4" value="">
   						<input type="hidden" id="keywordContent3" value=""><input type="hidden" id="keywordContent5" value=""></td>
   					</tr>
   					<tr>
						<td class="td-1"><h4>공간주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="address" name="spaceaddr1" placeholder="주소"></span><button type="button" onclick="execDaumPostcode()">주소검색</button></td>
					</tr>
					<tr>
						<td class="td-1"><h4>상세주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="detailAddress" name="spaceaddr2" placeholder="상세주소"></span><input type="hidden" id="latitude" name="latitude"><input type="hidden" id="longitude" name="longitude"></td>
					</tr>
					<tr>
						<td class="td-1"><h4>간략한 소개</h4></td>
						<td class="td-2"><textarea rows="10" cols="50" name="comments"></textarea></td>
					</tr>
				</c:if>
				</table>
				</form>
			 		<div class="signUpbtn">
					<button type="button" id="btnExtraInsert">등록</button>
   					<p id="extraWarning"></p>
				</div>
			</div>
   		</div>
 		<footer class="site-footer">
		<div class="main-footer">
			푸터
		</div>
	</footer>
	</div>
</div>
</body>
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>

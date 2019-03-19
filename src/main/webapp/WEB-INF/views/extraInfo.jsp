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
	<div class="main-nav">
        <div class="list-menu">
            <ul>
                <li><a href="goBoardSpace">공간보기</a></li>
                <li><a href="goBoardSeller">셀러보기</a></li>
                <li><a href="">판매상품</a></li>
            </ul>
            
        </div> <!-- /.list-menu -->
	</div>
	
	<div id="sidenav" class="sidenav">
		<div class="side-login">
			<i class="fas fa-user-circle"></i><br>
			<c:if test="${sessionMember==null}">
				<a class="login-btn" href="goLogin">로그인해주세요!</a>
			</c:if>   
			<c:if test="${sessionMember!=null}">
				${sessionMember.id}님
				<button class="logout-btn" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="sidenav-btn">
			<a class="slide-btn" href="#">계약관리</a>
			<a class="slide-btn" href="#">지원관리</a>
			<a class="slide-btn" href="goProposal">제안서관리</a>
			<a class="slide-btn" href="#">내가쓴글</a>
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
						<td class="td-2"><span class="inputNorm"><select name="prod_type1"><option value="type1">대분류</option></select>
														  		<select name="prod_type2"><option value="type2">중분류</option></select>
														  		<select name="prod_type3"><option value="type3">소분류</option></select></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>키워드</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="keyword" placeholder="검색시 활용할 키워드를 넣어주세요"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>사진</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="file" name="uploadFile" id="images" multiple/><br>
				 		</span></td>
					</tr>
					<tr>
						<td class="td-1"></td>
						<td class="td-2"><div class="imgs_wrap">
							<div class="imgs_wrap0"></div>
							<div class="imgs_wrap1"></div>
							<div class="imgs_wrap2"></div>
						</div></td>
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
			 		<input type="hidden" name="latitude" value="${latitude}">
			 		<input type="hidden" name="longitude" value="${longitude}">
					<tr>
						<td class="td-1"><h4>공간분류</h4></td>
						<td class="td-2"><span class="inputNorm"><select name="space_type1"><option value="type1">대분류</option></select>
				  		<select name="space_type2"><option value="type2">중분류</option></select>
				  		<select name="space_type3"><option value="type3">소분류</option></select></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>키워드</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" name="keyword" placeholder="검색시 활용할 키워드를 넣어주세요"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>사진</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="file" name="uploadFile" id="images" multiple/><br>
				 		</span></td>
					</tr>
				  	<tr>
						<td class="td-1"></td>
						<td class="td-2">
						<div class="imgs_wrap">
							<div class="imgs_wrap0"></div>
							<div class="imgs_wrap1"></div>
							<div class="imgs_wrap2"></div>
						</div></td>
						
					</tr>
					<tr>
						<td class="td-1"><h4>간략한 소개</h4></td>
						<td class="td-2"><textarea rows="10" cols="50" name="comments"></textarea></td>
					</tr>
				</c:if>
				</table>
				</form>
			 		<div class="signUpbtn">
					<button id="btnExtraInsert">등록</button>
   					<p id="extraWarning"></p>
				</div>
			</div>
   		</div>
	</div>
</body>
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>

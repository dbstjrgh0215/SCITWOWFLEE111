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
	<div id="searchFilter" class="search">
			<div class="searchSection">
				<div class="searchWrap">
					<form class="searchForm">
						<input type="text" id="searchText" class="searchText" placeholder="키워드를 검색해보세요.">
						<a class="searchIcon" href="javascript:void(0);" id="goSearch"><i class="fas fa-search"></i></a>
					</form>
				</div>
				<div class="searchTable">
					<h4>추천검색어</h4>
					<div class="searchKeywordDiv">
					<ul class="ul-searchKeyword">
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=1><a href="javascript:void(0);" data-sno=1 id="keyword-a1"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　카페</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=2><a href="javascript:void(0);" data-sno=2 id="keyword-a2"><i data-sno=2 id="keyword-icon2" class="fas fa-check"></i>　애견카페</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=3><a href="javascript:void(0);" data-sno=3 id="keyword-a3"><i data-sno=3 id="keyword-icon3" class="fas fa-check"></i>　헤어밴드</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=4><a href="javascript:void(0);" data-sno=4 id="keyword-a4"><i data-sno=4 id="keyword-icon4" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=5><a href="javascript:void(0);" data-sno=5 id="keyword-a5"><i data-sno=5 id="keyword-icon5" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=6><a href="javascript:void(0);" data-sno=6 id="keyword-a6"><i data-sno=6 id="keyword-icon6" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=7><a href="javascript:void(0);" data-sno=7 id="keyword-a7"><i data-sno=7 id="keyword-icon7" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=8><a href="javascript:void(0);" data-sno=8 id="keyword-a8"><i data-sno=8 id="keyword-icon8" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=9><a href="javascript:void(0);" data-sno=9 id="keyword-a9"><i data-sno=9 id="keyword-icon9" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=10><a href="javascript:void(0);" data-sno=10 id="keyword-a10"><i data-sno=10 id="keyword-icon10" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=11><a href="javascript:void(0);" data-sno=11 id="keyword-a11"><i data-sno=11 id="keyword-icon11" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=12><a href="javascript:void(0);" data-sno=12 id="keyword-a12"><i data-sno=12 id="keyword-icon12" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=13><a href="javascript:void(0);" data-sno=13 id="keyword-a13"><i data-sno=13 id="keyword-icon13" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=14><a href="javascript:void(0);" data-sno=14 id="keyword-a14"><i data-sno=14 id="keyword-icon14" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=15><a href="javascript:void(0);" data-sno=15 id="keyword-a15"><i data-sno=15 id="keyword-icon15" class="fas fa-check"></i>　악세서리</a></span></li>
					</ul>
					</div>
					<h4>추천검색장소</h4>
					<div class="searchLocationDiv">
					<ul class="ul-searchKeyword">
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
					</ul>
					</div>
				</div>
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
    					<td class="td-prog" style="background-color:yellow">
						<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp1.png"></li>
	   						<li><h4>기본정보입력</h4></li>
    					</ul>
						</td>
	   					<td class="td-prog">
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
    			<h3>기본정보입력</h3><hr class="progressLine">
    		</div>
    		<div class="signUpDiv"> 
				<table class="signUpTable"> 
					<tr> 
						<td class="td-1"><h4>아이디</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="signId"></span><button id="checkId">중복확인</button>
						<p class="signUpMsg" id="idFail"></p></td>
					</tr>
					<tr>
						<td class="td-1"><h4>비밀번호</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="password" id="signPw"><img class="img-pw" id="img-pw" src="resources/images/signUp/m_icon_pass.png"></span>
						<p class="signUpMsg" id="pwFail"></p></td>
					</tr>
					<tr>
						<td class="td-1"><h4>비밀번호확인</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="password" id="passwordCheck"><img class="img-pw" id="img-pwcheck" src="resources/images/signUp/m_icon_check_disable.png"></span>
						<p class="signUpMsg" id="pwCheckFail"></p></td>
					</tr>
					<tr>
						<td class="td-1"><h4>이름</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="signName"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>닉네임</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="signNickname"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>전화번호</h4></td>
						<td class="td-tel"><span class="inputCen"><input type="text" id="signPhone1">―<input type="text" id="signPhone2">―<input type="text" id="signPhone3"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>이메일</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="signEmail">@<select id="signMailaddr">
							 			<option value="naver.com">naver.com</option><option value="nate.com">nate.com</option><option value="daum.net">daum.net</option><option value="google.com">google.com</option>
							 			</select></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>생년월일</h4></td>
						<td class="td-2"><span class="inputCen"><input type="date" id="signBirthdate"></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>성별</h4></td>
						<td class="td-2"><span class="inputNorm"><select id="signGender"><option value="men">남</option><option value="woman">녀</option></select></span></td>
					</tr>
					<tr>
						<td class="td-1"><h4>주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="address" placeholder="주소"></span><button onclick="execDaumPostcode()">주소검색</button></td>
					</tr>
					<tr>
						<td class="td-1"><h4>상세주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="detailAddress" placeholder="상세주소"></span><input type="hidden" id="latitude"><input type="hidden" id="longitude"></td>
					</tr>
					<tr>
						<td class="td-1"><h4>멤버타입</h4></td>
						<td class="td-2"><span class="inputNorm"><select id="signMembertype"><option value="seller">셀러</option><option value="space">공간제공자</option><option value="user">일반사용자</option></select></span></td>
					</tr>
				</table>
				<div class="signUpbtn">
					<button id="btnSignUp">회원가입</button>
   					<p id="signUpWarning"></p>
				</div>
			</div>
    	</div>
    </div>
	<footer class="site-footer">
		<div class="main-footer">
			<div class="footer-logo">
				<img src="resources/images/logo.png"><br>
			</div>
		</div>
	</footer>
</div>	
</body>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>

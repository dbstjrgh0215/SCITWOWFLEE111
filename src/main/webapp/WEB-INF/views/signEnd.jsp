 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
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
			<c:if test="${sessionMember.membertype=='셀러'}">
				<div class="profileIcon" style="background-color:darkslateblue;">
					<img src="resources/images/seller.png">
				</div>
			</c:if>
			<c:if test="${sessionMember.membertype=='공간제공자'}">
				<div class="profileIcon" style="background-color:lightcoral;">
					<img src="resources/images/spacer.png">
				</div>
			</c:if>
			<c:if test="${sessionMember.membertype=='일반사용자'}">
				<div class="profileIcon" style="background-color:indigo;">
					<img src="resources/images/user.png">
				</div>
			</c:if>
			<c:if test="${sessionMember.membertype==null}">
				<div class="profileIcon" style="background-color:indigo;">
					<img src="resources/images/user.png">
				</div>
				<a class="login-btn" href="goLogin">로그인해주세요!</a>
			</c:if>
			<c:if test="${sessionMember!=null}">
				${sessionMember.nickname}님
				<button class="logout-btn" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="sidenav-menu">
			<a class="slide-btn" href="goZzimList">찜목록<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goContract">계약관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goRequest">지원관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goProposal">제안서관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goUserBoard">내가쓴글<i class="fas fa-chevron-right"></i></a>
		</div>
	</div>
	
	<div id="notice" class="notice">
		<div class="notice-header">
			<h5 class="notice-headerName">알림</h5>
		</div>
		<div class="newNotice">
			<div class="newNotice-header">
				<h5 class="notice-headerName2">새로운 알림</h5>
			</div>
			<div class="newNotice-content">
				<ul>
					<c:forEach var="notice" items="${listNewNotice}" varStatus="status">
					<li>
						<a class="checkNotice" data-sno="${notice.noticenum}" go="${notice.go}">
							<div class="newNoticeContent" id="checkNotice${notice.noticenum}">
								<table class="noticeContentTable">
									<tr>
										<td rowspan="2">
										<div class="noticeProfile">
											<img src="resources/images/seller.png">
										</div></td>
										<td><b>${listNewNickname[status.index]}</b>${notice.message}</td>
									</tr>
									<tr>
										<td>${notice.indate}</td>
									</tr>
								</table>
							</div>
						</a>
						<a class="updateConfirm" data-sno="${notice.noticenum}"><i class="far fa-circle"></i></a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="oldNotice">
			<div class="oldNotice-header">
				<h5 class="notice-headerName2">이전 알림</h5>
				<a class="updateConfirm" data-sno="${notice.noticenum}"></a>
			</div>
			<div class="newNotice-content">
				<ul>
					<c:forEach var="notice" items="${listOldNotice}" varStatus="status">
					<li>
						<a class="checkNotice" data-sno="${notice.noticenum}" href="${notice.go}">
							<div class="oldNoticeContent" id="checkNotice${notice.noticenum}">
								<table class="noticeContentTable">
									<tr>
										<td rowspan="2">
										<div class="noticeProfile">
											<img src="resources/images/seller.png">
										</div></td>
										<td><b>${listOldNickname[status.index]}</b>${notice.message}</td>
									</tr>
									<tr>
										<td>${notice.indate}</td>
									</tr>
								</table>
							</div>
						</a>
						<a class="deleteNotice" data-sno="${notice.noticenum}"><i class="far fa-trash-alt"></i></a>
						<a class="noConfirm" data-sno="${notice.noticenum}"><i class="fas fa-circle"></i></a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div id="searchModal" class="search">
	<span class="closeSearch">&times;</span> 
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
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=2><a href="javascript:void(0);" data-sno=2 id="keyword-a2"><i data-sno=2 id="keyword-icon2" class="fas fa-check"></i>　서점</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=3><a href="javascript:void(0);" data-sno=3 id="keyword-a3"><i data-sno=3 id="keyword-icon3" class="fas fa-check"></i>　바</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=4><a href="javascript:void(0);" data-sno=4 id="keyword-a4"><i data-sno=4 id="keyword-icon4" class="fas fa-check"></i>　레스토랑</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=5><a href="javascript:void(0);" data-sno=5 id="keyword-a5"><i data-sno=5 id="keyword-icon5" class="fas fa-check"></i>　복합문화공간</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=6><a href="javascript:void(0);" data-sno=6 id="keyword-a6"><i data-sno=6 id="keyword-icon6" class="fas fa-check"></i>　코스메틱</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=7><a href="javascript:void(0);" data-sno=7 id="keyword-a7"><i data-sno=7 id="keyword-icon7" class="fas fa-check"></i>　디저트</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=8><a href="javascript:void(0);" data-sno=8 id="keyword-a8"><i data-sno=8 id="keyword-icon8" class="fas fa-check"></i>　액세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=9><a href="javascript:void(0);" data-sno=9 id="keyword-a9"><i data-sno=9 id="keyword-icon9" class="fas fa-check"></i>　옷</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=10><a href="javascript:void(0);" data-sno=10 id="keyword-a10"><i data-sno=10 id="keyword-icon10" class="fas fa-check"></i>　DIY</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=11><a href="javascript:void(0);" data-sno=11 id="keyword-a11"><i data-sno=11 id="keyword-icon11" class="fas fa-check"></i>　소품</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=12><a href="javascript:void(0);" data-sno=12 id="keyword-a12"><i data-sno=12 id="keyword-icon12" class="fas fa-check"></i>　종로</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=13><a href="javascript:void(0);" data-sno=13 id="keyword-a13"><i data-sno=13 id="keyword-icon13" class="fas fa-check"></i>　홍대</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=14><a href="javascript:void(0);" data-sno=14 id="keyword-a14"><i data-sno=14 id="keyword-icon14" class="fas fa-check"></i>　강남</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=15><a href="javascript:void(0);" data-sno=15 id="keyword-a15"><i data-sno=15 id="keyword-icon15" class="fas fa-check"></i>　대학로</a></span></li>
					</ul>
					</div>
				</div>
			</div>
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
	   					<td class="td-prog">
   						<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp2.png"></li>
	   						<li><h4>추가정보입력</h4></li>
    					</ul>
	   					</td>
	   					<td class="td-prog" style="background-color:yellow">
	   					<ul class="ul-progress">
	    					<li><img class="img-progress" src="resources/images/signUp/signUp3.png"></li>
	   						<li><h4>회원가입완료</h4></li>
    					</ul>
	   					</td>
	   				</tr>
	   			</table>
	   			<h3>회원가입완료</h3><hr class="progressLine">
	   		</div>
			<div class="signEnd">
				<h4>회원가입이 완료되었습니다!</h4>
				<h4>WOWFLEE를 통해 계약을 진행하려면 제안서가 필요합니다!</h4>
				<h4>지금 제안서를 쓰러가시겠습니까?</h4>
				<button id="btnGoProposal" type="button">제안서쓰러가기</button>
			</div>
			<div>
				<img class="signEndLogo" src="resources/images/logo.png">
			</div>
		</div>
	</div>	
	<footer class="site-footer">
		<div class="main-footer">
			<div class="footerDiv">
				<img src="resources/images/logo.png">
				<span>WOWFLEE는 모든 상업관계자 분들을 응원합니다.</span>
				<div class="footerNav">
					<a>공지사항</a>
					<a>1:1문의</a>
					<a>이용약관</a>
					<a>서비스정보</a>
				</div>
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



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안서 관리</title>
	<link rel="stylesheet" href="resources/jqueryui/jquery-ui.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
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
	</div>
	<div id="notice" class="notice">
		<div class="notice-header">
			<font class="notice-name">알림</font>
		</div>
		
	</div>
</header>
<div class="wrap">     
    <div class="main-content" id="main-content">
		<div class="proposal">
	    	<div class="proposal-header">
	   			<h3>제안서관리</h3>
	   			<div class="proposal-explain">
	   				<ul>
	   					<li><h5>제안서는 최대 5개까지 등록할 수 있습니다.</h5></li>
	   					<li><h5>계약요청 후 제안서의 내용을 수정해도 요청한 제안서에는 반영되지 않습니다.</h5></li>
	   					<li><h5>내가 쓴 글에서 제안서를 이용하여 공고문을 작성할 수 있습니다.</h5></li>
	   				</ul>
	   			</div>
	   		</div>
			<div class="proposalList">
				<button class="btnRegistProposal" id="btnRegistProposal">제안서 작성 <i class="fas fa-chevron-right"></i></button>
				<div class="proposalDiv"> 
				<table id="proposalTable" class="proposalTable"> 
					<tr>
						<th class="proposal-td-1">제안서 제목</th>
						<th class="proposal-td-2">최종 수정일</th>
						<th class="proposal-td-3">관리</th>
					</tr>
					<c:forEach var="list" items="${listProposal}">
						<tr class="proposal-tr">
							<td class="proposal-td-1"><a data-sno="${list.proposalnum}" id="proposal${list.proposalnum}" class="goProposalDetail" href="#goProposalDetail?proposalnum=${list.proposalnum}">${list.title}</a></td>
							<td class="proposal-td-1">${list.indate}</td>
							<td class="td-control"><button data-sno="${list.proposalnum}" class="udtProposal" id="udtProposal${list.proposalnum}">수정</button><button data-sno="${list.proposalnum}" class="delProposal" id="deleteProposal${list.proposalnum}">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		
		<div id="modal-proposal" class="modal">
    		<div class="modal-content">
			<span class="close">&times;</span> 
				<div id="modal-proposalContent" class="modal-proposalContent">
					
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
	<script src="resources/jqueryui/jquery-ui.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>



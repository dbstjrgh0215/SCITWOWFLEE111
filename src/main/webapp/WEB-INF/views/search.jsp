<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>WOWFLEE</title>
	
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
                <li><a href="javascript:void(0);" id="goSpace">공간보기</a></li>
                <li><a href="javascript:void(0);" id="goSeller">셀러보기</a></li>
                <li><a href="javascript:void(0);" id="goProduct">판매상품</a></li>
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
</header>
<div class="wrap">
    <div class="main-content" id="main-content">
	<div class="searchPage">
		<div class="searchPageHeader">
		</div>
		<div class="searchPageContent">
			<div class="searchPageContentHeader">
				<input type="hidden" id="text" value="${text}">
				<h2>${text}(으)로 검색한 결과 ${fn:length(searchList)}건을 검색하였습니다.</h2>
				<div class="searchHeaderWrap">
					<div class="searchHeader">
						<form class="searchForm2">
							<input type="text" id="searchText2" class="searchText" placeholder="키워드를 검색해보세요.">
							<a class="searchIcon" href="javascript:void(0);" id="goSearch2"><i class="fas fa-search"></i></a>
						</form>
						<div class="searchBtn">
							<a class="search-map" id="searchMap" href="javascript:void(0);"><i class="fas fa-map-marker-alt"></i> 지도</a>
							<a class="search-Filter" id="searchFilter2" href="javascript:void(0);"><i class="fas fa-list"></i> 필터</a>
						</div>
					</div>
				</div>
			</div>
			<div class="searchResultList">
				<c:forEach var="search" items="${searchList}">
	  			<article class="box_search">
	  				<div class="inner" data-sno="${search.searchNum}">
	  					<c:if test="${search.membertype=='공간제공자'}">
	  					<a href="goSpaceDetail?boardnum=${search.boardnum}">
	  					</c:if>
	  					<c:if test="${search.membertype=='셀러'}">
	  					<a href="goSellerDetail?boardnum=${search.boardnum}">
	  					</c:if>
		  					<div class="img_border">
		  						<div class="img_area" data-sno="${search.searchNum}" id="img_area${search.searchNum}">
		  							<ul class="board-ul" id="board-ul${search.searchNum}">
		  								<li class="board-li"><c:if test="${!empty search.image1}"><img class="img_area_image" src="resources/images/userImage/${search.id}/board/${search.title}/${search.image1}"></c:if></li>
		  								<li class="board-li"><c:if test="${!empty search.image2}"><img class="img_area_image" src="resources/images/userImage/${search.id}/board/${search.title}/${search.image2}"></c:if></li>
		  								<li class="board-li"><c:if test="${!empty search.image3}"><img class="img_area_image" src="resources/images/userImage/${search.id}/board/${search.title}/${search.image3}"></c:if></li>
		  							</ul>
		  						</div>
		  						<div class="board-img-slider" data-sno="${search.searchNum}" id="board-img-slider${search.searchNum}">
		  							<a href="javascript:void(0);" data-sno="${search.searchNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${search.searchNum}" ><i class="fas fa-chevron-left"></i></button></a>
		  							<a href="javascript:void(0);" data-sno="${search.searchNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${search.searchNum}" ><i class="fas fa-chevron-right"></i></button></a>
					    		</div>
		  					</div>
	  						<div class="info_area">
	  							<h4>${search.title}</h4>
	  						</div>
	  					</a>
						<div class="tag_area">
							<h5>키워드
							<a href="javascript:void(0);"><c:if test="${!empty search.keyword1}"><span>#${search.keyword1}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty search.keyword2}"><span>#${search.keyword2}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty search.keyword3}"><span>#${search.keyword3}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty search.keyword4}"><span>#${search.keyword4}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty search.keyword5}"><span>#${search.keyword5}</span></c:if></a></h5>
						</div>
	  				</div>
	  			</article>
	  			</c:forEach>
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
</html>
   		

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.name}</title>
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
    <div class="proposalDetail">
		<div class="proposalDetailDiv">
			<div class="divHeader">
				<h3>제안서정보</h3><hr>
			</div>
			<table class="proposalDetailTable">
				<tr>
					<td class="td-1"><h4>제안서 제목</h4></td>
					<td class="td-2"><h4>${udtProposal.title}</h4></td>
						</tr>
			<tr>
				<td class="td-1"><h4>키워드</h4></td>
				<td class="keywordDetail"><span class="keywordSpan">#${contentDetail[0].keyword1}</span> 
				<c:if test="${!empty contentDetail[0].keyword2}"><span class="keywordSpan">#${contentDetail[0].keyword2}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword3}"><span class="keywordSpan">#${contentDetail[0].keyword3}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword4}"><span class="keywordSpan">#${contentDetail[0].keyword4}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword5}"><span class="keywordSpan">#${contentDetail[0].keyword5}</span></c:if>
			</tr>
			<tr>
				<td class="td-1"><h4>간략한 소개</h4></td>
				<td class="td-2"><h4>${udtProposal.comments}</h4></td>
			</tr>
					</table><hr>
				</div>
				<c:if test="${sessionMember.membertype=='셀러'}">
			<div class="seller-ProposalDetail">
				<div class="divHeader">
					<h3>셀러 추가 정보</h3><hr>
				</div>
				<table>
				<tr>
					<td class="td-1"><h4>물품이름</h4></td>
					<td class="td-2"><h4>${udtProposal.name}</h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>물품분류</h4></td>
				<td class="td-2"><h4>${contentDetail[0].type1} 
				<c:if test="${!empty contentDetail[0].type2}">,${contentDetail[0].type2}</c:if>
				<c:if test="${!empty contentDetail[0].type3}">,${contentDetail[0].type3}</c:if>
				<c:if test="${!empty contentDetail[0].type4}">,${contentDetail[0].type4}</c:if>
				<c:if test="${!empty contentDetail[0].type5}">,${contentDetail[0].type5}</c:if></h4></td>
				</tr>
				<tr>
	    			<td class="td-1"><h4>물품사진</h4></td>
	    			<td class="td-2">
	    				<div class="proposal-image">
	    					<div class="proposal-image1"><c:if test="${!empty contentDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if></div>
	    					<div class="proposal-image2"><c:if test="${!empty contentDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if></div>
	    					<div class="proposal-image3"><c:if test="${!empty contentDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if></div>
	    				</div>
	   				</td>
	   			</tr>
				<tr>
					<td class="td-1"><h4>기대가격</h4></td>
					<td class="td-2"><h4>${udtProposal.price}원</h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>현재재고</h4></td>
					<td class="td-2"><h4>${udtProposal.stock}개</h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>계약기간</h4></td>
					<td class="td-2"><h4>${contentDetail[0].contractPeriod1} 
					<c:if test="${!empty contentDetail[0].contractPeriod2}">,${contentDetail[0].contractPeriod2}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod3}">,${contentDetail[0].contractPeriod3}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod4}">,${contentDetail[0].contractPeriod4}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod5}">,${contentDetail[0].contractPeriod5}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod6}">,${contentDetail[0].contractPeriod6}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod7}">,${contentDetail[0].contractPeriod7}</c:if></h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>주의사항</h4></td>
					<td class="td-2"><h4>1. ${contentDetail[0].precaution1}</h4> 
				<c:if test="${!empty contentDetail[0].precaution2}"><h4>2. ${contentDetail[0].precaution2}</h4></c:if>
				<c:if test="${!empty contentDetail[0].precaution3}"><h4>3. ${contentDetail[0].precaution3}</h4></c:if>
				<c:if test="${!empty contentDetail[0].precaution4}"><h4>4. ${contentDetail[0].precaution4}</h4></c:if>
				<c:if test="${!empty contentDetail[0].precaution5}"><h4>5. ${contentDetail[0].precaution5}</h4></c:if></td>
				</tr>
				</table><hr>
			</div>
			</c:if>
			<c:if test="${sessionMember.membertype=='공간제공자'}">
			<div class="seller-ProposalDetail">
				<div class="divHeader">
					<h3>공간제공자 추가 정보</h3><hr>
				</div>
				<table>
				<tr>
					<td class="td-1"><h4>공간분류</h4></td>
				<td class="td-2"><h4>${contentDetail[0].type1} 
				<c:if test="${!empty contentDetail[0].type2}">,${contentDetail[0].type2}</c:if>
				<c:if test="${!empty contentDetail[0].type3}">,${contentDetail[0].type3}</c:if>
				<c:if test="${!empty contentDetail[0].type4}">,${contentDetail[0].type4}</c:if>
				<c:if test="${!empty contentDetail[0].type5}">,${contentDetail[0].type5}</c:if></h4></td>
				</tr>
				<tr>
	    			<td class="td-1"><h4>공간사진</h4></td>
	    			<td class="td-2">
	    				<div class="proposal-image">
	    					<div class="proposal-image1"><c:if test="${!empty contentDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if></div>
	    					<div class="proposal-image2"><c:if test="${!empty contentDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if></div>
	    					<div class="proposal-image3"><c:if test="${!empty contentDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if></div>
	    				</div>
	   				</td>
	   			</tr>
				<tr>
					<td class="td-1"><h4>주소</h4></td>
					<td class="td-2"><h4>${udtProposal.spaceaddr1}</h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>상세주소</h4></td>
					<td class="td-2"><h4>${udtProposal.spaceaddr2}</h4><input type="hidden" id="latitude"><input type="hidden" id="longitude"></td>
				</tr>
				<tr>
					<td class="td-1"><h4>규모</h4></td>
					<td class="td-2"><h4>${udtProposal.scale}m<sup>2</sup></h4></td>
				</tr>
				<tr>
   					<td><h4>운영시간</h4></td>
   					<td><h4>${contentDetail[0].optime1}${contentDetail[0].optime2}시 ~ ${contentDetail[0].optime3}${contentDetail[0].optime4}시</h4></td>
   				</tr>
   				<tr>
   					<td><h4>휴무일</h4></td>
   					<td>
   					<h4><c:if test="${empty contentDetail[0].offday1}">없음</c:if>
   					<c:if test="${!empty contentDetail[0].offday1}">${contentDetail[0].offday1}</c:if>
   					<c:if test="${!empty contentDetail[0].offday2}">, ${contentDetail[0].offday2}</c:if>
   					<c:if test="${!empty contentDetail[0].offday3}">, ${contentDetail[0].offday3}</c:if>
   					<c:if test="${!empty contentDetail[0].offday4}">, ${contentDetail[0].offday4}</c:if>
   					<c:if test="${!empty contentDetail[0].offday5}">, ${contentDetail[0].offday5}</c:if>
   					<c:if test="${!empty contentDetail[0].offday6}">, ${contentDetail[0].offday6}</c:if>
   					<c:if test="${!empty contentDetail[0].offday7}">, ${contentDetail[0].offday7}</c:if></h4>
   					</td>
   				</tr>
				<tr>
					<td class="td-1"><h4>계약기간</h4></td>
					<td class="td-2"><h4>${contentDetail[0].contractPeriod1} 
					<c:if test="${!empty contentDetail[0].contractPeriod2}">, ${contentDetail[0].contractPeriod2}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod3}">, ${contentDetail[0].contractPeriod3}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod4}">, ${contentDetail[0].contractPeriod4}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod5}">, ${contentDetail[0].contractPeriod5}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod6}">, ${contentDetail[0].contractPeriod6}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod7}">, ${contentDetail[0].contractPeriod7}</c:if></h4></td>
				</tr>
				<tr>
					<td class="td-1"><h4>주의사항</h4></td>
					<td class="td-2"><h4>${udtProposal.precaution}</h4></td>
				</tr>
				</table><hr>
				</div>
				</c:if>
			<div class="proposalBtn">
				<button data-sno="${udtProposal.proposalnum}" class="udtProposal" id="udtProposal${udtProposal.proposalnum}">수정</button>
				<button data-sno="${udtProposal.proposalnum}" class="delProposal" id="udtProposal${udtProposal.proposalnum}">삭제</button>
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
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
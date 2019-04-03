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
					<td class="td-2"><h4>${udtProposal.precaution}</h4></td>
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
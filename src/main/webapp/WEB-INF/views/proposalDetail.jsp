<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.name}</title>
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
<header class="site-header">
	<div class="main-header">
		<div class="logo">
			<img src="resources/images/logo.png">
			<a href="updateHome">WOWFLEE</a>
		</div>
		<div class="btn-header">
	        <button id="btnSearchM"><i class="fas fa-search"></i></button>
	        <button id="btnNotice"><i class="fas fa-bell"></i></button>
	        <c:if test="${!empty cntNewNotice&&cntNewNotice!=0}">
	        	<span class="cntNewNotice">${cntNewNotice}</span>
	        </c:if>
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
    <div class="proposalDetail">
		<div class="proposalDetailDiv">
			<div class="divHeader">
				<h4>제안서정보</h4>
			</div>
			<table class="proposalDetailTable">
				<tr>
					<td class="td-1"><h5>제안서 제목</h5></td>
					<td class="td-2"><h5>${udtProposal.title}</h5></td>
						</tr>
			<tr>
				<td class="td-1"><h5>키워드</h5></td>
				<td class="keywordDetail"><span class="keywordSpan">#${contentDetail[0].keyword1}</span> 
				<c:if test="${!empty contentDetail[0].keyword2}"><span class="keywordSpan">#${contentDetail[0].keyword2}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword3}"><span class="keywordSpan">#${contentDetail[0].keyword3}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword4}"><span class="keywordSpan">#${contentDetail[0].keyword4}</span></c:if>
				<c:if test="${!empty contentDetail[0].keyword5}"><span class="keywordSpan">#${contentDetail[0].keyword5}</span></c:if>
			</tr>
			<tr>
				<td class="td-1"><h5>간략한 소개</h5></td>
				<td class="td-2"><h5>${udtProposal.comments}</h5></td>
			</tr>
					</table><hr>
				</div>
				<c:if test="${sessionMember.membertype=='셀러'}">
			<div class="seller-ProposalDetail">
				<div class="divHeader">
					<h4>셀러 추가 정보</h4>
				</div>
				<table>
				<tr>
					<td class="td-1"><h5>물품이름</h5></td>
					<td class="td-2"><h5>${udtProposal.name}</h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>물품분류</h5></td>
				<td class="td-2"><h5>${contentDetail[0].type1} 
				<c:if test="${!empty contentDetail[0].type2}">,${contentDetail[0].type2}</c:if>
				<c:if test="${!empty contentDetail[0].type3}">,${contentDetail[0].type3}</c:if>
				<c:if test="${!empty contentDetail[0].type4}">,${contentDetail[0].type4}</c:if>
				<c:if test="${!empty contentDetail[0].type5}">,${contentDetail[0].type5}</c:if></h5></td>
				</tr>
				<tr>
	    			<td class="td-1"><h5>물품사진</h5></td>
	    			<td class="td-2">
	    				<div class="proposal-image">
	    					<div class="proposal-image1"><c:if test="${!empty contentDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if></div>
	    					<div class="proposal-image2"><c:if test="${!empty contentDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if></div>
	    					<div class="proposal-image3"><c:if test="${!empty contentDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if></div>
	    				</div>
	   				</td>
	   			</tr>
				<tr>
					<td class="td-1"><h5>기대가격</h5></td>
					<td class="td-2"><h5>${udtProposal.price}원</h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>현재재고</h5></td>
					<td class="td-2"><h5>${udtProposal.stock}개</h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>계약기간</h5></td>
					<td class="td-2"><h5>${contentDetail[0].contractPeriod1} 
					<c:if test="${!empty contentDetail[0].contractPeriod2}">,${contentDetail[0].contractPeriod2}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod3}">,${contentDetail[0].contractPeriod3}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod4}">,${contentDetail[0].contractPeriod4}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod5}">,${contentDetail[0].contractPeriod5}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod6}">,${contentDetail[0].contractPeriod6}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod7}">,${contentDetail[0].contractPeriod7}</c:if></h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>주의사항</h5></td>
					<td class="td-2"><h5>1. ${contentDetail[0].precaution1}</h5> 
				<c:if test="${!empty contentDetail[0].precaution2}"><h5>2. ${contentDetail[0].precaution2}</h5></c:if>
				<c:if test="${!empty contentDetail[0].precaution3}"><h5>3. ${contentDetail[0].precaution3}</h5></c:if>
				<c:if test="${!empty contentDetail[0].precaution4}"><h5>4. ${contentDetail[0].precaution4}</h5></c:if>
				<c:if test="${!empty contentDetail[0].precaution5}"><h5>5. ${contentDetail[0].precaution5}</h5></c:if></td>
				</tr>
				</table>
			</div>
			</c:if>
			<c:if test="${sessionMember.membertype=='공간제공자'}">
			<div class="seller-ProposalDetail">
				<div class="divHeader">
					<h4>공간제공자 추가 정보</h4>
				</div>
				<table>
				<tr>
					<td class="td-1"><h5>공간분류</h5></td>
				<td class="td-2"><h5>${contentDetail[0].type1} 
				<c:if test="${!empty contentDetail[0].type2}">,${contentDetail[0].type2}</c:if>
				<c:if test="${!empty contentDetail[0].type3}">,${contentDetail[0].type3}</c:if>
				<c:if test="${!empty contentDetail[0].type4}">,${contentDetail[0].type4}</c:if>
				<c:if test="${!empty contentDetail[0].type5}">,${contentDetail[0].type5}</c:if></h5></td>
				</tr>
				<tr>
	    			<td class="td-1"><h5>공간사진</h5></td>
	    			<td class="td-2">
	    				<div class="proposal-image">
	    					<div class="proposal-image1"><c:if test="${!empty contentDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if></div>
	    					<div class="proposal-image2"><c:if test="${!empty contentDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if></div>
	    					<div class="proposal-image3"><c:if test="${!empty contentDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${udtProposal.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if></div>
	    				</div>
	   				</td>
	   			</tr>
				<tr>
					<td class="td-1"><h5>주소</h5></td>
					<td class="td-2"><h5>${udtProposal.spaceaddr1}</h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>상세주소</h5></td>
					<td class="td-2"><h5>${udtProposal.spaceaddr2}</h5><input type="hidden" id="latitude"><input type="hidden" id="longitude"></td>
				</tr>
				<tr>
					<td class="td-1"><h5>규모</h5></td>
					<td class="td-2"><h5>${udtProposal.scale}m<sup>2</sup></h5></td>
				</tr>
				<tr>
   					<td><h5>운영시간</h5></td>
   					<td><h5>${contentDetail[0].optime1}${contentDetail[0].optime2}시 ~ ${contentDetail[0].optime3}${contentDetail[0].optime4}시</h5></td>
   				</tr>
   				<tr>
   					<td><h5>휴무일</h5></td>
   					<td>
   					<h5><c:if test="${empty contentDetail[0].offday1}">없음</c:if>
   					<c:if test="${!empty contentDetail[0].offday1}">${contentDetail[0].offday1}</c:if>
   					<c:if test="${!empty contentDetail[0].offday2}">, ${contentDetail[0].offday2}</c:if>
   					<c:if test="${!empty contentDetail[0].offday3}">, ${contentDetail[0].offday3}</c:if>
   					<c:if test="${!empty contentDetail[0].offday4}">, ${contentDetail[0].offday4}</c:if>
   					<c:if test="${!empty contentDetail[0].offday5}">, ${contentDetail[0].offday5}</c:if>
   					<c:if test="${!empty contentDetail[0].offday6}">, ${contentDetail[0].offday6}</c:if>
   					<c:if test="${!empty contentDetail[0].offday7}">, ${contentDetail[0].offday7}</c:if></h5>
   					</td>
   				</tr>
				<tr>
					<td class="td-1"><h5>계약기간</h5></td>
					<td class="td-2"><h5>${contentDetail[0].contractPeriod1} 
					<c:if test="${!empty contentDetail[0].contractPeriod2}">, ${contentDetail[0].contractPeriod2}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod3}">, ${contentDetail[0].contractPeriod3}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod4}">, ${contentDetail[0].contractPeriod4}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod5}">, ${contentDetail[0].contractPeriod5}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod6}">, ${contentDetail[0].contractPeriod6}</c:if>
					<c:if test="${!empty contentDetail[0].contractPeriod7}">, ${contentDetail[0].contractPeriod7}</c:if></h5></td>
				</tr>
				<tr>
					<td class="td-1"><h5>주의사항</h5></td>
					<td class="td-2"><h5>1. ${contentDetail[0].precaution1}</h5> 
					<c:if test="${!empty contentDetail[0].precaution2}"><h5>2. ${contentDetail[0].precaution2}</h5></c:if>
					<c:if test="${!empty contentDetail[0].precaution3}"><h5>3. ${contentDetail[0].precaution3}</h5></c:if>
					<c:if test="${!empty contentDetail[0].precaution4}"><h5>4. ${contentDetail[0].precaution4}</h5></c:if>
					<c:if test="${!empty contentDetail[0].precaution5}"><h5>5. ${contentDetail[0].precaution5}</h5></c:if></td>
				</tr>
				</table>
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
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안서 작성</title>
	<link rel="stylesheet" href="resources/jqueryui/jquery-ui.css">
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
    	<div class="proposal-write">
    	<c:if test="${empty clickNo}">
    	<form action="insertProposal" method="post" id="proposalWriteForm" enctype="multipart/form-data">
    	</c:if>
    	<c:if test="${!empty update}">
    	<form action="updateProposal" method="post" id="proposalWriteForm" enctype="multipart/form-data">
    		<input type="hidden" name="clickNo" value="${clickNo}">
    	</c:if>
			<input type="hidden" id="form_id" name="id" value="${sessionMember.id}">
			<input type="hidden" id="form_membertype" name="membertype" value="${sessionMember.membertype}">
			<input type="hidden" id="form_title" name="title" value="">
			<input type="hidden" id="form_comments" name="comments" value="">
			<input type="hidden" id="form_precaution" name="precaution" value="">
			<input type="hidden" id="form_offday" name="offday" value="">
			<c:if test="${sessionMember.membertype=='셀러'}">
						<input type="hidden" id="form_keyword" name="keyword" value="${sessionProd.keyword}">
			<input type="hidden" id="form_name" name="name" value="${sessionType.sellername}">
			<input type="hidden" id="form_type" name="type" value="${sessionProd.prod_type}">
			</c:if>
			<c:if test="${sessionMember.membertype=='공간제공자'}">
			<input type="hidden" id="form_keyword" name="keyword" value="${sessionType.keyword}">
			<input type="hidden" id="form_name" name="name" value="${sessionType.spacename}">
			<input type="hidden" id="form_type" name="type" value="${sessionType.space_type}">
			<input type="hidden" id="form_spaceaddr1" name="spaceaddr1" value="${sessionType.spaceaddr1}">
			<input type="hidden" id="form_spaceaddr2" name="spaceaddr2" value="${sessionType.spaceaddr2}">
			<input type="hidden" id="form_latitude" name="latitude" value="${sessionType.latitude}">
			<input type="hidden" id="form_longitude" name="longitude" value="${sessionType.longitude}">
			</c:if>
			<input type="hidden" id="form_contractPeriod" name="contractperiod" value="">
			<input type="hidden" id="form_price" name="price" value=0>
			<input type="hidden" id="form_stock" name="stock" value=0>
			<input type="hidden" id="form_optime" name="optime" value="">
			<input type="hidden" id="form_scale" name="scale" value=0>
			<div class="proposalWriteContent">
				<h4>제안서 제목</h4><br>
				<span class="inputNorm"><input type="text" id="title" value="${udtProposal.title}"></span>
				<div id="titleCheck" class="titleCheck">
				</div>
				<c:if test="${sessionMember.membertype=='공간제공자'}">
				<h4>공간이름</h4><br>
				<span class="inputNorm"><input type="text" id="name" value="${sessionType.spacename}"></span>
				<h4>공간소개</h4><br>
				<textarea rows="10" cols="100" id="comments">${sessionType.comments}</textarea><br>
				<h4>공간분류</h4><br>
				<span class="inputNorm"><input type="text" id="type" value=""></span>
			   	<button id="typeRegist" type="button">등록</button><br>
			   	<table id="typeTable" class="typeTable-bw">
			   	<tr id="typeSelected">
			 		<td class="td-2" colspan="2">
			 		<input type="hidden" id="typeContent1" value="${contentDetail[0].type1}">
			 		<input type="hidden" id="typeContent2" value="${contentDetail[0].type2}"><input type="hidden" id="typeContent4" value="${contentDetail[0].type4}">
			 		<input type="hidden" id="typeContent3" value="${contentDetail[0].type3}"><input type="hidden" id="typeContent5" value="${contentDetail[0].type5}">
			 		</td>
			 	</tr>
			 	</table>
				<h4>키워드</h4></br>
			   	<span class="inputNorm"><input type="text" id="keyword" value=""></span>
			   	<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button><br>
			 	<table id="keywordTable" class="keywordTable-bw">
			 	<tr id="keywordFilter">
			   						
			   	</tr>
			   	<tr id="keywordSelected">
			 		<td class="td-1"><h4>나의 키워드</h4><p>(<font id="keywordCount">0</font> / 5)</p></td>
			 		<td class="td-2"><input type="hidden" id="keywordContent1" value="${contentDetail[0].keyword1}">
			 		<input type="hidden" id="keywordContent2" value="${contentDetail[0].keyword2}"><input type="hidden" id="keywordContent4" value="${contentDetail[0].keyword4}">
			 		<input type="hidden" id="keywordContent3" value="${contentDetail[0].keyword3}"><input type="hidden" id="keywordContent5" value="${contentDetail[0].keyword5}"></td>
			 	</tr>
			 	</table>
				<h4>사진</h4></br>
				<div>
				<div class="input_wrap">
					<a href="javascript:void(0);" id="fileUpload" class="my_button">파일업로드</a>
					<input type="file" id="image" name="uploadFile" multiple/>
				</div>
				</div> 
			    <div>
			        <div class="imgs_wrap">
			            <c:if test="${!empty contentDetail[0].image1}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if>
			            <c:if test="${!empty contentDetail[0].image2}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if>
			            <c:if test="${!empty contentDetail[0].image3}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if>
			        </div>
			        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
			        <h5>사진파일은 3개까지 등록가능합니다.</h5>
			    </div>
				<h4>운영시간</h4><br>
				<select id="optime1"><option <c:if test="${contentDetail[0].optime1=='오전'}">selected</c:if>>오전</option><option> <c:if test="${contentDetail[0].optime1=='오후'}">selected</c:if>오후</option></select>
				<select id="optime2"><option <c:if test="${contentDetail[0].optime2==1}">selected</c:if>>1</option><option <c:if test="${contentDetail[0].optime2==2}">selected</c:if>>2</option><option <c:if test="${contentDetail[0].optime2==3}">selected</c:if>>3</option><option <c:if test="${contentDetail[0].optime2==4}">selected</c:if>>4</option><option <c:if test="${contentDetail[0].optime2==5}">selected</c:if>>5</option><option <c:if test="${contentDetail[0].optime2==6}">selected</c:if>>6</option><option <c:if test="${contentDetail[0].optime2==7}">selected</c:if>>7</option><option <c:if test="${contentDetail[0].optime2==8}">selected</c:if>>8</option><option <c:if test="${contentDetail[0].optime2==9}">selected</c:if>>9</option><option <c:if test="${contentDetail[0].optime2==10}">selected</c:if>>10</option><option <c:if test="${contentDetail[0].optime2==11}">selected</c:if>>11</option><option <c:if test="${contentDetail[0].optime2==12}">selected</c:if>>12</option></select>시 ~ 
				<select id="optime3"><option <c:if test="${contentDetail[0].optime3=='오전'}">selected</c:if>>오전</option><option <c:if test="${contentDetail[0].optime3=='오후'}">selected</c:if>>오후</option></select>
				<select id="optime4"><option <c:if test="${contentDetail[0].optime4==1}">selected</c:if>>1</option><option <c:if test="${contentDetail[0].optime4==2}">selected</c:if>>2</option><option <c:if test="${contentDetail[0].optime4==3}">selected</c:if>>3</option><option <c:if test="${contentDetail[0].optime4==4}">selected</c:if>>4</option><option <c:if test="${contentDetail[0].optime4==5}">selected</c:if>>5</option><option <c:if test="${contentDetail[0].optime4==6}">selected</c:if>>6</option><option <c:if test="${contentDetail[0].optime4==7}">selected</c:if>>7</option><option <c:if test="${contentDetail[0].optime4==8}">selected</c:if>>8</option><option <c:if test="${contentDetail[0].optime4==9}">selected</c:if>>9</option><option <c:if test="${contentDetail[0].optime4==10}">selected</c:if>>10</option><option <c:if test="${contentDetail[0].optime4==11}">selected</c:if>>11</option><option <c:if test="${contentDetail[0].optime4==12}">selected</c:if>>12</option></select>시<br>
				<h4>규모</h4><br>
				<span class="inputNorm"><input type="number" id="scale" step="any" value="${udtProposal.scale}"></span><br>
				<h4>휴무일</h4><font>휴무일이 없는 경우 선택하지 않음</font><br>
				<div class="offday">
				<ul class="ul-offday">
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=1 id="offday1" class="offday-a"><i data-sno=1 id="offday-icon1" class="fas fa-check"></i>　월</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=2 id="offday2" class="offday-a"><i data-sno=2 id="offday-icon2" class="fas fa-check"></i>　화</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=3 id="offday3" class="offday-a"><i data-sno=3 id="offday-icon3" class="fas fa-check"></i>　수</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=4 id="offday4" class="offday-a"><i data-sno=4 id="offday-icon4" class="fas fa-check"></i>　목</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=5 id="offday5" class="offday-a"><i data-sno=5 id="offday-icon5" class="fas fa-check"></i>　금</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=6 id="offday6" class="offday-a"><i data-sno=6 id="offday-icon6" class="fas fa-check"></i>　토</a></span></li>
					<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=7 id="offday7" class="offday-a"><i data-sno=7 id="offday-icon7" class="fas fa-check"></i>　일</a></span></li>
				</ul>
				</div>
				<div id="offdaySelected">
					<input type="hidden" id="offdayContent1" value="">
					<input type="hidden" id="offdayContent2" value=""><input type="hidden" id="offdayContent4" value="">
					<input type="hidden" id="offdayContent3" value=""><input type="hidden" id="offdayContent5" value="">
					<input type="hidden" id="offdayContent6" value=""><input type="hidden" id="offdayContent7" value="">
				</div>
				<br><h4>계약기간</h4><font>계약기간은 여러개 선택 가능</font><br>
				<div class="contractPeriod">
				<ul class="ul-contractPeriod">
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=1 id="contractPeriod1" class="contractPeriod-a"><i data-sno=1 id="contractPeriod-icon1" class="fas fa-check"></i>　1주</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=2 id="contractPeriod2" class="contractPeriod-a"><i data-sno=2 id="contractPeriod-icon2" class="fas fa-check"></i>　2주</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=3 id="contractPeriod3" class="contractPeriod-a"><i data-sno=3 id="contractPeriod-icon3" class="fas fa-check"></i>　1개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=4 id="contractPeriod4" class="contractPeriod-a"><i data-sno=4 id="contractPeriod-icon4" class="fas fa-check"></i>　2개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=5 id="contractPeriod5" class="contractPeriod-a"><i data-sno=5 id="contractPeriod-icon5" class="fas fa-check"></i>　3개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=6 id="contractPeriod6" class="contractPeriod-a"><i data-sno=6 id="contractPeriod-icon6" class="fas fa-check"></i>　6개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=7 id="contractPeriod7" class="contractPeriod-a"><i data-sno=7 id="contractPeriod-icon7" class="fas fa-check"></i>　1년</a></span></li>
				</ul>
				</div>
				<div id="contractPeriodSelected">
					<input type="hidden" id="contractPeriodContent1" value="${contentDetail[0].contractPeriod1}">
					<input type="hidden" id="contractPeriodContent2" value="${contentDetail[0].contractPeriod2}"><input type="hidden" id="contractPeriodContent4" value="${contentDetail[0].contractPeriod4}">
					<input type="hidden" id="contractPeriodContent3" value="${contentDetail[0].contractPeriod3}"><input type="hidden" id="contractPeriodContent5" value="${contentDetail[0].contractPeriod5}">
					<input type="hidden" id="contractPeriodContent6" value="${contentDetail[0].contractPeriod6}"><input type="hidden" id="contractPeriodContent7" value="${contentDetail[0].contractPeriod7}">
				</div>
				<br><h4>주의사항</h4>
				<div class="precaution">
				<table class="precautionTable">
				<tr>
					<td class="td-precaution1">
					<span class="inputNorm">1. <input type="text" id="precaution1" placeholder="한개이상 작성해야합니다." value="${contentDetail[0].precaution1}"></span><button class="addPrecaution" data-sno="2" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution2">
					<span class="inputNorm">2. <input type="text" id="precaution2" value="${contentDetail[0].precaution2}"></span><button class="addPrecaution" data-sno="3" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution3">
					<span class="inputNorm">3. <input type="text" id="precaution3" value="${contentDetail[0].precaution3}"></span><button class="addPrecaution" data-sno="4" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution4">
					<span class="inputNorm">4. <input type="text" id="precaution4" value="${contentDetail[0].precaution4}"></span><button class="addPrecaution" data-sno="5" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution5">
					<span class="inputNorm">5. <input type="text" id="precaution5" value="${contentDetail[0].precaution5}"></span>
					</td>
				</tr>
				</table>
				</div>
				</c:if>
				<c:if test="${sessionMember.membertype=='셀러'}">
				<h4>셀러이름</h4><br>
				<span class="inputNorm"><input type="text" id="name" value="${sessionType.sellername}"></span>
				<h4>셀러소개</h4><br>
				<textarea rows="10" cols="100" id="comments">${sessionType.comments}</textarea><br>
				<h4>물품분류</h4><br>
				<span class="inputNorm"><input type="text" id="type" value=""></span>
			   	<button id="typeRegist" type="button">등록</button><br>
			   	<table id="typeTable" class="typeTable-bw">
			   	<tr id="typeSelected">
			 		<td class="td-2" colspan="2">
			 		<input type="hidden" id="typeContent1" value="${contentDetail[0].type1}">
			 		<input type="hidden" id="typeContent2" value="${contentDetail[0].type2}"><input type="hidden" id="typeContent4" value="${contentDetail[0].type4}">
			 		<input type="hidden" id="typeContent3" value="${contentDetail[0].type3}"><input type="hidden" id="typeContent5" value="${contentDetail[0].type5}">
			 		</td>
			 	</tr>
			 	</table>
				<h4>키워드</h4></br>
			   	<span class="inputNorm"><input type="text" id="keyword" value=""></span>
			   	<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button><br>
			 	<table id="keywordTable" class="keywordTable-bw">
			 	<tr id="keywordFilter">
			   						
			   	</tr>
			   	<tr id="keywordSelected">
			 		<td class="td-1"><h4>나의 키워드</h4><p>(<font id="keywordCount">0</font> / 5)</p></td>
			 		<td class="td-2"><input type="hidden" id="keywordContent1" value="${contentDetail[0].keyword1}">
			 		<input type="hidden" id="keywordContent2" value="${contentDetail[0].keyword2}"><input type="hidden" id="keywordContent4" value="${contentDetail[0].keyword4}">
			 		<input type="hidden" id="keywordContent3" value="${contentDetail[0].keyword3}"><input type="hidden" id="keywordContent5" value="${contentDetail[0].keyword5}"></td>
			 	</tr>
			 	</table>
			 	<h4>사진</h4></br>
				<div>
				<div class="input_wrap">
					<a href="javascript:void(0);" id="fileUpload" class="my_button">파일업로드</a>
					<input type="file" id="image" name="uploadFile" multiple/>
				</div>
				</div> 
			    <div>
			        <div class="imgs_wrap">
			            <c:if test="${!empty contentDetail[0].image1}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image1}"></c:if>
			            <c:if test="${!empty contentDetail[0].image2}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image2}"></c:if>
			            <c:if test="${!empty contentDetail[0].image3}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${udtProposal.title}/${contentDetail[0].image3}"></c:if>
			        </div>
			        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
			        <h5>사진파일은 3개까지 등록가능합니다.</h5>
			    </div>
				<h4>희망가격</h4><br>
				<span class="inputNorm"><input type="number" id="price" value="${udtProposal.price}">원</span><br>
				<h4>현재재고상태</h4><br>
				<span class="inputNorm"><input type="number" id="stock" value="${udtProposal.stock}">개</span><br>
				<h4>계약기간</h4><font>계약기간은 여러개 선택 가능</font><br>
				<div class="contractPeriod">
				<ul class="ul-contractPeriod">
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=1 id="contractPeriod1" class="contractPeriod-a"><i data-sno=1 id="contractPeriod-icon1" class="fas fa-check"></i>　1주</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=2 id="contractPeriod2" class="contractPeriod-a"><i data-sno=2 id="contractPeriod-icon2" class="fas fa-check"></i>　2주</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=3 id="contractPeriod3" class="contractPeriod-a"><i data-sno=3 id="contractPeriod-icon3" class="fas fa-check"></i>　1개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=4 id="contractPeriod4" class="contractPeriod-a"><i data-sno=4 id="contractPeriod-icon4" class="fas fa-check"></i>　2개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=5 id="contractPeriod5" class="contractPeriod-a"><i data-sno=5 id="contractPeriod-icon5" class="fas fa-check"></i>　3개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=6 id="contractPeriod6" class="contractPeriod-a"><i data-sno=6 id="contractPeriod-icon6" class="fas fa-check"></i>　6개월</a></span></li>
					<li class="li-contractPeriod"><span class="span-contractPeriod"><a href="javascript:void(0);" data-sno=7 id="contractPeriod7" class="contractPeriod-a"><i data-sno=7 id="contractPeriod-icon7" class="fas fa-check"></i>　1년</a></span></li>
				</ul>
				</div>
				<div id="contractPeriodSelected"> 
					<input type="hidden" id="contractPeriodContent1" value="${contentDetail[0].contractPeriod1}">
					<input type="hidden" id="contractPeriodContent2" value="${contentDetail[0].contractPeriod2}"><input type="hidden" id="contractPeriodContent4" value="${contentDetail[0].contractPeriod4}">
					<input type="hidden" id="contractPeriodContent3" value="${contentDetail[0].contractPeriod3}"><input type="hidden" id="contractPeriodContent5" value="${contentDetail[0].contractPeriod5}">
					<input type="hidden" id="contractPeriodContent6" value="${contentDetail[0].contractPeriod6}"><input type="hidden" id="contractPeriodContent7" value="${contentDetail[0].contractPeriod7}">
				</div>
				<br><h4>주의사항</h4>
				<div class="precaution">
				<table class="precautionTable">
				<tr>
					<td class="td-precaution1">
					<span class="inputNorm">1. <input type="text" id="precaution1" placeholder="한개이상 작성해야합니다." value="${contentDetail[0].precaution1}"></span><button class="addPrecaution" data-sno="2" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution2">
					<span class="inputNorm">2. <input type="text" id="precaution2" value="${contentDetail[0].precaution2}"></span><button class="addPrecaution" data-sno="3" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution3">
					<span class="inputNorm">3. <input type="text" id="precaution3" value="${contentDetail[0].precaution3}"></span><button class="addPrecaution" data-sno="4" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution4">
					<span class="inputNorm">4. <input type="text" id="precaution4" value="${contentDetail[0].precaution4}"></span><button class="addPrecaution" data-sno="5" type="button">추가</button>
					</td>
				</tr>
				<tr>
					<td class="td-precaution5">
					<span class="inputNorm">5. <input type="text" id="precaution5" value="${contentDetail[0].precaution5}"></span>
					</td>
				</tr>
				</table>
				</div>
				</c:if>
				<c:if test="${empty clickNo}">
				<button class="btnProposalWrite" id="btnProposalWrite">등록</button>
				</c:if>
				<c:if test="${!empty clickNo}">
				<button class="btnProposalWrite" id="btnProposalUpdate">수정</button>
				</c:if>
			</div>
		</form>
    	</div>
	</div>
    <footer class="site-footer">
		<div class="main-footer">
			푸터
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



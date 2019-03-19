<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안서 작성</title>
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
    	<div class="proposalWrite">
    		<div class="memberInfoDiv">
    			<div class="divHeader">
	    			<h3>기본정보</h3><hr>
    			</div>
    			<input type="hidden" id="id" value="${sessionMember.id}">
    			<input type="hidden" id="membertype" value="${sessionMember.membertype}">
   				<table class="memberInfoDivTable">
   					<tr>
   						<td class="td-1"><h4>닉네임</h4></td>
   						<td class="td-2"><h5>${sessionMember.nickname}</h5></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>전화번호</h4></td>
   						<td class="td-2"><h5>${sessionMember.phone}</h5></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>E-MAIL</h4></td>
   						<td class="td-2"><h5>${sessionMember.email}</h5></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>멤버구분</h4></td>
   						<td class="td-2"><h5>${sessionMember.membertype}</h5></td>
   					</tr>
   				</table><hr>
    		</div>
   			<div class="proposalWriteDiv">
   				<div class="divHeader">
   					<h3>제안서작성</h3><hr>
   				</div>
   				<form id="proposalForm" action="insertProposal" method="post" enctype="multipart/form-data">
	   				<input type="hidden" id="form_id" name="id">
	   				<input type="hidden" id="form_title" name="title">
	   				<input type="hidden" id="form_membertype" name="membertype">
	   				<input type="hidden" id="form_keyword" name="keyword">
	   				<input type="hidden" id="form_comments" name="comments">
	   				<input type="hidden" id="form_name" name="name">
	   				<input type="hidden" id="form_type1" name="type1">
	   				<input type="hidden" id="form_type2" name="type2">
	   				<input type="hidden" id="form_type3" name="type3">
	   				<input type="hidden" id="form_price" name="price">
	   				<input type="hidden" id="form_stock" name="stock">
   				<table class="proposalWriteTable">
   					<tr>
   						<td class="td-1"><h4>제안서 제목</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="title"></span></td>
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
   						<td class="td-1"><h4>키워드</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="keyword"></span></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>간략한 소개</h4></td>
						<td class="td-2"><textarea rows="10" cols="50" id="comments"></textarea></td>
					</tr>
   				</table><hr>
	   			</form>
   			</div>
   			<c:if test="${sessionMember.membertype=='셀러'}">
   			<div class="seller-ProposalDiv">
   				<div class="divHeader">
   					<h3>셀러 추가 정보</h3><hr>
   				</div>
   				<table>
   					<tr>
   						<td class="td-1"><h4>물품이름</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="name"></span></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>물품분류</h4></td>
						<td class="td-2"><span class="inputNorm"><select id="type1"><option value="type1">대분류</option></select>
				  		<select id="type2"><option value="type2">중분류</option></select>
				  		<select id="type3"><option value="type3">소분류</option></select></span></td>
					</tr>
   					<tr>
   						<td class="td-1"><h4>기대가격</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="number" id="price"></span></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>현재재고</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="number" id="stock">개</span></td>
   					</tr>
   				</table><hr>
   			</div>
   			</c:if>
   			<c:if test="${sessionMember.membertype=='공간제공자'}">
   			<div class="seller-ProposalDiv">
   				<div class="divHeader">
   					<h3>공간제공자 추가 정보</h3><hr>
   				</div>
   				<table>
   					<tr>
   						<td class="td-1"><h4>운영시간</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="optime"></span></td>
   					</tr>
   					<tr>
   						<td class="td-1"><h4>공간분류</h4></td>
						<td class="td-2"><span class="inputNorm"><select id="type1"><option value="type1">대분류</option></select>
				  		<select id="type2"><option value="type2">중분류</option></select>
				  		<select id="type3"><option value="type3">소분류</option></select></span></td>
					</tr>
   					<tr>
   						<td class="td-1"><h4>규모</h4></td>
   						<td class="td-2"><span class="inputNorm"><input type="text" id="scale"></span></td>
   					</tr>
   					<tr>
						<td class="td-1"><h4>주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="address" placeholder="주소"></span><button onclick="execDaumPostcode()">주소검색</button></td>
					</tr>
					<tr>
						<td class="td-1"><h4>상세주소</h4></td>
						<td class="td-2"><span class="inputNorm"><input type="text" id="detailAddress" placeholder="상세주소"></span><input type="hidden" id="latitude"><input type="hidden" id="longitude"></td>
					</tr>
   				</table><hr>
   			</div>
   			</c:if>
   			<div class="signUpbtn">
   				<button id="btnSaveProposal">임시저장</button>
				<button id="btnWriteProposal">작성완료</button>
			</div>
    	</div>
    
	</div>
</body>
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>


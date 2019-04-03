<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="insertBoard" method="post" id="boardWriteForm" enctype="multipart/form-data">
	<input type="hidden" id="form_id" name="id" value="${selectProposal.id}">
	<input type="hidden" id="form_proposalnum" name="proposalnum" value="${selectProposal.proposalnum}">
	<input type="hidden" id="form_membertype" name="membertype" value="${selectProposal.membertype}">
	<input type="hidden" id="form_title" name="title" value="${selectProposal.title}">
	<input type="hidden" id="form_comments" name="comments" value="${selectProposal.comments}">
	<input type="hidden" id="form_precaution" name="precaution" value="">
	<input type="hidden" id="form_offday" name="offday" value="">
	<input type="hidden" id="form_keyword" name="keyword" value="">
	<input type="hidden" id="form_name" name="name" value="${selectProposal.name}">
	<input type="hidden" id="form_type" name="type" value="${selectProposal.type}">
	<input type="hidden" id="form_type" name="contractperiod" value="${selectProposal.contractperiod}">
	<input type="hidden" id="form_price" name="price" value=0>
	<input type="hidden" id="form_stock" name="stock" value=0>
	<input type="hidden" id="form_optime" name="optime" value="">
	<input type="hidden" id="form_scale" name="scale" value=0>
	<input type="hidden" id="form_spaceaddr1" name="spaceaddr1" value="${selectProposal.spaceaddr1}">
	<input type="hidden" id="form_spaceaddr2" name="spaceaddr2" value="${selectProposal.spaceaddr2}">
	<input type="hidden" id="form_latitude" name="latitude" value="${selectProposal.latitude}">
	<input type="hidden" id="form_longitude" name="longitude" value="${selectProposal.longitude}">
<div class="boardWriteContent">
	<h4>공고문 제목</h4><br>
	<span class="inputNorm"><input type="text" id="title" value="${selectProposal.title}"></span>
	<div id="titleCheck" class="titleCheck"></div>
	<c:if test="${selectProposal.membertype=='공간제공자'}">
	<h4>공간이름</h4><br>
	<span class="inputNorm"><input type="text" id="name" value="${selectProposal.name}"></span>
	<h4>공간소개</h4><br>
	<textarea rows="10" cols="100" id="comments">${selectProposal.comments}</textarea><br>
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
            <c:if test="${!empty contentDetail[0].image1}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image1}"></c:if>
            <c:if test="${!empty contentDetail[0].image2}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image2}"></c:if>
            <c:if test="${!empty contentDetail[0].image3}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image3}"></c:if>
        </div>
        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
        <h5>사진파일은 3개까지 등록가능합니다.</h5>
    </div>
	<h4>이용시간</h4><br>
	<select id="optime1"><option <c:if test="${contentDetail[0].optime1=='오전'}">selected</c:if>>오전</option><option> <c:if test="${contentDetail[0].optime1=='오후'}">selected</c:if>오후</option></select>
	<select id="optime2"><option <c:if test="${contentDetail[0].optime2==1}">selected</c:if>>1</option><option <c:if test="${contentDetail[0].optime2==2}">selected</c:if>>2</option><option <c:if test="${contentDetail[0].optime2==3}">selected</c:if>>3</option><option <c:if test="${contentDetail[0].optime2==4}">selected</c:if>>4</option><option <c:if test="${contentDetail[0].optime2==5}">selected</c:if>>5</option><option <c:if test="${contentDetail[0].optime2==6}">selected</c:if>>6</option><option <c:if test="${contentDetail[0].optime2==7}">selected</c:if>>7</option><option <c:if test="${contentDetail[0].optime2==8}">selected</c:if>>8</option><option <c:if test="${contentDetail[0].optime2==9}">selected</c:if>>9</option><option <c:if test="${contentDetail[0].optime2==10}">selected</c:if>>10</option><option <c:if test="${contentDetail[0].optime2==11}">selected</c:if>>11</option><option <c:if test="${contentDetail[0].optime2==12}">selected</c:if>>12</option></select>시 ~ 
	<select id="optime3"><option <c:if test="${contentDetail[0].optime3=='오전'}">selected</c:if>>오전</option><option <c:if test="${contentDetail[0].optime3=='오후'}">selected</c:if>>오후</option></select>
	<select id="optime4"><option <c:if test="${contentDetail[0].optime4==1}">selected</c:if>>1</option><option <c:if test="${contentDetail[0].optime4==2}">selected</c:if>>2</option><option <c:if test="${contentDetail[0].optime4==3}">selected</c:if>>3</option><option <c:if test="${contentDetail[0].optime4==4}">selected</c:if>>4</option><option <c:if test="${contentDetail[0].optime4==5}">selected</c:if>>5</option><option <c:if test="${contentDetail[0].optime4==6}">selected</c:if>>6</option><option <c:if test="${contentDetail[0].optime4==7}">selected</c:if>>7</option><option <c:if test="${contentDetail[0].optime4==8}">selected</c:if>>8</option><option <c:if test="${contentDetail[0].optime4==9}">selected</c:if>>9</option><option <c:if test="${contentDetail[0].optime4==10}">selected</c:if>>10</option><option <c:if test="${contentDetail[0].optime4==11}">selected</c:if>>11</option><option <c:if test="${contentDetail[0].optime4==12}">selected</c:if>>12</option></select>시<br>
	<h4>규모</h4><br>
	<span class="inputNorm"><input type="number" id="scale" step="any" value="${selectProposal.scale}"></span><br>
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
	<div id="offdaySelected">
		<input type="hidden" id="offdayContent1" value="">
		<input type="hidden" id="offdayContent2" value=""><input type="hidden" id="offdayContent4" value="">
		<input type="hidden" id="offdayContent3" value=""><input type="hidden" id="offdayContent5" value="">
		<input type="hidden" id="offdayContent6" value=""><input type="hidden" id="offdayContent7" value="">
	</div><br>
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
	<br><h4>주의사항</h4><br>
	<textarea rows="10" cols="100" id="precaution">${selectProposal.comments}</textarea><br>
	</c:if>
	<c:if test="${selectProposal.membertype=='셀러'}">
	<h4>셀러이름</h4><br>
	<span class="inputNorm"><input type="text" id="name" value="${selectProposal.name}"></span>
	<h4>셀러소개</h4><br>
	<textarea rows="10" cols="100" id="comments">${selectProposal.comments}</textarea><br>
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
            <c:if test="${!empty contentDetail[0].image1}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image1}"></c:if>
            <c:if test="${!empty contentDetail[0].image2}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image2}"></c:if>
            <c:if test="${!empty contentDetail[0].image3}"><img class="img1" src="resources/images/userImage/${sessionMember.id}/prop/${selectProposal.title}/${contentDetail[0].image3}"></c:if>
        </div>
        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
        <h5>사진파일은 3개까지 등록가능합니다.</h5>
    </div>
	<h4>희망가격</h4><br>
	<span class="inputNorm"><input type="number" id="price" value="${selectProposal.price}">원</span><br>
	<h4>현재재고상태</h4><br>
	<span class="inputNorm"><input type="number" id="stock" value="${selectProposal.stock}">개</span><br>
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
	<br><h4>주의사항</h4><br>
	<textarea rows="10" cols="100" id="precaution">${selectProposal.comments}</textarea><br>
	</c:if>
	<button class="btnBoardWrite" id="btnBoardWrite">등록</button>
</div>
</form>
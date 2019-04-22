<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="r-bSpace">
  		<div class="r-bSpace-header">
  			<h4>추천공간</h4><hr>
  		</div>
  		<div class="r-bSpace-content">
  		<c:forEach var="recommend" items="${recommendSpaceList}">
  			<article class="box_space">
  				<div class="inner" data-sno="${recommend.recommendNum}" >
  					<a href="goSpaceDetail?boardnum=${recommend.boardnum}">
  						<div class="img_border">
	  						<div class="img_area" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  							<ul class="board-ul" id="board-ul${recommend.recommendNum}">
	  								<li class="board-li"><c:if test="${!empty recommend.image1}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image2}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image3}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image3}"></c:if></li>
	  							</ul>
	  						</div>
	  						<div class="board-img-slider" data-sno="${recommend.recommendNum}" id="board-img-slider${recommend.recommendNum}">
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-left"></i></button></a>
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-right"></i></button></a>
				    		</div>
			    		</div>
  						<div class="info_area">
  							<h4>${recommend.title}</h4>
  						</div>
  					</a>
					<div class="tag_area">
						<h5>키워드
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword1}"><span>#${recommend.keyword1}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword2}"><span>#${recommend.keyword2}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword3}"><span>#${recommend.keyword3}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword4}"><span>#${recommend.keyword4}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword5}"><span>#${recommend.keyword5}</span></c:if></a></h5>
					</div>
					<div class="detail_area">
						<h5><i class="fas fa-heart"></i> ${recommend.cntZzim} <i class="fas fa-eye"></i> ${recommend.count} <i class="far fa-comment-dots"></i> ${recommend.cntQna}</h5>
					</div>
  				</div>
  			</article>
  			</c:forEach>
  		</div> 
  	</div>
   	<div class="bspace">
   		
   		<div class="bspace-header"> 
   			<h4>공간목록</h4><hr>
   		</div> 
   		
   		<c:forEach var="space" items="${spaceList}">
  			<article class="box_space">
  				<div class="inner" data-sno="${space.spaceNum}">
  					<a href="goSpaceDetail?boardnum=${space.boardnum}">
  						<div class="img_border">
	  						<div class="img_area" data-sno="${space.spaceNum}" id="img_area${space.spaceNum}">
	  							<ul class="board-ul" id="board-ul${space.spaceNum}">
	  								<li class="board-li"><c:if test="${!empty space.image1}"><img class="img_area_image" src="resources/images/userImage/${space.id}/board/${space.title}/${space.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty space.image2}"><img class="img_area_image" src="resources/images/userImage/${space.id}/board/${space.title}/${space.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty space.image3}"><img class="img_area_image" src="resources/images/userImage/${space.id}/board/${space.title}/${space.image3}"></c:if></li>
	  							</ul>
	  						</div>
	  						<div class="board-img-slider" data-sno="${space.spaceNum}" id="board-img-slider${space.spaceNum}">
	  							<a href="javascript:void(0);" data-sno="${space.spaceNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${space.spaceNum}" ><i class="fas fa-chevron-left"></i></button></a>
	  							<a href="javascript:void(0);" data-sno="${space.spaceNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${space.spaceNum}" ><i class="fas fa-chevron-right"></i></button></a>
				    		</div>
  						</div>
  						<div class="info_area">
  							<h4>${space.title}</h4>
  						</div>
  					</a>
					<div class="tag_area">
						<h5>키워드
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty space.keyword1}"><span>#${space.keyword1}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty space.keyword2}"><span>#${space.keyword2}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty space.keyword3}"><span>#${space.keyword3}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty space.keyword4}"><span>#${space.keyword4}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty space.keyword5}"><span>#${space.keyword5}</span></c:if></a></h5>
					</div>
					<div class="detail_area">
						<h5><i class="fas fa-heart"></i> ${space.cntZzim} <i class="fas fa-eye"></i> ${space.count} <i class="far fa-comment-dots"></i> ${space.cntQna}</h5>
					</div>
  				</div>
  			</article>
  			</c:forEach>
   	</div>
   	

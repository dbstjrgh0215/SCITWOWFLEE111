<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
	    <!-- 지도를 표시할 div 입니다 -->
	    <input type="hidden" id="text" value="${text}">
		<div class="map_wrap" style="height:100%;"> 
		    <div class="map_map" id="map_map" style="width:100%;height:100%;position:relative;overflow:hidden;">
		    </div>
		    <div class="map_search_header">
		    	<input type="hidden" id="text" value="${text}">
				<h2 id="searchResult">${text}(으)로 검색한 결과 입니다.</h2>
				<a class="backMap"><i class="fas fa-times"></i></a>
		    </div>
			    <div class="map_category" >
			    	<div class="map_header">
			    		<span class="category_header"><img src="resources/images/logo.png"><h5> 와우플리 장소검색</h5></span><br>
			    		<span>검색 : <input type="text" id="mapSearchText"><button id="mapSearchBtn"><i class="fas fa-search"></i></button></span><br>
			    		<span>분류 : <select><option>대분류</option></select><button><i class="fas fa-search"></i></button></span>
			    	</div>
			    	<div class="category_content">
				    	<ul style="width:100%;">
				    		<li style="width:33%"><button class="map_category_btn" id="map_btn1"><img src="resources/images/mapCategory/map_category1.png">카페</button></li>
				    		<li style="width:33%"><button class="map_category_btn" id="map_btn2"><img src="resources/images/mapCategory/map_category2.png">서점</button></li>
				    		<li style="width:33%"><button class="map_category_btn" id="map_btn3"><img src="resources/images/mapCategory/map_category3.png">소품샵</button></li> 
				   		</ul><br>
				   		<ul style="width:100%">
				    		<li style="width:33%"><button class="map_category_btn" id="map_btn4"><img src="resources/images/mapCategory/map_category4.png">바(bar)</button></li>
							<li style="width:33%"><button class="map_category_btn" id="map_btn5"><img src="resources/images/mapCategory/map_category5.png">레스토랑</button></li>
							<li style="width:33%"><button class="map_category_btn" id="map_btn6" style="font-size: 13px;"><img src="resources/images/mapCategory/map_category6.png">복합문화공간</button></li>
						</ul><br>
						<ul style="width:100%">
							<li style="width:50%"><button class="map_category_btn2" id="map_btnMyPos"><i class="fas fa-street-view"></i>내위치</button></li>
							<li style="width:50%"><button class="map_category_btn2" id="map_btn8"><i class="far fa-grin-hearts"></i>인기있는물품</button></li>
						</ul><br>
			    	</div>
			    </div>
			</div>
</body>
 	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>	
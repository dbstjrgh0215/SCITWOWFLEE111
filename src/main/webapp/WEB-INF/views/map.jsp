<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	  
	    <!-- 지도를 표시할 div 입니다 -->
		<div class="map_wrap" style="height:100%;"> 
		    <div class="map_map" id="map_map" style="width:100%;height:100%;position:relative;overflow:hidden;">
		    </div>
			    <div class="map_category" >
			    	<ul> 
			    		<li>검색 : </li>
			    		<li><input type="text"></li>
			    		<li><button>검색</button></li>
			    	</ul><br>
			    	<ul>
			    		<li>품목 : </li>  
			    		<li><select><option>대분류</option></select></li>
			    		<li><select><option>중분류</option></select></li>
			    		<li><select><option>소분류</option></select></li>
			    		<li><button>검색</button></li> 
			    	</ul><br>
			    	<ul style="width:100%;">
			    		<li style="width:33%"><button id="map_btn1" style="width:100%; height:60px;">은행</button></li>
			    		<li style="width:33%"><button id="map_btn2" style="width:100%; height:60px;">마트</button></li>
			    		<li style="width:33%"><button id="map_btn3" style="width:100%; height:60px;">약국</button></li> 
			   		</ul><br>
			   		<ul style="width:100%">
			    		<li style="width:33%"><button id="map_btn4" style="width:100%; height:60px;">주유소</button></li>
						<li style="width:33%"><button id="map_btn5" style="width:100%; height:60px;">카페</button></li>
						<li style="width:33%"><button id="map_btn6" style="width:100%; height:60px;">편의점</button></li>
					</ul><br>
					<ul style="width:100%">
						<li style="width:50%"><button id="map_btnMyPos" style="width:100%; height:60px;">내위치</button></li>
						<li style="width:50%"><button id="map_btn8" style="width:100%; height:60px;">인기있는물품</button></li>
					</ul><br>
			    </div>
			</div>
<footer class="site-footer">
		<div class="main-footer">
			푸터
		</div>
	</footer>
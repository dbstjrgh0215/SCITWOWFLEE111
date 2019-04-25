$(function() { 
	if($('.board').length==1){
		$('.site-header').addClass('goBoard'); 
	}
	
	var menu = $(".site-header").offset();
	$(window).scroll( function() {
		if($(document).scrollTop()>menu.top) {
			$('.site-header').addClass('fixed');  
		} else {
			$('.site-header').removeClass('fixed');
		}
	});	 
	
	board_image();
	
	if(typeof daum !== 'undefined'){
		var text = $('#text').val();
		$.ajax({
			url:"searchMap",
			data:{text:text},
			type:"get",
			success:function(serverData){
				map(serverData);
			}
		});
	}
	
	$("#btnSearchM").on("click", function(){
		var status = $('#searchModal').css('display');
		barclose();
		searchWidth();
		if(status != 'block'){   
			$('.search').addClass('searchOpen');
			$('#event-slider-right').css('display','none');
			$('#event-slider-left').css('display','none');
		} else {
			$('#event-slider-right').css('display','block');
			$('#event-slider-left').css('display','block');
		}
		/*$.ajax({
			url:"goMap",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				map();
			}
		});*/
	});
	
	$('.closeSearch').on('click',function(){
		$('.search').removeClass('searchOpen');
	});
	
	search();
	
	$("#searchText").keydown(function(key) {
		if (key.keyCode == 13) {
			goSearch();
		}
	});
	
	$("#searchText2").keydown(function(key) {
		if (key.keyCode == 13) {
			goSearch();
		}
	});
	
	clickKeyword();
	
	$("#btnNotice").on("click",function(){
		var status = document.getElementById("notice").style.display;
		barclose();
		if(status != 'block'){   
			document.getElementById("notice").style.display = 'block';
		}
		notice();
	});
	
	$('.cntNewNotice').on('click',function(){
		var status = document.getElementById("notice").style.display;
		barclose();
		if(status != 'block'){   
			document.getElementById("notice").style.display = 'block';
		}
		notice();
	});
	
	$("#btnSlide").on("click", function(){  
		var status = document.getElementById("sidenav").style.display;
		barclose();
	    if(status != 'block'){
	    	document.getElementById("sidenav").style.display = 'block';
	    }
	});  
	
	$("#btnBackMenu").on("click",function(){
		barclose();
	});
	
	$("#btnBackNotice").on("click",function(){
		barclose();
	});
	
	mainNav();
	
	
	if($('#loginId').length!=0){
		$("#loginId,#loginPw").keydown(function(key) {
			if (key.keyCode == 13) {
				login();
			}
		});
	}

	$("#btnLogin").on("click", function(){
		login();
	});
	
	function login(){
		var id = $("#loginId").val();
		var pw = $("#loginPw").val();
		
		$.ajax({
			url:"login",
			data:{id:id,
				  pw:pw},
			type:"post",
			success:function(serverData){
				if(serverData=="success"){
					location.href="goHome";
				} else {
					if(id==""){
						$("#loginIdFail").html("<h4>아이디를 입력해주세요!</h4>");
						$("#loginIdFail h4").css("color","red");
						$("#loginpwFail").html("");
					} else if(pw==""){
						$("#loginIdFail").html("");
						$("#loginPwFail").html("<h4>비밀번호를 입력해주세요!</h4>");
						$("#loginPwFail h4").css("color","red");
					} else {
						$("#loginIdFail").html("");
						$("#loginPwFail").html("<h4>아이디 또는 비밀번호를 확인해주세요!</h4>");
						$("#loginPwFail h4").css("color","red");
					}
				}
			}
		});
	}
	
	$("#btnGoLogin").on("click",function(){
		location.href="goLogin";
	});
	
	$("#btnGoSignUp").on("click",function(){
		location.href="goSignUp";
	});
	
	$("#findId").click(function () {
		window.open('goSearchIdPw?type=id','window','width=400px, height=400px');
    });
	
	$('#btnFindId').on('click',function(){
		var name = $('#searchIdName').val();
		var email = $('#signEmail').val()+"@"+$('#signMailaddr').val();
		
		$.ajax({
			url:"findId",
			data:{name:name,
				email:email},
				type:"get",
				success:function(serverData){
					var result = "아이디는 "+serverData+" 입니다.";
					$('#searchIdPwResult').html("<h4>"+result+"</h4>");
				}
		});
	});
	
	$("#findPw").click(function () {
		window.open('goSearchIdPw?type=pw','window','width=400px, height=400px');
    });
	
	$('#btnFindPw').on('click',function(){
		var id = $('#searchPwId').val();
		var name = $('#searchPwName').val();
		var email = $('#signEmail').val()+"@"+$('#signMailaddr').val();
		
		$.ajax({
			url:"findPw",
			data:{id:id,
				name:name,
				email:email},
				type:"get",
				success:function(serverData){
					var result = "비밀번호는 "+serverData+" 입니다.";
					$('#searchIdPwResult').html("<h4>"+result+"</h4>");
				}
		});
	});
	
	$('#signId').on('keyup',function(){
		var signId = $('#signId').val();
		$.ajax({
			url:"checkId",
			data:{id:signId},
			type:"get",
			success:function(serverData){
				if(serverData==""){
					$('#idFail').html("ID 사용이 가능합니다.");
					$('#idFail').css("color","green");
				} else {
					$('#idFail').html("중복된 ID가 있습니다.");
					$('#idFail').css("color","red");
				}
			}
		});
	});
	
	$('#signPw').on('keyup',function(){
		var signPw = $('#signPw').val();
		var passwordCheck = $('#passwordCheck').val();
		$.ajax({
			url:"checkPw",
			data:{},
			type:"get",
			success:function(serverData){
				if(signPw.length>16||signPw.length<8){
					$('#img-pw').attr("src", "resources/images/signUp/m_icon_not_use.png");
					$('#pwFail').html("8~16자를 사용하세요.");
				} else{
					$('#img-pw').attr("src", "resources/images/signUp/m_icon_safe.png");
					$('#pwFail').html("사용가능합니다.");
				}
			}
		});
	});
	
	$('#passwordCheck').on('keyup',function(){
		var signPw = $('#signPw').val();
		var passwordCheck = $('#passwordCheck').val();
		$.ajax({
			url:"checkPw",
			data:{},
			type:"get",
			success:function(serverData){
				if(signPw==passwordCheck){
					$('#img-pwcheck').attr("src", "resources/images/signUp/m_icon_check_enable.png");
					$('#pwCheckFail').html("");
				} else{
					$('#img-pwcheck').attr("src", "resources/images/signUp/m_icon_check_disable.png");
					$('#pwCheckFail').html("비밀번호가 일치하지 않습니다.");
				}
			}
		});
	});
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        readURL(this);
    });

	
	$("#btnSignUp").on("click",function(){
		var id = $("#signId").val();
		var pw = $("#signPw").val();
		var name = $("#signName").val();
		var nickname = $("#signNickname").val();
		var phone = $("#signPhone1").val()+"-"+$("#signPhone2").val()+"-"+$("#signPhone3").val();
		var email = $("#signEmail").val()+"@"+$("#signMailaddr").val();
		var birthdate = $("#signBirthdate").val();
		var gender = $("#signGender").val();
		var address1 = $("#address").val();
		var address2 = $("#detailAddress").val();
		var membertype = $("#signMembertype").val();
		var latitude = $("#latitude").val();
        var longitude = $("#longitude").val();
		
		var member = {
		  'id':id,
		  'pw':pw,
		  'name':name,
		  'nickname':nickname,
		  'phone':phone,
		  'email':email,
		  'birthdate':birthdate,
		  'gender':gender,
		  'address1':address1,
		  'address2':address2,
		  'membertype':membertype,
		}
		
		if(id==""){
			alert("아이디를 입력해주세요!");
			return;
		} else if(pw=="") {
			alert("비밀번호를 입력해주세요!");
			return;
		} else if(name=="") {
			alert("이름을 입력해주세요!");
			return;
		} else if(nickname==""){
			alert("닉네임을 입력해주세요!");
			return;
		} else if(phone=="") {
			alert("전화번호를 입력해주세요!");
			return;
		} else if(email=="") {
			alert("이메일을 입력해주세요!");
			return;
		} else if(address1=="") {
			alert("주소를 입력해주세요!");
			return;
		} else if(address2=="") {
			alert("상세주소를 입력해주세요!");
			return;
		} 
		
		$.ajax({
			url:"signUp",
			data:member,
			type:"post",
			success:function(serverData){
				if(serverData==1){
					if(membertype=="user"){
						alert("회원가입을 축하합니다!")
						location.href="goLogin";
					} else {
						var redirect = "id="+id+"&membertype="+membertype+"&latitude="+latitude+"&longitude="+longitude;
						location.href="goExtraInfo?"+redirect;
					}
				} else {
					return;
				}
			}
		});
	});
	
	
	$('#btnGoProposal').on('click',function(){
		location.href="goProposal";
	});
	
	$("#btnLogout").on("click", function(){
		location.href="logout";
	});
	
	event();
	if($('#btnExtraInsert').length!=0){
		extraInfo();
		keywordSet();
		typeSet();
	}
	
	$('#btnRegistProposal').on('click',function(){
		if($('#proposalTable tr').length>5){
			$.jQueryAlert("제안서 등록개수 초과","5개까지가능");
		} else{
			location.href="goProposalWrite";
		}
	});
	
	if($('#btnProposalWrite').length!=0){
		typeSet();
		offdaySet();
		keywordSet();
		img();
		contractPeriodSet();
		insertProposal();
		precaution();
	}
	
	if($('.udtProposal').length!=0){
		proposal();
	}
	
	if($('#btnProposalUpdate').length!=0){
		typeSet();
		offdaySet();
		keywordSet();
		img();
		contractPeriodSet();
		proposal();
		precaution();
	}
	
	if($('#btnRegistBoard').length!=0){
		userBoard();
		$("#btnRegistBoard").on('click',function(){
			document.getElementById("modal-userBoard-proposalList").style.display = "block";
		});
	}
	
	if($('#btnBoardWrite').length!=0){
		typeSet();
		offdaySet();
		keywordSet();
		img();
		contractPeriodSet();
		userBoard();
		precaution();
	}
	
	if($('#btnBoardUpdate').length!=0){
		typeSet();
		offdaySet();
		keywordSet();
		img();
		contractPeriodSet();
		userBoard();
		precaution();
	}
	
	if($('#contract-online').length!=0){
		boardDetail();
	}
	
	if($('.request').length!=0){
		request();
	}
	
	if($('.contract').length!=0){
		contract();
	}
});

function extraInfo(){
	$("#btnExtraInsert").on('click', function(){
		var id = $("#id").val();
		var membertype = $("#membertype").val();
		var name = $("#name").val();
		var tel = $("#signPhone1").val()+"-"+$("#signPhone2").val()+"-"+$("#signPhone3").val();
		var type = "";
		for(var i=1; i<=5; i++){
			if($('#typeContent'+i).val!=""){
				type += "&"+$('#typeContent'+i).val();
			}
		}
		var keyword = "";
		for(var i=1; i<=5; i++){
			if($('#keywordContent'+i).val!=""){
				keyword += "&"+$('#keywordContent'+i).val();
			}
		}
		var comments = $("#comments").val();
		var productName = $("#productName").val();
		var spaceaddr1 = $('#address').val();
		var spaceaddr2 = $('#detailAddress').val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		
		$('#type').val(type);
		$('#selectedKeyword').val(keyword);
		$('#tel').val(tel);
		$("#imgForm").submit();
		
	});
}

function udt(){
	
}


jQuery.jQueryAlert = function (title, msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        title: title,
        autoOpen: true,
        modal: true,
        buttons: {
            OK: function alert() {
                $("#alertBox").dialog("close");
            }
        }
    });
};

function barclose(){
    document.getElementById("sidenav").style.display = 'none';
    document.getElementById("notice").style.display = 'none';
    if($('#searchFilter').hasClass('search searchOpen')===true){
    	$('.search').removeClass("searchOpen");
    }
}

function mainNav(){
	$("#goSeller").on("click",function(){
		$.ajax({
			url:"goBoardSeller",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				board_image();
			}
		});
	});
	
	$("#goSpace").on("click",function(){
		$.ajax({
			url:"goBoardSpace",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				board_image();
				clickKeyword();
			}
		});
	});
	
	$("#goProduct").on("click",function(){
		$.ajax({
			url:"goBoardProduct",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				board_image();
			}
		});
	});
}

function mainNavMake(){
	var data = "<div class='list-menu'><ul> <li><a href='javascript:void(0);' id='goSpace'>공간보기</a></li><li><a href='javascript:void(0);' id='goSeller'>셀러보기</a></li><li><a href='javascript:void(0);' id='goProduct'>판매상품</a></li></ul></div>";
	if($('.searchPageContent').length!=0){
		$.ajax({
			url:"keyword",
			data:{},
			type:"get",
			success:function(serverData){
				$('.main-nav').html(data);
				$('#searchText').css('width','88%');
				mainNav();
			}
		});
	}
}

function searchWidth(){
	if($('.list-menu').length==0){
		$.ajax({
			url:"keyword",
			data:{},
			type:"get",
			success:function(serverData){
				$('#searchText').css('width','88%');
			}
		});
	}
}

function clickKeyword(){
	$('.clickKeyword').on('click',function(){
		var text = $(this).text().substring(1);
		$.ajax({
			url:"goSearch",
			data:{text:text},
			type:"get",
			success:function(serverData){
				location.href="goSearch?text="+text;
			}
		});
	});
}

function goSearch(){
	var text = $('#searchText').val();
	var text2 = $('#searchText2').val();
	if(text!=""){
		$.ajax({
			url:"goSearch",
			data:{text:text},
			type:"get",
			success:function(serverData){
				location.href="goSearch?text="+text;
			}
		});
	} else if(text2!=undefined) {
		if(text2!=""){
			$.ajax({
				url:"goSearch",
				data:{text:text2},
				type:"get",
				success:function(serverData){
					location.href="goSearch?text="+text2;
				}
			});
		}
	} else {
		alert("검색어를입력해주세요!");
		return;
	}
	if(text2=="") {
		alert("검색어를입력해주세요!");
		return;
	}
}

function search(){
	mainNavMake();
	
	$('#goSearch').on('click',function(){
		goSearch();
	});
	
	$('#goSearch2').on('click',function(){
		goSearch();
	});
	
	$('.span-searchKeyword').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		var text = $('#keyword-a'+clickNo).text().substring(1);
		$('#keyword-a'+clickNo).on('click',function(){
			$.ajax({
				url:"goSearch",
				data:{text:text},
				type:"get",
				success:function(serverData){
					location.href="goSearch?text="+text;
				}
			});
		});
	});
	
	$('#searchMap').on('click',function(){
		var text = $('#text').val();
		location.href="goMap?text="+text;
	});
}

//생성자 함수를 이용해서 Arraylist 만들기
ArrayList = function arrayList(){
 
 this.list=[]; //데이터를 저장할 수 있는 배열을 멤버필드로 선언한다.
 //인자로 전달되는 데이터를 저장하는 함수
 
 this.add = function(item){
  //인자로 전달된 데이터를 자기 자신의 필드에 저장
  this.list.push(item);
 };
 
 //인자로 전달되는 해당 인덱스의 값을 리턴 하는 함수
 this.get = function(index){
  return this.list[index];
 };
 
 //인자로 전달되는 해당 인덱스의 값을 삭제하는 함수
 this.removeAll = function(){
  this.list=[]; //빈 배열을 대입해서 삭제하는 효과를 준다
 };
 
 //현재 저장된 크기를 리턴하는 메소드
 this.size = function(){
  return this.list.length;
 };
  
 this.remove = function(index){
  //새로운 배열을 정의
  var newList=[];
  //반복문을 돌면서 인자로 전달된 인덱스를 제외한 모든 요소를 새 배열에 담는다.
  for(var i=0;i<this.list.length;i++){
   if(i!=index){ //삭제할 인덱스가 아니라면
    newList.push(this.list[i]);
   };
  };
  //새로 만든 배열을 멤버 필드에 저장한다.
  this.list = newList;
 };
};

function map(serverData){
	if(typeof daum !== 'undefined'){
		//지도 관련
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    overlays = [],
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		var marker = null;
		var overlay = null;
		var mapContainer = document.getElementById('map_map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(37.513220, 127.058581), // 지도의 중심좌표
		    level: 7 // 지도의 확대 레벨
		};
		if($('#map_map').length!=0){
			panTo();
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			var imageSrc = 'resources/images/map_icon.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
			imageOption = {
				spriteSize : new daum.maps.Size(31, 31), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(15, 15) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			if(typeof daum !== 'undefined'){
				var text = $('#text').val();
				$.ajax({
					url:"searchMapDetail",
					data:{text:text},
					type:"get",
					success:function(searchList){
						var searchMapList = new ArrayList();
						searchMapList = searchList;
						// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
						$.each(serverData, function(index,item){
							//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
							var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
							markerPosition = new daum.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
							//마커를 생성합니다
							marker = new daum.maps.Marker({
							position: markerPosition,
							image: markerImage // 마커이미지 설정 
							});
							panTo(item.latitude,item.longitude);
							marker.setMap(map);
							markers.push(marker);  // 배열에 생성된 마커를 추가합니다
							
							var image = searchMapList[index].image1;
							var type = "";
							var type1 = searchMapList[index].type1;
							var type2 = searchMapList[index].type2;
							var type3 = searchMapList[index].type3;
							var type4 = searchMapList[index].type4;
							var type5 = searchMapList[index].type5;
							if(type1!=""){
								type += type1;
								if(type2!=""){
									type += ", "+type2;
									if(type3!=""){
										type += ", "+type3;
										if(type4!=""){
											type += ", "+type4;
											if(type5!=""){
												type += ", "+type5;
											}
										}
									}
								}
							}
							var keyword = "";
							var keyword1 = searchMapList[index].keyword1;
							var keyword2 = searchMapList[index].keyword2;
							var keyword3 = searchMapList[index].keyword3;
							var keyword4 = searchMapList[index].keyword4;
							var keyword5 = searchMapList[index].keyword5;
							if(keyword1!=""){
								keyword += '<a class="overLay-keyword">#'+keyword1+'</a> ';
								if(keyword2!=""){
									keyword += '<a class="overLay-keyword">#'+keyword2+'</a> ';
									if(keyword3!=""){
										keyword += '<a class="overLay-keyword">#'+keyword3+'</a> ';
										if(keyword4!=""){
											keyword += '<a class="overLay-keyword">#'+keyword4+'</a> ';
											if(keyword5!=""){
												keyword += '<a class="overLay-keyword">#'+keyword5+'</a> ';
											}
										}
									}
								}
							}
							// 커스텀 오버레이에 표시할 컨텐츠 입니다
							// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
							// 별도의 이벤트 메소드를 제공하지 않습니다 
							var content = '<div class="overlay" id="overlay'+index+'">' + 
							            '    <div class="info">' + 
							            '        <div class="title">' + 
							            			item.name+ 
							            '            <div class="closeInfo" data-sno="'+index+'" title="닫기"></div>' + 
							            '        </div>' + 
							            '        <div class="body">' + 
							            '            <div class="img">' +
							            '                 <img class="img1" src="resources/images/userImage/'+item.id+'/board/'+item.title+'/'+image+'">' +
							            '           </div>' + 
							            '            <div class="desc">' + 
							            '                <div class="ellipsis">'+item.spaceaddr1+'</div>' + 
							            '                <div class="ellipsis">'+item.spaceaddr2+'</div>' +
							            '                <div class="jibun ellipsis">'+type+'</div>' +
							            '                <div class="jibun ellipsis">'+keyword+'</div>' +
							            '                <a class="overLay-goBoard" data-sno="'+item.boardnum+'">자세히보기</a>' +
							            '            </div>' + 
							            '        </div>' + 
							            '    </div>' +    
							            '</div>';
	
							// 커스텀 오버레이를 생성합니다
							var customOverlay = new daum.maps.CustomOverlay({
							    position: markerPosition,
							    content: content   
							});
	
							overlays.push(customOverlay);
						});
						
						// 마커에 클릭이벤트를 등록합니다
						$.each(overlays, function(index,item){
							// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							daum.maps.event.addListener(markers[index], 'click', function() {
								for(var i=0; i<overlays.length; i++){
									overlays[i].setMap(null);
								}
								overlays[index].setMap(map);
								
								// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
								$('.closeInfo').on('click',function(){
									overlays[index].setMap(null);
								});
								
								$('.overLay-keyword').on('click',function(){
									overlays[index].setMap(null);
									var text = $(this).text().substring(1);
									$('#text').val(text);
									$.ajax({
										url:"searchMap",
										data:{text:text},
										type:"get",
										success:function(serverData){
											overlays=[];
											removeMarker(); 
											addMarker(serverData);
										}
									});
								});
								
								$('.overLay-goBoard').on('click',function(){
									var clickNo = $(this).attr('data-sno');
									location.href="goSpaceDetail?boardnum="+clickNo;
								});
							});
						});
						return searchMapList; 
					}
				});
			}
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(serverData) {
				if(typeof daum !== 'undefined'){
					var text = $('#text').val();
					$.ajax({
						url:"searchMapDetail",
						data:{text:text},
						type:"get",
						success:function(searchList){
							var searchMapList = new ArrayList();
							searchMapList = searchList;
							// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
							$.each(serverData, function(index,item){
								//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
								markerPosition = new daum.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
								//마커를 생성합니다
								marker = new daum.maps.Marker({
								position: markerPosition,
								image: markerImage // 마커이미지 설정 
								});
								panTo(item.latitude,item.longitude);
								marker.setMap(map);
								markers.push(marker);  // 배열에 생성된 마커를 추가합니다
								
								var image = searchMapList[index].image1;
								var type = "";
								var type1 = searchMapList[index].type1;
								var type2 = searchMapList[index].type2;
								var type3 = searchMapList[index].type3;
								var type4 = searchMapList[index].type4;
								var type5 = searchMapList[index].type5;
								if(type1!=""){
									type += type1;
									if(type2!=""){
										type += ", "+type2;
										if(type3!=""){
											type += ", "+type3;
											if(type4!=""){
												type += ", "+type4;
												if(type5!=""){
													type += ", "+type5;
												}
											}
										}
									}
								}
								var keyword = "";
								var keyword1 = searchMapList[index].keyword1;
								var keyword2 = searchMapList[index].keyword2;
								var keyword3 = searchMapList[index].keyword3;
								var keyword4 = searchMapList[index].keyword4;
								var keyword5 = searchMapList[index].keyword5;
								if(keyword1!=""){
									keyword += '<a class="overLay-keyword">#'+keyword1+'</a> ';
									if(keyword2!=""){
										keyword += '<a class="overLay-keyword">#'+keyword2+'</a> ';
										if(keyword3!=""){
											keyword += '<a class="overLay-keyword">#'+keyword3+'</a> ';
											if(keyword4!=""){
												keyword += '<a class="overLay-keyword">#'+keyword4+'</a> ';
												if(keyword5!=""){
													keyword += '<a class="overLay-keyword">#'+keyword5+'</a> ';
												}
											}
										}
									}
								}
								// 커스텀 오버레이에 표시할 컨텐츠 입니다
								// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
								// 별도의 이벤트 메소드를 제공하지 않습니다 
								var content = '<div class="overlay" id="overlay'+index+'">' + 
								            '    <div class="info">' + 
								            '        <div class="title">' + 
								            			item.name+ 
								            '            <div class="closeInfo" data-sno="'+index+'" title="닫기"></div>' + 
								            '        </div>' + 
								            '        <div class="body">' + 
								            '            <div class="img">' +
								            '                 <img class="img1" src="resources/images/userImage/'+item.id+'/board/'+item.title+'/'+image+'">' +
								            '           </div>' + 
								            '            <div class="desc">' + 
								            '                <div class="ellipsis">'+item.spaceaddr1+'</div>' + 
								            '                <div class="ellipsis">'+item.spaceaddr2+'</div>' +
								            '                <div class="jibun ellipsis">'+type+'</div>' +
								            '                <div class="jibun ellipsis">'+keyword+'</div>' +
								            '                <a class="overLay-goBoard" data-sno="'+item.boardnum+'">자세히보기</a>' +
								            '            </div>' + 
								            '        </div>' + 
								            '    </div>' +    
								            '</div>';
	
								// 커스텀 오버레이를 생성합니다
								var customOverlay = new daum.maps.CustomOverlay({
								    position: markerPosition,
								    content: content   
								});
	
								overlays.push(customOverlay);
							});
							
							// 마커에 클릭이벤트를 등록합니다
							$.each(overlays, function(index,item){
								// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
								daum.maps.event.addListener(markers[index], 'click', function() {
									for(var i=0; i<overlays.length; i++){
										overlays[i].setMap(null);
									}
									overlays[index].setMap(map);
									
									// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
									$('.closeInfo').on('click',function(){
										overlays[index].setMap(null);
									});
									
									$('.overLay-keyword').on('click',function(){
										overlays[index].setMap(null);
										var text = $(this).text().substring(1);
										$('#text').val(text);
										$.ajax({
											url:"searchMap",
											data:{text:text},
											type:"get",
											success:function(serverData){
												removeMarker(); 
												overlays=[];
												addMarker(serverData);
												$('#searchResult').html(text+"(으)로 검색한 결과입니다.");
											}
										});
									});
									
									$('.overLay-goBoard').on('click',function(){
										var clickNo = $(this).attr('data-sno');
										location.href="goSpaceDetail?boardnum="+clickNo;
									});
								});
							});
							return searchMapList; 
						}
					});
				}
			}
			
	
			function panTo(latitude,longitude) {
			 	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			    if (navigator.geolocation) {
			        
			        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			        navigator.geolocation.getCurrentPosition(function(position) {
			            
			            var lat = position.coords.latitude, // 위도
			                lon = position.coords.longitude; // 경도
			            
			            var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            
			         	// 이동할 위도 경도 위치를 생성합니다 
					    var moveLatLon = new daum.maps.LatLng(37.513220, 127.058581);
			            
					 	// 지도 중심을 부드럽게 이동시킵니다
					    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
					    if(latitude==undefined){
					    	locPosition = new daum.maps.LatLng(lat, lon);
					    } else {
					    	locPosition = new daum.maps.LatLng(latitude, longitude);
					    }
					    map.panTo(locPosition);  
					    
			          });
			        
			    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			        
			        var locPosition = new daum.maps.LatLng(33.450701, 126.570667);    
			         
			     	// 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(locPosition);  
			    }
			}      
			
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			
			$('#map_btn1').on('click',function(){
				$('#text').val("카페");
				$.ajax({
					url:"searchMap",
					data:{text:"카페"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("카페(으)로 검색한 결과입니다.");
					}
				});
			});
			 
			$('#map_btn2').on('click',function(){
				$('#text').val("서점");
				$.ajax({
					url:"searchMap",
					data:{text:"서점"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("서점(으)로 검색한 결과입니다.");
					}
				});
			});
			
			$('#map_btn3').on('click',function(){
				$('#text').val("소품샵");
				$.ajax({
					url:"searchMap",
					data:{text:"소품샵"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("소품샵(으)로 검색한 결과입니다.");
					}
				});
			});
			
			$('#map_btn4').on('click',function(){
				$('#text').val("바");
				$.ajax({
					url:"searchMap",
					data:{text:"바"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("바(으)로 검색한 결과입니다.");
					}
				});
			});
			
			$('#map_btn5').on('click',function(){
				$('#text').val("레스토랑");
				$.ajax({
					url:"searchMap",
					data:{text:"레스토랑"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("레스토랑(으)로 검색한 결과입니다.");
					}
				});
			});
			
			$('#map_btn6').on('click',function(){
				$('#text').val("복합문화공간");
				$.ajax({
					url:"searchMap",
					data:{text:"복합문화공간"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("복합문화공간(으)로 검색한 결과입니다.");
					}
				});
			});
			
			$('#map_btnMyPos').on('click', function(){
				panTo();
			});
			
			$('#map_btn8').on('click',function(){
				$.ajax({
					url:"searchPopular",
					data:{type:"space"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html("인기있는 장소로 검색한 결과입니다.");
					}
				});
			});
			
			$('#mapSearchBtn').on('click',function(){
				var text = $('#mapSearchText').val();
				$('#text').val(text);
				$.ajax({
					url:"searchMap",
					data:{text:text},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						overlays=[];
						addMarker(serverData);
						$('#searchResult').html(text+"(으)로 검색한 결과입니다.");
						$('#mapSearchText').val("");
					}
				});
			});
			
			$('#mapSearchText').on('keydown',function(key){
				var text = $('#mapSearchText').val();
				if(key.keyCode==13){
					$('#text').val(text);
					$.ajax({
						url:"searchMap",
						data:{text:text},
						type:"get",
						success:function(serverData){
							removeMarker(); 
							overlays=[];
							addMarker(serverData);
							$('#mapSearchText').val("");
						}
					});
				}
			});
			
			$('.backMap').on('click',function(){
				history.back();
			});
		}
	}
}

function markerSetting(text){
	location.href="goMap?text="+text;
}

function execDaumPostcode() {
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    var latitude = result.y;
                    var longitude = result.x;
                    
                    $("#latitude").val(latitude);
                    $("#longitude").val(longitude);
                }
            });
        }
    }).open();
}

function jqueryUI(){
	$("#btnRegistProposal").button();
	$(".udtProposal").button();
	$(".delProposal").button();
	$("#btnSaveProposal").button();
	$("#btnWriteProposal").button();
}

function precaution(){
	for(var i=1; i<=5; i++){
		if($('#precaution'+i).val()!=""){
			$('.td-precaution'+i).css('display','block');
		}
	}
	$('.td-precaution1').css('display','block');
	$('.addPrecaution').on('click',function(){
		var addNo = $(this).attr('data-sno');
		$('.td-precaution'+addNo).css('display','block');
	});
}

function insertProposal(){
	$('#title').on('keyup',function(){
		var title=$('#title').val();
		$.ajax({
			url:"checkTitle",
			data:{title:title},
			type:"get",
			success:function(serverData){
				if(serverData=="fail"){
					$('#titleCheck').html("중복된 제안서 제목이있습니다. 제목을 바꿔주세요.");
				} else {
					$('#titleCheck').html("");
				}
			}
		});
	});
	
	$('#btnProposalWrite').on('click',function(){
		var membertype=$('#form_membertype').val();
		var title=$('#title').val();
		var keyword = "";
		for(var i=1; i<=5; i++){
			if($('#keywordContent'+i).val!=""){
				keyword += "&"+$('#keywordContent'+i).val();
			}
		}
		var comments=$('#comments').val();
		var precaution="";
		for(var i=1; i<=5; i++){
			if($('#precaution'+i).val!=""){
				precaution += "&"+$('#precaution'+i).val();
			}
		}
		var name = $('#name').val();
		var type = "";
		for(var i=1; i<=5; i++){
			if($('#typeContent'+i).val!=""){
				type += "&"+$('#typeContent'+i).val();
			}
		}
		var contractPeriod = "";
		for(var i=1; i<=7; i++){
			if($('#contractPeriodContent'+i).val!=""){
				contractPeriod += "&"+$('#contractPeriodContent'+i).val();
			}
		}
		var price=$('#price').val();
		var stock=$('#stock').val();
		var optime = "";
		for(var i=1; i<=4; i++){
			if($('#optime'+i).val!=""){
				optime += "&"+$('#optime'+i).val();
			}
		}
		var offday = "";
		for(var i=1; i<=7; i++){
			if($('#offdayContent'+i).val!=""){
				offday += "&"+$('#offdayContent'+i).val();
			}
		}
		var scale = $('#scale').val();

		$('#form_title').val(title);
		$('#form_keyword').val(keyword);
		$('#form_comments').val(comments);
		$('#form_precaution').val(precaution);
		$('#form_name').val(name);
		$('#form_type').val(type);
		$('#form_contractPeriod').val(contractPeriod);
		if(price!=null){
			$('#form_price').val(price);
		}
		if(stock!=null){
			$('#form_stock').val(stock);
		}
		if(optime!=null){
			$('#form_optime').val(optime);
		}
		if(scale!=null){
			$('#form_scale').val(scale);
		}
		if(offday!=null){
			$('#form_offday').val(offday);
		}
				
	});
}

function proposal(){
	$(".udtProposal").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"goProposal2",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				location.href="goUpdateProposal?clickNo="+clickNo;
			}
		});
	}); 
	
	$(".delProposal").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"delProposal",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				location.href="goProposal";
			}
		});
	}); 
	
	$(".goProposalDetail").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		location.href="goProposalDetail?clickNo="+clickNo;
	});
	
	$(".close").on('click',function(){
		document.getElementById("modal-proposal").style.display="none";
	});
	
	$('#btnProposalUpdate').on('click',function(){
		var membertype=$('#form_membertype').val();
		var title=$('#title').val();
		var keyword = "";
		for(var i=1; i<=5; i++){
			if($('#keywordContent'+i).val!=""){
				keyword += "&"+$('#keywordContent'+i).val();
			}
		}
		var comments=$('#comments').val();
		var precaution="";
		for(var i=1; i<=5; i++){
			if($('#precaution'+i).val!=""){
				precaution += "&"+$('#precaution'+i).val();
			}
		}
		var name = $('#name').val();
		var type = "";
		for(var i=1; i<=5; i++){
			if($('#typeContent'+i).val!=""){
				type += "&"+$('#typeContent'+i).val();
			}
		}
		var offday="";
		for(var i=1; i<=7; i++){
			if($('#offdayContent'+i).val!=""){
				offday += "&"+$('#offdayContent'+i).val();
			}
		}
		var contractPeriod = "";
		for(var i=1; i<=7; i++){
			if($('#contractPeriodContent'+i).val!=""){
				contractPeriod += "&"+$('#contractPeriodContent'+i).val();
			}
		}
		var price=$('#price').val();
		var stock=$('#stock').val();
		var optime = "";
		for(var i=1; i<=4; i++){
			if($('#optime'+i).val!=""){
				optime += "&"+$('#optime'+i).val();
			}
		}
		var scale = $('#scale').val();

		$('#form_title').val(title);
		$('#form_keyword').val(keyword);
		$('#form_comments').val(comments);
		$('#form_precaution').val(precaution);
		$('#form_name').val(name);
		$('#form_type').val(type);
		$('#form_offday').val(offday);
		$('#form_contractPeriod').val(contractPeriod);
		if(price!=null){
			$('#form_price').val(price);
		}
		if(stock!=null){
			$('#form_stock').val(stock);
		}
		if(optime!=null){
			$('#form_optime').val(optime);
		}
		if(scale!=null){
			$('#form_scale').val(scale);
		}
		
	});
}

function userBoard(){
	$(".close2").on('click',function(){
		location.href="goUserBoard";
	});
	
	$("input:radio[name=selectProposal]").change(function(){
		var checked_radio = $(this).val();
		$.ajax({
	    	url:"selectProposal",
	    	data:{proposalnum:checked_radio},
	    	type:"get",
	    	success:function(serverData){
	    		$('#userBoardWrite').html(serverData);
	    	}
	    });
		
	});
	
	$('#btnGoBoardWrite').on('click',function(){
		var checked_radio_check = $("input:radio[name=selectProposal]").prop("checked");
		var checked_radio = $("input:radio[name=selectProposal]:checked").val();
		if(checked_radio==false){
			alert('선택해주세요!');
			return false;
		} 
		location.href="goBoardWrite?proposalnum="+checked_radio;
	});
	
	$('#btnBoardWrite').on('click',function(){
		var membertype=$('#form_membertype').val();
		var title=$('#title').val();
		$.ajax({
			url:"checkTitle",
			data:{title:title},
			type:"get",
			success:function(serverData){
				if(serverData=="fail"){
					$('#titleCheck').html("중복된 공고문 제목이있습니다. 제목을 바꿔주세요.");
				} else {
					$('#titleCheck').html("");
				}
			}
		});
		var keyword = "";
		for(var i=1; i<=5; i++){
			if($('#keywordContent'+i).val!=""){
				keyword += "&"+$('#keywordContent'+i).val();
			}
		}
		var comments=$('#comments').val();
		var precaution="";
		for(var i=1; i<=5; i++){
			if($('#precaution'+i).val!=""){
				precaution += "&"+$('#precaution'+i).val();
			}
		}
		var contractPeriod = "";
		for(var i=1; i<=7; i++){
			if($('#contractPeriodContent'+i).val!=""){
				contractPeriod += "&"+$('#contractPeriodContent'+i).val();
			}
		}
		var offday = "";
		for(var i=1; i<=7; i++){
			if($('#offdayContent'+i).val!=""){
				offday += "&"+$('#offdayContent'+i).val();
			}
		}
		if(membertype=='셀러'){
			var price=$('#price').val();
			var stock=$('#stock').val();
		} else {
			var optime = "";
			for(var i=1; i<=4; i++){
				if($('#optime'+i).val!=""){
					optime += "&"+$('#optime'+i).val();
				}
			}
			var scale = $('#scale').val();
		}

		$('#form_title').val(title);
		$('#form_keyword').val(keyword);
		$('#form_comments').val(comments);
		$('#form_precaution').val(precaution);
		$('#form_contractPeriod').val(contractPeriod);
		$('#form_offday').val(offday);
		if(membertype=='셀러'){
			$('#form_price').val(price);
			$('#form_stock').val(stock);
			$('#form_optime').val("");
			$('#form_scale').val(0);
		} else {
			$('#form_price').val(0);
			$('#form_stock').val(0);
			$('#form_optime').val(optime);
			$('#form_scale').val(scale);
		}
		
	});
	
	$(".udtuserBoard").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"goBoardWrite2",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				location.href="goUpdateBoard?clickNo="+clickNo;
				contractPeriodSet();
				offdaySet();
				keywordSet();
				typeSet();
				img();
			}
		});
	}); 
	
	$(".deluserBoard").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"delBoard",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				location.href="goUserBoard";
			}
		});
	}); 
	
	$('#btnBoardUpdate').on('click',function(){
		var membertype=$('#form_membertype').val();
		var title=$('#title').val();
		$.ajax({
			url:"checkTitle",
			data:{title:title},
			type:"get",
			success:function(serverData){
				if(serverData=="fail"){
					$('#titleCheck').html("중복된 공고문 제목이있습니다. 제목을 바꿔주세요.");
				} else {
					$('#titleCheck').html("");
				}
			}
		});
		var type="";
		for(var i=1; i<=5; i++){
			if($('#typeContent'+i).val!=""){
				type += "&"+$('#typeContent'+i).val();
			}
		}
		var keyword = "";
		for(var i=1; i<=5; i++){
			if($('#keywordContent'+i).val!=""){
				keyword += "&"+$('#keywordContent'+i).val();
			}
		}
		var comments=$('#comments').val();
		var precaution="";
		for(var i=1; i<=5; i++){
			if($('#precaution'+i).val!=""){
				precaution += "&"+$('#precaution'+i).val();
			}
		}
		var contractPeriod = "";
		for(var i=1; i<=7; i++){
			if($('#contractPeriodContent'+i).val!=""){
				contractPeriod += "&"+$('#contractPeriodContent'+i).val();
			}
		}
		var offday = "";
		for(var i=1; i<=7; i++){
			if($('#offdayContent'+i).val!=""){
				offday += "&"+$('#offdayContent'+i).val();
			}
		}
		if(membertype=='셀러'){
			var price=$('#price').val();
			var stock=$('#stock').val();
		} else {
			var optime = "";
			for(var i=1; i<=4; i++){
				if($('#optime'+i).val!=""){
					optime += "&"+$('#optime'+i).val();
				}
			}
			var scale = $('#scale').val();
		}

		$('#form_title').val(title);
		$('#form_keyword').val(keyword);
		$('#form_comments').val(comments);
		$('#form_precaution').val(precaution);
		$('#form_contractPeriod').val(contractPeriod);
		$('#form_offday').val(offday);
		if(membertype=='셀러'){
			$('#form_price').val(price);
			$('#form_stock').val(stock);
			$('#form_optime').val("");
			$('#form_scale').val(0);
		} else {
			$('#form_price').val(0);
			$('#form_stock').val(0);
			$('#form_optime').val(optime);
			$('#form_scale').val(scale);
		}
	});
}

function contractPeriodSet(){
	contractPeriodFilter();
	
	for(var a=1; a<=7;a++){
		if($('#contractPeriodContent'+a).val()!=""){
			for(var b=1; b<=7; b++){
				if($('#contractPeriod'+b).text().substring(1)==$('#contractPeriodContent'+a).val()){
					$('#contractPeriod'+b).css('color','#F05E22');
					$('#contractPeriod-icon'+b).css('color','#F05E22');
				}
			}
		}
	}
	
	function contractPeriodFilter(){
		$(".contractPeriod-a").on('click',function(){
			var clickNo = $(this).attr('data-sno');
			var status = document.getElementById("contractPeriod"+clickNo).style.color;
			if(status=='rgb(240, 94, 34)'){
				$('#contractPeriod'+clickNo).css('color','gray');
				$('#contractPeriod-icon'+clickNo).css('color','gray');
				var contractPeriod = $('#contractPeriod'+clickNo).text();
				$('#selectedcontractPeriod'+clickNo).remove();
				var contractPeriod = $('#contractPeriod'+clickNo).text();
				for(var a=1; a<=7;a++){
					if($('#contractPeriodContent'+a).val()==contractPeriod.substring(1)){
						$('#contractPeriodContent'+a).val("");
						break;
					}
				}
			} else {
				$('#contractPeriod'+clickNo).css('color','#F05E22');
				$('#contractPeriod-icon'+clickNo).css('color','#F05E22');
				var contractPeriod = $('#contractPeriod'+clickNo).text();
				for(var a=1; a<=7;a++){
					if($('#contractPeriodContent'+a).val()==""){
						$('#contractPeriodContent'+a).val(contractPeriod.substring(1));
						break;
					}
				}
			}
			contractPeriodDel();
		}); 
	}
	
	function contractPeriodDel(){
		$('.contractPeriod-del').off('click');
		$('.contractPeriod-del').on('click',function(){
			var delNo = $(this).attr('data-sno');
			$('#contractPeriod'+delNo).css('color','gray');
			$('#contractPeriod-icon'+delNo).css('color','gray');
			var contractPeriod = $('#contractPeriod'+delNo).text();
			$('#selectedcontractPeriod'+delNo).remove();
			var delcontractPeriod = $(this).attr('key');
			for(var a=1; a<=5;a++){
				if($('#contractPeriodContent'+a).val()==delcontractPeriod){
					$('#contractPeriodContent'+a).val("");
					break;
				}
			}
		});
	}
}

function offdaySet(){
	offdayFilter();
	
	for(var a=1; a<=7;a++){
		if($('#offdayContent'+a).val()!=""){
			for(var b=1; b<=7; b++){
				if($('#offday'+b).text().substring(1)==$('#offdayContent'+a).val()){
					$('#offday'+b).css('color','#F05E22');
					$('#offday-icon'+b).css('color','#F05E22');
				}
			}
		}
	}
	
	function offdayFilter(){
		$(".offday-a").on('click',function(){
			var clickNo = $(this).attr('data-sno');
			var status = document.getElementById("offday"+clickNo).style.color;
			if(status=='rgb(240, 94, 34)'){
				$('#offday'+clickNo).css('color','gray');
				$('#offday-icon'+clickNo).css('color','gray');
				var offday = $('#offday'+clickNo).text();
				$('#offdayContent'+clickNo).remove();
				var offday = $('#offday'+clickNo).text();
				for(var a=1; a<=5;a++){
					if($('#offdayContent'+a).val()==offday.substring(1)){
						$('#offdayContent'+a).val("");
						break;
					}
				}
			} else {
				$('#offday'+clickNo).css('color','#F05E22');
				$('#offday-icon'+clickNo).css('color','#F05E22');
				var offday = $('#offday'+clickNo).text();
				for(var a=1; a<=5;a++){
					if($('#offdayContent'+a).val()==""){
						$('#offdayContent'+a).val(offday.substring(1));
						break;
					}
				}
			}
			offdayDel();
		}); 
	}
	
	function offdayDel(){
		$('.offday-del').off('click');
		$('.offday-del').on('click',function(){
			var delNo = $(this).attr('data-sno');
			$('#offday'+delNo).css('color','gray');
			$('#offday-icon'+delNo).css('color','gray');
			var offday = $('#offday'+delNo).text();
			$('#selectedoffday'+delNo).remove();
			var deloffday = $(this).attr('key');
			for(var a=1; a<=5;a++){
				if($('#offdayContent'+a).val()==deloffday){
					$('#offdayContent'+a).val("");
					break;
				}
			}
		});
	}
}

function typeSet(){
	var index = 30;
	var count = 0;
	
	for(var i=1; i<=5; i++){
		if($('#typeContent'+i).val()!=""){
			var type = $('#typeContent'+i).val();
			$('#typeSelected .td-2').append("<button type='button' id='selectedtype"+index+"'>"+type
					+"<a href='javascript:void(0);' data-sno='"+index+"' key='"+type+"' id='deletetype"+index+"' class='type-del'>　X</a></button>");
			index++;
			$('#type').val("");
			count++;
			$('#typeCount').html(count);
			typeDel();
		}
		
	}
	
	$("#typeRegist").on('click',function(){
		var membertype=$('#form_membertype').val();
		var type = $('#type').val();
		if(count>4){
			alert("5개이상선택할수없습니다.");
		} else{
			if(type!=""){
				$.ajax({
					url:"keyword",
					data:{membertype:membertype},
					type:"get",
					success:function(serverData){
						$('#typeSelected .td-2').append("<button type='button' id='selectedtype"+index+"'>"+type
								+"<a href='javascript:void(0);' data-sno='"+index+"' key='"+type+"' id='deletetype"+index+"' class='type-del'>　X</a></button>");
						index++;
						$('#type').val("");
						for(var a=1; a<=5;a++){
							if($('#typeContent'+a).val()==""){
								$('#typeContent'+a).val(type);
								break;
							}
						}
						count++;
						$('#typeCount').html(count);
						typeDel();
					}
				});
			} else {
				if(membertype=="공간제공자"){
					alert("공간분류를 입력해주세요!");
				}
				if(membertype=="셀러"){
					alert("상품분류를 입력해주세요!");
				}
			}
		}
	});
	
	
	function typeDel(){
		$('.type-del').off('click');
		$('.type-del').on('click',function(){
			var delNo = $(this).attr('data-sno');
			var type = $('#type'+delNo).text();
			$('#selectedtype'+delNo).remove();
			var deltype = $(this).attr('key');
			for(var a=1; a<=5;a++){
				if($('#typeContent'+a).val()==deltype){
					$('#typeContent'+a).val("");
					break;
				}
			}
			count--;
			$('#typeCount').html(count);
		});
	}
	
}

function keywordSet(){
	var index = 30;
	var count = 0;
	
	for(var i=1; i<=5; i++){
		if($('#keywordContent'+i).val()!=""){
			var keyword = $('#keywordContent'+i).val();
			$('#keywordSelected .td-2').append("<button type='button' id='selectedKeyword"+index+"'>"+keyword
					+"<a href='javascript:void(0);' data-sno='"+index+"' key='"+keyword+"' id='deleteKeyword"+index+"' class='keyword-del'>　X</a></button>");
			index++;
			$('#keyword').val("");
			count++;
			$('#keywordCount').html(count);
			if(count==5){
				$('#keywordCount').css('color','red');
			} else {
				$('#keywordCount').css('color','#2a3f52');
			}
			keywordDel();
		}
		
	}
	
	$('#keywordRegist').off('click');
	$("#keywordRegist").on('click',function(){
		var membertype=$('#membertype').val();
		var keyword = $('#keyword').val();
		if(count>4){
			alert("5개이상선택할수없습니다.");
		} else{
			if($('#keyword').val()!=""){
				$.ajax({
					url:"keyword",
					data:{membertype:membertype},
					type:"get",
					success:function(serverData){
						$('#keywordSelected .td-2').append("<button type='button' id='selectedKeyword"+index+"'>"+keyword
								+"<a href='javascript:void(0);' data-sno='"+index+"' key='"+keyword+"' id='deleteKeyword"+index+"' class='keyword-del'>　X</a></button>");
						index++;
						$('#keyword').val("");
						for(var a=1; a<=5;a++){
							if($('#keywordContent'+a).val()==""){
								$('#keywordContent'+a).val(keyword);
								break;
							}
						}
						count++;
						$('#keywordCount').html(count);
						if(count==5){
							$('#keywordCount').css('color','red');
						} else {
							$('#keywordCount').css('color','#2a3f52')
						}
						keywordDel();
					}
				});
			} else {
				alert("키워드를 입력해주세요!");
			}
		}
	});
	
	$('#selectKeyword').on('click',function(){
		var membertype=$('#membertype').val();
		if($('#keyword1').length==0){		// 키워드 선택창 열기
			$.ajax({
				url:"keyword",
				data:{membertype:membertype},
				type:"get",
				success:function(serverData){
					$('#keywordFilter').html(serverData);
					keywordFilter();
					for(var i=1; i<=15; i++){
						var status = $("#selectedKeyword"+i).length;
						if(status!=0) {
							$('#keywordIcon'+i).css('color','#F05E22');
							$('#keyword'+i).css('color','#F05E22');
						}
					}
					$("#selectKeyword i").attr('class','fas fa-chevron-up');
				}
			});
		} else {			// 키워드 선택창 닫기
			$.ajax({
				url:"keyword",
				data:{membertype:membertype},
				type:"get",
				success:function(serverData){
					$('#keywordFilter').html("");
					keywordFilter();
					$("#selectKeyword i").attr('class','fas fa-chevron-down');
				}
			});
		}
	});
	
	function keywordFilter(){
		$(".keyword-a").on('click',function(){
			var clickNo = $(this).attr('data-sno');
			var status = document.getElementById("keyword"+clickNo).style.color;
			if(status=='rgb(240, 94, 34)'){
				$('#keyword'+clickNo).css('color','gray');
				$('#keywordIcon'+clickNo).css('color','gray');
				var keyword = $('#keyword'+clickNo).text();
				$('#selectedKeyword'+clickNo).remove();
				var keyword = $('#keyword'+clickNo).text();
				for(var a=1; a<=5;a++){
					if($('#keywordContent'+a).val()==keyword.substring(1)){
						$('#keywordContent'+a).val("");
						break;
					}
				}
				count--;
				$('#keywordCount').html(count);
				if(count==5){
					$('#keywordCount').css('color','red');
				} else {
					$('#keywordCount').css('color','#2a3f52')
				}
			} else {
				if(count>4){
					alert("5개이상선택할수없습니다.");
				} else{
					$('#keyword'+clickNo).css('color','#F05E22');
					$('#keywordIcon'+clickNo).css('color','#F05E22');
					var keyword = $('#keyword'+clickNo).text();
					$('#keywordSelected .td-2').append("<button type='button' id='selectedKeyword"+clickNo+"'>"+keyword.substring(1)
							+"<a href='javascript:void(0);' data-sno='"+clickNo+"' key='"+keyword.substring(1)+"' id='deleteKeyword"+clickNo+"' class='keyword-del'>　X</a></button>");
					for(var a=1; a<=5;a++){
						if($('#keywordContent'+a).val()==""){
							$('#keywordContent'+a).val(keyword.substring(1));
							break;
						}
					}
					count++;
					$('#keywordCount').html(count);
					if(count==5){
						$('#keywordCount').css('color','red');
					} else {
						$('#keywordCount').css('color','#2a3f52')
					}
				}
			}
			keywordDel();
		}); 
	}
	
	function keywordDel(){
		$('.keyword-del').off('click');
		$('.keyword-del').on('click',function(){
			var delNo = $(this).attr('data-sno');
			$('#keyword'+delNo).css('color','gray');
			$('#keywordIcon'+delNo).css('color','gray');
			var keyword = $('#keyword'+delNo).text();
			$('#selectedKeyword'+delNo).remove();
			var delKeyword = $(this).attr('key');
			for(var a=1; a<=5;a++){
				if($('#keywordContent'+a).val()==delKeyword){
					$('#keywordContent'+a).val("");
					break;
				}
			}
			count--;
			$('#keywordCount').html(count);
			if(count==5){
				$('#keywordCount').css('color','red');
			} else {
				$('#keywordCount').css('color','#2a3f52')
			}
		});
	}
}



function event(){
	var imgs;
	var img_count;
	var img_position = 1;
	
	imgs = $(".event ul");
	img_count = imgs.children().length;
	
	$('#event-slider-left').click(function(){
		back();
	});
	
	$('#event-slider-right').click(function(){
		next();
	});
	
	function back() {
		if(1<img_position){
			imgs.animate({
				left:'+=100%'
			});
			img_position--;
		}
	}
	
	function next() {
		if(img_count>img_position){
			imgs.animate({
				left:'-=100%'
			});
			img_position++;
		}
	}
}


function board_image(){
	var imgs;
	var img_count;
	var img_position = 1;
	
	$('.img_area').on('mouseenter',function(){
		var clickImg = $(this).attr('data-sno');
		document.getElementById('board-img-slider'+clickImg).style.display='block';
		$('#img_area'+clickImg).addClass('aaa');
	});
	
	$('.inner').on('mouseleave',function(){
		var clickImg = $(this).attr('data-sno');
		document.getElementById('board-img-slider'+clickImg).style.display='none';
		$('#img_area'+clickImg).removeClass('aaa');
	});
	
	$('.board-img-slider-left').click(function(){
		var clickNo = $(this).attr('data-sno');
		imgs = $(".inner #board-ul"+clickNo);
		var status = document.getElementById("board-ul"+clickNo).style.left;
		img_count = imgs.children().length;
		if(status==''){
			img_position=1;
		} else if(status=='-100%'){
			img_position=2;
		} else if(status=='-200%'){
			img_position=3;
		}
		
		if(img_position==1){
			imgs.animate({
				left:'-=200%'
			});
			img_position=3;
		} else {
			if(1<img_position){
				imgs.animate({
					left:'+=100%'
				});
				img_position--;
			}
		}
	});
	
	$('.board-img-slider-right').click(function(){
		var clickNo = $(this).attr('data-sno');
		imgs = $(".inner #board-ul"+clickNo);
		var status = document.getElementById("board-ul"+clickNo).style.left;
		img_count = imgs.children().length;
		if(status==''){
			img_position=1;
		} else if(status=='-100%'){
			img_position=2;
		} else if(status=='-200%'){
			img_position=3;
		}
		
		if(img_position==3){
			imgs.animate({
				left:'+=200%'
			});
			img_position=1;
		} else {
			if(img_count>img_position){
				imgs.animate({
					left:'-=100%'
				});
				img_position++;
			}
		}
	});
	
}

function boardDetail(){
	var imgs3;
	var img_count3;
	var img_position3 = 1;
	
	imgs3 = $(".boardDetail-image ul");
	img_count3 = imgs3.children().length;
	
	$('#board-content-image-slider-left').click(function(){
		back();
	});
	
	$('#board-content-image-slider-right').click(function(){
		next();
	});
	
	function back() {
		if(1<img_position3){
			imgs3.animate({
				left:'+=100%'
			});
			img_position3--;
		}
	}
	
	function next() {
		if(img_count3>img_position3){
			imgs3.animate({
				left:'-=100%'
			});
			img_position3++;
		}
	}
	
	$(window).scroll( function() {
		var menu = $(".board").offset();
		if($(document).scrollTop()>menu.top) {
			$('.contractWindow').addClass('fixed-contract'); 
			$('.contractWindow2').addClass('fixed-contract');
		} else {
			$('.contractWindow').removeClass('fixed-contract');
			$('.contractWindow2').removeClass('fixed-contract');
		}
		
		var bottom = $('.board-map').offset();
		if(bottom!=null){
			if($(document).scrollTop()>bottom.top){
				$('.contractWindow').css('display','none');  
			} else {
				$('.contractWindow').css('display','block'); 
			}
		} else {
			var bottom2 = $('.board-precaution').offset();
			if($(document).scrollTop()>bottom2.top){
				$('.contractWindow').css('display','none');  
			} else {
				$('.contractWindow').css('display','block'); 
			}
		}
	});	
	
	//지도 띄우기
	// 이미지 지도에서 마커가 표시될 위치입니다 
	var latitude = $('#staticMap').attr('latitude');
	var longitude = $('#staticMap').attr('longitude');
	var positionName = $('#staticMap').attr('positionName');
    var markerPosition  = new daum.maps.LatLng(latitude, longitude); 

    // 이미지 지도에 표시할 마커입니다
    // 이미지 지도에 표시할 마커는 Object 형태입니다
    var marker = {
        position: markerPosition, 
        text: positionName // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다 
    };

    var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
        staticMapOption = { 
    		center: new daum.maps.LatLng(latitude, longitude), // 이미지 지도의 중심좌표
            level: 3, // 이미지 지도의 확대 레벨
            marker: marker // 이미지 지도에 표시할 마커 
        };    

    if(staticMapContainer!=undefined){
    	// 이미지 지도를 생성합니다
    	var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
    }
	
    //댓글작성
    $('#btnCommentWrite').on('click',function(){
    	var loginId = $('#sessionId').val();
    	var boardId = $('#boardId').val();
    	if(loginId!=boardId){
    		$('#modal-board-qna').css('display','block');
    	}
    });
    
    $('.closeQna').on('click',function(){
    	$('#modal-board-qna').css('display','none');
    });
    
    $('#qna-cancel').on('click',function(){
    	$('#modal-board-qna').css('display','none');
    });
    
    $('#qna-regist').on('click',function(){
    	var boardnum = $('#board-num').val();
    	var comments = $('#qnaInsertTextarea').val();
    	var id = $('#sessionId').val();
    	var membertype = $('#boardType').val();
    	var go = "goHome";
    	if(membertype=="셀러"){
			go = "goSellerDetail?boardnum="+boardnum;
		} else if(membertype=="공간제공자") {
			go = "goSpaceDetail?boardnum="+boardnum;
		}
		var receiveId = $('#boardId').val();
    	$.ajax({
    		url:"insertQna",
    		data:{boardnum:boardnum,
    			  comments:comments,
    			  id:id,
    			  go:go,
    			  receiveId:receiveId},
    		type:"get",
    		success:function(serverData){
    			$('#modal-board-qna').css('display','none');
    			var data = '';
    			data += '<tr><th>작성자</th><th>질문제목</th><th>작성일자</th><th>비고</th></tr>';
    			$.each(serverData,function(index,item){
    				data += '<tr>';
        			data += '<td><input type="hidden" id="qnaNum" value="'+item.qnanum+'">'+item.nickname+'</td>'
					data += '<td class="commentsTitle"><a href="javascript:void(0);" class="goCommentsDetail" data-sno="'+item.qnanum+'" qnaId="'+item.id+'">'+item.comments+'</a></td>'
					data += '<td>'+item.indate+'</td>'
					if(id==item.id){
						data += '<td><button class="udtCommentBtn" data-sno="'+item.qnanum+'">수정</button><button class="delCommentBtn" data-sno="'+item.qnanum+'">삭제</button></td>'
					} else {
						data += '<td></td>'
					}
        			data += '</tr>';
    			});
    			$('#commentTable').html(data);
    			goCommentsDetail();
    		}
    	});
    });
    
    goCommentsDetail();
    function goCommentsDetail(){
	    $('.goCommentsDetail').on('click',function(){
	    	var loginId = $('#sessionId').val();
	    	var boardId = $('#boardId').val();
	    	var qnaId = $(this).attr('qnaId');
	    	var qnaNum = $(this).attr('data-sno');
	    	var boardNum = $('#board-num').val();
	    	var boardName = $('#boardName').text();
	    	$.ajax({
	    		url:"goCommentsDetail",
	    		data:{qnanum:qnaNum,
	    			  boardnum:boardNum},
	    		type:"get",
	    		success:function(serverData){
	    			var data = '';
	    			if(loginId==boardId){
		    			data = '<div class="modal-board-qnaReplyHeader">';
			    		data += serverData.nickname+'님의 댓글 '+'<span class="closeReply">&times;</span>';
			    		data += '</div>';
						data += '<div class="modal-board-qnaReplyContent" id="modal-board-qnaContent">';
						data += '<div class="modal-board-qnaReplyInsert" id="modal-baord-qnaInsert">';
						data += '<div class="modal-board-qnaHead" id="modal-board-qnaHead">';
						data +=	serverData.nickname+'님의 댓글</div>';
						data += '<div class="modal-board-qnaReplyQuestion" id="modal-board-qnaHead">';
						data +=	'Q. '+serverData.comments+'</div>';
						if(serverData.reply==null){
							data += '<div class="modal-board-qnaReplyHead" id="modal-board-qnaHead">';
							data +=	'답글달기<input type="hidden" id="receiveId" value="'+serverData.id+'"></div>';
							data += '<textarea class="replyInsertTextarea" id="replyInsertTextarea" maxlength="200" placeholder="답글을 입력하세요."></textarea>';
							data += '</div>';
							data += '<div class="modal-board-replybtn">';
							data += '<a href="javascript:void(0);" id="reply-cancel"><span class="modal-board-qna-cancel">취소</span></a>';
							data += '<a href="javascript:void(0);" id="reply-regist" qnaNum="'+qnaNum+'"><span class="modal-board-qna-regist">등록</span></a>';
							data += '</div>';
						} else {
							data += '<div class="modal-board-qnaReplyHead" id="modal-board-qnaHead">';
							data +=	boardName+'님의 답글</div>';
							data += '<div class="modal-board-qnaReplyComments">A. '+serverData.reply+'</div>';
						}
						data += '</div>';
		    			$('.modal-board-qnaReply').html(data);
		    			$('#modal-board-qnaReply').css('display','block');
		    			$('.closeReply').on('click',function(){
		    		    	$('#modal-board-qnaReply').css('display','none');
		    		    });
		    		    $('#reply-cancel').on('click',function(){
		    		    	$('#modal-board-qnaReply').css('display','none');
		    		    });
	    			} else if(loginId==qnaId) {
	    				data = '<div class="modal-board-qnaReplyHeader">';
			    		data += serverData.nickname+'님의 댓글 '+'<span class="closeReply">&times;</span>';
			    		data += '</div>';
						data += '<div class="modal-board-qnaReplyContent" id="modal-board-qnaContent">';
						data += '<div class="modal-board-qnaReplyInsert" id="modal-baord-qnaInsert">';
						data += '<div class="modal-board-qnaReplyQuestion" id="modal-board-qnaHead">';
						data +=	'Q. '+serverData.comments+'</div>';
						data += '<div class="modal-board-qnaReplyHead" id="modal-board-qnaHead">';
						data +=	boardName+'님의 답글</div>';
						if(serverData.reply!=null){
							data += '<div class="modal-board-qnaReplyComments">A. '+serverData.reply+'</div>';
						} else {
							data += '<div class="modal-board-qnaReplyComments">아직 '+boardName+'님이 답글을 달지 않았습니다.</div>';
						}
						data += '</div>';
						data += '</div>';
	    				$('.modal-board-qnaReply').html(data);
	    				$('.modal-board-qnaReplyContent').css('height','330px');
		    			$('#modal-board-qnaReply').css('display','block');
		    			$('.closeReply').on('click',function(){
		    		    	$('#modal-board-qnaReply').css('display','none');
		    		    });
		    		    $('#reply-cancel').on('click',function(){
		    		    	$('#modal-board-qnaReply').css('display','none');
		    		    });
	    			} else {
	    				alert("작성자만 볼 수 있습니다.");
	    			}
	    			
	    			$('#reply-regist').on('click',function(){
	    		    	var qnanum = $(this).attr('qnaNum');
	    		    	var boardnum = $('#board-num').val();
	    		    	var reply = $('#replyInsertTextarea').val();
	    		    	var id = $('#sessionId').val();
	    		    	var go = "goHome";
	    		    	var membertype = $('#boardType').val();
	    		    	if(membertype=="셀러"){
	    					go = "goSellerDetail?boardnum="+boardnum;
	    				} else if(membertype=="공간제공자") {
	    					go = "goSpaceDetail?boardnum="+boardnum;
	    				}
	    				var receiveId = $('#receiveId').val();
	    		    	$.ajax({
	    		    		url:"insertReply",
	    		    		data:{qnanum:qnanum,
	    		    			  boardnum:boardnum,
	    		    			  reply:reply,
	    		    			  id:id,
	    		    			  go:go,
	    		    			  receiveId:receiveId},
	    		    		type:"get",
	    		    		success:function(serverData){
	    		    			$('#modal-board-qnaReply').css('display','none');
	    		    			var data = '';
	    		    			data += '<tr><th>작성자</th><th>질문제목</th><th>작성일자</th><th>비고</th></tr>';
	    		    			$.each(serverData,function(index,item){
	    		    				data += '<tr>';
	    		        			data += '<td><input type="hidden" id="qnaNum" value="'+item.qnanum+'">'+item.nickname+'</td>'
	    							data += '<td class="commentsTitle"><a href="javascript:void(0);" class="goCommentsDetail" data-sno="'+item.qnanum+'" qnaId="'+item.id+'">'+item.comments+'</a></td>'
	    							data += '<td>'+item.indate+'</td>'
	    							if(id==item.id){
	    								data += '<td><button class="udtCommentBtn" data-sno="'+item.qnanum+'">수정</button><button class="delCommentBtn" data-sno="'+item.qnanum+'">삭제</button></td>'
	    							} else {
	    								data += '<td></td>'
	    							}
	    		        			data += '</tr>';
	    		    			});
	    		    			$('#commentTable').html(data);
	    		    			goCommentsDetail();
	    		    		}
	    		    	});
	    		    });
	    		}
	    	});
	    });
    }
    
    // 비슷한 공간 상세 페이지 이동
    $('.inner_similar').on('click',function(){
    	var boardnum = $(this).attr('data-sno');
    	var memberType = $(this).attr('memType');
    	if(memberType=="셀러"){
    		location.href="goSellerDetail?boardnum="+boardnum;
    	} else {
    		location.href="goSpaceDetail?boardnum="+boardnum;
    	}
    });
    
    var imgs;
	var img_count;
	var img_position = 1;
	
	imgs = $("#similar-ul");
	img_count = imgs.children().length/2;
    
	if(img_count>1){
		$('.similarLeft').on('click',function(){
	    	if(1<img_position){
				imgs.animate({
					left:'+=60%'
				});
				img_position--;
			}
	    	
	    });
	    
	    $('.similarRight').on('click',function(){
	    	if(img_count>img_position){
				imgs.animate({
					left:'-=60%'
				});
				img_position++;
			}
	    });
	}
	
	if($('#similar-ul2').length>0){
		var imgs2;
		var img_count2;
		var img_position2 = 1;
		
		imgs2 = $("#similar-ul2");
		img_count2 = imgs2.children().length/2;
	    
		if(img_count2>1){
			$('.similarLeft').on('click',function(){
		    	if(1<img_position2){
					imgs2.animate({
						left:'+=60%'
					});
					img_position2--;
				}
		    	
		    });
		    
		    $('.similarRight').on('click',function(){
		    	if(img_count2>img_position2){
		    		imgs2.animate({
						left:'-=60%'
					});
		    		img_position2++;
				}
		    });
		}
	}
    
	
    // 계약창
    var contractSelect = $('.contract-select-li input:radio[name=contractType]');
    contractSelect.change(function(){
    	var select = $(this).val();
    	if(select=='online'){
    		$('#contract-online').css('display','block');
    		$('#contract-offline').css('display','none');
    	} else if(select=='offline') {
    		$('#contract-online').css('display','none');
    		$('#contract-offline').css('display','block');
    	}
    	$.ajax({
    		url:"contractSelect",
    		data:{type:select},
    		type:"get",
    		success:function(serverData){
    			$('.selectedContractType').html(serverData);
    		}
    	});
    });
    
    $('#goContractRequest').on('click',function(){
    	var boardnum = $('#board-num').val();
    	var id = $('#sessionId').val();
    	var boardId = $('#boardId').val();
    	var contractperiod = $('#contractPeriod').val();
    	$(".close2").on('click',function(){
    		location.href="goSpaceDetail?boardnum="+boardnum;
    	});
    	
    	var selectedContractType = $('.selectedContractType').text();
    	if(selectedContractType==""){
    		alert("신청방식을 선택하여주세요!");
    	} else if(selectedContractType=="온라인 신청") {
    		$('#modal-userBoard-proposalList').css('display','block');
    		$("input:radio[name=selectProposal]").change(function(){
    			var checked_radio = $(this).val();
    			$.ajax({
    		    	url:"selectProposal",
    		    	data:{proposalnum:checked_radio},
    		    	type:"get",
    		    	success:function(serverData){
    		    		$('#userBoardWrite').html(serverData);
    		    	}
    		    });
    			
    		});
    		$('#btnGoRequest').on('click',function(){
    			var checked_radio_check = $("input:radio[name=selectProposal]").prop("checked");
    			var checked_radio = $("input:radio[name=selectProposal]:checked").val();
    			if(checked_radio==false){
    				alert('선택해주세요!');
    				return false;
    			} 
    			$.ajax({
        			url:"insertRequest",
        			data:{id:id,
        				  boardnum:boardnum,
        				  proposalnum:checked_radio,
        				  contractperiod:contractperiod,
        				  boardId:boardId},
        			type:"get",
        			success:function(serverData){
        				$('#modal-userBoard-proposalList').css('display','none');
        				alert("계약신청이 완료되었습니다.");
        			}
        		});
    		});
    	} else {
    		$.ajax({
    			url:"insertRequest",
    			data:{id:id,
    				  boardnum:boardnum,
    				  contractperiod:contractperiod,
    				  boardId:boardId},
    			type:"get",
    			success:function(serverData){
    				$('#modal-userBoard-proposalList').css('display','none');
    				alert("계약신청이 완료되었습니다.");
    			}
    		});
    	}
    });
    
  //찜
	$("#board-content-zzim").on('click',function(){
		var status = $(this).val();
		var boardnum = $("#board-num").val(); 
		var id = $("#sessionId").val();
		var boardId = $('#boardId').val();
		var membertype=$('#boardType').val();
		var go = "goHome";
		if(membertype=="셀러"){
			go = "goSellerDetail?boardnum="+boardnum;
		} else if(membertype=="공간제공자") {
			go = "goSpaceDetail?boardnum="+boardnum;
		}
		var zzim = {'boardnum':boardnum,'id':id, 'go':go, 'boardId':boardId};
		var zzimCount = Number($('#zzimCount').text());
		if(status==1){
			$.ajax({
				url:'deleteZzim',
				data:zzim,
				type:'get',
				success:function(serverData){
					$('#board-content-zzim').html('<i class="far fa-heart" title="찜하기"></i>');
					$('#board-content-zzim').val("0");
					zzimCount=zzimCount-1;
					$('#zzimCount').html(zzimCount);
				}
			});
		} else {
			$.ajax({
				url:'insertZzim',
				data:zzim,
				type:'get',
				success:function(serverData){
					$('#board-content-zzim').html('<i class="fas fa-heart" title="찜취소"></i>');
					$('#board-content-zzim').val("1");
					zzimCount=zzimCount+1;
					$('#zzimCount').html(zzimCount);
				}
			});
		}
	});
}

function img(){
	var sel_files = [];
	
	$("#image").on("change", handleImgFileSelect);
	
	$("#fileUpload").on('click',function(){
        $("#image").trigger('click');
		
	});
	
	$('#imageClear').on('click',function(){
		sel_files = [];
        $(".imgs_wrap").empty();
        $('#image').val("");
	});
	
	function handleImgFileSelect(e) {
        /*sel_files = [];
        $(".imgs_wrap").empty();*/

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                return;
            }

            sel_files.push(f);
            
            var reader = new FileReader();
            reader.onload = function(e) {
            	var html;
                if($('#img_id_0').length==0){
                	$(".imgs_wrap").empty();
                	html = "<a id=img_id_"+0+"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                } else if($('#img_id_1').length==0){
                	html = "<a id=img_id_"+1+"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                } else if($('#img_id_2').length==0){
                	html = "<a id=img_id_"+2+"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                } else {
                	alert("3개까지등록가능합니다!");
                }
                $(".imgs_wrap").append(html);
                index++;
                $("#img_id_0").on('click', function(){
                	sel_files.splice(0, 1);
                	$('#img_id_0').remove(); 
                });
                $("#img_id_1").on('click', function(){
                	sel_files.splice(1, 1);
                	$('#img_id_1').remove(); 
                });
                $("#img_id_2").on('click', function(){
                	sel_files.splice(2, 1);
                	$('#img_id_2').remove(); 
                });
                
            }
            reader.readAsDataURL(f);
            
        });
        
        
    }
	
}

function request(){
	$('.clickListRequest').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"listRequest",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				$('.listRequestTable').empty();
				$('.listRequestTable').css('background-color','gray');
				var data = '<tr class="listRequestUser" id="listRequestUser${board.boardnum}l"><td colspan="5" class="listLine">지원자목록 <i class="fas fa-level-down-alt"></i></td></tr>';
				if(serverData==""){
					data += '<tr><td colspan="5">현재 지원자가 없습니다.</td></tr>'
				} else {
					$.each(serverData, function(index,item){
						var approval = '<td class="td-listRequest" id="listRequestApproval'+item.requestnum+'" rowspan="2"><button class="btnApproval" data-sno="'+item.requestnum+'" id="btnApproval">OK</button><button class="btnRefuse" data-sno="'+item.requestnum+'" id="btnRefuse">SORRY</button></td>';
						if(item.approval=="1"){
							approval = '<td class="td-listRequest" id="listRequestApproval'+item.requestnum+'" rowspan="2">계약요청이 승인되었습니다.</td>';
						} else if(item.approval=="0"){
							approval = '<td class="td-listRequest" id="listRequestApproval'+item.requestnum+'" rowspan="2">계약요청이 거절되었습니다.</td>';
						}
						var requestType = "오프라인 신청";
						var goProposal = "";
						if(item.proposalnum!=""){
							requestType = "온라인 신청"
							goProposal = '<a href="goProposalDetail?clickNo='+item.proposalnum+'">제안서 보러가기</a>';
						}
						data += '<tr class="listRequestUser" id="listRequestUser'+item.boardnum+'">';
						data += '<td class="listRequestUserProfile" rowspan="2"><div class="profileIcon-request"><img src="resources/images/seller.png"></div></td>';
						data += '<td class="td-listRequest">'+item.nickname+' '+'</td>';
						data += '<td class="td-listRequest">'+goProposal+'<input type="hidden" id="requestId'+item.requestnum+'" value="'+item.id+'"></td>';
						data += approval;
						data += '</tr>';
						data += '<tr class="listRequestUser" id="listRequestUser'+item.boardnum+'a">';
						data += '<td class="td-listRequest">'+requestType+'('+item.contractperiod+')'+'<input type="hidden" id="contractPeriod'+item.requestnum+'" value="'+item.contractperiod+'"></td>';
						data += '<td class="td-listRequest">계약 요청일 : '+item.requestdate+'</td>';
						data += '</tr>';
						data += '<tr><td colspan="4" class="listLine"></td></tr>';
					});
				}
				$('#listRequestTable'+clickNo).append(data);
				$('#listRequestTable'+clickNo).css('background-color','white');
				$('#listRequestTable'+clickNo+' .listRequestUser').css('display','table-row');
				
				$('.btnApproval').on('click',function(){
					var clickNo = $(this).attr('data-sno');
					var go = "goContract";
					var receiveId = $('#requestId'+clickNo).val();
					var contractPeriod = $('#contractPeriod'+clickNo).val();
					$.ajax({
						url:"clickApproval",
						data:{requestnum:clickNo,
							  select:"승인",
							  go:go,
							  receiveId:receiveId,
							  contractPeriod:contractPeriod},
						type:"get",
						success:function(serverData){
						}
					});
					$('#listRequestApproval'+clickNo).html("계약요청이 승인되었습니다.");
				});
				
				$('.btnRefuse').on('click',function(){
					var clickNo = $(this).attr('data-sno');
					var go = "goRequest";
					var receiveId = $('#requestId'+clickNo).val();
					$.ajax({
						url:"clickApproval",
						data:{requestnum:clickNo,
							  select:"거절",
							  go:go,
							  receiveId:receiveId},
						type:"get",
						success:function(serverData){
						}
					});
					$('#listRequestApproval'+clickNo).html("계약요청이 거절되었습니다.");
				});
			}
		});
		
	});
	
	$('.clickListMyRequest').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"listMyRequest",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				$('.requestResult').empty();
				$('.requestResult').css('background-color','gray');
				var data = '<tr class="listRequestUser" id="listRequestUser${board.boardnum}l"><td colspan="5" class="listLine">지원결과 <i class="fas fa-level-down-alt"></i></td></tr>';
				if(serverData==""){
					data += '<tr><td colspan="5">현재 지원자가 없습니다.</td></tr>'
				} else {
					$.each(serverData, function(index,item){
						var approval = item.approval;
						if(approval==null){
							approval = "아직 성사여부가 결정되지 않았습니다.";
						} else if(approval=='1') {
							approval = "계약요청이 승인되었습니다.";
						} else {
							approval = "계약요청이 거절되었습니다.";
						}
						data += '<tr><td colspan="5">'+approval+'</td></tr>';
					});
				}
				$('#requestResultTable'+clickNo).append(data);
				$('#requestResultTable'+clickNo).css('background-color','white');
				$('#requestResultTable'+clickNo+' .listRequestUser').css('display','table-row');
			}
		});
		
	});
}

function notice(){
	$('.notice').on('mouseenter',function(){
		$('.notice').css('overflow-y','auto');
		$('.updateConfirm').css('display','block');
		$('.noConfirm').css('display','block');
		$('.deleteNotice').css('display','block');
	});
	$('.notice').on('mouseleave',function(){
		$('.notice').css('overflow-y','hidden');
		$('.updateConfirm').css('display','none');
		$('.noConfirm').css('display','none');
		$('.deleteNotice').css('display','none');
	});
	
	$('.goAllConfirm').on('click',function(){
		var id=$(this).attr('data-sno');
		$.ajax({
			url:"goAllConfirm",
			data:{id:id},
			type:"get",
			success:function(serverData){
				location.href="updateHome";
			}
		});
	});
	
	$('.checkNotice').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		var go = $(this).attr('go');
		$.ajax({
			url:"updateConfirm",
			data:{noticenum:clickNo},
			type:"get",
			success:function(serverData){
				$('#checkNotice'+clickNo).css('background-color','#FADCA5');
			}
		});
		location.href=go;
	});
	
	$('.updateConfirm').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		
		$.ajax({
			url:"updateConfirm",
			data:{noticenum:clickNo},
			type:"get",
			success:function(serverData){
				$('#checkNotice'+clickNo).css('background-color','#FADCA5');
				location.href="updateHome";
			}
		});
	});
	
	$('.deleteNotice').on('click',function(){
		var clickNo = $(this).attr('data-sno');
		
		$.ajax({
			url:"deleteNotice",
			data:{noticenum:clickNo},
			type:"get",
			success:function(serverData){
				location.href="updateHome";
			}
		});
	});
}

function contract(){
	$('.goContractDetail').on('click',function(){
		var contractNum = $(this).attr('data-sno');
		$.ajax({
			url:"selectContract",
			data:{contractnum:contractNum},
			type:"get",
			success:function(serverData){
				var data = "";
				var content = "";
				var sellerId = serverData.sellerId;
				var spacerId = serverData.spacerId;
				var sessionId = $('#sessionId').val();
				var sellerNickname = "";
				var spacerNickname = "";
				$.ajax({
					url:"searchNickname",
					data:{sellerId:sellerId,
						  spacerId:spacerId},
					type:"get",
					success:function(search){
						$.each(search,function(index,item){
							if(sellerNickname==""){
								sellerNickname=item;
							} else {
								spacerNickname=item;
							}
						});
						data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
						$('#modal-contractHeader').html(data);
						
						$('.closeContract').on('click',function(){
							$('#modal-contractDetail').css('display','none');
						});
						
						content += '<table class="contractDetailTable">';
						content += '<tr>';
						content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
						content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
						content += '</tr>';
						content += '<tr>';
						content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
						content += '</tr>';
						content += '<tr>';
						content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
						content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
						content += '</tr>';
						content += '<tr>';
						content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
						content += '</tr>';
						content += '<tr>';
						content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
						if(sessionId==sellerId){
							content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
							content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
						}
						content += '</td>';
						content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
						if(sessionId==spacerId){
							content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
							content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
						}
						content += '</td>';
						content += '</tr>';
						content += '<tr>';
						content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
						if(sessionId==spacerId){
							content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
							content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
						}
						content += '</td>';
						content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
						if(sessionId==spacerId){
							content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
							content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
						}
						content += '</td>';
						content += '</tr>';
						content += '<tr>';
						if(serverData.startDate==null){
							content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
							if(sessionId=spacerId){
								content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
							}
							content += '</td>';
							content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
						} else {
							content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
							content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
						}
						content += '</tr>';
						content += '</table>';
						
						$('#modal-contractContent').html(content);
						
						insertDiv();
						
					}
				});
			}
		});
		$('#modal-contractDetail').css('display','block');
		
	});
	
	function insertDiv(){
		var amount = "";
		$('.1').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+1);
		});
		
		$('.2').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+2);
		});
		$('.3').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+3);
		});
		$('.4').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+4);
		});
		$('.5').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+5);
		});
		$('.6').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+6);
		});
		$('.7').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+7);
		});
		$('.8').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+8);
		});
		$('.9').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+9);
		});
		$('.0').on('click',function(){
			amount = $('.insertAmount').val();
			$('.insertAmount').val(amount+0);
		});
		$('.C').on('click',function(){
			$('.insertAmount').val("");
		});
		
		$('.btnInsertSales').on('click',function(){
			var status = document.getElementById("insertDivSales").style.display;
			if(status=='block'){
				$('#insertDivSales').css('display','none');
			} else {
				$('#insertDivSales').css('display','block');
				var contractnum = $(this).attr('data-sno');
				$('#insertBtnSales').off('click');
				$('#insertBtnSales').on('click',function(){
					var sales = $('#insertAmountSales').val(); 
					$.ajax({
						url:"updateContract",
						data:{contractnum:contractnum,
							  sales:sales},
						type:"get",
						success:function(serverData){
							var data = "";
							var content = "";
							var sellerId = serverData.sellerId;
							var spacerId = serverData.spacerId;
							var sessionId = $('#sessionId').val();
							var sellerNickname = "";
							var spacerNickname = "";
							$.ajax({
								url:"searchNickname",
								data:{sellerId:sellerId,
									  spacerId:spacerId},
								type:"get",
								success:function(search){
									$.each(search,function(index,item){
										if(sellerNickname==""){
											sellerNickname=item;
										} else {
											spacerNickname=item;
										}
									});
									data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
									$('#modal-contractHeader').html(data);
									
									$('.closeContract').on('click',function(){
										$('#modal-contractDetail').css('display','none');
									});
									
									content += '<table class="contractDetailTable">';
									content += '<tr>';
									content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
									content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
									content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
									if(sessionId==sellerId){
										content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
										content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
										content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									if(serverData.startDate==null){
										content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
										if(sessionId=spacerId){
											content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
										}
										content += '</td>';
										content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
									} else {
										content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
										content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
									}
									content += '</tr>';
									content += '</table>';
									
									$('#modal-contractContent').html(content);
									
									insertDiv();
								}
							});
						}
					});
					$('.insertAmount').val("");
					$('#insertDivSales').css('display','none');
				});
			}
		});
		
		$('.btnInsertSold').on('click',function(){
			var status = document.getElementById("insertDivSold").style.display;
			if(status=='block'){
				$('#insertDivSold').css('display','none');
			} else {
				$('#insertDivSold').css('display','block');
				var contractnum = $(this).attr('data-sno');
				$('#insertBtnSold').off('click');
				$('#insertBtnSold').on('click',function(){
					var soldCount = $('#insertAmountSold').val(); 
					$.ajax({
						url:"updateContract",
						data:{contractnum:contractnum,
							  soldCount:soldCount},
						type:"get",
						success:function(serverData){
							var data = "";
							var content = "";
							var sellerId = serverData.sellerId;
							var spacerId = serverData.spacerId;
							var sessionId = $('#sessionId').val();
							var sellerNickname = "";
							var spacerNickname = "";
							$.ajax({
								url:"searchNickname",
								data:{sellerId:sellerId,
									  spacerId:spacerId},
								type:"get",
								success:function(search){
									$.each(search,function(index,item){
										if(sellerNickname==""){
											sellerNickname=item;
										} else {
											spacerNickname=item;
										}
									});
									data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
									$('#modal-contractHeader').html(data);
									
									$('.closeContract').on('click',function(){
										$('#modal-contractDetail').css('display','none');
									});
									
									content += '<table class="contractDetailTable">';
									content += '<tr>';
									content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
									content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
									content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
									if(sessionId==sellerId){
										content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
										content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
										content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									if(serverData.startDate==null){
										content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
										if(sessionId=spacerId){
											content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
										}
										content += '</td>';
										content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
									} else {
										content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
										content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
									}
									content += '</tr>';
									content += '</table>';
									
									$('#modal-contractContent').html(content);
									
									insertDiv();
								}
							});
						}
					});
					$('.insertAmount').val("");
					$('#insertDivSold').css('display','none');
				});
			}
		});
		
		$('.btnInsertStock').on('click',function(){
			var status = document.getElementById("insertDivStock").style.display;
			if(status=='block'){
				$('#insertDivStock').css('display','none');
			} else {
				$('#insertDivStock').css('display','block');
				var contractnum = $(this).attr('data-sno');
				$('#insertBtnStock').off('click');
				$('#insertBtnStock').on('click',function(){
					var stockCount = $('#insertAmountStock').val(); 
					$.ajax({
						url:"updateContract",
						data:{contractnum:contractnum,
							  stockCount:stockCount},
						type:"get",
						success:function(serverData){
							var data = "";
							var content = "";
							var sellerId = serverData.sellerId;
							var spacerId = serverData.spacerId;
							var sessionId = $('#sessionId').val();
							var sellerNickname = "";
							var spacerNickname = "";
							$.ajax({
								url:"searchNickname",
								data:{sellerId:sellerId,
									  spacerId:spacerId},
								type:"get",
								success:function(search){
									$.each(search,function(index,item){
										if(sellerNickname==""){
											sellerNickname=item;
										} else {
											spacerNickname=item;
										}
									});
									data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
									$('#modal-contractHeader').html(data);
									
									$('.closeContract').on('click',function(){
										$('#modal-contractDetail').css('display','none');
									});
									
									content += '<table class="contractDetailTable">';
									content += '<tr>';
									content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
									content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
									content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
									if(sessionId==sellerId){
										content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
										content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
										content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									if(serverData.startDate==null){
										content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
										if(sessionId=spacerId){
											content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
										}
										content += '</td>';
										content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
									} else {
										content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
										content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
									}
									content += '</tr>';
									content += '</table>';
									
									$('#modal-contractContent').html(content);
									
									insertDiv();
								}
							});
						}
					});
					$('.insertAmount').val("");
					$('#insertDivStock').css('display','none');
				});
			}
		});
		
		$('.btnInsertOrder').on('click',function(){
			var status = document.getElementById("insertDivOrder").style.display;
			if(status=='block'){
				$('#insertDivOrder').css('display','none');
			} else {
				$('#insertDivOrder').css('display','block');
				var contractnum = $(this).attr('data-sno');
				$('#insertBtnOrder').off('click');
				$('#insertBtnOrder').on('click',function(){
					var orderCount = $('#insertAmountOrder').val(); 
					$.ajax({
						url:"updateContract",
						data:{contractnum:contractnum,
							  orderCount:orderCount},
						type:"get",
						success:function(serverData){
							var data = "";
							var content = "";
							var sellerId = serverData.sellerId;
							var spacerId = serverData.spacerId;
							var sessionId = $('#sessionId').val();
							var sellerNickname = "";
							var spacerNickname = "";
							$.ajax({
								url:"searchNickname",
								data:{sellerId:sellerId,
									  spacerId:spacerId},
								type:"get",
								success:function(search){
									$.each(search,function(index,item){
										if(sellerNickname==""){
											sellerNickname=item;
										} else {
											spacerNickname=item;
										}
									});
									data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
									$('#modal-contractHeader').html(data);
									
									$('.closeContract').on('click',function(){
										$('#modal-contractDetail').css('display','none');
									});
									
									content += '<table class="contractDetailTable">';
									content += '<tr>';
									content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
									content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
									content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
									if(sessionId==sellerId){
										content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
										content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
										content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
									if(sessionId==spacerId){
										content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
										content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
									}
									content += '</td>';
									content += '</tr>';
									content += '<tr>';
									if(serverData.startDate==null){
										content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
										if(sessionId=spacerId){
											content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
										}
										content += '</td>';
										content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
									} else {
										content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
										content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
									}
									content += '</tr>';
									content += '</table>';
									
									$('#modal-contractContent').html(content);
									
									insertDiv();
								}
							});
						}
					});
					$('.insertAmount').val("");
					$('#insertDivOrder').css('display','none');
				});
			}
		});
		
		$('.startContract').on('click',function(){
			var contractnum=$(this).attr('data-sno');
			var contractPeriod=$('#contractPeriod').val();
			var endDate = "";
			if(contractPeriod=='1주'){
				endDate = "7";
			} else if(contractPeriod=="2주"){
				endDate = "14";
			} else if(contractPeriod=="1개월"){
				endDate = "30";
			} else if(contractPeriod=="2개월"){
				endDate = "60";
			} else if(contractPeriod=="3개월"){
				endDate = "90";
			} else if(contractPeriod=="6개월"){
				endDate = "180";
			} else if(contractPeriod=="1년"){
				endDate = "365";
			}
			$.ajax({
				url:"startContract",
				data:{contractnum:contractnum,
					  endDate:endDate},
				type:"get",
				success:function(serverData){
					var data = "";
					var content = "";
					var sellerId = serverData.sellerId;
					var spacerId = serverData.spacerId;
					var sessionId = $('#sessionId').val();
					var sellerNickname = "";
					var spacerNickname = "";
					$.ajax({
						url:"searchNickname",
						data:{sellerId:sellerId,
							  spacerId:spacerId},
						type:"get",
						success:function(search){
							$.each(search,function(index,item){
								if(sellerNickname==""){
									sellerNickname=item;
								} else {
									spacerNickname=item;
								}
							});
							data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+"X"+spacerNickname+'</h5><span class="closeContract">&times;</span>';
							$('#modal-contractHeader').html(data);
							
							$('.closeContract').on('click',function(){
								$('#modal-contractDetail').css('display','none');
							});
							
							content += '<table class="contractDetailTable">';
							content += '<tr>';
							content += '<td class="td-contractDetail1">공간이름 : '+spacerNickname+'</td>';
							content += '<td class="td-contractDetail2">공간분류 : '+serverData.spaceType+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="td-contractDetail1" colspan="2">상세주소 : '+serverData.spaceaddr1+' '+serverData.spaceaddr2+'</td>'
							content += '</tr>';
							content += '<tr>';
							content += '<td class="td-contractDetail1">셀러이름 : '+sellerNickname+'</td>';
							content += '<td class="td-contractDetail2">셀러분류 : '+serverData.sellerType+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="td-contractDetail1">계약기간 : '+serverData.contractPeriod+'<input type="hidden" id="contractPeriod" value="'+serverData.contractPeriod+'"></td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="td-contractDetail1">현재 재고수 : '+serverData.stockCount+'개';
							if(sessionId==sellerId){
								content += '<button type="button" class="btnInsertStock" data-sno="'+serverData.contractnum+'">입고</button>';
								content += '<div class="insertDiv" id="insertDivStock"><input type="number" class="insertAmount" id="insertAmountStock"><button type="button" id="insertBtnStock">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
							}
							content += '</td>';
							content += '<td class="td-contractDetail2">추가 요청수 : '+serverData.orderCount+'개';
							if(sessionId==spacerId){
								content += '<button type="button" class="btnInsertOrder" data-sno="'+serverData.contractnum+'">요청</button>';
								content += '<div class="insertDiv" id="insertDivOrder"><input type="number" class="insertAmount" id="insertAmountOrder"><button type="button" id="insertBtnOrder">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
							}
							content += '</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="td-contractDetail1">판매수 : '+serverData.soldCount+'개';
							if(sessionId==spacerId){
								content += '<button type="button" class="btnInsertSold" data-sno="'+serverData.contractnum+'">입력</button>';
								content += '<div class="insertDiv" id="insertDivSold"><input type="number" class="insertAmount" id="insertAmountSold"><button type="button" id="insertBtnSold">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
							}
							content += '</td>';
							content += '<td class="td-contractDetail2">판매액 : '+serverData.sales+'원';
							if(sessionId==spacerId){
								content += '<button type="button" class="btnInsertSales" data-sno="'+serverData.contractnum+'">입력</button>';
								content += '<div class="insertDiv" id="insertDivSales"><input type="number" class="insertAmount" id="insertAmountSales"><button type="button" id="insertBtnSales">입력</button><table class="insertTable"><tr><td><button class="7">7</button></td><td><button class="8">8</button><td><td><button class="9">9</button></td></tr><tr><td><button class="4">4</button></td><td><button class="5">5</button><td><td><button class="6">6</button></td></tr><tr><td><button class="1">1</button></td><td><button class="2">2</button><td><td><button class="3">3</button></td></tr><tr><td><button class="jum">.</button></td><td><button class="0">0</button><td><td><button class="C">C</button></td></tr></table></div>';
							}
							content += '</td>';
							content += '</tr>';
							content += '<tr>';
							if(serverData.startDate==null){
								content += '<td class="td-contractDetail1">시작일 : 공간제공자가 시작버튼을 누르면 계약이 진행됩니다.';
								if(sessionId=spacerId){
									content += '<button type="button" class="startContract" data-sno="'+serverData.contractnum+'">판매 시작</button>';
								}
								content += '</td>';
								content += '<td class="td-contractDetail2">종료일 : 시작버튼을 누르면 계약 기간만큼 계약이 진행됩니다.</td>';
							} else {
								content += '<td class="td-contractDetail1">시작일 : '+serverData.startDate+'</td>';
								content += '<td class="td-contractDetail2">종료일 : '+serverData.endDate+'</td>';
							}
							content += '</tr>';
							content += '</table>';
							
							$('#modal-contractContent').html(content);
							
							insertDiv();
						}
					});
				}
			});
		});
	}
	
	$('.goHanasi').off('click');
	$('.goHanasi').on('click',function(){
		var contractnum = $(this).attr('data-sno');
		var spacerNickname = $('#spacerNickname'+contractnum).val();
		var sellerNickname = $('#sellerNickname'+contractnum).val();
		var spacerId = $('#spacerId'+contractnum).val();
		var sellerId = $('#sellerId'+contractnum).val();
		var memberType = $('#sessionMemberType').val();
		$('#hanasiInputText').val("");
		var data = "";
		var content = "";
		$.ajax({
			url:"listHanasi",
			data:{contractnum:contractnum},
			type:"get",
			success:function(serverData){
				content="";
				if(memberType=='셀러'){
					$.each(serverData,function(index,item){
						if(item.sendId==spacerId){
							content += '<table class="hanasiTable">';
							content += '<tr>';
							content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
							content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiDate">'+item.indate+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiNickname" colspan="2">'+spacerNickname+'</td>';
							content += '</tr>';
							content += '</table>';
						} else if(item.sendId==sellerId){
							content += '<table class="hanasiTable">';
							content += '<tr>';
							content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
							content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiDate2">'+item.indate+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiNickname2" colspan="2">'+sellerNickname+'</td>';
							content += '</tr>';
							content += '</table>';
						}
					});
				} else {
					$.each(serverData,function(index,item){
						if(item.sendId==sellerId){
							content += '<table class="hanasiTable">';
							content += '<tr>';
							content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
							content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiDate">'+item.indate+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiNickname" colspan="2">'+sellerNickname+'</td>';
							content += '</tr>';
							content += '</table>';
						} else if(item.sendId==spacerId){
							content += '<table class="hanasiTable">';
							content += '<tr>';
							content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
							content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiDate2">'+item.indate+'</td>';
							content += '</tr>';
							content += '<tr>';
							content += '<td class="hanasiNickname2" colspan="2">'+spacerNickname+'</td>';
							content += '</tr>';
							content += '</table>';
						}
					});
				}
				$("#modal-hanasiContent").scrollTop($("#modal-hanasiContent")[0].scrollHeight);
				$('#modal-hanasiContent').html(content);
			}
		});
		$('#modal-contractHanasi').css('display','block');
		
		if(memberType=='셀러'){
			data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+spacerNickname+'님과의 대화</h5><span class="closeHanasi">&times;</span>';
		} else {
			data += '<img class="imgContract" src="resources/images/logo.png"><h5 class="contractHeader">'+sellerNickname+'님과의 대화</h5><span class="closeHanasi">&times;</span>';
		}
		$('#modal-hanasiHeader').html(data);
		
		
		$('#btnHanasiInput').off('click');
		$('#btnHanasiInput').on('click',function(){
			var message = $('#hanasiInputText').val();
			var sendId, receiveId, sendNickname, receiveNickname;
			if(memberType=='셀러'){
				sendId = sellerId;
				receiveId = spacerId;
				sendNickname = sellerNickname;
				receiveNickname = spacerNickname;
			} else {
				sendId = spacerId;
				receiveId = sellerId;
				sendNickname = spacerNickname;
				receiveNickname = sellerNickname;
			}
			$.ajax({
				url:"insertHanasi",
				data:{contractnum:contractnum,
					  sendId:sendId,
					  receiveId:receiveId,
					  sendNickname:sendNickname,
					  receiveNickname:receiveNickname,
					  message:message},
				type:"get",
				success:function(serverData){
					$('#hanasiInputText').val("");
					content="";
					if(memberType=='셀러'){
						$.each(serverData,function(index,item){
							if(item.sendId==spacerId){
								content += '<table class="hanasiTable">';
								content += '<tr>';
								content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
								content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiMessage">'+item.indate+'</td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiNickname" colspan="2">'+spacerNickname+'</td>';
								content += '</tr>';
								content += '</table>';
							} else if(item.sendId==sellerId){
								content += '<table class="hanasiTable">';
								content += '<tr>';
								content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
								content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiMessage2">'+item.indate+'</td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiNickname2" colspan="2">'+sellerNickname+'</td>';
								content += '</tr>';
								content += '</table>';
							}
						});
					} else {
						$.each(serverData,function(index,item){
							if(item.sendId==sellerId){
								content += '<table class="hanasiTable">';
								content += '<tr>';
								content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
								content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiMessage">'+item.indate+'</td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiNickname" colspan="2">'+sellerNickname+'</td>';
								content += '</tr>';
								content += '</table>';
							} else if(item.sendId==spacerId){
								content += '<table class="hanasiTable">';
								content += '<tr>';
								content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
								content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiMessage2">'+item.indate+'</td>';
								content += '</tr>';
								content += '<tr>';
								content += '<td class="hanasiNickname2" colspan="2">'+spacerNickname+'</td>';
								content += '</tr>';
								content += '</table>';
							}
						});
					}
					$("#modal-hanasiContent").scrollTop($("#modal-hanasiContent")[0].scrollHeight);
					$('#modal-hanasiContent').html(content);
				}
			});
		});
		
		$('#hanasiInputText').keydown(function(key) {
			if (key.keyCode == 13) {
				var message = $('#hanasiInputText').val();
				var sendId, receiveId, sendNickname, receiveNickname;
				if(memberType=='셀러'){
					sendId = sellerId;
					receiveId = spacerId;
					sendNickname = sellerNickname;
					receiveNickname = spacerNickname;
				} else {
					sendId = spacerId;
					receiveId = sellerId;
					sendNickname = spacerNickname;
					receiveNickname = sellerNickname;
				}
				$.ajax({
					url:"insertHanasi",
					data:{contractnum:contractnum,
						  sendId:sendId,
						  receiveId:receiveId,
						  sendNickname:sendNickname,
						  receiveNickname:receiveNickname,
						  message:message},
					type:"get",
					success:function(serverData){
						$('#hanasiInputText').val("");
						content="";
						if(memberType=='셀러'){
							$.each(serverData,function(index,item){
								if(item.sendId==spacerId){
									content += '<table class="hanasiTable">';
									content += '<tr>';
									content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
									content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiMessage">'+item.indate+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiNickname" colspan="2">'+spacerNickname+'</td>';
									content += '</tr>';
									content += '</table>';
								} else if(item.sendId==sellerId){
									content += '<table class="hanasiTable">';
									content += '<tr>';
									content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
									content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiMessage2">'+item.indate+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiNickname2" colspan="2">'+sellerNickname+'</td>';
									content += '</tr>';
									content += '</table>';
								}
							});
						} else {
							$.each(serverData,function(index,item){
								if(item.sendId==sellerId){
									content += '<table class="hanasiTable">';
									content += '<tr>';
									content += '<td class="hanasiProfile" rowspan="2"><img class="receiveProfile" src="resources/images/seller.png"></td>';
									content += '<td class="hanasiMessage"><span class="span-message">'+item.message+'</span></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiMessage">'+item.indate+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiNickname" colspan="2">'+sellerNickname+'</td>';
									content += '</tr>';
									content += '</table>';
								} else if(item.sendId==spacerId){
									content += '<table class="hanasiTable">';
									content += '<tr>';
									content += '<td class="hanasiMessage2"><span class="span-message2">'+item.message+'</span></td>';
									content += '<td class="hanasiProfile2" rowspan="2"><img class="receiveProfile" src="resources/images/spacer.png"></td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiMessage2">'+item.indate+'</td>';
									content += '</tr>';
									content += '<tr>';
									content += '<td class="hanasiNickname2" colspan="2">'+spacerNickname+'</td>';
									content += '</tr>';
									content += '</table>';
								}
							});
						}
						$("#modal-hanasiContent").scrollTop($("#modal-hanasiContent")[0].scrollHeight);
						$('#modal-hanasiContent').html(content);
					}
				});
			}
		});
		
		$('.closeHanasi').on('click',function(){
			$('#modal-contractHanasi').css('display','none');
			$('#hanasiInputText').val("");
		});
	});
}



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
	
	$("#btnSearchM").on("click", function(){
		$.ajax({
			url:"goMap",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				map();
			}
		});
	});
	
	
	$("#btnNotice").on("click",function(){
		var status = document.getElementById("notice").style.display;
		barclose();
		if(status != 'block'){   
			document.getElementById("notice").style.display = 'block'
		}
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
	
	
	$("#loginId,#loginPw").keydown(function(key) {
		if (key.keyCode == 13) {
			login();
		}
	});

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
	
	$('#checkId').on('click',function(){
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
		keywordSet();
		img();
		contractPeriodSet();
		insertProposal();
	}
	
	if($('.udtProposal').length!=0){
		proposal();
	}
	
	if($('#btnProposalUpdate').length!=0){
		typeSet();
		keywordSet();
		img();
		contractPeriodSet();
		proposal();
	}
	
	if($('#btnRegistBoard').length!=0){
		userBoard();
		$("#btnRegistBoard").on('click',function(){
			document.getElementById("modal-userBoard-proposalList").style.display = "block";
		});
	}
	
	if($('#contract-online').length!=0){
		boardDetail();
	}
	
});

function extraInfo(){
	$("#btnExtraInsert").on('click', function(){
		var id = $("#id").val();
		var membertype = $("#membertype").val();
		var name = $("#name").val();
		var tel = $("#tel").val();
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
		
		$("#imgForm").submit();
		
	});
}

function udt(){
	alert("udt");
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
}

function map(){
	if(typeof daum !== 'undefined'){
		//지도 관련
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		var marker = null;
		var mapContainer = document.getElementById('map_map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(37.513220, 127.058581), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(serverData) {
				$.each(serverData, function(index,item){
					//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
					markerPosition = new daum.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
					//마커를 생성합니다
					marker = new daum.maps.Marker({
					position: markerPosition,
					image: markerImage // 마커이미지 설정 
					});
					
					marker.setMap(map);
					markers.push(marker);  // 배열에 생성된 마커를 추가합니다
				});
			}
			
			function panTo() {
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
				$.ajax({
					url:"clickBtn1",
					data:{spacename:"aaa"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						addMarker(serverData);
					}
				});
			});
			 
			$('#map_btn2').on('click',function(){
				$.ajax({
					url:"clickBtn2",
					data:{spacename:"bbb"},
					type:"get",
					success:function(serverData){
						removeMarker(); 
						addMarker(serverData);
					}
				});
			});
			
			$('#map_btnMyPos').on('click', function(){
				panTo();
			});
		

	}
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
		var precaution=$('#precaution').val();
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
		var precaution=$('#precaution').val();
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
		$.ajax({
			url:"goBoardWrite",
			data:{proposalnum:checked_radio},
			type:"post",
			success:function(serverData){
				$('#userBoard-proposalListDiv').html(serverData);
				contractPeriodSet();
				keywordSet();
				typeSet();
				img();
				
				$('#btnBoardWrite').on('click',function(){
					var membertype=$('#form_membertype').val();
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
					var keyword = "";
					for(var i=1; i<=5; i++){
						if($('#keywordContent'+i).val!=""){
							keyword += "&"+$('#keywordContent'+i).val();
						}
					}
					var comments=$('#comments').val();
					var precaution=$('#precaution').val();
					var contractPeriod = "";
					for(var i=1; i<=7; i++){
						if($('#contractPeriod'+i).val!=""){
							optime += "&"+$('#contractPeriod'+i).val();
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
		});
		
	});
	
	$(".udtuserBoard").on('click',function(){
		var clickNo = $(this).attr('data-sno');
		$.ajax({
			url:"goBoardWrite2",
			data:{clickNo:clickNo},
			type:"get",
			success:function(serverData){
				location.href="goUpdateBoard?clickNo="+clickNo;
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
	
	function offdayFilter(){
		$(".offday-a").on('click',function(){
			var clickNo = $(this).attr('data-sno');
			var status = document.getElementById("offday"+clickNo).style.color;
			if(status=='rgb(240, 94, 34)'){
				$('#offday'+clickNo).css('color','gray');
				$('#offday-icon'+clickNo).css('color','gray');
				var offday = $('#offday'+clickNo).text();
				$('#selectedoffday'+clickNo).remove();
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
		var membertype=$('#membertype').val();
		var type = $('#type').val();
		if(count>4){
			alert("5개이상선택할수없습니다.");
		} else{
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
				$('#keywordCount').css('color','#2a3f52')
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
							$('#keyword'+i).css('color','#F05E22');
							$('#keyword-icon'+i).css('color','#F05E22');
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
				$('#keyword-icon'+clickNo).css('color','gray');
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
					$('#keyword-icon'+clickNo).css('color','#F05E22');
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
			$('#keyword-icon'+delNo).css('color','gray');
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
	var imgs;
	var img_count;
	var img_position = 1;
	
	imgs = $(".boardDetail-image ul");
	img_count = imgs.children().length;
	
	$('#board-content-image-slider-left').click(function(){
		back();
	});
	
	$('#board-content-image-slider-right').click(function(){
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
				$('.contractWindow2').css('display','none');  
			} else {
				$('.contractWindow2').css('display','block'); 
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
    	$('#modal-board-qna').css('display','block');
    });
    
    $('.closeQna').on('click',function(){
    	$('#modal-board-qna').css('display','none');
    });
    
    $('#qna-cancel').on('click',function(){
    	$('#modal-board-qna').css('display','none');
    });
    
    $('#qna-regist').on('click',function(){
    	//댓글작성하기만들것
    	
    });
	
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



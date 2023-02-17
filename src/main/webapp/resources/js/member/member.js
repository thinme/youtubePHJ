/**
 * 
 */
$(document).ready(function(){

	//login(로그인)
	$("#loginBtn").on("click", function(){
		$.ajax({
			url: getContextPath() + "/loginChk",
			type: "POST",
			data: $("#loginFrm").serialize(),
			dataType: "text",
			async: false,
			success: function(result){
				if(result == "Y"){
					alert("성공적으로 로그인되었습니다.");
					$("#loginFrm").attr("action", getContextPath());
				}else{
					alert("아이디와 비밀번호를 확인하세요");
				}
			},
		    error:function(request, status, error){
		        alert("code : " + request.status);
				alert("message : " + request.responseText);
				alert("error : " + error);       
			}
		});
	});

	//회원가입하러가기
	$("#goRegMemberBtn").on("click", function(){
		location.href = getContextPath() +"/registerMemberForm";
	});
	
	//registerMember(회원가입)
	$("#regMemberBtn").on("click", function(){
		var ans = confirm("가입하시겠습니까?");
		$.ajax({
			url: getContextPath() + "/registerMember",
			type: "POST",
			async: false,
			data: $("#regMemberFrm").serialize(),
			success: function(data){
				if(ans){
					if(data.registerCnt > 0){
						alert("성공적으로 회원가입되었습니다.");
						$("#regMemberFrm").attr("action", getContextPath() + "/login");
					}else{
						alert("회원가입에 실패하였습니다.");
					}
				}
			},
		    error:function(request, status, error){
		        alert("code : " + request.status);
				alert("message : " + request.responseText);
				alert("error : " + error);       
			}
		});
	});
	
	// updateMember(회원수정)
	$("#uptMemberBtn").on("click", function(){
		var ans = confirm("수정하시겠습니까?");
		var memberIdx = $("#memberIdx").val();
		console.log(memberIdx);
		$.ajax({
			url: getContextPath() + "/updateMember",
			type: "POST",
			data: $("#memberUpFrm").serialize(),
			success: function(data){
				if(ans){
						alert("성공적으로 수정되었습니다.");
						location.href= getContextPath() + "/memberList";
					}else{
						alert("수정하는데 실패하였습니다.");
					}
				
			},
			error: function(){  
				alert("수정 실패");  
			}
		});
	});
	
	
	// deleteMember(회원삭제)
	$("#delMemberBtn").on("click", function(){
		var ans = confirm("삭제하시겠습니까?");
		var memberIdx = $("#memberIdx").val();
		$.ajax({
			url: getContextPath() + "/deleteMember",
			data: "memberIdx="+memberIdx,
			type: "GET",
			success: function(data){
				if(ans){
					if(data.cnt > 0){
						alert("성공적으로 삭제되었습니다.");
						location.href = getContextPath() + "/memberList";
					}else{
						alert("삭제하는데 실패하였습니다.");
					}
				}
			},
			error: function(){  
				alert("삭제 실패");  
			}
		});
	});
	
//deleteChkMember(회원선택삭제)
	$("#delChkMember").on("click", function(){
		deleteCheckList()
	});
});

/*회원 검색 리스트 조회*/
function memberSearchList(){
	$("#searchFrm").submit();
}

/*회원 상세 정보 이동*/
function goMemberDetail(idx){
	location.href = getContextPath() + "/memberDetail?memberIdx=" + idx;
}

/*회원 수정 정보 이동*/
function goUpdateMember(idx){
	location.href = getContextPath() + "/updateMemberForm?memberIdx=" + idx;
}


/*유효성검사*/
function validation(){
		/*아이디 유효성 검사*/
		$("#inputId").on("keyup", function(){
			var memberId = $("#inputId").val().trim();
			if(memberId != ""){
				$.ajax({
					url: getContextPath() + "/loginDplChk",
					type:"GET",
					data: "memberId="+memberId,
					success: function(result){
						if (result == 0) {
							var regExp = /^[a-z0-9]{1}[a-z0-9]{4,19}$/;
							var regResult = regExp.test($("#inputId").val().trim());
							if(regResult){
								$("#idChkresult").css("color", "green");
		                    	$("#idChkresult").text("사용 가능한 아이디입니다.");
							}else{
								$("#idChkresult").css("color", "red");
		                    	$("#idChkresult").text("5~20자의 영문 소문자, 숫자만 사용가능합니다.");							
								$("#idChkresult").text("");
							}
	                	}else{
							$("#idChkresult").css("color", "red");
	                    	$("#idChkresult").text("이미 사용중인 아이디이거나 탈퇴한 아이디입니다.");
	                	}
					},
					error:function(request,status,error){
				       
					}       
				});
			}else{
				$("#idChkresult").css("color", "red");
				$("#idChkresult").text("필수정보입니다.");
				$("#inputId").focus();
				return false;
			}
		});
		
		/*비밀번호 유효성검사*/
		$("#inputPswd").blur(function(){
			if($("#inputPswd").val().trim() == ""){
				$("#pswdChkresult").css("color", "red");
				$("#pswdChkresult").text("필수정보입니다.");
				$("#userPswd").focus();
				return false;
			}else{
				$("#pswdChkresult").text("");
			}
		});
		
		/*비밀번호확인 유효성검사*/
		$("#inputPswdChk").blur(function(){	   
			if($("#inputPswdChk").val().trim() != ""){		    
				if($("#inputPswd").val().trim() != $("#inputPswdChk").val().trim()){
					$("#pswdDblChkresult").css("color", "red");	    	
					$("#pswdDblChkresult").text("비밀번호가 일치하지 않습니다.");	    	    
					$("#inputPswdChk").val("");	          
					$("#inputPswdChk").focus();      
				}else{
					$("#pswdDblChkresult").text("");	
				}	    
			}else{
				$("#pswdDblChkresult").text("필수정보입니다.");
			}	
		});
		
		/*이름 유효성검사*/
		$("#inputName").blur(function(){
			if($("#inputName").val().trim() == ""){
				$("#nameChkresult").css("color", "red");
				$("#nameChkresult").text("필수정보입니다.");
				$("#inputName").focus();
				return false;
			}else{
				$("#nameChkresult").text("");
			}
		});
		
		/*성별 유효성검사*/
		$("#selectGender").blur(function(){
			if($("#selectGender").val().trim() == ""){
				$("#genderChkresult").css("color", "red");
				$("#genderChkresult").text("필수정보입니다.");
				$("#selectGender").focus();
				return false;
			}else{
				$("#genderChkresult").text("");
			}
		});
		
		/*이메일 유효성검사*/
		$("#inputEmail").blur(function(){
			if($("#inputEmail").val().trim() == ""){
				$("#emailChkresult").css("color", "red");
				$("#emailChkresult").text("필수정보입니다.");
				$("#inputEmail").focus();
				return false;
			}else{
				var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
				var regResult = regExp.test($("#inputEmail").val().trim());
				if(!regResult){
					$("#emailChkresult").css("color", "red");
					$("#emailChkresult").text("잘못된 이메일 형식입니다.");
				}else{
					$("#emailChkresult").text("");
				}
			}
		});

		/*채널명 유효성검사*/
		$("#inputChannelName").blur(function(){
			if($("#inputChannelName").val().trim() == ""){
				$("#channelChkresult").css("color", "red");
				$("#channelChkresult").text("필수정보입니다.");
				$("#inputChannelName").focus();
				return false;
			}else{
				$("#channelChkresult").text("");
			}
		});
		
	}
	
/* 선택 삭제 */
function deleteCheckList(){
	var checkedArr = new Array();
	var list = $("input[name='check']");
	
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			checkedArr.push(list[i].value);
		}
	}
	if(checkedArr.length == 0){
		alert("선택된 항목이 없습니다.");
	}else{
		var chk = confirm("해당 게시글을 삭제하시겠습니까?");
		$.ajax({
			url : getContextPath() + "/deleteChkMember",
			type: "POST",
			traditional : true, // 배열넘기기 option
			data : {
				checkedArr : checkedArr
			},
			success :  function(result){
				alert("성공적으로 삭제되었습니다.");
				location.href = getContextPath() + "/memberList";
			},
			error: function(){  
				alert("삭제 실패");  
			}
		});
	}
}


 

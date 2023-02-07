// 페이지 로드시 바로 실행
$(window).on("load", function(){
	
	// 체크 이벤트
	checkEve();
	// 버튼 이벤트
	btnEve();
	
	// 자동완성 끄기
	$("input").prop("autocomplete","off");
	
});

var checkEve = function(){

	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")) $("input[name=check]").prop("checked", true);
		else $("input[name=check]").prop("checked", false);
	});
	
	$("input[name=check]").click(function() {
		var total = $("input[name=check]").length;
		var checked = $("input[name=check]:checked").length;

		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true); 
		
	});
	
}

var btnEve = function(){	
	
	$("#goLoginBtn").click(function(){
		location.href = getContextPath() + "/login";
	});
	
	$("#goRegisterVideo").click(function(){
		location.href = getContextPath() + "/registerVideoForm";
	});
	
} 

/* 절대 경로 */
function getContextPath(){
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;		
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}


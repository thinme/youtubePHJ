/**
 * 
 */
 $(document).ready(function(){
 
 	$("#goMemberList").on("click", function(){
		location.href = getContextPath() + "/memberList";
	});
 
 	// videoDetail - videoContents 더보기 및 간략히 기능
 	$("#showMore").on("click", function(){
 		var originText = document.getElementById("textarea-vContents");
		var showMoreText = document.getElementById("textarea-vContents-more");
	    
	    if(showMoreText.style.display === "none"){
	    	originText.style.display = "none";
	    	showMoreText.style.display = "block";
	 		$("#showMore").text("간략히");
	 		$("#showMore").css("font-size", "12px");
	    }else{
	 		$("#showMore").text("더보기");
	 		originText.style.display = "block";
	    	showMoreText.style.display = "none";
	    }
	 });
 	
 	// videoList - memberChannelName(채널명 hover시 tooltip으로 채널명 보여줌)
	$('[data-toggle="tooltip"]').tooltip(); 
	
	// registerVideo(영상등록)
	$("#regVideoBtn").unbind().on("click", function(){
		$.ajax({
			url: getContextPath() + "/registerVideo",
			type:"POST",
			async: false,
			data: $("#regVideoFrm").serialize(),
			success: function(data){
				if(data.resultCnt > 0){
					alert("성공적으로 등록되었습니다.");
					$("#regVideoFrm").attr("action", getContextPath());
				}else{
					alert("등록하는데 실패하였습니다.");
				}
			},
			error: function(){  
				alert("등록 실패");  
			}
		});
	});
	
	// updateVideo(영상수정)
	$("#updVideoBtn").on("click", function(){
		var ans = confirm("수정하시겠습니까?");
		var videoIdx = $("#videoIdx").val();
		$.ajax({
			url: getContextPath() + "/updateVideo",
			type:"POST",
			data: $("#uptVideoFrm").serialize(),
			success: function(data){
				if(ans){
					if(data.resultCnt > 0){
						alert("성공적으로 수정되었습니다.");
						location.href = getContextPath();
					}else{
						alert("수정하는데 실패하였습니다.");
					}
				}
			},
			error: function(){  
				alert("수정 실패");  
			}
		});
	});
	
	// deleteVideo(영상삭제)
	$("#delVideoBtn").on("click", function(){
		var ans = confirm("삭제하시겠습니까?");
		var videoIdx = $("#videoIdx").val();
		$.ajax({
			url: getContextPath() + "/deleteVideo",
			data: "videoIdx="+videoIdx,
			type: "GET",
			success: function(data){
				if(ans){
					if(data.resultCnt > 0){
						alert("성공적으로 삭제되었습니다.");
						location.href = getContextPath();
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
	
	// registerComment(댓글등록)
	$("#regCommentBtn").on("click", function(){
		$.ajax({
			url: getContextPath() + "/registerComment",
			type:"POST",
			async: false,
			data: $("#regCommentFrm").serialize(),
			success: function(data){
				if(data.resultCnt > 0){
					$("#commentCnt").text(data.cmtCnt);
					$("#comment").val("");
					$("#commentBtn").hide();
					
					$("#row-comment").text("");
					resultHtmlComment(data.commentList);
				}else{
					alert("등록하는데 실패하였습니다.");
				}
			},
			error: function(){  
				alert("등록 실패");  
			}
		});
	});
	
	// show more comment(댓글 자세히 보기)
	$(document).on("click", "#showMoreCmnt", function(){
 		var shortComment = document.getElementById("shortComment");
		var orginComment = document.getElementById("orginComment");
	    
	    if(orginComment.style.display === "none"){
	    	shortComment.style.display = "none";
	    	orginComment.style.display = "block";
	 		$("#showMoreCmnt").text("간략히");
	    }else{
	 		$("#showMoreCmnt").text("자세히 보기");
	 		shortComment.style.display = "block";
	    	orginComment.style.display = "none";
	    }
	 });
	
});

// deleteComment(답글삭제)
function delComment(commentIdx){
	var ans = confirm("삭제하시겠습니까?");
	$("#commentIdx").val(commentIdx);
	$.ajax({
		url: getContextPath() + "/deleteComment",
		//data: "commentIdx="+commentIdx,
		data: $("#commentFrm").serialize(),
		type: "GET",
		success: function(data){
			if(ans){
				if(data.resultCnt > 0){
					alert("성공적으로 삭제되었습니다.");
					$("#row-comment").text("");
					resultHtmlComment(data.commentList);
				}else{
					alert("삭제하는데 실패하였습니다.");
				}
			}
		},
		error: function(){  
			alert("삭제 실패");  
		}
	});
}

// videoList -> videoDetail로 이동
function goVideoDetail(videoIdx){
	location.href = getContextPath() + "/videoDetail?videoIdx=" + videoIdx;
}

// videoDetail -> updateVideo로 이동
function goUptVideo(videoIdx){
	location.href = getContextPath() + "/updateVideoForm?videoIdx=" + videoIdx;
}

// videoList(Home)에서 무한스크롤
function videoList(nowPage){
	$("#page").val(nowPage);
    $.ajax({
        url : getContextPath() + "/videoList",
        type : 'POST',  
        datatype : 'text',
        data : $("#listFrm").serialize(),
        success : function(data) {
        	var list = data.list
        	var page = data.paging
			
			resultHtml(list);      	        	
		},
       error:function(request,status,error){
		        alert("code:" + request.status);
				alert("message:" + request.responseText);
				alert("error:" + error);       
			}
    }); 

}

// videoDetail(오른쪽)에서 무한스크롤
function videoListDetail(nowPage){
	$("#page").val(nowPage);
    $.ajax({
        url : getContextPath() + "/videoListDetail",
        type : 'POST',  
        datatype : 'text',
        data : $("#detailFrm").serialize(),
        success : function(data) {
        	var list = data.list
        	var page = data.paging
			
			resultHtmlDetail(list);      	        	
		},
       error:function(request,status,error){
		        alert("code:" + request.status);
				alert("message:" + request.responseText);
				alert("error:" + error);       
			}
    }); 
}

// videoList 화면 그리기 호출
function resultHtml(data){
	var html = "";
	
	$.each(data , function(i){
    	html += '<div class="col-xl-3 col-md-6">';
    	html += '<div class="card bg-dark text-white mb-4">';
    	html += '<div class="row-cols-sm-1">';
    	html += '<img class="goDetail" onclick="goVideoDetail('+data[i].videoIdx+')" src="http://img.youtube.com/vi/' + data[i].videoIdentifiedId + '/maxresdefault.jpg"></img>';
    	html += '</div>';
    	html += '<div class="card-body-mod align-items-center justify-content-end">';
    	html += '<div class="col-sm-2 float-start">';
    	html += '<div class="small ps-1">';
    	html += '<span class="p-img">';
    	html += '<img class="goChannel" id="profile" src="' + getContextPath() + '/resources/assets/img/YouTube.png"></img>';
    	html += '</span>';
    	html += '</div>';
    	html += '</div>';
  	 	html += '<div class="col-sm-10 ps-2 float-end">';
	    html += '<div class="small text-white">';
    	//if(data[i].videoTitle.length > 40){
	    //	html += '<span class="goDetail" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle.substring(0,38) + '...</span>';
    	//}else{
	    //	html += '<span class="goDetail" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle + '</span>';
    	//}
    	html += '<span class="goDetail" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle + '</span>';
    	html += '</div>';
    	html += '<a class="small text-white-50" id="goChannel" href="#" data-toggle="tooltip" title="' + data[i].member.memberChannelName + '">';
    	html += '<small><span id="channelName">' + data[i].member.memberChannelName + '</span></small>';
    	html += '</a>';
    	html += '<div class="small text-white-50">';
    	html += '<small>조회수 ' + data[i].videoViewCnt + '회 · ' + data[i].videoRegdate_change + '</small>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    });
    
    $('.row').append(html);
	
}

// videoDetail 화면 그리기 호출
function resultHtmlDetail(data){
	var html = "";
	
	$.each(data , function(i){
    	html += '<div class="row mb-3">';
    	html += '<div class="align-items-center justify-content-end">';
    	html += '<div class="col-sm-5 float-start">';
    	html += '<img width="180px" src="http://img.youtube.com/vi/' + data[i].videoIdentifiedId + '/maxresdefault.jpg"></img>';
    	html += '</div>';
    	html += '<div class="col-sm-7-mod float-end">';
    	//if(data[i].videoTitle.length > 40){
	    //	html += '<span class="goDetail text-white" style="font-size: 14px;" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle.substring(0,38) + '</span>';
    	//}else{
	    //	html += '<span class="goDetail text-white" style="font-size: 14px;" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle + '</span>';
    	//}
    	html += '<span class="goDetail text-white" style="font-size: 14px;" onclick="goDetail('+data[i].videoIdx+')">' + data[i].videoTitle + '</span>';
    	html += '<div style="font-size: 13px; color: #ccc">';
    	html += data[i].member.memberChannelName;
    	html += '</div>';
    	html += '<div style="font-size: 12px; color: #ccc">';
    	html += '조회수 ' + data[i].videoViewCnt + '회 · ' + data[i].videoRegdate_change;
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    });
    
    $('#row').append(html);
}

// 댓글 리스트 조회
function resultHtmlComment(data){
	var html = "";
	
	$.each(data , function(i){
    	//html += '<form id="commentFrm' + data[i].commentIdx + '">';
    	//html += '<input type="hidden" id="commentIdx" name="commentIdx" value="' + data[i].commentIdx + '">';
    	html += '<div class="align-items-center justify-content-end mb-3" onmouseover="moreMenuFunc(' + i + ')" onmouseleave="outMenuFunc(' + i + ')">';
    	html += '<div class="col-sm-1-mod2 float-start">';
    	html += '<div class="row small ps-1">';
    	html += '<span class="p-img">';
    	html += '<img id="profile" src="' + getContextPath() + '/resources/assets/img/YouTube.png"></img>';
    	html += '</span>';
    	html += '</div>';
    	html += '</div>';
    	html += '<div class="col-sm-1-mod text-white float-end">';
    	html += '<div class="float-end" id="menu-bar' + i + '" style="display:none; font-size: 15px;">';
    	html += '<button class="bg-dark text-white" type="button" id="menuFunc" onclick="menuDropDown(' + i + ')">';
    	html += '<i class="bx bx-dots-vertical-rounded"></i>';
    	html += '</button>';
    	html += '</div>';
    	html += '<div class="dropdown-menu mt-4-mod" id="drop-content' + i + '" style="display: none; text-align: center;">';
    	html += '<a class="dropdown-item" onclick="uptComment(' + data[i].commentIdx + ')"><small>수정</small></a>';
    	html += '<hr class="dropdown-divider">';
    	html += '<a class="dropdown-item" onclick="delComment(' + data[i].commentIdx + ')"><small>삭제</small></a>';
    	html += '</div>';
    	html += '</div>';
    	html += '<div class="col-sm-11">';
    	html += '<div class="row small text-white">';
    	html += '<small>' + data[i].member.memberChannelName + '&nbsp;&nbsp;';
    	html += '<span style="color:#ccc;">' + data[i].commentRegdate_change + '</span>';
    	html += '</small>';
    	if(data[i].commentContents.length > 316){
	    	html += '<div id="shortComment">';
	    	html += '<span>' + data[i].commentContents.substring(0,316) + '</span>';
	    	html += '</div>';
	    	html += '<div id="orginComment" style="display: none;">';
	    	html += '<span>' + data[i].commentContents + '</span>';
	    	html += '</div>';
	    	html += '<div id="showMoreCmnt"><span>자세히 보기</span></div>';
    	}else{
	    	html += '<div>';
	    	html += '<span>' + data[i].commentContents + '</span>';
	    	html += '</div>';
    	}
    	html += '<div>';
    	html += '<span id="showReplyBtn' + i + '" style="cursor: pointer;color: #ccc;" onclick="showReplyFunc(' + i + ')"><small>답글</small></span>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    	html += '</div>';
    	html += '<div class="align-items-center justify-content-end mt-2 mb-5 ms-5-mod" id="reply-block' + i + '" style="display:none;">';
    	html += '<div class="col-sm-1-mod float-start">';
    	html += '<div class="row small">';
    	html += '<span class="p-img">';
    	html += '<img id="reply-profile" src="' + getContextPath() + '/resources/assets/img/YouTube.png"></img>';
    	html += '</span>';
    	html += '</div>';
    	html += '</div>';
    	html += '<div class="col-sm-12-mod">';
    	html += '<div class="row">';
    	html += '<textarea class="bg-dark text-white" id="reply" name="reply" rows="1" cols="130" oninput="this.style.height = ""; this.style.height = this.scrollHeight + "px"" placeholder="답글 추가...">';
    	html += '</textarea>';
    	html += '</div>';
    	html += '</div>';
    	html += '<div class="col-sm-auto my-3 float-end mb-2" id="replyBtn">';
    	html += '<input class="cancleBtn bg-dark" type="button" id="cancleReplyBtn" value="취소" >';
    	html += '<input class="btn btn-outline-info" type="button"  id="regReplyBtn" value="답글">';
    	html += '</div>';
    	html += '</div>';
    
    });
    
    $('#row-comment').append(html);
}
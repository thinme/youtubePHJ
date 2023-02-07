<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>YouTube</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="${path}/resources/css/styles.css" rel="stylesheet" />
	<link href="${path}/resources/css/video.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.nav-item dropdown{
		  height: 50px;
		}
		.nav-prof{
		  width: 28px;
		  height: 28px;
		  border-radius: 50%;
		}
		#dtl-profile{
		  width: 50px;
		  height: 50px;
		  border-radius: 50%;
		}
		#reply-profile{
		  width: 30px;
		  height: 30px;
		  border-radius: 50%;
		}
		.dtl-divide{
		  color: #ccc;
		}
		.textarea-vContents{
		  width: 100%; 
		  border: none; 
		  outline: none; 
		  resize: none; 
		  overflow: hidden;
		}
		#showMore{
		  font-size: 14px;
		  cursor: pointer;
		}
		#comment,
		#reply{
		  width: 100%;
		  border: none; 
		  outline: none;
		  border-bottom: #ccc 1px solid;
		  overflow: hidden; 
		}
		.cancleBtn,
		#cancleCommentBtn{
		  border: none;
		  outline: none;
		  color: #ccc; 
		}
		#showMoreCmnt{
		  color: #ccc; 
		  cursor: pointer;
		}
		#showMoreCmnt:hover{
		  text-decoration: underline;
		}
		#showReplyBtn{
		  cursor: pointer;
		  color: #ccc;
		}
		#replyBtn,
		#regReplyBtn{
		  font-size: 0.75rem;
		}
		#menuFunc{
		  border-radius: 50%;
		  border: none;
		}
		.menu-wrapper{
		  background-color: rgba(0, 0, 0, 0.5);
		}
	</style>
	<script type="text/javascript">
		//페이징과 같은 방식이라고 생각하면 된다. 	
		var page = 1;  
		
		$(document).ready(function(){
			//화면 초기화
			$("#row").empty(); 
			//화면 접근시 최초 수행, 1페이지 호출부
			videoListDetail(page);
			page++;
			
			// 댓글창 클릭 시 댓글버튼 표시
			$("#comment").on("click", function(){
				$("#comment").css("border-bottom", "#fff 2px solid");
				$("#commentBtn").show();
			});
			
			// 댓글창 클릭 시 댓글버튼 숨김
			$("#cancleCommentBtn").on("click", function(){
				$("#comment").css("border-bottom", "#ccc 1px solid");
				$("#comment").val("");
				$("#commentBtn").hide();
			});
			
			// 답글창 클릭 시 답글 창 focus
			$("#reply").on("click", function(){
				$("#reply").css("border-bottom", "#fff 2px solid");
			});
			
		});
		
		//마우스 올렸을때
		function moreMenuFunc(idx){
			$("#menu-bar"+idx).show();
		}
		
		//마우스 벗어났을때
		function outMenuFunc(idx){
			$("#menu-bar"+idx).hide();
		}
		
		//답글 버튼 클릭시 답글 display=block
		function showReplyFunc(idx){
			var replyBlock = document.getElementById("reply-block"+idx);	    
		    if(replyBlock.style.display === "none"){
		    	replyBlock.style.display = "block";
		    	alert("준비중입니다...!")
		    };
		}
		
		//답글 취소 버튼 클릭시 답글 display=none
		function hideReplyFunc(idx){
			var replyBlock = document.getElementById("reply-block"+idx);	    
		    if(replyBlock.style.display === "block"){
		    	replyBlock.style.display = "none";
		    };
		}
		
		//답글 메뉴버튼 클릭시 수정, 삭제 기능 표시
		function menuDropDown(idx){
			var content = document.getElementById("drop-content"+idx);
		    if(content.style.display === "none"){
		    	content.style.display = "block";
		    }else{
		    	content.style.display = "none";
		    }
		}
		
		//스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		//스크롤부터는 2부터 시작되는거 같음
		$(window).scroll(function(){   
			if($(window).scrollTop() >= $(document).height() - $(window).height()){
			   videoListDetail(page);
			   page++;   
			} 
		});
	</script>
</head>
	<body class="sb-nav-fixed sb-sidenav-toggled">
	    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	        <!-- Sidebar Toggle-->
	        <button class="btn btn-link btn-sm order-1 order-lg-0 ms-2 me-lg-0" id="sidebarToggle" href="#!"><i class='bx bx-menu bx-md'></i></button>
	        <!-- Navbar Brand-->
	        <a class="navbar-brand ps-3 pb-3" href="${path}"><img height="20px" src="${path}/resources/assets/img/YouTube.png">&nbsp;YouTube</a>
	        <!-- Navbar Search-->
	        <form id="detailFrm" class="d-none d-md-inline-block form-inline ms-auto me-md-5">
	        	<input type="hidden" id="page" name="page" value="1">
	            <div class="input-group">
	                <input class="form-control" type="text" placeholder="검색" aria-label="Search for..." aria-describedby="btnNavbarSearch" style="width: 526px;"/>
	                <button class="btn btn-light" id="btnNavbarSearch" type="button"><i class='bx bx-search-alt-2 bx-sm'></i></button>
	            </div>
	        </form>
	        <c:if test="${sesMemberId == null}">
	        <div class="navbar-nav ms-auto me-2 me-lg-4">
	        	<div class="nav-item dropdown">
	        		<button class="btn btn-outline-primary" id="goLoginBtn">
	        			<span style="font-size: 14px;">로그인</span>
	        			<i class='bx bx-user-circle align-middle' style="font-size: 25px;"></i>
	        		</button>
	        	</div>
	        </div>
	        </c:if>
	        <c:if test="${sesMemberId != null}">
	        <!-- Navbar -->
	        <ul class="navbar-nav ms-auto me-2 me-lg-4">
	            <li class="nav-item dropdown">
	                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class='bx bx-user bx-sm'></i></a>
	                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                    <li style="pointer-events: none;">
	                    	<a class="dropdown-item" href="#!">
	                    		<img class="nav-prof" src="${path}/resources/assets/img/YouTube.png"></img>&nbsp;<strong> ${sesMemberId}</strong>
	                    	</a>
	                    </li>
	                    <li><hr class="dropdown-divider"/></li>
	                    <li><a class="dropdown-item" href="#!"><i class='bx bxs-user-account'></i>&nbsp;계정관리</a></li>
	                    <li><a class="dropdown-item" href="#!"><i class='bx bx-slideshow'></i>&nbsp;내 채널</a></li>
	                    <li><hr class="dropdown-divider"/></li>
	                    <li><a class="dropdown-item" href="${path}/logout"><i class='bx bx-log-in' ></i>&nbsp;로그아웃</a></li>
	                </ul>
	            </li>
	        </ul>
	        </c:if>
	    </nav>
	    <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
	            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	                <div class="sb-sidenav-menu">
	                    <div class="nav">
	                        <a class="nav-link" href="${path}">
	                            <div class="sb-nav-link-icon">
	                            	<i class='bx bx-home bx-sm'></i>
	                            </div>
	                            <span style="font-size: 1.1rem;">Home</span>
	                        </a>
	                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon" style="padding-top:2px;">
                                	<i class='bx bx-caret-right-square bx-sm'></i>
                                </div>
                                <span style="font-size: 1.1rem;">Channel</span>
                                <div class="sb-sidenav-collapse-arrow">
                                	<i class="fas fa-angle-down"></i>
                                </div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#"><i class='bx bx-film bx-sm'></i>&nbsp;&nbsp;Video List</a>
                                    <a class="nav-link" id="goRegisterVideo"><i class='bx bx-video-plus bx-sm'></i>&nbsp;&nbsp;Register Video</a>
                                </nav>
                            </div>
                            
	                    </div>
	                </div>
	                <div class="sb-sidenav-footer">
	                	<div class="small">안녕하세요&nbsp;<i class='bx bx-smile bx-xs'></i></div>
	                    ${sesMemberId}[${sesMemberAuth}]님
	                </div>
	            </nav>
	        </div>
	        <div id="layoutSidenav_content">
	            <main class="bg-dark">
	                <div class="container-fluid px-4">
	                    <div class="row mt-4">
	                    	<div class="col-xl-9-mod">
                                <div class="mb-4">
                                	<%-- <input type="hidden" id="videoIdx" name="videoIdx" value="${videoDetail.videoIdx}"> --%>
                                    <iframe width="100%" height="588" src="https://www.youtube.com/embed/${videoDetail.videoIdentifiedId}?autoplay=1&mute=1" 
		                                    title="${videoDetail.videoTitle}" frameborder="0" 
		                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
		                            </iframe>
		                            <div class="mt-3 mb-2 text-white" style="font-size: 1.15rem;">${videoDetail.videoTitle}</div>
				                    <ol class="breadcrumb mb-4">
				                        <li class="breadcrumb-item active"><small>조회수 ${videoDetail.videoViewCnt}회 · ${videoDetail.videoRegdate}</small></li>
				                    </ol>
				                	<hr class="dtl-divide">
	                                <div class="row mb-4">
	                                	<div class="align-items-center justify-content-end">
	                                		<div class="col-sm-1 float-start">
	                                			<div class="small ps-1">
	                                				<span class="p-img">
	                                					<img id="dtl-profile" src="${path}/resources/assets/img/YouTube.png"></img>
	                                				</span>
	                                			</div>
	                                		</div>
	                                		<div class="col-sm-11 py-2 float-start">
	                                			<div class="small text-white">
	                                				<strong>${videoDetail.member.memberChannelName}</strong>
	                                				<c:if test="${sesMemberId eq videoDetail.videoRegId or sesMemberAuth eq 'master' or sesMemberAuth eq 'manager'}">
		                                				<span class="float-end" id="videoFuncBtn">
		                                					<input class="btn btn-outline-primary" type="button" onclick="goUptVideo(${videoDetail.videoIdx})" value="수정">
		                                					<input class="btn btn-outline-primary" type="button" id="delVideoBtn" value="삭제">
		                                				</span>
	                                				</c:if>
	                                			</div>
				                                <br>
				                                <div class="small text-white mt-3" id="textarea-vContents">
				                                	<textarea class="textarea-vContents bg-dark text-white" rows="3" cols="50" readonly="readonly">${videoDetail.videoContents}</textarea>
				                                </div>
				                                <div class="small text-white mt-3" id="textarea-vContents-more" style="display: none;">
				                                	<textarea class="textarea-vContents bg-dark text-white" rows="25" cols="50" readonly="readonly">${videoDetail.videoContents}</textarea>
				                                </div>
				                                <div class="text-white mt-2">
				                                	<span id="showMore"><small>더보기</small></span>
				                                </div>
	                                		</div>
	                                	</div>
	                                </div>
	                            	<hr class="dtl-divide">
		                            <div class="text-white">
										댓글 <span id="commentCnt">${cmtCnt}</span>개
		                            </div>
		                            <div class="row align-items-center justify-content-end mt-4 mb-3">
		                            <!-- 댓글 등록 -->
		                            <form id="regCommentFrm">
		                            	<input type="hidden" name="commentVideoIdx" value="${videoDetail.videoIdx}">
		                            	<input type="hidden" name="commentRegId" value="${sesMemberId}">
                                		<div class="col-sm-1-mod float-start me-4">
                                			<div class="row small ps-1">
                                				<span class="p-img">
                                					<img id="profile" src="${path}/resources/assets/img/YouTube.png"></img>
                                				</span>
                                			</div>
                                		</div>
                                		<div class="col-sm-12">
                                			<div class="row">
                                				<textarea class="bg-dark text-white" id="comment" name="commentContents" rows="1" cols="130"
                                				oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' placeholder="댓글 추가..."></textarea>
                                			</div>
                                		</div>
		                            	<div class="col-sm-auto my-3 float-end mb-2" id="commentBtn" style="display: none">
	                               			<small><input class="bg-dark" type="button" id="cancleCommentBtn" value="취소" ></small>
	                               			<small><input class="btn btn-outline-info" type="button"  id="regCommentBtn" value="댓글"></small>
		                            	</div>
		                            </form>
                                	</div>
                                	
                                	<!-- 댓글 폼 -->
                                	<form id="commentFrm">
                                		<input type="hidden" name="commentVideoIdx" value="${videoDetail.videoIdx}">
                                		<input type="hidden" id="commentIdx" name="commentIdx" value="">
                                		<input type="hidden" id="commentContents" name="commentContents" value="">
                                	</form>
                                	
                                	<!-- 댓글 리스트 조회 -->
                                	<div id="row-comment">
                                	<c:forEach items="${commentList}" var="comment" varStatus="status">
			                            <!-- <form id="commentFrm"> -->
			                            	<%-- <input type="hidden" id="commentIdx" name="commentIdx" value="${comment.commentIdx}"> --%>
		                                	<div class="align-items-center justify-content-end mb-3" onmouseover="moreMenuFunc(${status.index})" onmouseleave="outMenuFunc(${status.index})">
		                                		<div class="col-sm-1-mod2 float-start">
		                                			<div class="row small ps-1">
		                                				<span class="p-img">
		                                					<img id="profile" src="${path}/resources/assets/img/YouTube.png"></img>
		                                				</span>
		                                			</div>
		                                		</div>
		                                		<div class="col-sm-1-mod text-white float-end">
		                                			<div class="float-end" id="menu-bar${status.index}" style="display:none; font-size: 15px;">
		                                				<button class="bg-dark text-white" type="button" id="menuFunc" onclick="menuDropDown(${status.index})">
		                                					<i class='bx bx-dots-vertical-rounded'></i>
		                                				</button>
		                                			</div>
		                                			<div class="dropdown-menu mt-4-mod" id="drop-content${status.index}" style="display: none; text-align: center;">
														<a class="dropdown-item" onclick="uptComment(${comment.commentIdx})"><small>수정</small></a>
														<hr class="dropdown-divider">
														<a class="dropdown-item" onclick="delComment(${comment.commentIdx})"><small>삭제</small></a>
													</div>
		                                		</div>
		                                		<div class="col-sm-11">
		                                			<div class="row small text-white">
		                                				<small>${comment.member.memberChannelName}&nbsp;&nbsp;
		                                					<span style="color:#ccc;">${comment.commentRegdate_change}</span>
		                                				</small>
		                                				<c:choose>
			                                				<c:when test="${fn:length(comment.commentContents) > 316}">
				                                				<div id="shortComment">
				                                					<span><c:out value="${fn:substring(comment.commentContents, 0, 316)}"/></span>
				                                				</div>
				                                				<div id="orginComment" style="display: none;">
				                                					<span><c:out value="${comment.commentContents}"/></span>
				                                				</div>
				                                				<div id="showMoreCmnt"><span>자세히 보기</span></div>
			                                				</c:when>
			                                				<c:when test="${fn:length(comment.commentContents) <= 316}">
			                                					<div>
				                                					<span><c:out value="${comment.commentContents}"/></span>
				                                				</div>
			                                				</c:when>
		                                				</c:choose>
		                                				<div>
		                                					<span id="showReplyBtn${status.index}" style="cursor: pointer;color: #ccc;" onclick="showReplyFunc(${status.index})"><small>답글</small></span>
		                                				</div>
		                                			</div>
		                                		</div>
		                                	</div>
			                            <!-- </form> -->
			                            <!-- 답글 등록 -->
			                            <!-- <form id="regReplyFrm"> -->
                               				<div class="align-items-center justify-content-end mt-2 mb-5-mod ms-5-mod" id="reply-block${status.index}" onclick="hideReplyFunc(${status.index})" style="display:none;">
					                            <div class="col-sm-1-mod float-start">
		                                			<div class="row small">
		                                				<span class="p-img">
		                                					<img id="reply-profile" src="${path}/resources/assets/img/YouTube.png"></img>
		                                				</span>
		                                			</div>
		                                		</div>
		                                		<div class="col-sm-12-mod">
		                                			<div class="row">
		                                				<textarea class="bg-dark text-white" id="reply" name="reply" rows="1" cols="130"
		                                				oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' placeholder="답글 추가..."></textarea>
		                                			</div>
		                                		</div>
				                            	<div class="col-sm-auto my-3 float-end mb-2" id="replyBtn">
			                               			<input class="cancleBtn bg-dark" type="button" id="cancleReplyBtn${status.index}" value="취소" >
			                               			<input class="btn btn-outline-info" type="button"  id="regReplyBtn${status.index}" value="답글">
				                            	</div>
			                                </div>
			                            <!-- </form> -->
                                	</c:forEach>
                                </div>
                            </div>
                            </div>
                            <div class="col-xl-4-mod">
	                            <div id="row">
	                                <!-- videoList -->
	                            </div>
                            </div>
	                    </div>
	                </div>
	            </main>
	            <footer class="py-4 bg-dark mt-auto">
	                <div class="container-fluid px-4">
	                    <div class="d-flex align-items-center justify-content-between small">
	                        <div class="text-muted">Copyright &copy; Godragonzoo</div>
	                        <div>
	                            <a href="#">Privacy Policy</a>
	                            &middot;
	                            <a href="#">Terms &amp; Conditions</a>
	                        </div>
	                    </div>
	                </div>
	            </footer>
	        </div>
	    </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="${path}/resources/component/jquery-3.3.1.min.js"></script>
		<script src="${path}/resources/component/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	    <script src="${path}/resources/js/video/video.js"></script>
	    <script src="${path}/resources/js/scripts.js"></script>
	    <script src="${path}/resources/js/util.js"></script>
	</body>
</html>

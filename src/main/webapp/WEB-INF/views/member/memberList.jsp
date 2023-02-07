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
	</style>
	<script type="text/javascript">
		
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
	                        <a class="nav-link" id="goMemberList">
	                            <div class="sb-nav-link-icon">
	                            	<i class='bx bxs-user-rectangle bx-sm'></i>
	                            </div>
	                            <span style="font-size: 1.1rem;">Member List</span>
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
	                	<c:if test="${sesMemberId != null}">
	                    	${sesMemberId}[${sesMemberAuth}]님
	                    </c:if>
	                </div>
	            </nav>
	        </div>
	        <div id="layoutSidenav_content">
	            <main class="bg-light">
	                <div class="container-fluid px-4">
                        <h1 class="mt-4">Member List</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a>Home</a></li>
                            <li class="breadcrumb-item active">Member List</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 리스트
                                <div class="float-end">
                            		<form action="${path}/memberList" id="searchFrm" method="post">
	                                	<input class="form-control-sm" type="text" name="memberSearchWord" value="${memberSearchWord}" placeholder="search">
	                                	<input class="btn btn-dark" type="button" onclick="memberSearchList()" value="검색" style="font-size: 0.85rem;">
                            		</form>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="dataTable-table" style="text-align: center; margin-bottom: 0.5rem;">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" id="checkAll" name="checkAll"/></th>
                                            <th>No</th>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Auth</th>
                                            <th>Email</th>
                                            <th>성별</th>
                                            <th>채널명</th>
                                            <th>등록일자</th>
                                            <th>수정일자</th>
                                            <th>등록Ip</th>
                                            <th>수정Ip</th>
                                            <th>탈퇴여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach items="${memberList}" var="member">
	                                        <tr ondblclick="goMemberDetail(${member.memberIdx})">
	                                        	<td onclick="event.cancelBubble=true">
													<input type="checkbox" id="${member.memberIdx}" name="check" value="${member.memberIdx}"/>
												</td>
	                                            <td>${member.rowNum}</td>
	                                            <td>${member.memberId}</td>
	                                            <td>${member.memberName}</td>
	                                            <td>${member.memberAuth}</td>
	                                            <td>${member.memberEmail}</td>
	                                            <td>${member.memberGender}</td>
	                                            <td>${member.memberChannelName}</td>
	                                            <td>${member.memberRegdate}</td>
	                                            <td>${member.memberUptdate}</td>
	                                            <td>${member.memberRegIp}</td>
	                                            <td>${member.memberUptIp}</td>
	                                            <td>${member.memberDelYN}</td>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="float-end mb-2">
                                	<button class="btn btn-outline-dark" id="delChkMember" type="button" style="font-size: 0.8rem;">선택삭제</button>
                                </div>
                                <br>
                                <div class="row pagination align-content-center mt-2">
									<ul>
										<c:if test="${paging.prev}">
									    	<span>
									    		<a href='<c:url value="/memberList?page=${paging.startPage - 1}"/>'><i class='bx bxs-chevron-left'></i></a>
									    	</span>
									    </c:if>
									    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
											<c:choose>
												<c:when test="${paging.criteria.page eq num}">
													<span><a class="active">${num}</a></span>
												</c:when>
												<c:otherwise>
													<span><a href='<c:url value="/memberList?page=${num}"/>'>${num}</a></span>
												</c:otherwise>
											</c:choose>
									    </c:forEach>
									    <c:if test="${paging.next && paging.endPage > 0}">
									    	<span>
									    		<a href='<c:url value="/memberList?page=${paging.endPage + 1}"/>'><i class='bx bxs-chevron-right'></i></a>
									    	</span>
									    </c:if>
									</ul>
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
	    <script src="${path}/resources/js/member/member.js"></script>
	    <script src="${path}/resources/js/scripts.js"></script>
	    <script src="${path}/resources/js/util.js"></script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link href="${path}/resources/css/styles.css" rel="stylesheet" />
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/component/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/component/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <script src="${path}/resources/js/video/video.js"></script>
    <script src="${path}/resources/js/util.js"></script>
	<style type="text/css">
		.nav-item dropdown{
			height: 50px;
		}
		#navbarDropdown{
			padding-top: 12px;
			padding-bottom: 12px;
		}
	</style>
</head>
	<body class="sb-nav-fixed">
	    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	        <!-- Sidebar Toggle-->
	        <button class="btn btn-link btn-sm order-1 order-lg-0 ms-2 me-lg-0" id="sidebarToggle" href="#!"><i class='bx bx-menu bx-md'></i></button>
	        <!-- Navbar Brand-->
	        <a class="navbar-brand ps-3 pb-3" href="${path}"><img height="20px" src="${path}/resources/assets/img/YouTube.png">&nbsp;YouTube</a>
	        <!-- Navbar Search-->
	        <form class="d-none d-md-inline-block form-inline ms-auto me-md-5">
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
	                    <li style="pointer-events: none;"><a class="dropdown-item" href="#!"><i class='bx bx-beer'></i>&nbsp;<strong>${sesMemberId}</strong></a></li>
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
	            <main>
	                <div class="container-fluid px-4">
	                    <h2 class="mt-4"><i class='bx bx-video-plus'></i>&nbsp;Update Video</h2>
	                    <ol class="breadcrumb mb-4">
	                        <li class="breadcrumb-item active" style="margin-left:42px;">영상 수정</li>
	                    </ol>
	                    <div class="card">
			                <div class="card-body">
			                	<form id="uptVideoFrm" method="post">
			                		<input type="hidden" name="videoIdx" value="${videoDetail.videoIdx}">
	                                <div class="form-floating mt-2 mb-4">
	                                    <input class="form-control" id="videoIdentifiedId" name="videoIdentifiedId" type="text" value="https://youtu.be/${videoDetail.videoIdentifiedId}" style="width: 30%;"/>
	                                    <label for="videoIdentifiedId">Url</label>
	                                </div>
	                                <div class="form-floating mt-2 mb-4">
	                                    <input class="form-control" id="videoTitle" name="videoTitle" value="${videoDetail.videoTitle}" type="text"/>
	                                    <label for="videoTitle">Title</label>
	                                </div>
	                                <div class="form-floating mb-4">
	                                    <textarea class="form-control" id="videoContents" name="videoContents" style="height: 240px;">${videoDetail.videoContents}</textarea>
	                                    <label for="videoContents" id="contents-label">Contents</label>
	                                </div>
	                                <div class="d-flex align-items-center justify-content-end mb-0">
	                                    <button class="btn btn-primary" id="updVideoBtn">수정</button>
	                                </div>
	                            </form>
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
	</body>
</html>

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
		.nav-item dropdown{
			height: 50px;
		}
		#navbarDropdown{
			padding-top: 12px;
			padding-bottom: 12px;
		}
		#goRegBtn:hover{
			cursor: pointer;
			text-decoration: underline;
		}
		#findPswd{
			text-decoration: none;
			color: #000;
		}
		#findPswd:hover{
			cursor: pointer;
			text-decoration: underline;
		}
		#loginBtn{
			width: 100%;
			height: 50px;
		}
	</style>
</head>
	<body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-mod">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form id="loginFrm" method="post">
                                            <div class="form-floating mt-2 mb-4">
                                                <input class="form-control" id="memberId" name="memberId" type="text"/>
                                                <label for="memberId">ID</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input class="form-control" id="inputPassword" name="memberPswd" type="password" placeholder="Password" />
                                                <label for="inputPassword">PSWD</label>
                                                <div class="mt-2">
                                                	<i class='bx bx-lock'></i>&nbsp;<a class="small" id="findPswd">비밀번호 찾기</a>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mb-0">
                                                <button class="btn btn-primary" id="loginBtn">로그인</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        아직 회원이 아니신가요?&nbsp;<i class='bx bx-user'></i>&nbsp;<a id="goRegMemberBtn">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="${path}/resources/component/jquery-3.3.1.min.js"></script>
		<script src="${path}/resources/component/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	    <script src="${path}/resources/js/scripts.js"></script>
	    <script src="${path}/resources/js/util.js"></script>
	    <script src="${path}/resources/js/member/member.js"></script>
	</body>
</html>

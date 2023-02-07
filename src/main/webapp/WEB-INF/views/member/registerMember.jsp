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
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="${path}/resources/css/styles.css" rel="stylesheet" />
	<script src="${path}/resources/component/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/component/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<style type="text/css">
		.nav-item dropdown{
			height: 50px;
		}
		#navbarDropdown{
			padding-top: 12px;
			padding-bottom: 12px;
		}
		#regMemberBtn{
			width: 100%;
			height: 50px;
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){	
		validation();
	});	
	
	</script>
</head>
	<body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Register</h3></div>
                                    <div class="card-body">
                                        <form id="regMemberFrm" method="post">
                                            <div class="form-floating mt-2 mb-4">
                                                <input class="form-control" id="inputId" name="memberId" type="text" placeholder="아이디를 입력하세요" />
                                                <label for="inputId">ID</label>
                                                <div class="mt-2" id="idChkresult"></div>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input class="form-control" id="inputPswd" name="memberPswd" type="password" placeholder="비밀번호를 입력하세요" />
                                                <label for="inputPswd">PSWD</label>
                                                <div class="mt-2" id="pswdChkresult"></div>
                                            </div>
                                            
                                            <div class="form-floating mb-4">
                                                <input class="form-control" id="inputPswdChk" name="memberPswdChk" type="password" placeholder="비밀번호를 확인하세요" />
                                                <label for="inputPswdChk">PSWD Check</label>
                                                <div class="mt-2" id="pswdDblChkresult"></div>
                                            </div>
                                            <div class="row">
	                                            <div class="col-md-6">
		                                            <div class="form-floating mb-4">
		                                                <input class="form-control" id="inputName" name="memberName" type="text" placeholder="이름을 입력하세요" />
		                                                <label for="inputName">Name</label>
		                                                <div class="mt-2" id="nameChkresult"></div>
		                                            </div>
	                                            </div>
	                                            <div class="col-md-6">
		                                            <div class="form-floating mb-4">
		                                            	<select class="form-select" id="selectGender" name="memberGender">
		                                            		<option value="" selected="selected">선택하세요</option>
															<option value="남성">남성</option>
															<option value="여성">여성</option>
		                                            	</select>
		                                                <label for="selectGender">Gender</label>
		                                                <div class="mt-2" id="genderChkresult"></div>
		                                            </div>
	                                            </div>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input class="form-control" id="inputEmail" name="memberEmail" type="text" placeholder="이메일을 입력하세요" />
                                                <label for="inputEmail">Email</label>
                                                <div class="mt-2" id="emailChkresult"></div>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input class="form-control" id="inputChannelName" name="memberChannelName" type="text" placeholder="채널명을 입력하세요" />
                                                <label for="inputChannelName">Channel Name</label>
                                                <div class="mt-2" id="channelChkresult"></div>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mb-0">
                                                <button class="btn btn-primary" id="regMemberBtn">회원가입</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        계정이 있으신가요?&nbsp;<i class='bx bx-user'></i>&nbsp;<a id="goLoginBtn">로그인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="${path}/resources/js/member/member.js"></script>
	    <script src="${path}/resources/js/scripts.js"></script>
	    <script src="${path}/resources/js/util.js"></script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/login.css">
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<body>
	<div id="loginbox">
		<div id="loginpart1">
			<div id="loginimgbox">
				<a href="/"><img src="/img/footerlogo.png"></a>
			</div>
		</div>

		<form action="/auth/loginProc" method="post">
			<div id="loginpart2">
				<div id="logintitle">로그인</div>
				<div class="logininput">
					<div class="inputbox">
						<input placeholder="ID" id="userid" name="username">
					</div>
					<div class="inputbox">
						<input placeholder="PASSWORD" type="password" id="pwd"
							name="password">
					</div>
				</div>
				<div id="findinfo">
					<div>
						<a href="/auth/joinForm">회원가입</a>
					</div>
					<div>
						<a href="/auth/findId">아이디찾기</a>&nbsp;/&nbsp;<a
							href="/auth/findpwd">비밀번호찾기</a>
					</div>
				</div>
				<div id="loginbutton1">
					<button type="submit" class="btn btn-primary" id="btn-login">로그인</button>
				</div>
				<div id="or">or</div>
				<div id="kakaologin">
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=f58010a68faa4d0a1e5774f2768482ac&redirect_uri=http://localhost:8111/auth/kakao/callback&response_type=code&prompt=login"><img
						src="/img/카카오로그인.png"></a>
				</div>
			</div>
		</form>


	</div>
</body>
</html>
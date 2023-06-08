<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/findId.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">

<body>
	<div id="findIdbox">

		<div id="loginpart1">
			<div id="loginimgbox">
				<a href="/"><img src="/img/footerlogo.png"></a>
			</div>
		</div>


		<div id="findIdpart">
			<form action="/auth/id/search" method="get">

				<div id="findtitle">아이디 찾기</div>
				<div class="logininput">
					<div class="inputbox">
						<input id="username2" name="username2"
							placeholder="이름을 입력해주세요.">
					</div>
					<div class="inputbox">
						<input type="text" id="tel" name="email"
							placeholder="이메일을 입력해주세요.">
					</div>
				</div>

				<div id="findinfo">
					<div>
						<a href="/auth/joinForm">회원가입</a>
					</div>
					<div>
						<a href="/auth/loginForm">로그인&nbsp;</a>/<a href="/auth/findpwd">&nbsp;비밀번호찾기</a>
					</div>
				</div>

				<div id="searchbutton1">
					<button type="submit">검색</button>
				</div>
			</form>
			<div class="searchresult">${board.username}</div>
		</div>



	</div>


</body>
</html>
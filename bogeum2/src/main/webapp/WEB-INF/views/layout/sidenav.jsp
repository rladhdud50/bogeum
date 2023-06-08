<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="/css/reset.css">
<body>

<div class="mypagenav">
	<div class="mypagenavmenu">
		<div class="mypagenavtitle">마이페이지</div>
		<div>
			<ul>
				<li><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>
			</ul>
		</div>
	</div>

	<div class="mypagenavmenu">
		<div class="mypagenavtitle">주문내역</div>
		<div>
			<ul>
				<li><a href="#">주문/배송 조회</a></li>
				<li><a href="#">취소/교환/반품 신청</a></li>
				<li><a href="#">관심상품</a></li>
			</ul>
		</div>
	</div>

	<div class="mypagenavmenu">
		<div class="mypagenavtitle">나의 정보</div>
		<div>
			<ul>
				<li><a href="/user/infoupdate">회원 정보 수정</a></li>
				<li><a href="/user/out">회원 탈퇴</a></li>
			</ul>
		</div>

	</div>
</div>
</body>

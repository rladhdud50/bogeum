<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<link rel="stylesheet" href="/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="https://kit.fontawesome.com/462a97624e.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="icon" href="/img/pavicon1.png">

</head>
<body>

<div id="main_container">
		<div id="header_wrap">
			<div id="top">
				<div class="logo2">
					<a href="/"><img src="/img/footerlogo.png"></a>
				</div>
				<div class="sub_package">
					<c:choose>
						<c:when test="${empty principal}">
							<ul>
								<li><a href="/auth/loginForm">로그인</a></li>
								<li><a href="/auth/joinForm">회원가입</a></li>
							</ul>
						</c:when>
						<c:when test="${principal.user.roles == 'ADMIN'}">
						<ul>
							<li class="loginjoin"><a href="/user/cart/${principal.user.id}">장바구니</a></li>
							<li class="loginjoin"><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>
							<li class="loginjoin"><a href="/admin">관리자페이지</a></li>

							<li class="loginjoin"><a href="#" onclick="window.open('/chat/rooms','채팅방','width=400,height=550,resizable=no')">정보공유방</a></li>
							<li class="loginjoin"><a href="/logout">로그아웃</a></li>
						</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li class="loginjoin"><a href="/user/cart/${principal.user.id}">장바구니</a></li>
								<li class="loginjoin"><a href="#" onclick="window.open('/chat/rooms','채팅방','width=400,height=550,resizable=no')">정보공유방</a></li>
								<li class="loginjoin"><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>
								<li class="loginjoin"><a href="/logout">로그아웃</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mobile_tap">
					<input type="checkbox" id="menuicon"> <label for="menuicon">
						<span></span> <span></span> <span></span>
					</label>
					<div class="sidebar">
						
						<div class="mobile_login">
							<c:choose>
								<c:when test="${empty principal}">
									<ul>
										<li><a href="/auth/loginForm">로그인</a></li>
										<li><a href="/auth/joinForm">회원가입</a></li>
									</ul>
								</c:when>
								<c:when test="${principal.user.roles == 'ADMIN'}">
									<ul>
										<li class="loginjoin"><a href="/user/cart/${principal.user.id}">장바구니</a></li>
										<li class="loginjoin"><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>
										<li class="loginjoin"><a href="/admin">관리자페이지</a></li>
			
										<li class="loginjoin"><a href="#" onclick="window.open('/chat/rooms','채팅방','width=400,height=550,resizable=no')">정보공유방</a></li>
										<li class="loginjoin"><a href="/logout">로그아웃</a></li>
									</ul>
									</c:when>
									<c:otherwise>
									<ul>
										<li class="loginjoin"><a href="/user/cart/${principal.user.id}">장바구니</a></li>
										<li class="loginjoin"><a href="#" onclick="window.open('/chat/rooms','채팅방','width=400,height=550,resizable=no')">정보공유방</a></li>
										<li class="loginjoin"><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>
										<li class="loginjoin"><a href="/logout">로그아웃</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="mobile_menu">
							<ul>
								<li><a href="/auth/shelter">보호소</a></li>
								<li><a href="/auth/board">커뮤니티</a></li>
								<li><a href="/auth/shop">쇼핑몰</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="middle">
				
				<div class="middle_box middle_box2">
					<a href="/auth/shelter">보호소</a>
				</div>
				<div class="middle_box middle_box3">
					<a href="/auth/board">커뮤니티</a>
				</div>
				<div class="middle_box middle_box4">
					<a href="/auth/shop">쇼핑몰</a>
				</div>
			</div>
		</div>
	</div>
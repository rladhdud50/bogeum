<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보금자리</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="/css/shelter2.css">
<link rel="icon" href="/img/pavicon1.png">
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	
	<!-- 배너  -->
	<div class="banner">
		<div class="bannercontainer">
			<div class="inner">
				<a href="#"><img src="/img/banner/banner3.jpg"></a>
			</div>
			<div class="inner">
				<a href="#"><img src="/img/banner/banner2.png"></a>
			</div>
			<div class="inner">
				<a href="#"><img src="/img/banner/banner4.png"></a>
			</div>
			<div class="inner">
				<a href="#"><img src="/img/banner/banner1.jpg"></a>
			</div>
		</div>

	</div>
	<div class="buttonbox">
		<button class="bannerbutton" id="button1"></button>
		<button class="bannerbutton" id="button2"></button>
		<button class="bannerbutton" id="button3"></button>
		<button class="bannerbutton" id="button4"></button>

	</div>	
	
	<!-- 보호소  -->
	<div class="container" id="maincontent1">
		<div class="main">
			<div id="content1">
				<div class="content_flex">
					<div class="contenttitle1">
						<div class="contenttitle">&nbsp;보호소&nbsp;</div>
						&nbsp;<div id="search-rst"></div>
					</div>
					<div class="contenttitle">
						<a href="/auth/shelter"><i class="fa-solid fa-plus"></i></a>&nbsp;
					</div>
				</div>

				
				<div id="pic-wrap"></div>

			</div>

		</div>
	</div>		
	
	<!-- 배너2  -->
	<div class="banner2">
		<div class="bannercontainer2">
			<div class="inner2">
				<a href="#" class="bannerBig"><img src="/img/banner/banner2.png"></a>
				<a href="#" class="bannerSmall"><img src="/img/banner/banner2_small.jpg"></a>
			</div>
		</div>
	</div>
	

	<div class="container" id="maincontent2">
	
		<!-- 게시판  -->
		<div id="content2">
			<div class="board">
				<div class="contenttitle2">공지사항</div>
				<c:forEach var="notice" items="${notice.content}">
					<div class="content2">
						<div class="content2title">
							<a href="/notice/${notice.id}">&nbsp;${notice.title}</a>
						</div>
						<div class="content2time">
							<span style="float: right"> <fmt:formatDate
									pattern="yyyy-MM-dd" value="${notice.createDate}" /></span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="board">
				<div class="contenttitle2">분실/습득</div>
				<c:forEach var="finds" items="${finds.content}">
					<div class="content2">
						<div class="content2title">
							<a href="/finds/${finds.id}">&nbsp;${finds.title}</a>
						</div>
						<div class="content2time">
							<span style="float: right"> <fmt:formatDate
									pattern="yyyy-MM-dd" value="${finds.createDate}" /></span>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>


		<!-- 쇼핑몰  -->
		<div id="productbox">
			<div id="productinfo">
				<div id="productstitle">추천 상품</div>
				<div id="productintro">보금자리에서만 만나볼 수 있는 특별한 상품들을 지금 소개합니다</div>
				<div>
					<a href="/auth/shop">더보기+</a>
				</div>
			</div>
			<div id="products">
				<c:forEach var="item" items="${shop.content}">
					<div class="product">
						<a href="/auth/shop/${item.id}"><img
							src="/auth/images?filename=${item.filename}"></a>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>

	<%@ include file="layout/footer.jsp"%>

	<script type="text/javascript" src="/js/shelter2.js"></script>

	<script>
		//배너 슬라이드
		let img = document.querySelectorAll(".inner");
		let totalslide = img.length;//3

		var sliderWidth = 100; // container의 width
		var slideIndex = 0;
		var slider = document.querySelector('.bannercontainer');
		var time = 3000;
		slider.style.width = sliderWidth * totalslide + '%';

		slide()

		function slide() {
			setTimeout(slide, time);
			for (var i = 0; i < totalslide; i++) {
				slider.style.left = -(sliderWidth * slideIndex) + '%';
			}
			slideIndex++;
			if (slideIndex === totalslide) {
				slideIndex = 0;
			}
		}

		//배너 버튼
		document
				.querySelector('#button1')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.bannercontainer').style.left = -(sliderWidth * 0)
									+ '%';
							slideIndex = 0;
							time = 20000;
						})
		document
				.querySelector('#button2')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.bannercontainer').style.left = -(sliderWidth * 1)
									+ '%';
							slideIndex = 1;
							time = 20000;
						})
		document
				.querySelector('#button3')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.bannercontainer').style.left = -(sliderWidth * 2)
									+ '%';
							slideIndex = 2;
							time = 20000;
						})
		document
				.querySelector('#button4')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.bannercontainer').style.left = -(sliderWidth * 3)
									+ '%';
							slideIndex = 3;
							time = 20000;
						})
		document.querySelector('.bannercontainer').addEventListener(
				'mouseleave', function() {
					time = 3000;
				})
		document.querySelector('.bannercontainer').addEventListener(
				'mouseover', function() {
					time = 20000;
				})

		
	</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mobilesidenav.css">
<link rel="stylesheet" href="/css/reset.css">
<body>

<div id="mobilesidenavbox">
	<ul id="mobilesidenavli">
		<li><a href="/user/mypage/${principal.user.id}">마이페이지</a></li>		
		<li onclick="open1()">주문내역 	
			<ul class="submenu" id="submenu1">
				<li><a href="/user/mypage/${principal.user.id}">주문/배송조회</a></li>
				<li>교환/반품신청</li>
				<li>관심상품</li>
			</ul>	
			
		</li>
		
		<li onclick="open2()">나의정보
			<ul class="submenu" id="submenu2">
				<li><a href="/user/infoupdate">회원정보수정</a></li>
				<li><a href="/user/out">회원탈퇴</a></li>				
			</ul>		
		</li>
	</ul>
</div>

<script>

function open1() {	
	 if(document.getElementById('submenu1').style.display != "block") {
		 document.getElementById('submenu1').style.display = "block";		 
	 } else {
		 document.getElementById('submenu1').style.display = "none";
	 }
	 
}
function open2() {	
	 if(document.getElementById('submenu2').style.display != "block") {
		 document.getElementById('submenu2').style.display = "block";		 
	 } else {
		 document.getElementById('submenu2').style.display = "none";
	 }	 
}

</script>


</body>
</html>
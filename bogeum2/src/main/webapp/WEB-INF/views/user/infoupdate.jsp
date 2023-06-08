<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/infoupdate.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<body>
	<div id="kakaomap">
		<p>카카오(다음) 주소찾기</p>
		<div>Company Address</div>
		<input id="member_post" type="text" placeholder="Zip Code" readonly
			onclick="findAddr()"> <input id="member_addr" type="text"
			placeholder="Address" readonly> <br> <input type="text"
			placeholder="Detailed Address">
	</div>
</body>
<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {				

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("address").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("address").value = jibunAddr;
				}
			}
		}).open();
	}
</script>

<body>
	<%@ include file="../layout/header.jsp"%>
	<!-- 모바일네비 -->
<%@ include file="../layout/mobilesidenav.jsp" %>

	<div class="container">
		<%@ include file="../layout/sidenav.jsp"%>
		<div class="mypagecontentbox">
			<div id="joinbox">
				<div class="title">회원정보수정</div>
				<div class="id">
					아이디<br> <input type="text" id="id" disabled
						value="${principal.user.username}">

				</div>
				<c:choose>
				<c:when test="${principal.user.oauth=='kakao'}">
					<div class="password">
						비밀번호<br> <input id="pwd" placeholder="카카오계정은 수정이 불가능 합니다"
							disabled>
						<div id="pwderror" class="error"></div>
					</div>
					<div class="passwordcheck">
						비밀번호확인<br> <input type="password" id="repwd" disabled>
						<div id="repwderror" class="error"></div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="password">
						비밀번호<br> <input type="password" id="pwd"
							placeholder="비밀번호는 8~25자리로 입력하세요">
						<div id="pwderror" class="error"></div>
					</div>
					<div class="passwordcheck">
						비밀번호확인<br> <input type="password" id="repwd">
						<div id="repwderror" class="error"></div>
					</div>
				</c:otherwise>
			</c:choose>
				<div class="name">
					이름<br> <input type="text" id="name"
						value="${principal.user.username2}" >
					<div id="nameerror" class="error"></div>
				</div>
				<div class="birth">
					생년월일<br> <input type="text" placeholder="생년월일 8자리를입력해주세요" maxlength="8"
						id="birth" value="${principal.user.birth}">
					<div id="birtherror" class="error"></div>
				</div>
				
				<div class="address">
					주소<br> <input id="address" value="${principal.user.address}" onclick="findAddr()" readonly>
					<div id="addresserror" class="error"></div>
					<input id="detailaddress"  type="text" placeholder="상세주소를 입력해주세요">
				</div>

				<div class="tel">
					전화번호<br> <input placeholder="숫자만입력해주세요" id="tel" maxlength="11"
						value="${principal.user.tel}">
					<div id="telerror" class="error"></div>
				</div>
				<div class="email">
					이메일<br> <input id="email" value="${principal.user.email}">
					<div id="addresserror" class="error"></div>
				</div>

				<c:choose>
				<c:when test="${principal.user.oauth=='kakao'}">
					<div class="signUp">
						<button class="updatebutton" id="updatebutton2">수정하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="signUp">
						<button class="updatebutton" id="updatebutton">수정하기</button>
					</div>
				</c:otherwise>
			</c:choose>
			</div>			

		</div>


	</div>



	<%@ include file="../layout/footer.jsp"%>
	<script src="/js/infoupdate.js"></script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/join.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<%--<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"	rel="stylesheet">--%>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- SweetAlert -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>

<body>
<div id="kakaomap">
<p>카카오(다음) 주소찾기</p>
<div >Company Address</div>
  <input id="member_post"  type="text" placeholder="Zip Code" readonly onclick="findAddr()">
  <input id="member_addr" type="text" placeholder="Address" readonly> <br>
  <input type="text" placeholder="Detailed Address">
  </div>
</body>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address").value = jibunAddr;
            }
        }
    }).open();
}
</script>
	<div id="joinbox">
		<div class="title">회원가입</div>
		<div class="id">
			아이디<br> <input type="text" id="id">
			<button onclick="idcheck()">중복확인</button>
			<input type="hidden" id="idcheck">
			<div id="iderror" class="error"></div>
		</div>
		<div class="password">
			비밀번호<br> <input type="password" id="pwd"
				placeholder="비밀번호는 8~25자리로 입력하세요">
			<div id="pwderror" class="error"></div>
		</div>
		<div class="passwordcheck">
			비밀번호확인<br> <input type="password" id="repwd">
			<div id="repwderror" class="error"></div>
		</div>
		<div class="name">
			이름<br> <input type="text" id="name">
			<div id="nameerror" class="error"></div>
		</div>
		<div class="birth">
			생년월일<br> <input type="text" placeholder="생년월일 8자리를입력해주세요" maxlength="8"
				id="birth">
			<div id="birtherror" class="error"></div>
		</div>
		 
		<div class="address">
			주소<br> <input id="address" type="text" onclick="findAddr()" readonly>			
			<input id="addressdetail" type="text" placeholder="상세주소를 입력해주세요">
			<button onclick="findAddr()">주소찾기</button>
			<div id="addresserror" class="error"></div>
		</div>
	
		<div class="tel">
			전화번호<br> <input type="text" placeholder="숫자만 입력해주세요" id="tel" maxlength="11">
			<div id="telerror" class="error"></div>
		</div>
		<div class="email">
			이메일<br> <input id="email" type="text">
			<button id="btn-joinnumber" onclick="joinNumber()">인증번호받기</button>
			<div id="emailerror" class="error"></div>
		</div>
		<div>
			인증번호입력<br> <input id="number" type="text">
			<div id="numbererror" class="error"></div>
		</div>

		<div class="signUpcheck">
			<input type="checkbox" name="agree" id="agreeAll"
				onclick="selectAll(this)" value="selectall">
			<spen id="signUptitle">&nbsp;약관 전체 동의하기</spen>
			<br>
			<div id="signUpcontent">
				<input type="checkbox" name="agree" id="agree1">&nbsp;이용약관
				동의(필수)<br> <input type="checkbox" name="agree" id="agree2">&nbsp;개인정보
				취급 방침 동의(필수)<br> <input type="checkbox" name="agree"
					id="agree3">&nbsp;마케팅정보 수신 동의(선택)<br> <br>
			</div>
		</div>

		<div class="signUp">
			<button id="signUpButton">가입하기</button>
		</div>
	</div>
	<!--  <script src="/js/join.js"></script>-->
	<script src="/js/join2.js"></script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/ShoppingmallPayment.css">
<%@ include file="../layout/header.jsp" %>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#finish_wrap{
	width: 80%;
	height:500px;
	margin: 0 auto;
}
p{
	font-size: 30px;
	text-align: center;
	margin-top: 100px;
	font-family: 'GmarketSansMedium';
}
.abox{
text-align: center;
}
.finish_btn{
	display: inline-block;
	width: 200px;
	height: 50px;
	margin-top: 30px;
}
button{
	width: 100%;
	height: 100%;
	text-align: center;
	font-size: 30px;
	border: none;
	border-radius: 10px;
	background-color: #FF8868;
    color: white;
    font-family: 'Jua', sans-serif;
}
</style>
	<div id="finish_wrap">
		<p>결제가 완료 되었습니다!</p>
		<div class="abox">
			<a href="/auth/shop" class="finish_btn"><button>메인으로 가기</button></a>
		</div>
	</div>
<%@ include file="../layout/footer.jsp" %>
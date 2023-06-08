<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/ShoppingmallDetail.css">
<%@ include file="../layout/header.jsp" %> 
	<div id="Shop_Detail_wrap">
        <div class="Shop_Detail_right">
            <div class="detail_goods_firstbox">
            	<div class="product_img_mobile"><img src="/auth/images?filename=${item.filename}"></div>
                <div class="detail_goods_name">
                    <p>${item.name}</p>
                </div>
                <div class="detail_goods_price">
                    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</p>
                </div>
            </div>
            <div class="detail_goods_secondbox">
                <div class="detail_goods_delivery">
                    <div class="delivery_font"><p>배송비</p></div>
                    <div class="delivery_price"><p>무료배송</p></div>
                </div>
                <form method="post" action="/user/cart/${principal.user.id}/${item.id}" name="count">
                    <div class="goods_count_box">
                        <div class="count_font">
                            <p>수량</p>
                            <input type="hidden" name="sell_price" value="${item.price}">
                        </div>
                        <div class="goods_count_btn">
                            <input type="button" value="-" name="minus">
                            <input type="text" id="amount" name="amount" value="1" readonly>
                            <input type="button" value="+" name="add">
                        </div>                  
                    </div>
                    <div class="detail_total_price">
                        <div class="total_font"><p>총 상품금액</p></div>
                        <div class="total_price"><input type="text" name="sum" id="sum" readonly></div>    
                    </div>
	                <div class="detail_payment">
	                    <input type="submit" onclick="alert('장바구니에 등록되었습니다.')" value="장바구니">
	                </div>
	                </form>
	                <div class="goods_payment_now">
	                    <input type="button" onclick="Go_Pay()" value="바로구매">
	                </div>
            </div>
        </div>
        
        
        <div class="Shop_Detail_left">
            <div class="goods_img_box">
                <div class="product_img"><img src="/auth/images?filename=${item.filename}"></div>
            </div>
            <div class="goods_info_box">
                <div class="info_list">
                    <ul class="info_list_ul">
                        <li class="info_list_li"><a href="#info_1" class="list_aBox"><p>상세 정보</p></a></li>
                        <li class="info_list_li"><a href="#info_2" class="list_aBox"><p>배송 안내</p></a></li>
                    </ul>
                </div>
                <div id="info_1"><p><pre style="font-family: 'GmarketSansMedium'; font-size : 24px" >${item.content}</pre></p></div>
                <div id="info_2">
                	<br>
                	<p>배송 방법</p>
                	<p>-택배</p><br>
                	<p>배송 지역</p>
                	<p>- 전국지역</p><br>
                	<p>배송 안내</p>
                	<p>- 산간벽지나 도서지방, 해외배송은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</p>
                	<p>- 주문 제작 상품의 배송 일정은 상품페이지 내 배송 안내를 확인해주시기 바랍니다.</p>
                	<p>- 고객님께서 주문하신 상품은 결제 후 발송됩니다.</p><br>

                	<p>교환 및 반품 주소</p>
                	<p>-[16455]경기도 수원시 팔달구 덕영대로 905 아이메카 7층 그린컴퓨터아카데미 수원</p><br>
                	<br>
                	<p>환불안내</p>
                	<p>- 상품 환불 가능기간은 상품 수령일로 부터 7일 이내 입니다.</p>
                	<p>- 배송 완료 후 구매확정 처리를 하지 않는 경우 7일 후 자동으로 구매 확정으로 처리됩니다.</p>
                	<p>- 구매 확정 후 환불은 고객 센터를 통해 진행 가능합니다.</p>
                </div>
                
            </div>
        </div>
  </div>
<script type="text/javascript">
	function Go_Pay(){
		let amount = document.getElementById('amount').value;
		console.log(amount);
		let url = '/order/now/${principal.user.id}/${item.id}/'+amount;
		console.log(url);
		window.location.href = url;
	}
</script>
<script src="/js/ShoppingDetail.js"></script>
<%@ include file="../layout/footer.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/ShoppingmallPayment.css">
<%@ include file="../layout/header.jsp" %>
	<div id="Shop_pay_wrap">
        <div id="pay_bigbox1">
            <div class="pay_font">
            	<div class="font1"><p>주문/결제</p></div>
                <div class="font2"><p>총 결제금액: <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</p></div>
            </div>
            <div class="pay_table">
                <div class="table_info">
                    <div class="items_name"><p>상품 정보</p></div>
                    <div class="items_count"><p>수량</p></div>
                    <div class="items_price"><p>상품 금액</p></div>
                </div>
                <div class="table_content">
                    <ul>
                    <c:choose>
                    <c:when test="${cartItem != null }"> <!-- 장바구니에 물품이 담겨있으면 -->
                    <c:forEach var="cartItem" items="${cartItem}">
                        <li>
                            <div class="items_name_box">
                                <div class="items_image_box"><img src="/auth/images?filename=${cartItem.item.filename}"></div>
                                <div class="items_naming_box"><p>${cartItem.item.name}<p></div>
                            </div>
                            <div class="items_count_box"><p>${cartItem.count}개</p></div>
                            <div class="items_price_box"><p><fmt:formatNumber type="number" maxFractionDigits="3" value="${(cartItem.count)*(cartItem.item.price)}" />원</p></div>
                        </li>
                    </c:forEach>
                    </c:when>
                    <c:otherwise> <!-- 바로 결제시 -->
                    	<li>
                            <div class="items_name_box">
                                <div class="items_image_box"><img src="/auth/images?filename=${item.filename}"></div>
                                <div class="items_naming_box"><p>${item.name}<p></div>
                            </div>
                            <div class="items_count_box"><p>${count}개</p></div>

                            <div class="items_price_box"><p><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</p></div>
                        </li>
                    </c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </div>
        
        <div id="pay_bigbox2">
        
        	<!-- 주문자 정보 --> 
            <div class="address_box">
                <div class="address_font">
                    <p>배송 정보</p>
                </div>
                <div class="chk_address">
                	<div class="left_radio_box">
                		<input type="radio" id="exist" name="chkadress" checked="checked" onchange="setDisplay()"><label for="exist">기본배송지</label>
                	</div>
                	<div class="right_radio_box">
                		<input type="radio" id="new" name="chkadress" onchange="setDisplay2()"><label for="new">직접입력</label>
                	</div>
                </div>
                <div class="address_content">
                	<p>${principal.user.username2}</p>
                	<p id="hyphen">${principal.user.tel}</p>               
					<p>${principal.user.address}</p>                  
                </div>
                <div class="address_content2" style="display: none;">
                	<table style="width: 100%">
                		<tr>
                			<td><input type="text" placeholder="받는 사람">
                		</tr>
                		<tr>
                			<td><input type="text" placeholder="-없이 휴대폰번호 입력"></td>
                		</tr>
                		<tr>
                			<td><input type="text" placeholder="기본 주소" id="address_kakao"></td>
                		</tr>
                		<tr>
                			<td><input type="text" name="address_detail" placeholder="상세 주소"></td>
                		</tr>
                	</table>
                </div>
            </div>
            <!-- 주문자 정보 끝! --> 
            
            <!-- 장바구니 구매시 필요 데이터 -->
            <input type="hidden" name="userId" id="userId" value="${principal.user.id}">
            <input type="hidden" name="cartId" id="cartId" value="${user.cart.id}">
            <input type="hidden" name="totalPrice" id="totalPrice" value="${totalPrice}">
            <!-- --------------------- -->
            <!-- 바로결제시 필요 데이터(상품id,수량,가격) -->
            <input type="hidden" name="itemId" id="itemId" value="${item.id}">
            <input type="hidden" name="count" id="count" value="${count}">
            <input type="hidden" name="price" id="price" value="${totalPrice}">
            <!-- --------------------- -->
            
            <div class="payment_box">
                <div class="payment_font">
                    <p>결제수단</p>
                </div>
                <div class="payment_content">
                    <div class="cacaopay_box">
                    	<img src="/img/kakaopay.png">
                    </div>
                    <div class="paybox">
                    	<c:choose>
	                    	<c:when test="${count != null}">
	                        	<input type="button" id="btn_order_now" value="바로 결제">
	                        </c:when>
	                        <c:otherwise>
								<input type="button" id="btn_order_cart" value="장바구니 결제">
	                        </c:otherwise>
                       </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 카카오 지도 연결 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/kakaoAdress.js"></script>


<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="/js/payment.js"></script>

<%@ include file="../layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/ShoppingmallCart.css">
<%@ include file="../layout/header.jsp" %>
	<div id="Shop_Basket_wrap">
        <div class="basket_list_box">
            <ul class="basket_list_ul">
            <c:choose>
            	<c:when test="${empty cartItems}">
            		<div class="empty_cart">
            			<p><strong>장바구니에 담긴 상품이 없습니다.</strong></p>
            			<p>원하는 상품을 장바구니에 담아보세요!</p>
            			<a href="/auth/shop" class="go_shop">쇼핑몰로 가기</a>
            		</div>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="cartItem" items="${cartItems}">
	                <li class="basket_list_li">                  
	                    <a href="#" class="basketAbox">
	                        <div class="basket_list_info">
	                            <div class="basket_picture">
	                                <div class="Basket_item_img"><img src="/auth/images?filename=${cartItem.item.filename}"></div>
	                            </div>
	                            <div class="basket_item_name">
	                                <div class="Basket_item_subnames">
	                                    <p>${cartItem.item.name}</p>
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                    <div class="basket_list_info2">
	                        <div class="basket_amount">
	                            <div class="goods_count_btn">
	                            	<button onclick="location.href='/api/cartItem/minus/${cartItem.id}/${user.id}'">-</button>
	                                <input type="text" value="${cartItem.count}" id="amount" name="amount" readonly>
	                                <button onclick="location.href='/api/cartItem/plus/${cartItem.id}/${user.id}'">+</button>
	                            </div>  
	                        </div>
	                        <div class="basket_price">
	                            <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${(cartItem.count)*(cartItem.item.price)}" />원</p>
	                        </div>
	
	                        <div class="basket_delete">
	                            <a href="/user/cart/${principal.user.id}/${cartItem.id}/delete"><i class="fa-regular fa-trash-can"></i></a>
	                        </div>
	                    </div>           
	                </li> 
                	</c:forEach>
            	</c:otherwise>
            </c:choose>
            
            </ul>
        </div>
        <div class="basket_pay_box">
            <div class="payment_price_box">
                <p>총 결제금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</p>
            </div>
            <c:choose>
            	<c:when test="${empty cartItems}">
		            <div class="pay_now">
		                <a href="#" onclick="alert('결제 할 상품이 없습니다!')"><button>결제하기</button></a>
		            </div>
	            </c:when>
	            <c:otherwise>
	            	<div class="pay_now">
		                <a href="/order/cart/${principal.user.id}"><button>결제하기</button></a>
		            </div>
	            </c:otherwise>
            </c:choose>
        </div>
    </div>


<%@ include file="../layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/462a97624e.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/ShoppingmallMain.css">
<%@ include file="../layout/header.jsp" %>
	<div id="Shop_main_wrap">
        <div class="Shop_main_right">
            <ul>
                <li class="nav_list"><a onclick="hide1();" return false;><span class="all_items">전체상품</span></a></li>
                <li class="nav_list"><a onclick="hide2();" return false;><span class="sub_items">굿즈</span></a></li>
                <li class="nav_list"><a onclick="hide3();" return false;><span class="sub_items">반려용품</span></a></li>
                <li class="nav_list"><a onclick="hide4();" return false;><span class="sub_items">매거진</span></a></li>
            </ul>
        </div>
        <div class="mobile_main_right">
        	<ul class="moblie_ul">
                <li class="moblie_nav_list1"><a onclick="hide1();" return false;><p class="all_items1">전체상품</p></a></li>
                <li class="moblie_nav_list2"><a onclick="hide2();" return false;><p class="sub_items1">굿즈</p></a></li>
                <li class="moblie_nav_list3"><a onclick="hide3();" return false;><p class="sub_items2">반려용품</p></a></li>
                <li class="moblie_nav_list4"><a onclick="hide4();" return false;><p class="sub_items3">매거진</p></a></li>
            </ul>
        </div>
        
        <div class="Shop_main_left">          

            <div class="goods_list list1" >
                <ul class="list_ul">
                	<c:forEach var="item" items="${shop.content}">
                    <li class="list_li">
                        <a href="/auth/shop/${item.id}" class="goods_box">
                            <div class="goods_picture">
                            	<img src="/auth/images?filename=${item.filename}">	
                            </div>
                            <div class="goods_info">
                                <div class="goods_name">
                                    <p>${item.name}</p>
                                </div>
                                <div class="goods_price">
                                    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</p>
                                    
                                </div>
                            </div>
                        </a>
                    </li>
					</c:forEach>
                </ul>
            </div>
			
			<div class="goods_list list2" style="display:none;">
                <ul class="list_ul">
                	<c:forEach var="item" items="${shop.content}">
                	<c:if test="${item.category eq '굿즈'}">
                    <li class="list_li">
                        <a href="/auth/shop/${item.id}" class="goods_box">
                            <div class="goods_picture">
                            	<img src="/auth/images?filename=${item.filename}">	
                            </div>
                            <div class="goods_info">
                                <div class="goods_name">
                                    <p>${item.name}</p>
                                </div>
                                <div class="goods_price">
                                    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </c:if>
					</c:forEach>
                </ul>
            </div>
            
            <div class="goods_list list3" style="display:none;">
                <ul class="list_ul">
                	<c:forEach var="item" items="${shop.content}">
                	<c:if test="${item.category eq '반려용품'}">
                    <li class="list_li">
                        <a href="/auth/shop/${item.id}" class="goods_box">
                            <div class="goods_picture">
                            	<img src="/auth/images?filename=${item.filename}">	
                            </div>
                            <div class="goods_info">
                                <div class="goods_name">
                                    <p>${item.name}</p>
                                </div>
                                <div class="goods_price">
                                    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </c:if>
					</c:forEach>
                </ul>
            </div>
            
            <div class="goods_list list4" style="display:none;">
                <ul class="list_ul">
                	<c:forEach var="item" items="${shop.content}">
   					<c:if test="${item.category eq '매거진'}">
                    <li class="list_li">
                        <a href="/auth/shop/${item.id}" class="goods_box">
                            <div class="goods_picture">
                            	<img src="/auth/images?filename=${item.filename}">	
                            </div>
                            <div class="goods_info">
                                <div class="goods_name">
                                    <p>${item.name}</p>
                                </div>
                                <div class="goods_price">
                                    <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </c:if>
					</c:forEach>
                </ul>
            </div>
          	<div class="page_wrap">
		    	<div class="page_nation">
		    		<c:choose>
		    			<c:when test="${shop.first}">
					  		<a class="arrow prev" href="?page=${shop.number-1}"></a>
					  	</c:when>
					  	<c:otherwise>
					  		<a class="arrow prev" href="?page=${shop.number-1}"></a>
					  	</c:otherwise>
		          	</c:choose>
		          	<a href="/auth/shop" class="active">1</a>
		          	<a href="/auth/shop?page=1">2</a>
		          	<a href="/auth/shop?page=2">3</a>
		          	<c:choose>
		    			<c:when test="${shop.last}">
					  		<a class="arrow next" href="?page=${shop.number+1}"></a>
					  	</c:when>
					  	<c:otherwise>
					  		<a class="arrow next" href="?page=${shop.number+1}"></a>
					  	</c:otherwise>
		          	</c:choose>		         	
		       	</div>
		    </div>
            
        </div>
    </div>
    <script>
    const div = document.getElementsByClassName('sub_items');
    div.addEventListener('click', (event) => {
      result.innerHTML+= '<i class="fa-solid fa-check"></i>';
    });
    </script>
<script type="text/javascript" src="/js/Shoppingmall.js"></script>
<%@ include file="../layout/footer.jsp" %>
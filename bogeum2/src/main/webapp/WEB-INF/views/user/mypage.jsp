<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<body>
<%@ include file="../layout/header.jsp"%>
<!-- 모바일네비 -->
<%@ include file="../layout/mobilesidenav.jsp" %>


<div class="container">     

<%@ include file="../layout/sidenav.jsp"%>




        <div class="mypagecontentbox">
            <div class="mypagecontent">
                <div class="mypagecontenttitle">주문/배송 조회</div>
                <div class="myorder1">


                    <div id="recentorder">                        
                        <div id="orderprocess">
                            <ul>
                                <li>
                                    <div class="ordercount"><a href="">0</a></div>
                                    <div>입금대기</div>
                                </li>        
                                <li>></li>                        
                                <li>
                                    <div class="ordercount"><a href="">0</a></div>
                                    <div>결제완료</div>
                                </li>   
                                <li>></li>                              
                                <li>
                                    <div class="ordercount"><a href="">0</a></div>
                                    <div>상품준비중</div>
                                </li>  
                                <li>></li>                               
                                <li>
                                    <div class="ordercount"><a href="">0</a></div>
                                    <div>배송중</div>
                                </li>       
                                <li>></li>                          
                                <li>
                                    <div class="ordercount"><a href="">0</a></div>
                                    <div>수령완료</div>
                                </li>
                            </ul>

                            <div class="refundmenu">
                                <div class="refundcontent">
                                    <div>주문취소&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    <div>0</div>
                                </div>
                                <div class="refundcontent">
                                    <div>교환신청&nbsp;&nbsp;&nbsp;</div>
                                    <div>0</div>
                                </div>
                                <div class="refundcontent">
                                    <div>반품신청&nbsp;&nbsp;&nbsp;</div>
                                    <div>0</div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <div class="mypagecontent">
                <div class="mypagecontenttitle">주문내역</div>

                <div class="myorder2">
                    <div class="myorder2nav">
                        <div class="orderdate">주문일자</div>
                        <div class="myorderitem">주문상품</div>
                        <div class="orderprice">상품금액(수량)</div>
                        <div class="deliveryprice">배송비</div>
                        <div class="confirm">확인/취소</div>
                    </div>
			
					<c:forEach var="order" items="${order}">
	                    <div class="myorder2content">
	                        <div class="orderdate">${order.createDate}</div>
	                        <c:forEach var="orderItem" items="${orderItem}">
	                        <div class="myorderitem">         
	                            <div class="itemname">${orderItem.itemName}</div>                           
	                        </div>                        
	                        <div class="orderprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderItem.itemPrice}" />원<br><br>(${orderItem.itemCount}개)</div>
	                        </c:forEach>
	                        <div class="deliveryprice">무료</div>
	                        <div class="confirm">
	                        	<c:choose>
	                 			<c:when test="${order.isCancel eq 2}">
	                       	 		<p>취소완료</p>
	                       	 	</c:when>
	                       	 	<c:otherwise>
	                       	 		<a href="/order/cancel/${principal.user.id}/${order.id}" style="color: red">주문취소</a>
	                       	 	</c:otherwise>
	                       	 	</c:choose>
	                        </div>
	                    </div>
					</c:forEach>
                </div>
				<!-- userId -->
				<input type="hidden" value="${principal.user.id}"> 
				<!-- ------ -->
            </div>
        </div>

    </div>  
    
    
    
    <%@ include file="../layout/footer.jsp" %>
    
    
</body>
</html>
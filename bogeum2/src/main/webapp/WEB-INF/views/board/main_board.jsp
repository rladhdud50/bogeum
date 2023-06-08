<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보금자리>커뮤니티</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!--Swiper-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
    />
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/7e47ddf105.js" crossorigin="anonymous"></script>
    <%--jstl--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec"
               uri="http://www.springframework.org/security/tags" %>
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal" var="principal"/>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    </sec:authorize>
    <link rel="stylesheet" href="/css/main_board.css">
</head>
<body>

<div class="banner1"><img class="normal" src="/img/BoardBanner1.png">
<%--    <div class="banner1_small"><img class="small" src="/img/BoardBanner1_phone.png"></div>--%>
</div>

<div class="container">
    <div id="content2">
        <div class="board">
            <div class="contenttitle2 mainTitle"><a href=/auth/notice> 공지사항<span class="titleimg"><i class="fa-solid fa-plus"></i></span></a>
            </div>
            <div class="content2">
                <c:forEach var="notice" items="${notice.content}">
                    <div class="content2title" style=" cursor: pointer;"
                         onclick="location.href='/notice/${notice.id}';"><a
                            href="/notice/${notice.id}">${notice.title} <span style="float: right"> <fmt:formatDate
                            pattern="yyyy-MM-dd" value="${notice.createDate}"/></span></a></div>
                </c:forEach>
            </div>
        </div>
        <div class="board">
            <div class="contenttitle2 mainTitle"><a href="/auth/inquiry"> 문의사항<span class="titleimg"><i
                    class="fa-solid fa-plus"></i></span></a></div>
            <div class="content2">
                <c:forEach var="inquirys" items="${inquirys.content}">
                    <div class="content2title" style=" cursor: pointer;"
                         onclick="location.href='/inquiry/${inquirys.id}';"><a
                            href="/inquiry/${inquirys.id}">${inquirys.title} <span style="float: right"> <fmt:formatDate
                            pattern="yyyy-MM-dd" value="${inquirys.createDate}"/></span></a></div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="content3">
        <div class="board">
            <div class="contenttitle2 mainTitle"><a href="/auth/findboard"> 분실/습득<span class="titleimg"><i
                    class="fa-solid fa-plus"></i></span></a></div>
            <div class="content2">
                <c:forEach var="finds" items="${finds.content}">
                    <div class="content2title" style=" cursor: pointer;" onclick="location.href='/finds/${finds.id}';">
                        <a
                                href="/finds/${finds.id}">${finds.title} <span style="float: right"> <fmt:formatDate
                                pattern="yyyy-MM-dd" value="${finds.createDate}"/></span></a></div>
                </c:forEach>
            </div>
        </div>
        <div class="board">
            <div class="contenttitle2 mainTitle"><a href="/auth/free"> 자유게시판<span class="titleimg"><i
                    class="fa-solid fa-plus"></i></span></a></div>
            <div class="content2">
                <c:forEach var="free" items="${free.content}">
                    <div class="content2title" style=" cursor: pointer;" onclick="location.href='/free/${free.id}';"><a
                            href="/free/${free.id}">${free.title} <span style="float: right">  <fmt:formatDate
                            pattern="yyyy-MM-dd" value="${free.createDate}"/></span></a></div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="content4">
        <div class="contenttitle3"> 입양 지원 / 안내</div>
    </div>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide "><img src="/img/BoardBanner_2.png"></div>
            <div class="swiper-slide "><img src="/img/BoardBanner_3.png"></div>
            <div class="swiper-slide "><img src="/img/BoardBanner_4.png"></div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

</div>
<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>
</body>
<%@ include file="../layout/footer.jsp" %>
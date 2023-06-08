<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보금자리>분실/습득</title>
<%--Font--%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%--Css--%>

<link rel="stylesheet" href=/css/inquiry_board.css>
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
<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<%--Header--%>
<%@ include file="../layout/header.jsp" %>
<body>
<%--Menu--%>
<div class="container">
    <div class="board_menu">
        <div class="subject"><b>커뮤니티</b></div>
        <br>
        <div class="menuList"><a href="/auth/notice"><i class="fa-solid fa-bell"></i> 공지사항</a></div>
        <br>
        <div class="menuList"><a href="/auth/free"><i class="fa-regular fa-pen-to-square"></i> 자유게시판</a></div>
        <br>
        <div class="menuList"><a href="/auth/shelter"><i class="fa-solid fa-cat"></i> 입양안내</a></div>
        <br>
        <div class="menuList"><a href="/auth/findboard"><i class="fa-solid fa-person-circle-question"></i> 분실/습득</a></div>
        <br>
        <div class="menuList"><a href="/auth/inquiry"><i class="fa-solid fa-comment"></i> 문의사항</a></div>
        <br>
    </div>
    <div class="board_wrap2">
        <div class="board_title">
            <strong>분실/습득</strong>
            <p>반려동물을 찾아주세요!! 가족들이 기다리고 있습니다</p>
            <%--===================글쓰기===================--%>
            <div class="writeForm1">
                <button type="button" id="btnWrite" onclick="location.href = '/find_board_saveForm'">글쓰기</button>
            </div>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회수</div>
                </div>
                <c:forEach var="finds" items="${finds.content}">
                    <div class="list_content">
                        <div class="num">${finds.id}</div>
                        <div class="title"><a href="/finds/${finds.id}">${finds.title}</a></div>
                        <div class="writer">${finds.users.username}</div>
                        <div class="date"><fmt:formatDate
                                pattern="yyyy-MM-dd HH:mm" value="${finds.createDate}"/></div>
                        <div class="count">${finds.count}</div>
                    </div>
                </c:forEach>
            </div>
<%--pagenation--%>
            <div class="board_page">
                <c:choose>
                    <c:when test="${finds.first}">
                        <a class="bt first" href="?page=${finds.number-1}"><</a>
                    </c:when>
                    <c:otherwise>
                        <a class="bt prev" href="?page=${finds.number-1}"><</a>
                    </c:otherwise>
                </c:choose>
                <a href="/auth/findboard" class="num on">1</a>
                <a href="/auth/findboard?page=1" class="num">2</a>
                <a href="/auth/findboard?page=2" class="num">3</a>
                <a href="/auth/findboard?page=4" class="num">4</a>
                <a href="/auth/findboard?page=5" class="num">5</a>
                <c:choose>
                    <c:when test="${finds.last}">
                        <a class="bt next" href="?page=${finds.number+1}">></a>
                    </c:when>
                    <c:otherwise>
                        <a class="bt last" href="?page=${finds.number+1}">></a>
                    </c:otherwise>
                </c:choose>
            </div>

            <%--===================검색기능===================--%>
            <div class="bt_wrap">
                <form name="searchForm" method="GET" action="/auth/finds/search">
                    <select name="searchOption">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="keyword" id="keyword">
                    <input type="submit" id="search" name="submit" value="">
                </form>

                <%--===================글쓰기===================--%>
                <div class="writeForm2">
                    <button type="button" id="btnWrite" onclick="location.href = '/find_board_saveForm'">글쓰기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../layout/footer.jsp"%>

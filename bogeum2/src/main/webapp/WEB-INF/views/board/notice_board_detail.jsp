<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/reset.css">
<%--Jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp" %>
<title>보금자리>공지사항</title>
<!-- Font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Css-->
<link rel="stylesheet" href="/css/boardDetail.css">
</head>
<body>
<div class="board_wrap">
    <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 안내드립니다</p>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <span id="id" style="display: none;">${notice.id}</span>
            <div class="title">
                ${notice.title}
            </div>
            <div class="info">
                <dl>
                    <dt>번호</dt>
                    <dd>${notice.id}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd>${notice.users.username}</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><fmt:formatDate
                            pattern="yyyy-MM-dd HH:mm" value="${notice.createDate}"/></dd>
                </dl>
                <dl>
                    <dt>조회수</dt>
                    <dd>${notice.count}</dd>
                </dl>
            </div>
            <div class="cont">
                <p>${notice.content}</p>
            </div>
        </div>
        <div class="bt_wrap">
            <button class="btn" onclick="location.href='/auth/notice'">목록</button>
            <c:if test="${notice.users.id == principal.user.id}">
                <a class="btn bt1" href="/notice/${notice.id}/notice_board_updateForm">수정</a>
                <button id="btn_delete" class="btn bt2">삭제</button>
            </c:if>
        </div>

    </div>
    <br>
</div>
</div>
</body>
<script type="text/javascript" src="/js/Notice.js"></script>
<%@ include file="../layout/footer.jsp" %>
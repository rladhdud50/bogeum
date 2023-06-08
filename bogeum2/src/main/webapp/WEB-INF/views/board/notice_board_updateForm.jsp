<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<title>공지사항>글쓰기</title>
<%--Summernote--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<%--Font--%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<%--Css--%>
<link rel="stylesheet" href=/css/inquiry_board.css>

<body>
<div class="board_wrap">
    <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 안내드립니다</p>
    </div>
    <form id="form_total">
        <input type="hidden" id="id" value="${notice.id}">
        <div class="board_write">
            <div class="title form_group">
                <dl>
                    <dt>제목</dt>
                    <dd><input type="text" class="form_control" placeholder="제목 입력" id="title" value="${notice.title}"></dd>
                </dl>
            </div>
            <br>
            <div class="cont form_group">
                <textarea rows="5" class="form_control summernote" id="content">${notice.content}</textarea>
            </div>
        </div>
    </form>
    <div class="bt_wrap">
        <button id="btn_update" class="btn">수정</button>
        <button class="btn" value="#" onclick="history.back()">취소</button>
    </div>
</div>
<script>
    $('.summernote').summernote({
        tabsize: 2,
        height: 400
    });
</script>
<script type="text/javascript" src="/js/Notice.js"></script>
<%@ include file="../layout/footer.jsp"%>

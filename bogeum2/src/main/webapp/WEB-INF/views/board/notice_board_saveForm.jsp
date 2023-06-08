<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<body>
<div class="board_wrap">
    <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 안내드립니다</p>
    </div>
    <form action="" id="form_total">
        <div class="board_write">
            <div class="title">
                <dl>
                    <dt>제목</dt>
                    <dd><input type="text" placeholder="제목 입력" id="title"></dd>
                </dl>
            </div>
            <br>
            <div class="cont">
                <textarea rows="5" class="form-control summernote" id="content"></textarea>
            </div>
        </div>
    </form>
    <div class="bt_wrap">
        <button id="btn_save" class="btn">글쓰기</button>
        <button class="btn" onclick="history.back()">취소</button>
    </div>
</div>
<script>
    $('.summernote').summernote({
        tabsize: 2,
        height: 400
    });
</script>
</body>
<script type="text/javascript" src="/js/Notice.js"></script>
<%@ include file="../layout/footer.jsp" %>
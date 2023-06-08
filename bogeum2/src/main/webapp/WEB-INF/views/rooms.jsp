<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <style>
        a {
            color: inherit;
            text-decoration: none;
        }
        .list-group-item {
            border-radius: 5px;
        }
        body {
            background-image: url("/img/background-chat.jpg");
        }

    </style>
</head>
<body style="margin: 50px;font-family: 'Jua', sans-serif;" >
<div class="container">
    <div class="top-fixed" >
        <h3 style="text-align: center;color: #f8f8f8">정보공유방 목록</h3>
    </div>
    <div class="list-group">
<%--        <ul class="list-group">--%>
<%--            <li class="list-group-item list-group-item-action">--%>
<%--                <a href="/chat/room?roomId=1" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">정보공유방<span class="badge bg-primary rounded-pill">14</span></a>--%>

<%--            </li>--%>
            <c:forEach items="${list}" var="room">
                 <a href="<c:url value='/chat/room?roomId=${room.roomId}'/>" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">${room.name}<span class="badge bg-primary rounded-pill">14</span></a>
            </c:forEach>
<%--        </ul>--%>
    </div>
    <br>
    <hr>
    <c:if test="${principal.user.roles eq 'ADMIN'}">
    <form action="/chat/room" method="post" class="d-flex">
        <input type="text" name="name" class="form-control">
        <button class="btn btn-secondary btn-create" >Create</button>
    </form>
    </c:if>
</div>

<%--    <input type="text" name="name">--%>
<%--<button class="btn btn-secondary btn-create">개설하기</button>--%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

        var roomName = '<c:out value="${room.name}" />';

        if(roomName != null && roomName != "")
            alert(roomName + " 방이 개설되었습니다.");

        $(".btn-create").on("click", function (e){
            e.preventDefault();

            var name = $("input[name='name']").val();

            if(name == "")
                alert("이름을 입력하세요.");
            else
                $("form").submit();
        });

    });
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/462a97624e.js"
        crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <style>
        .top-fixed {
            top: 0;
            left: 0;
            right: 0;
            position: fixed;
            height: 60px;
            padding: 1rem;
            color: #12263a;
            background: antiquewhite;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 999;
            background-image: url("/img/water.jpg");

        }
        .arrow_box:after, .arrow_box:before {
            right: 100%;
            top: 50%;
            border: solid transparent;
            content: "";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
        }

        .arrow_box:after {
            border-color: rgba(136, 183, 213, 0);
            border-right-color: #e2e3e5;
            border-width: 30px;
            margin-top: -30px;
        }

        .arrow_box2 {
            position: relative;
            background: #fff3cd;

        }
        .arrow_box2:after, .arrow_box:before {
            left: 100%;
            top: 50%;
            border: solid transparent;
            content: "";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
        }

        .arrow_box2:after {
            border-color: rgba(136, 183, 213, 0);
            border-left-color: #fff3cd;
            border-width: 30px;
            margin-top: -30px;
        }
        /*.arrow_box:before {*/
        /*    border-color: rgba(194, 225, 245, 0);*/
        /*    border-right-color: #c2e1f5;*/
        /*    border-width: 36px;*/
        /*    margin-top: -36px;*/

        body {
            background-image: url("/img/background-chat.jpg");
        }
    </style>
</head>
<body style="margin-top: 100px;
    margin-left: 25px;
    margin-right: 25px;font-family: 'Jua', sans-serif;">
<div class="container">
    <div class="top-fixed"  >
        <div onclick="history.back()" style="cursor: pointer">
            <i class="fa-solid fa-reply" style="width: 24px"></i>
        </div>
        <div class="col" style="text-align: center;">
            <h1 style="height: 25px"><c:out value="${room.name}" /></h1>
        </div>
    </div>
    <div>
        <div id="msgArea" class="col"></div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" id="msg" class="form-control" style="top: 470px; position: fixed; width: 275px">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="button-send" style="background-color: antiquewhite; top: 470px; position: fixed; right: 40px;">전송</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>


    document.getElementById("msg").addEventListener("keyup", function(event) {
        event.preventDefault();
        if (event.keyCode === 13) {
            document.getElementById("button-send").click();
        }
    });

    $(document).ready(function(){

        var roomName = '<c:out value="${room.name}"/>';
        var roomId = '<c:out value="${room.roomId}"/>';
        <%--var username = '<c:out value="${pageContext.request.remoteUser}"/>';--%>
        var username = '${principal.user.username}';
        <%--alert('${principal.user.username}');--%>
        console.log(roomName + ", " + roomId + ", " + username);

        var sockJs = new SockJS("/stomp/chat");
        //1. SockJS를 내부에 들고있는 stomp를 내어줌
        var stomp = Stomp.over(sockJs);

        //2. connection이 맺어지면 실행
        stomp.connect({}, function (){
            console.log("STOMP Connection")

            //4. subscribe(path, callback)으로 메세지를 받을 수 있음
            stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                var content = JSON.parse(chat.body);

                var writer = content.writer;
                var message = content.message;
                var str = '';

                if(writer === username){
                    str = "<div class='col-12'>";
                    str += "<div class='alert alert-secondary arrow_box'>";
                    str += "<b>" + writer + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
                else{
                    str = "<div class='col-12'>";
                    str += "<div class='alert alert-warning arrow_box2'>";
                    str += "<b>" + writer + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
            });

            //3. send(path, header, message)로 메세지를 보낼 수 있음
            stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
        });

        $("#button-send").on("click", function(e){
            var msg = document.getElementById("msg");

            console.log(username + ":" + msg.value);
            stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
            msg.value = '';
        });
    });
    $('#msgArea').scrollTop($('#msgArea')[0].scrollHeight);
</script>
<%--<script>--%>
<%--    $(document).ready(function(){--%>

<%--        var roomName = [[${room.name}]];--%>
<%--        var roomId = [[${room.roomId}]];--%>
<%--        var username = [[${#authentication.principal.username}]];--%>

<%--        console.log(roomName + ", " + roomId + ", " + username);--%>

<%--        var sockJs = new SockJS("/stomp/chat");--%>
<%--        //1. SockJS를 내부에 들고있는 stomp를 내어줌--%>
<%--        var stomp = Stomp.over(sockJs);--%>

<%--        //2. connection이 맺어지면 실행--%>
<%--        stomp.connect({}, function (){--%>
<%--            console.log("STOMP Connection")--%>

<%--            //4. subscribe(path, callback)으로 메세지를 받을 수 있음--%>
<%--            stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {--%>
<%--                var content = JSON.parse(chat.body);--%>

<%--                var writer = content.writer;--%>
<%--                var str = '';--%>

<%--                if(writer === username){--%>
<%--                    str = "<div class='col-6'>";--%>
<%--                    str += "<div class='alert alert-secondary'>";--%>
<%--                    str += "<b>" + writer + " : " + message + "</b>";--%>
<%--                    str += "</div></div>";--%>
<%--                    $("#msgArea").append(str);--%>
<%--                }--%>
<%--                else{--%>
<%--                    str = "<div class='col-6'>";--%>
<%--                    str += "<div class='alert alert-warning'>";--%>
<%--                    str += "<b>" + writer + " : " + message + "</b>";--%>
<%--                    str += "</div></div>";--%>
<%--                    $("#msgArea").append(str);--%>
<%--                }--%>

<%--                $("#msgArea").append(str);--%>
<%--            });--%>

<%--            //3. send(path, header, message)로 메세지를 보낼 수 있음--%>
<%--            stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))--%>
<%--        });--%>

<%--        $("#button-send").on("click", function(e){--%>
<%--            var msg = document.getElementById("msg");--%>

<%--            console.log(username + ":" + msg.value);--%>
<%--            stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));--%>
<%--            msg.value = '';--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
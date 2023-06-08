<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel='stylesheet' type='text/css' href='/css/chat.css'>
    <style>
        *{
            box-sizing: border-box;
        }

        #chat{
            width: 800px;
            margin: 20px auto;
        }

        #chat #talk{
            width: 800px;
            height: 400px;
            overflow: scroll;
            border : 1px solid #aaa;
        }
        #chat #msg{
            width: 740px;
            height:100px;
            display: inline-block;
        }

        #chat #sendZone > *{
            vertical-align: top;

        }
        #chat #btnSend{
            width: 54px;
            height: 100px;
        }

        #chat #talk div{
            width: 70%;
            display: inline-block;
            padding: 6px;
            border-radius:10px;

        }

        #chat .me{
            background-color : #ffc;
            margin : 1px 0px 2px 30%;
        }

        #chat .other{
            background-color : #eee;

    </style>
</head>
<body>
    <div id="chat">
        <h1>웹소켓 채팅 테스트</h1>
        <input type="text" id="mid" value="홍길동">
        <input type="button" id="btnLogin" value="로그인">
        <br/>
        <div id="talk"></div>
        <div id="sendZone">
            <textarea id="msg" value="hi..."></textarea>
            <input type="button" id="btnSend" value="전송">
        </div>
    </div>
    <script src="/js/chat.js"></script>
</body>
</html>
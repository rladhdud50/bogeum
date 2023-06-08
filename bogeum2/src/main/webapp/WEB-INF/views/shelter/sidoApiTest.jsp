<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sidoapi</title>
</head>
<body>


<script>
    /* Javascript 샘플 코드 */


    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sido'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('50'); /**/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {

            document.write('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        }
    };

    xhr.send('');
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>api테스트</title>
</head>
<body>

<script>
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/

    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 갯수*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/


    queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent(''); /*축종코드 개 : 417000, 고양이 : 422400*/
    queryParams += '&' + encodeURIComponent('neuterYn') + '=' + encodeURIComponent(''); /*(전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U*/
    // queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(''); /*품종코드*/
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */
    queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent(''); /*유기날짜 검색 시작일 YYYYMMDD */
    // queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20230201'); /*유기날짜 검색 종료일*/
    queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(''); /*시도코드*/
    // queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(''); /*보호소번호*/

    neuterYn
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            document.write('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        }
    };

    xhr.send('');
</script>

<%--    <script>--%>
<%--        var xhr = new XMLHttpRequest();--%>
<%--        var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/--%>
<%--        var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'서비스키'; /*Service Key*/--%>
<%--        queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent(' '); /*공고시작일*/--%>
<%--        queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent(' '); /*공고만료일*/--%>
<%--        queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent(' '); /*축종코드*/--%>
<%--        queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(' '); /*품종코드*/--%>
<%--        queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(' '); /*시도코드*/--%>
<%--        queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(' '); /*시군구코드*/--%>
<%--        queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + encodeURIComponent(' '); /**/--%>
<%--        queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent(' '); /*상태*/--%>
<%--        queryParams += '&' + encodeURIComponent('neuter_yn') + '=' + encodeURIComponent(' '); /*중성화유무*/--%>
<%--        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지번호*/--%>
<%--        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/--%>
<%--        queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent(' '); /**/--%>
<%--        xhr.open('GET', url + queryParams);--%>
<%--        xhr.onreadystatechange = function () {--%>
<%--            if (this.readyState == 4) {--%>
<%--                alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);--%>
<%--            }--%>
<%--        };--%>

<%--        xhr.send('');--%>
<%--    </script>--%>
</body>
</html>

function shelterSearch() {
    /**
     *날짜형식변경 YYYYMMDD
     */
    var date = new Date($('#notice-date').val());
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth()+1).toString().padStart(2, '0');
    var dd = date.getDate().toString().padStart(2, '0');
    var yyyymmdd = yyyy + mm + dd;
    if (yyyymmdd == 'NaNNaNNaN'){
        Swal.fire({
            html: "날짜를 입력해주세요",
            icon: "warning"
        });
        return false;
    }
    /**
     * 유기동물조회API {XMLHttpRequest}
     */
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/

    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 갯수*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/
    queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent($('input:radio[name=animal]:checked').val()); /*축종코드 개 : 417000, 고양이 : 422400*/
    queryParams += '&' + encodeURIComponent('neuter_yn') + '=' + encodeURIComponent($('input:radio[name=neuter]:checked').val()); /*(전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U*/
// queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(''); /*품종코드*/
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */
    queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent(yyyymmdd); /*유기날짜 검색 시작일 YYYYMMDD */

// queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20230201'); /*유기날짜 검색 종료일*/
    queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent($('#city').val()); /*시도코드*/
// queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(''); /*보호소번호*/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        // if (this.readyState == 4) {
        //     alert($('input:radio[name=neuter]:checked').val())
        //     document.write('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
        // }
        if (this.readyState == 4 && this.status == 200) {
            // alert(yyyymmdd);
            // alert($('input:radio[name=neuter]:checked').val())

            var dat = JSON.parse(this.responseText);
            var html = '';
            count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
            document.getElementById('search-rst').innerHTML = count;
            for (var i in dat.response.body.items.item) {
                var item = dat.response.body.items.item[i];

                html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                html += '<p>' + item.kindCd +'&nbsp'+ '<span style="color: #b8dff8">(' + item.noticeSdt + ')</span></p>';
                // html += '<p>공고날짜: ' + item.noticeSdt + '</p>';
                html += '<p>지역: ' + item.orgNm + '</p></div>';
            }
            document.getElementById('pic-wrap').innerHTML = html;
            for (var i in dat.response.body.items.item) {
                let itemnn = dat.response.body.items.item[i];

                let data = {
                    desertionNo: itemnn.desertionNo,
                    kindCd: itemnn.kindCd,
                    colorCd: itemnn.colorCd,
                    age: itemnn.age,
                    weight: itemnn.weight,
                    noticeSdt: itemnn.noticeSdt,
                    noticeEdt: itemnn.noticeEdt,
                    popfile: itemnn.popfile,
                    sexCd: itemnn.sexCd,
                    neuterYn: itemnn.neuterYn,
                    specialMark: itemnn.specialMark,
                    careNm: itemnn.careNm,
                    careTel: itemnn.careTel,
                    careAddr: itemnn.careAddr,
                    processState: itemnn.processState,
                };
                console.log(data)
                $.ajax({
                    type: "POST",
                    url: "/auth/shelter",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done(function (resp) {
                    // alert("테스트");
                    // location.href = "/auth/shelter";
                }).fail(function (error) {
                    // alert(JSON.stringify(error));
                });
            }
        }
    };
    xhr.send('');
}
    /**
     * 유기동물조회API {XMLHttpRequest} 전체출력
     */
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/

    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('8'); /*페이지당 보여줄 갯수*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */

    xhr.open('GET', url + queryParams);

    xhr.onreadystatechange = function () {


        if (this.readyState == 4 && this.status == 200) {
            // alert("테스트");
            var dat = JSON.parse(this.responseText);
            var html = '';

            // var item = data.response.body.items.item
            count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
            document.getElementById('search-rst').innerHTML = "(&nbsp"+count+"&nbsp)";
            for (var i in dat.response.body.items.item) {
                let item = dat.response.body.items.item[i];

                html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                html += '<p>' + item.kindCd + '</p>';
                html += '<p><span style="color: #b8dff8">나이: (' + item.age + ')</span></p>';
                html += '<p>공고날짜: ' + item.noticeSdt + '</p>';
                html += '<p>지역: ' + item.orgNm + '</p></div>';
            }
            document.getElementById('pic-wrap').innerHTML = html;

            for (var i in dat.response.body.items.item) {
                let itemnn = dat.response.body.items.item[i];

                let data = {
                    desertionNo: itemnn.desertionNo,
                    kindCd: itemnn.kindCd,
                    colorCd: itemnn.colorCd,
                    age: itemnn.age,
                    weight: itemnn.weight,
                    noticeSdt: itemnn.noticeSdt,
                    noticeEdt: itemnn.noticeEdt,
                    popfile: itemnn.popfile,
                    sexCd: itemnn.sexCd,
                    neuterYn: itemnn.neuterYn,
                    specialMark: itemnn.specialMark,
                    careNm: itemnn.careNm,
                    careTel: itemnn.careTel,
                    careAddr: itemnn.careAddr,
                    processState: itemnn.processState,
                };
                console.log(data)
                $.ajax({
                    type: "POST",
                    url: "/auth/shelter",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done(function (resp) {
                    // alert("테스트")
                    // location.href = "/auth/shelter";
                }).fail(function (error) {
                    // alert(JSON.stringify(error));
                });
            }
        }
    };
    xhr.send('');






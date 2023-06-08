
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
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */
    queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent(yyyymmdd); /*유기날짜 검색 시작일 YYYYMMDD */
    queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent($('#city').val()); /*시도코드*/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {

        if (this.readyState == 4 && this.status == 200) {


            var dat = JSON.parse(this.responseText);
            var html = '';
            count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
            document.getElementById('search-rst').innerHTML = count;
            for (var i in dat.response.body.items.item) {
                var item = dat.response.body.items.item[i];

                html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                html += '<p>' + item.kindCd +'&nbsp'+ '<span style="color: #b8dff8">(' + item.noticeSdt + ')</span></p>';
                html += '<p>지역: ' + item.orgNm + '</p></div>';
            }
            document.getElementById('pic-wrap').innerHTML = html;

            // 서버 측에서 총 데이터 건수를 조회한 후, 다음 변수에 저장합니다.
            var totalDataCount = dat.response.body.totalCount;

            // 페이지당 보여줄 데이터 건수와 현재 페이지 번호를 파라미터로 전달받습니다.
            var pageSize = dat.response.body.numOfRows;
            var currentPage = dat.response.body.pageNo;

            // 총 페이지 수를 계산합니다.
            var totalPageCount = Math.ceil(totalDataCount / pageSize);

            // 페이지 링크를 생성합니다.
            var pageLinkHtml = '';
            var maxPageCount = 10; // 한 페이지에 최대 보여줄 링크 수
            var startIndex = Math.floor((currentPage - 1) / maxPageCount) * maxPageCount + 1; // 시작 페이지 번호
            var endIndex = Math.min(startIndex + maxPageCount - 1, totalPageCount); // 끝 페이지 번호

            // 이전 버튼 생성
            if (startIndex > 1) {
                pageLinkHtml += '<button onclick="sendPageNo2(' + (startIndex - 1) + ')">&laquo;</button>';
            }

            for (var i = startIndex; i <= endIndex; i++) {
                var activeClass = (i === currentPage) ? 'active' : '';
                pageLinkHtml += '<button class="' + activeClass + '" onclick="sendPageNo2(' + i + ')">' + i + '</button>';
            }

            // 다음 버튼 생성
            if (endIndex < totalPageCount) {
                pageLinkHtml += '<button onclick="sendPageNo2(' + (endIndex + 1) + ')">&raquo;</button>';
            }

            // 페이지 링크를 페이지 네이션에 추가합니다.
            var pageNationElem = document.querySelector('.page_nation');
            pageNationElem.innerHTML = pageLinkHtml;

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

                }).fail(function (error) {
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

        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 갯수*/
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
        queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/
        queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */

        xhr.open('GET', url + queryParams);

        xhr.onreadystatechange = function () {

            if (this.readyState == 4 && this.status == 200) {
                // alert("테스트");

                var dat = JSON.parse(this.responseText);
                var html = '';

                // 서버 측에서 총 데이터 건수를 조회한 후, 다음 변수에 저장
                var totalDataCount = dat.response.body.totalCount;

                // 페이지당 보여줄 데이터 건수와 현재 페이지 번호를 파라미터로 전달
                var pageSize = dat.response.body.numOfRows;
                var currentPage = dat.response.body.pageNo;

                // 총 페이지 수를 계산
                var totalPageCount = Math.ceil(totalDataCount / pageSize);

                // 페이지 링크를 생성
                var pageLinkHtml = '';
                var maxPageCount = 10; // 한 페이지에 최대 보여줄 링크 수
                var startIndex = Math.floor((currentPage - 1) / maxPageCount) * maxPageCount + 1; // 시작 페이지 번호
                var endIndex = Math.min(startIndex + maxPageCount - 1, totalPageCount); // 끝 페이지 번호

                // 이전 버튼 생성
                if (startIndex > 1) {
                    pageLinkHtml += '<button onclick="sendPageNo(' + (startIndex - 1) + ')">&laquo;</button>';
                }


                for (var i = startIndex; i <= endIndex; i++) {
                    var activeClass = (i === currentPage) ? 'active' : '';
                    pageLinkHtml += '<button class="' + activeClass + '" onclick="sendPageNo(' + i + ')">' + i + '</button>';
                }

                // 다음 버튼 생성
                if (endIndex < totalPageCount) {
                    pageLinkHtml += '<button onclick="sendPageNo(' + (endIndex + 1) + ')">&raquo;</button>';
                }

                // 페이지 링크를 페이지 네이션에 추가
                var pageNationElem = document.querySelector('.page_nation');
                pageNationElem.innerHTML = pageLinkHtml;

                count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
                document.getElementById('search-rst').innerHTML = count;
                for (var i in dat.response.body.items.item) {
                    let item = dat.response.body.items.item[i];

                    html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                    html += '<p>' + item.kindCd + '&nbsp' + '<span style="color: #b8dff8">(' + item.noticeSdt + ')</span></p>';
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

console.log(xhr);


function sendPageNo(pageNo) {


    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 갯수*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(pageNo); /*페이지 번호*/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {

        console.log("readyState: " + this.readyState + ", status: " + this.status);
        if (this.readyState == 4 && this.status == 200) {

            var dat = JSON.parse(this.responseText);

            var html = '';
            // 서버 측에서 총 데이터 건수를 조회한 후, 다음 변수에 저장
            var totalDataCount = dat.response.body.totalCount;

            // 페이지당 보여줄 데이터 건수와 현재 페이지 번호를 파라미터로 전달
            var pageSize = dat.response.body.numOfRows;
            var currentPage = dat.response.body.pageNo;

            // 총 페이지 수를 계산
            var totalPageCount = Math.ceil(totalDataCount / pageSize);

            // 페이지 링크를 생성
            var pageLinkHtml = '';
            var maxPageCount = 10; // 한 페이지에 최대 보여줄 링크 수
            var startIndex = Math.floor((currentPage - 1) / maxPageCount) * maxPageCount + 1; // 시작 페이지 번호
            var endIndex = Math.min(startIndex + maxPageCount - 1, totalPageCount); // 끝 페이지 번호

            // 이전 버튼 생성
            if (startIndex > 1) {
                pageLinkHtml += '<button onclick="sendPageNo(' + (startIndex - 1) + ')">&laquo;</button>';
            }


            for (var i = startIndex; i <= endIndex; i++) {
                var activeClass = (i === currentPage) ? 'active' : '';
                pageLinkHtml += '<button class="' + activeClass + '" onclick="sendPageNo(' + i + ')">' + i + '</button>';
            }

            // 다음 버튼 생성
            if (endIndex < totalPageCount) {
                pageLinkHtml += '<button onclick="sendPageNo(' + (endIndex + 1) + ')">&raquo;</button>';
            }

            // 페이지 링크를 페이지 네이션에 추가
            var pageNationElem = document.querySelector('.page_nation');
            pageNationElem.innerHTML = pageLinkHtml;


            // var item = data.response.body.items.item
            count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
            document.getElementById('search-rst').innerHTML = count;
            for (var i in dat.response.body.items.item) {
                let item = dat.response.body.items.item[i];

                html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                html += '<p>' + item.kindCd + '&nbsp' + '<span style="color: #b8dff8">(' + item.noticeSdt + ')</span></p>';
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
                    // alert("테스트")
                    // location.href = "/auth/shelter";
                }).fail(function (error) {
                    // alert(JSON.stringify(error));
                });
            }
        }
    };
    xhr.send('');
}

function sendPageNo2(pageNo) {

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

    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'PDUYcZF9dcMRdEkUd1Pw9rGid%2BJo0ZfjB3LCXuea%2BFybDCjXK%2FsY5e8uyVqZGqCdwUijgAfBM31dtYDTZmWpOQ%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 갯수*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(pageNo); /*페이지 번호*/
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('JSON'); /*응답형태*/
    queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent($('input:radio[name=animal]:checked').val()); /*축종코드 개 : 417000, 고양이 : 422400*/
    queryParams += '&' + encodeURIComponent('neuter_yn') + '=' + encodeURIComponent($('input:radio[name=neuter]:checked').val()); /*(전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U*/
    queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('notice'); /*상태 notice:보호중 */
    queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent(yyyymmdd); /*유기날짜 검색 시작일 YYYYMMDD */
    queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent($('#city').val()); /*시도코드*/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {

        console.log("readyState: " + this.readyState + ", status: " + this.status);
        if (this.readyState == 4 && this.status == 200) {

            var dat = JSON.parse(this.responseText);

            var html = '';
            // 서버 측에서 총 데이터 건수를 조회한 후, 다음 변수에 저장
            var totalDataCount = dat.response.body.totalCount;

            // 페이지당 보여줄 데이터 건수와 현재 페이지 번호를 파라미터로 전달
            var pageSize = dat.response.body.numOfRows;
            var currentPage = dat.response.body.pageNo;

            // 총 페이지 수를 계산
            var totalPageCount = Math.ceil(totalDataCount / pageSize);

            // 페이지 링크를 생성
            var pageLinkHtml = '';
            var maxPageCount = 10; // 한 페이지에 최대 보여줄 링크 수
            var startIndex = Math.floor((currentPage - 1) / maxPageCount) * maxPageCount + 1; // 시작 페이지 번호
            var endIndex = Math.min(startIndex + maxPageCount - 1, totalPageCount); // 끝 페이지 번호

            // 이전 버튼 생성
            if (startIndex > 1) {
                pageLinkHtml += '<button onclick="sendPageNo2(' + (startIndex - 1) + ')">&laquo;</button>';
            }


            for (var i = startIndex; i <= endIndex; i++) {
                var activeClass = (i === currentPage) ? 'active' : '';
                pageLinkHtml += '<button class="' + activeClass + '" onclick="sendPageNo2(' + i + ')">' + i + '</button>';
            }

            // 다음 버튼 생성
            if (endIndex < totalPageCount) {
                pageLinkHtml += '<button onclick="sendPageNo2(' + (endIndex + 1) + ')">&raquo;</button>';
            }

            // 페이지 링크를 페이지 네이션에 추가
            var pageNationElem = document.querySelector('.page_nation');
            pageNationElem.innerHTML = pageLinkHtml;


            // var item = data.response.body.items.item
            count = '<div>전체: ' + dat.response.body.totalCount + ' 개</div>'
            document.getElementById('search-rst').innerHTML = count;
            for (var i in dat.response.body.items.item) {
                let item = dat.response.body.items.item[i];

                html += `<div class="picpic"><a href="/auth/shelterDetail/${item.desertionNo}" target="_blank"><img class="shelter-pic" src="${item.popfile}"></a>`;
                html += '<p>' + item.kindCd + '&nbsp' + '<span style="color: #b8dff8">(' + item.noticeSdt + ')</span></p>';
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
                    // alert("테스트")
                    // location.href = "/auth/shelter";
                }).fail(function (error) {
                    // alert(JSON.stringify(error));
                });
            }
        }
    };
    xhr.send('');
}

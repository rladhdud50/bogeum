/**
 *회원삭제
 */
function deleteById(id) {

    $.ajax({
        type: "DELETE",
        url: "/api/user/out/" + id,
        dataType: "json"
    }).done(function(resp) {
        Swal.fire({
        html: "<b>회원삭제완료",
        icon: "success",
    }).then(function() {
        location.href = "/admin";
    });
    }).fail(function(error) {
        alert(JSON.stringify(error));
    });
}

/**
 * 검색타입선택
 */
function selectSearchType() {
    var select = document.getElementById("select");
    var searchTypeInput = document.getElementById("searchType");
    searchTypeInput.value = select.value;
}

/**
 * 작성게시물 모달
 */
function modalOpen(type, username2, userId) {
    if(type == "board") {
        $("#modalTitle").text(username2 + "님의 작성 게시물");

        let item =
            `<tr>
                <th class="board-table-no">번호</th>
                <th class="board-table-title">제목</th>
                <th class="board-table-date">작성일</th>
                <th class="board-table-view">조회수</th>
            </tr>`;

        $.ajax({
            url: `/api/board/${userId}`,
            dataType: "json"
        }).done(resp => {
            resp.forEach((board) => {
                item += getBoardModalItem(board);
            });
            $("#modalTableBody").append(item);
        }).fail(error => {
            console.log(error);
        });
    }
}
function getBoardModalItem(board) {
    let item =
        `<tr onclick="location.href='/board/${board.id}/'">
            <th>${board.id}</th>
            <th class="board-table-title">${board.title}</th>
            <th>${board.createDate}</th>
            <th>${board.views}</th>
         </tr>`;
    return item;
}

function getReplyModalItem(reply) {
    let item =
        `<tr>
            <th>${reply.id}</th>
            <th class="board-table-title">${reply.content}</th>
            <th>${reply.createDate}</th>
         </tr>`;

    return item;
}
function modalClose() {
    $("#modalTableHead > tr").remove();
    $("#modalTableBody > tr").remove();
}



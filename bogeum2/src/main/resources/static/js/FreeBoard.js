let index = {
    init: function() {
        $("#btn_save").on("click", () => {
            this.save();
        });
        $("#btn_delete").on("click", () => {
            Swal.fire({
                html: '정말 삭제하시겠습니까?',
                icon: 'warning',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                // 만약 Promise리턴을 받으면,
                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                    Swal.fire({
                        html: '<b>삭제가 완료되었습니다.',
                        icon: 'success'
                    }).then(result => { this.deleteById(); })
                } else {
                    location.go(-1);
                }
            });
        });
        $("#btn_update").on("click", () => {
            Swal.fire({
                html: '수정을 완료하시겠습니까?',
                icon: 'question',

                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정

            }).then(result => {
                // 만약 Promise리턴을 받으면,
                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                    Swal.fire({
                        html: '<b>수정이 완료되었습니다.',
                        icon: 'success'
                    }).then(result => { this.update(); })
                } else {
                    location.go(-1);
                }
            });
        })

        $("#btn_reply_save").on("click", () => {
            this.reply_save();
        })
    },

    save: function() {
        let data = {
            title: $("#title").val(),
            content: $("#content").val()
        };
        $.ajax({
            type: "POST",
            url: "/api/free",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function(resp) {
            Swal.fire({
                html: "<b>글쓰기가 완료되었습니다.",
                icon: "success",
            }).then(function() {
                location.href = "/auth/free";
            });

        }).fail(function(error) {
            alert(JSON.stringify(error));
        });
    },
    update: function() {
        let id = $("#id").val()

        let data = {
            title: $("#title").val(),
            content: $("#content").val()
        };
        $.ajax({
            type: "PUT",
            url: "/api/free/" + id,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function(resp) {
            location.href = "/free/" + id;
        })
    },
    deleteById: function() {
        var id = $("#id").text()

        $.ajax({
            type: "DELETE",
            url: "/api/free/" + id,
            dataType: "json"
        }).done(function(resp) {
            location.href = "/auth/free";
        }).fail(function(error) {
            alert(JSON.stringify(error))
        })
    },

    reply_save: function() {
        let id = $("#id").text();
        let data = {
            content: $("#reply_content").val()
        };
        console.log(data.content);

        if (data.content != "") {
            $.ajax({
                type: "POST",
                url: "/api/free/reply/" + id,
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(function(resp) {
                location.href = "/free/" + id;
            }).fail(function(error) {
                alert(JSON.stringify(error));
            });
        } else {
            Swal.fire({
                html: "입력된 댓글이 없습니다.",
                icon: "warning"
            });
        }

    },

}
index.init();
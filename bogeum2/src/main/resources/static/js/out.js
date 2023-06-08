let index = {
	init: function() {
		$("#btn-out").on("click", () => {

			var chk1 = document.querySelector("#checkList").checked;

			if (!chk1) {
				Swal.fire({
					html: "약관에 동의해주세요",
					icon: "warning"
				});
				return false;

			} else {
				Swal.fire({
					html: '정말로 탈퇴하시겠습니까?',
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
							html: '<b>탈퇴가 완료되었습니다',
							icon: 'success'
						}).then(result => { this.out(); })
					} else {
						Swal.fire({
							html: '<b>취소되었습니다',
							icon: 'error'
						})
					}
				});

			}

		});
	},


	out: function() {		
		var id = $("#id").val();

		$.ajax({
			type: "DELETE",
			url: "/api/user/out/" + id,
			dataType: "json"
		}).done(function(resp) {
			location.href = "/logout";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

}
index.init();

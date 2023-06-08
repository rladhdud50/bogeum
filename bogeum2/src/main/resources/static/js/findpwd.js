let index2 = {
	init: function() {

		$("#btn-find").on("click", () => {
			var username = document.getElementById('username');
			var email = document.getElementById('email');

			if (username.value == "") {
				Swal.fire({
					html: "아이디를 입력해주세요",
					icon: "warning"
				});
				username.focus();
				return false;

			};
			if (email.value == "") {
				Swal.fire({
					html: "이메일을 입력해주세요",
					icon: "warning"
				});
				return false;
			};
			Swal.fire({
				html: "회원정보를 확인하고 있습니다",
				icon: "info",
			}).then(result =>{ this.find();})

		});

	},

	find: function() {

		let data = {
			username: $("#username").val(),
			email: $("#email").val()
		};

		$.ajax({
			type: "POST",
			url: "/auth/find",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {

			if (resp.data !== 0) {
				Swal.fire({
					html: "임시 비밀번호가 발송되었습니다",
					icon: "success"
				});

			} else {
				Swal.fire({
					html: "회원정보를 찾을 수 없습니다",
					icon: "error"
				});
			}
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},


}


index2.init();
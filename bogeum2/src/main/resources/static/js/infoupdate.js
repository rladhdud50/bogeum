let index = {
	init: function() {
		$("#updatebutton").on("click", () => {
			this.updateCheck();
		});

		$("#updatebutton2").on("click", () => {
			this.updateCheck2();
		});

	},

	update: function() {
		let data = {
			username: document.getElementById('id').value,
			password: document.getElementById('pwd').value,
			username2: document.getElementById('name').value,
			birth: document.getElementById('birth').value,
			tel: document.getElementById('tel').value,
			address: document.getElementById('address').value,
			email: document.getElementById('email').value,		
			address: document.getElementById('address').value.concat(" "+ document.getElementById('detailaddress').value),
			email : document.getElementById('email').value,
		};
		

		$.ajax({
			type: "PUT",
			url: "/user",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			Swal.fire({
				html: "<b>회원수정이 완료되었습니다.",
				icon: "success",
			}).then(function() {
				location.href = "/";
			});

		}).fail(function(error) {
			alert(JSON.stringify(error));
		});


	},

	update2: function() {
		let data = {
			username: document.getElementById('id').value,
			username2: document.getElementById('name').value,
			birth: document.getElementById('birth').value,
			tel: document.getElementById('tel').value,
			address: document.getElementById('address').value.concat(" "+ document.getElementById('detailaddress').value),
			email: document.getElementById('email').value,
		};
		
		console.log(data);
		
		$.ajax({
			type: "PUT",
			url: "/user2",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			Swal.fire({
				html: "<b>회원수정이 완료되었습니다.",
				icon: "success",
			}).then(function() {
				location.href = "/";
			});
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},


	updateCheck: function() {
		var pwd = document.getElementById('pwd');
		var repwd = document.getElementById('repwd');
		var name = document.getElementById('name');
		var birth = document.getElementById('birth');		
		var address = document.getElementById('address');
		var tel = document.getElementById('tel');
		var email = document.getElementById('email');

		var pwdCheck = /^(?=.*[0-9]).{8,25}$/;
		var birthCheck = /^(?=.*[0-9]).{8}$/;
		var telCheck = /^(?=.*[0-9]).{10,11}$/;
		var emailCheck = /^(?=.*[a-z])[a-z0-9]{1,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		
		
		if (pwd.value == "") {
			Swal.fire({
				html: "비밀번호를 입력해주세요",
				icon: "warning"
			});
			pwd.focus();
			return false;
		};

		if (!pwdCheck.test(pwd.value)) {
			Swal.fire({
				html: "비밀번호는 8~25자리를 사용합니다",
				icon: "warning"
			});
			pwd.focus();
			return false;
		};


		var repwd = document.getElementById('repwd');	
		
		var pwdCheck = /^(?=.*[0-9]).{8,25}$/;

		if (!pwdCheck.test(pwd.value)) {
			Swal.fire({
				html: "비밀번호는 8~25자리를 사용합니다",
				icon: "warning"
			});
			pwd.focus();
			return false;		
		};

		if (repwd.value !== pwd.value) {
			Swal.fire({
				html: "비밀번호가 일치하지 않습니다",
				icon: "warning"
			});
			repwd.focus();
			return false;
		};

		if (name.value == "") {
			Swal.fire({
			html: "이름을 입력해주세요",
			icon: "warning"
		});
			name.focus();
			return false;
		};
		if (birth.value == "") {
			Swal.fire({
				html: "생년월일을 입력해주세요",
				icon: "warning"
			});
			birth.focus();
			return false;
		};
		if (!birthCheck.test(birth.value)) {
			Swal.fire({
				html: "정확한 생년월일을 입력해주세요",
				icon: "warning"
			});
			birth.focus();
			return false;
		};

		
		if (address.value == "") {
			Swal.fire({
				html: "주소를 입력해주세요",
				icon: "warning"
			});
			address.focus();
			return false;
		};
		
		if (tel.value == "") {
			Swal.fire({
				html: "전화번호를 입력해주세요",
				icon: "warning"
			});
			tel.focus();
			return false;
		};

		if (!telCheck.test(tel.value)) {
			Swal.fire({
				html: "정확한 전화번호를 입력해주세요",
				icon: "warning"
			});
			tel.focus();
			return false;
		};			
		
		if (email.value == "") {
			Swal.fire({
				html: "이메일을 입력해주세요",
				icon: "warning"
			});
			email.focus();
			return false;
		};
				
		if (!emailCheck.test(email.value)) {
			Swal.fire({
				html: "정확한 이메일을 입력해주세요",
				icon: "warning"
			});
			email.focus();
			return false;
		};

		this.update();

	},
	
	updateCheck2: function() {
		
		var name = document.getElementById('name');
		var birth = document.getElementById('birth');		
		var address = document.getElementById('address');
		var tel = document.getElementById('tel');
		var email = document.getElementById('email');
				
		var birthCheck = /^(?=.*[0-9]).{8}$/;
		var telCheck = /^(?=.*[0-9]).{10,11}$/;
		var emailCheck = /^(?=.*[a-z])[a-z0-9]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		
		
		if (name.value == "") {
			Swal.fire({
				html: "이름을 입력해주세요",
				icon: "warning"
			});
			name.focus();
			return false;
		};
		if (birth.value == "") {
			Swal.fire({
				html: "생년월일을 입력해주세요",
				icon: "warning"
			});
			birth.focus();
			return false;
		};
		if (!birthCheck.test(birth.value)) {
			Swal.fire({
				html: "정확한 생년월일을 입력해주세요",
				icon: "warning"
			});
			birth.focus();
			return false;
		};
		
		if (address.value == "") {
			Swal.fire({
				html: "주소를 입력해주세요",
				icon: "warning"
			});
			address.focus();
			return false;
		};
		
		if (tel.value == "") {
			Swal.fire({
				html: "전화번호를 입력해주세요",
				icon: "warning"
			});
			tel.focus();
			return false;
		};

		if (!telCheck.test(tel.value)) {
			Swal.fire({
				html: "정확한 전화번호를 입력해주세요",
				icon: "warning"
			});
			tel.focus();
			return false;
		};			
		
		if (email.value == "") {
			Swal.fire({
				html: "이메일을 입력해주세요",
				icon: "warning"
			});
			email.focus();
			return false;
		};
		
		if (!emailCheck.test(email.value)) {
			Swal.fire({
				html: "정확한 이메일을 입력해주세요",
				icon: "warning"
			});
			email.focus();
			return false;
		};

		this.update2();

	}



}
index.init();
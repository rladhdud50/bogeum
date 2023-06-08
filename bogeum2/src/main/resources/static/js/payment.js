let index = {
	init: function(){
		$("#btn_order_cart").on("click",()=>{
			console.log('장바구니 결제');
			this.order_cart();
		});
		$("#btn_order_now").on("click",()=>{
			console.log('바로 결제');
			this.order_now();
		})
	},
	
	order_cart: function(){
		let data = {
			id: $("#userId").val(),
			totalPrice: $("#totalPrice").val(),
		};
		
	    var IMP = window.IMP; 
	    IMP.init('imp41506834'); 
	    IMP.request_pay({
	    	pg : "kakaopay", 
	        pay_method : 'card',
	        merchant_uid : '보금자리' + new Date().getTime(),
	        name : '보금자리',	//결제창에서 보여질 이름
	        amount : data.totalPrice,	//가격 
	        buyer_email : 'lhw931213@naver.com',
	        buyer_name : '임해원',
	        buyer_tel : '010-5004-5517',
	        buyer_addr : '경기도 화성시 북촌길 12-14',
	    }, function(rsp) {
			console.log(rsp);
	        if (rsp.success) {	// 결제 성공 시: 결제 승인
	            $.ajax({
					url: "/payment/complete",
					type: 'POST',
					dataType : "JSON",
					data: {
                        imp_uid: rsp.imp_uid,
                    },
				}).done(function(data){
					if(do_it){
						var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
					} else {
						var msg = '결제에 실패하였습니다.';
						alert("결제 실패!!!!");
					}
					alert(msg);
				});
				$.ajax({
					type: 'POST',
					url: "/cart/checkout/"+data.id,
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					dataType : "JSON"
				})
				location.href = "/order/finish/"+data.id;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	           	alert(msg);
	            
	        }
	    });		    	    
	},
	order_now: function(){
		let data = {
			id: $("#userId").val(),
			itemId: $("#itemId").val(),
			price: $("#price").val(),
			count: $("#count").val()
		};
		console.log(data)
		var IMP = window.IMP; 
	   	IMP.init('imp41506834');
	   	IMP.request_pay({
			pg : "kakaopay", 
	        pay_method : 'card',
	        merchant_uid : '보금자리' + new Date().getTime(),
	        name : '보금자리',	//결제창에서 보여질 이름
	        amount : data.price,	//가격 
	}, function(rsp){
		if (rsp.success){	// 결제 성공 시: 결제 승인
			$.ajax({
					url: "/payment/complete",
					type: 'POST',
					dataType : "JSON",
					data: {
                        imp_uid: rsp.imp_uid,
                    },
				}).done(function(data){
					if(do_it){
						var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
					} else {
						var msg = '결제에 실패하였습니다.';
						alert("결제 실패!!!!");
					}
					alert(msg);
				});
				$.ajax({
					type: 'POST',
					url: "/now/checkout/"+data.id+"/"+data.itemId+"/"+data.count,
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					dataType : "JSON"
				})
				location.href = "/order/finish/"+data.id;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	           	alert(msg);
	            
		}
	})
	}
	
}
index.init();

  function setDisplay() {
    document.querySelector('.address_content').style.display = 'block';
    document.querySelector('.address_content2').style.display = 'none';
  }

  function setDisplay2() {
    document.querySelector('.address_content').style.display = 'none';
    document.querySelector('.address_content2').style.display = 'block';
  }

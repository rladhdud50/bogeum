function Delete_item(itemId){
	console.log(itemId);
	$.ajax({
		type:"DELETE",
		url:"/deleteItem/"+itemId,
		dataType:"json"
	}).done(function(resp){
		alert("상품 삭제가 완료되었습니다");
		location.href="/admin";
	}).fail(function(error){
		alert(JSON.stringify(error));
	});
}
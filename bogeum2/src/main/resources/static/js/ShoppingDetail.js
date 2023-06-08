let count = document.getElementsByName('count'),
    sell_price = document.count.sell_price,
    amount = document.count.amount,
    add = document.count.add,
    minus = document.count.minus,
    sum = document.count.sum;
    
if(count){
    sum.value = sell_price.value;
    let amountval = amount.value,
        sumval = sum.value,
        priceval = sell_price.value;
    if(add){
        add.addEventListener('click', function(){
            amountval++;
            sumval = amountval*priceval;
            amount.value=amountval;
            sum.value=sumval.toLocaleString()+"원";
            console.log(amountval,sumval,priceval);
        })
      
        
    }
    if(minus){
        minus.addEventListener('click', function(){
            if(amountval > 1){
                amountval--;
                sumval = amountval*priceval;
                amount.value=amountval;
                sum.value=sumval.toLocaleString()+"원";
                console.log(amountval,sumval,priceval);
            }else{
                amountval=1;
            }
        })
    }
}
function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	} 
	
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}
	
	function inputOnlyNumberFormat(obj) {
	    obj.value = onlynumber(uncomma(obj.value));
	}
	
	function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
		
	var price = $('.sum').val();
	var price2 = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
	$('.sum').val(price2);

	



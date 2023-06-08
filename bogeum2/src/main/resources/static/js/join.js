function idcheck() {
    var id2 = document.getElementById('id').value;    
    document.getElementById('idcheck').value = id2;
    Swal.fire({
        html: "<b>사용할 수 있는 아이디입니다.",
        icon: "success",
    });
    if(id!=="") {
        document.getElementById('iderror').innerHTML = ""
    }
    
}

function signUpCheck() {                       
    var id = document.getElementById('id');
    var pwd = document.getElementById('pwd');
    var repwd = document.getElementById('repwd');
    var name = document.getElementById('name');
    var birth = document.getElementById('birth');
    var gender_man = document.getElementById('gender_man');
    var gender_woman = document.getElementById('gender_woman');
    var address = document.getElementById('address');
    var tel = document.getElementById('tel');
    var number = document.getElementById('number');
    var agree1 = document.getElementById('agree1');
    var agree2 = document.getElementById('agree2');
    var idcheck = document.getElementById('idcheck');

    if(id.value == "") {
        document.getElementById('iderror').innerHTML = "아이디를 입력해주세요"
        id.focus();
        return false;
    }else {
        document.getElementById('iderror').innerHTML = ""        
    };
    
    if(idcheck.value == "") {
        document.getElementById('iderror').innerHTML = "아이디 중복확인을 해주세요"
        id.focus();
        return false;
    }else {
        document.getElementById('iderror').innerHTML = ""        
    };

    if(pwd.value == "") {
        document.getElementById('pwderror').innerHTML = "비밀번호를 입력해주세요"
        pwd.focus();
        return false;
    }else{
        document.getElementById('pwderror').innerHTML = ""
    };

    var pwdCheck = /^(?=.*[0-9]).{8,25}$/;

  if (!pwdCheck.test(pwd.value)) {
    document.getElementById('pwderror').innerHTML = "비밀번호는 8~25자리를 사용합니다"
    pwd.focus();
    return false;
  };
    

    if(repwd.value !== pwd.value) {
        document.getElementById('repwderror').innerHTML = "비밀번호가 일치하지 않습니다"
        repwd.focus();
        return false;
    }else {
        document.getElementById('repwderror').innerHTML = ""
    };

    if(name.value == "") {
        document.getElementById('nameerror').innerHTML = "이름을 입력해주세요"
        name.focus();
        return false;
    }else {
        document.getElementById('nameerror').innerHTML = ""
    };

    

    if(birth.value == "") {
        document.getElementById('birtherror').innerHTML = "생년월일을 입력해주세요"
        birth.focus();
        return false;
    }else {
        document.getElementById('birtherror').innerHTML = ""
    };

    var birthCheck = /^(?=.*[0-9]).{8}$/;

  if (!birthCheck.test(birth.value)) {
    document.getElementById('birtherror').innerHTML = "정확한 생년월일을 입력해주세요"
    birth.focus();
    return false;
  };

    if( !gender_man.checked && !gender_woman.checked) {
        document.getElementById('gendererror').innerHTML = "성별을 선택해주세요"
        female.focus();
        return false;
    }else {
        document.getElementById('gendererror').innerHTML = ""
    };
    
    if(tel.value == "") {
        document.getElementById('telerror').innerHTML = "전화번호를 입력해주세요"
        tel.focus();
        return false;
    }else {
        document.getElementById('telerror').innerHTML = ""
    };

    var telCheck = /^(?=.*[0-9]).{10,11}$/;

  if (!telCheck.test(tel.value)) {
    document.getElementById('telerror').innerHTML = "정확한 번호를 입력해주세요"
    tel.focus();
    return false;
  }else {
    document.getElementById('telerror').innerHTML = ""
  };

    if(number.value == "") {
        document.getElementById('numbererror').innerHTML = "인증번호를 입력해주세요"
        number.focus();
        return false;
    }else {
        document.getElementById('numbererror').innerHTML = ""
    };
    if(address.value == "") {
        document.getElementById('addresserror').innerHTML = "주소를 입력해주세요"
        address.focus();
        return false;
    }else {
        document.getElementById('addresserror').innerHTML = ""
    };
    if(!agree1.checked) {
        Swal.fire({
            html: "<b>약관동의를 체크하세요.",
            icon: "warning",
        });
        agree1.focus();
        return false;
    };
    if(!agree2.checked) {
        Swal.fire({
            html: "<b>약관동의를 체크하세요.",
            icon: "warning",
        });
        agree1.focus();
        return false;
    };

    Swal.fire({
        html: "회원가입이 완료되었습니다",
        icon: "success",
    });
}       

function selectAll(selectAll)  {
    const checkboxes 
        = document.getElementsByName('agree');
    
    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    })
}

document.getElementById('id').addEventListener("keyup",()=>{
    var id2 = document.getElementById('id');
    if(id2!=="") {
        document.getElementById('iderror').innerHTML = ""
    }
})
document.getElementById('pwd').addEventListener("keyup",()=>{
    var pwd2 = document.getElementById('pwd');
    if(pwd2!=="") {
        document.getElementById('pwderror').innerHTML = ""
    }
})
document.getElementById('repwd').addEventListener("keyup",()=>{
    var repwd2 = document.getElementById('repwd');
    if(repwd2!=="") {
        document.getElementById('repwderror').innerHTML = ""
    }
})
document.getElementById('name').addEventListener("keyup",()=>{
    var name2 = document.getElementById('name');
    if(name2!=="") {
        document.getElementById('nameerror').innerHTML = ""
    }
})
document.getElementById('birth').addEventListener("keyup",()=>{
    var birth2 = document.getElementById('birth');
    if(birth2!=="") {
        document.getElementById('birtherror').innerHTML = ""
    }
})
document.getElementById('tel').addEventListener("keyup",()=>{
    var tel2 = document.getElementById('tel');
    if(tel2!=="") {
        document.getElementById('telerror').innerHTML = ""
    }
})
document.getElementById('number').addEventListener("keyup",()=>{
    var number2 = document.getElementById('number');
    if(number2!=="") {
        document.getElementById('numbererror').innerHTML = ""
    }
})
document.getElementById('address').addEventListener("keyup",()=>{
    var address2 = document.getElementById('address');
    if(address2!=="") {
        document.getElementById('addresserror').innerHTML = ""
    }
})
var checkbox = document.querySelector("input[name=gender]");

checkbox.addEventListener('change', function() {
  if (this.checked) {
    document.getElementById('gendererror').innerHTML="";
  } 
});
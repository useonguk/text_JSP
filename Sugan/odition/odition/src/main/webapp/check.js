function joinCheck(){
	if(frm.id.value.length==0){
		window.alert("입력번호가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}
	if(frm.name.value.length==0){
		window.alert("참가자명이 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}
	if(frm.yyyy.value.length==0 || frm.mm.value.length==0 || frm.dd.value.length==0){
		window.alert("생년월일가 입력되지 않았습니다.");
		frm.yyyy.focus();
		return false;
	}
	if(frm.sex[0].checked==false && frm.sex[1].checked==false){
		window.alert("성별이 선택되지 않았습니다");
		frm.sex.focus();
		return false;
	}
	if(frm.telant.value==1){
		window.alert("특기가 서낵되지 않았다");
		frm.telant.focus();
		return false;
	}
	if(frm.com.value.length==0){
		window.alert("소속사가 입력되지 않았습니다");
		frm.com.focus();
		return false;
	}
	else{
		window.alert("쎵공");
		document.frm.submit();
		return true;
	}
}
function res()
{
	alert("태초마을로 고!");
	document.frm.reset();
	return false;
}
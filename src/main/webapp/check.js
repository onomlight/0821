function joinCheck()
	{
		//회원 성명
		if(document.frm.custname.value.length =="")
		{
			alert('회원성명을 입력해주세요.');
			frm.custname.focus();
			return false;
		}
		//회원 전화
		if(document.frm.phone.value.length =="")
		{
			alert('회원전화를 입력해주세요.');
			frm.phone.focus();
			return false;
		}
		//회원 주소
		if(document.frm.address.value.length =="")
		{
			alert('회원주소를 입력해주세요.');
			frm.address.focus();
			return false;
		}
		//가입 일자
		if(document.frm.joindate.value.length =="")
		{
			alert('가입일자를 입력해주세요.');
			frm.joindate.focus();
			return false;
		}
		//고객등급
		if(document.frm.grade.value.length =="")
		{
			alert('고객등급을 입력해주세요.');
			frm.grade.focus();
			return false;
		}
		//도시코드
		if(document.frm.city.value.length =="")
		{
			alert('도시번호를 입력해주세요.');
			frm.city.focus();
			return false;
		}
		success();
		
		return true;
		
	}
	
	
	function success(){
		
		alert('회원등록이 완료되었습니다.!');
		
	}
	
	function search(){
		window.location = 'list.jsp';
	}
	
	function modify(){
		
		alert('회원정보 수정이 완료되었습니다.!');
		
	}
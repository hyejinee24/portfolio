<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jq/jquery-3.7.0.js"></script>
<style>
	#container{
		width: 500px;
		height: 900px;
		border: 1px solid green;
		margin: auto;
		position: relative;
	}
	#topTxt{
		margin-left: 5px;
		margin-bottom: 0;
	}
	#logoImg{
		width: 300px;
		display: block;
		margin: auto;
	}
	#idArea{
		margin-left: 50px;
		margin-top: 10px;
	}
	#id{
		border-color: #dfdfdf;
		border-style: solid;
		width: 300px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#dupBtn{
		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 5px 15px;
		margin-left: 10px;
		cursor: pointer;
	}
	#pwArea{
		margin-left: 50px;
	}
	#pw{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
	}
	#pwInfo{
		margin-top: 5px;
		margin-bottom: 5px;
		font-size: small;
		color: grey;
	}
	#re_pw{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-bottom: 10px;
	}
	#nameAgender{
		display: flex;
		margin-left: 50px;
	}
	#nameArea{
		margin-right: 40px;
	}
	#name{
		border-color: #dfdfdf;
		border-style: solid;
		width: 200px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	input[type="radio"]{
		margin-top: 20px;
		cursor: pointer;
	}
	#bdArea{
		margin-left: 50px;
	}
	#bd{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#telArea{
		margin-left: 50px;
	}
	#tel{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#termsArea{
		margin-left: 50px;
		margin-top: 10px;
	}
	input[type="checkbox"]{
		margin-bottom: 15px;
		cursor: pointer;
	}
	#termsAllLb {
		cursor: pointer;
	}
	#terms1Lb, #terms2Lb {
    	color: grey;
    	cursor: pointer;
 	}
 	#detail1, #detail2{
 		text-decoration: none;
 		color: black;
 	}
 	#detail2{
 		margin-left: 20px;
 	}
 	#subtn{
 		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 6px 40px;
		margin-top: 10px;
		margin-left: auto;
		margin-right: auto;
		display: block;
		cursor: pointer;
 	}
 	#idDemo, #pwDemo{
 		width: 400px;
 		margin-bottom: 10px;
 	}
</style>
</head>
<body>
	<div id="container">
		<h3 id="topTxt"><a href="MainMusicList" style="text-decoration: none; color: black;"><-</a> 사운드웨이브 회원가입</h3>
		<img src="icons/logo.png" id="logoImg">
		<div id="idArea">
			아이디<br>
			<input type="text" name="id" id="id" placeholder="아이디 입력">
			<input type="button" id="dupBtn" value="중복 확인">
			<div id="idDemo"></div>
		</div>
		<div id="pwArea">
			비밀번호<br>
			<input type="password" name="pw" id="pw" placeholder="비밀번호 입력"><br>
			<p id="pwInfo">8~20자 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합</p>
			<input type="password" name="re_pw" id="re_pw" placeholder="비밀번호 재입력">
			<div id="pwDemo"></div>
		</div>
		<div id="nameAgender">
			<div id="nameArea">
				이름<br>
				<input type="text" name="name" id="name" placeholder="이름 입력">
			</div>
			<div id="genderArea">
				성별<br>
				<input type="radio" name="gender" value="남">남
				<input type="radio" name="gender" value="여">여
			</div>
		</div>
		<div id="bdArea">
			생년월일<br>
			<input type="text" name="bd" id="bd" placeholder="8자리 숫자만 입력 예) 20120814">
		</div>
		<div id="telArea">
			휴대폰<br>
			<input type="text" name="tel" id="tel" placeholder="숫자만 입력">
		</div>
		<div id="termsArea">
			<input type="checkbox" name="terms" value="termsAll" id="termsAll"><label for="termsAll" id="termsAllLb"><strong>아래 내용에 모두 동의합니다.</strong></label><br>
			<input type="checkbox" name="terms" value="terms1" id="terms1" class="terms"><label for="terms1" id="terms1Lb">(필수) 이용약관에 동의합니다.&nbsp;<a href="#" id="detail1">자세히 보기 ></a></label><br>
			<input type="checkbox" name="terms" value="terms2" id="terms2" class="terms"><label for="terms2" id="terms2Lb">(필수) 개인정보 수집 및 이용에 대한 안내에 동의합니다.<br><a href="#" id="detail2">자세히 보기 ></a></label><br>
		</div>
		<button id="subtn" onclick="signup()">가입 완료</button>
	</div>
	
	<script>
		const termsAll = $('#termsAll');
		const terms = $('.terms');
		const terms1 = $('#terms1');
		const terms2 = $('#terms2');
	
		const dupBtn = $('#dupBtn');
		dupBtn.on('click', function(){
			const id = $('#id');
			const idDemo = $('#idDemo');
			
			if (/^\d+$/.test(id.val())) {
			    idDemo.html('아이디는 영문 소문자 또는 영문 소문자와 숫자의 조합이어야 합니다.').css('color', 'red');
			    return false;
			  }
			
			$.ajax({
				url: "IdCheck",
				type: "GET",
				data: {id: id.val()},
				success: function(response){
					if (response == "1") {
						idDemo.html("이미 존재하는 아이디입니다.").css("color","red");
					} else {
						idDemo.html("사용 가능한 아이디입니다.").css("color","green");
					}

					if (id.val().trim().length == 0) {
						idDemo.html("아이디를 입력하세요.").css("color","red");
					}
					if (id.val().trim().length < 5) {
						idDemo.html("아이디는 최소 5자리 이상 입력하세요.").css("color","red");
					}
					if (id.val().trim().length > 20) {
						idDemo.html("아이디는 최대 20자리까지 입력할 수 있습니다.").css("color","red");
					}
					if (id.val().trim().includes("admin")) {
						idDemo.html("아이디에는 'admin'을 포함할 수 없습니다.").css("color","red");
					}
					if (!/^[a-z]+$/.test(id.val()) && !/^[a-z0-9]+$/.test(id.val())) {
						idDemo.html('아이디는 영문 소문자 또는 영문 소문자와 숫자의 조합이어야 합니다.').css("color","red");;
					}
				}
			});
		});
		
		const id = $('#id');
		const idDemo = $('#idDemo');
		id.on('keyup', function(){
			idDemo.html('아이디 중복 확인을 체크해주세요.').css("color","red");
		});
		
		const pw = $('#pw');
		const re_pw = $('#re_pw');
		const pwDemo = $('#pwDemo');
		
		function checkPw(){
			if (re_pw.val().length == 0) {
				pwDemo.html('').css("color","black");
				return;
			}
			if (pw.val() == re_pw.val()) {
				pwDemo.html('일치').css("color","blue");
			}else {
				pwDemo.html('불일치').css("color","red");
			}
		}
		
		pw.on('keyup', checkPw);
		re_pw.on('keyup', checkPw);
		
		function signup(){
			const id = $('#id');
			const dupBtn = $('#dupBtn');
			const idDemo = $('#idDemo');
			const pw = $('#pw');
			const re_pw = $('#re_pw');
			const pwDemo = $('#pwDemo');
			const name = $('#name');
			const gender = $('input[name="gender"]:checked');
			const birth = $('#bd');
			const tel = $('#tel');
			
			if (id.val().trim().length == 0) {
				alert('아이디를 입력하세요.');
				id.focus();
				return false;
			}
			//중복확인 체크
			if (idDemo.text() != '사용 가능한 아이디입니다.') {
				alert('아이디 중복 확인을 체크해주세요.');
				return false;
			}
			
			if (pw.val().trim().length == 0) {
				alert('비밀번호를 입력하세요.');
				pw.focus();
				return false;
			}
			//8~20자 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합 <- 조건 맞추기
			if (pw.val().trim().length < 8 || pw.val().trim().length > 20) {
				alert('비밀번호는 8~20자리로 입력하세요.');
				pw.focus();
				return false;
			}
			
			var conditions = [/[A-Z]/,/[a-z]/,/\d/,/[^A-Za-z0-9]/];
			var count = 0;
			for (var i = 0; i < conditions.length; i++) {
				if (conditions[i].test(pw.val())) {
					count++;
				}
			}
			
			if (count < 2) {
				alert('비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상의 조합이어야 합니다.');
				pw.focus();
				return false;
			}
			
			if (re_pw.val().trim().length == 0) {
				alert('비밀번호를 재입력하세요.');
				re_pw.focus();
				return false;
			}
			//pw랑 re_pw 일치하는지 확인
			if (pwDemo.text() == '불일치') {
				alert('비밀번호가 일치하지 않습니다.');
				re_pw.focus();
				return false;
			}
			
			if (name.val().trim().length == 0) {
				alert('이름을 입력하세요.');
				name.focus();
				return false;
			}
			//gender 체크됐는지 확인
			if (!gender.is(':checked')) {
				alert('성별을 선택하세요.');
				return false;
			}
			
			//숫자만 입력되도록 설정! (bd, tel)
			var onlyNum = /^[0-9]*$/;
			if (birth.val().trim().length == 0) {
				alert('생년월일을 입력하세요.');
				birth.focus();
				return false;
			}
			if (!onlyNum.test(birth.val())) {
				alert('생년월일은 숫자만 입력하세요.');
				birth.focus();
				return false;
			}
			if (birth.val().trim().length != 8) {
				alert('생년월일은 8자리 숫자를 입력하세요.');
				birth.focus();
				return false;
			}
			if (tel.val().trim().length == 0) {
				alert('휴대폰 번호를 입력하세요.');
				tel.focus();
				return false;
			}
			if (!onlyNum.test(tel.val())) {
				alert('휴대폰 번호는 숫자만 입력하세요.');
				tel.focus();
				return false;
			}
			if (tel.val().trim().length < 10 || tel.val().trim().length > 11) {
				alert('휴대폰 번호는 10자리 또는 11자리 숫자를 입력하세요.');
				tel.focus();
				return false;
			}
			
			let rs;
			$.ajax({
				url: "TelCheck",
				type: "GET",
				data: {tel: tel.val()},
				async: false,
				success: function(response){
					rs = response;
				}
			});
			
			if (rs == "1") {
				alert('이미 존재하는 휴대폰 번호입니다.');
				tel.focus();
				return false;
			}
			
			//체크박스 모두 체크됐는지 확인
			if (termsAll.prop('checked') == false) {
				alert('필수 약관에 동의해주세요.');
				return false;
			}
			alert('회원가입이 완료되었습니다.');
			location.href="SignUp?id="+id.val()+"&pw="+pw.val()+"&name="+name.val()+"&gender="+gender.val()+"&bd="+birth.val()+"&tel="+tel.val();
		}
		
		termsAll.on('change', function(){
			if (!this.checked) {
				terms.prop('checked', false);
			} else{
				terms.prop('checked', true);
			}
		});
		
		terms1.on('change', updateTermsAll);
		terms2.on('change', updateTermsAll);
		
		function updateTermsAll(){
			if (terms1.prop('checked') && terms2.prop('checked')) {
				termsAll.prop('checked', true);
			} else{
				termsAll.prop('checked', false);
			}
		}
	
	</script>
</body>
</html>
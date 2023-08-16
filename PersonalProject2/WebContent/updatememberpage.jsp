<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jq/jquery-3.7.0.js"></script>
<style>
#container {
	width: 500px;
	height: 900px;
	border: 1px solid green;
	margin: auto;
	position: relative;
}

#topTxt {
	margin-left: 5px;
	margin-bottom: 0;
}

#logoImg {
	width: 300px;
	display: block;
	margin: auto;
}

#idArea {
	margin-left: 50px;
	margin-top: 10px;
}

#id {
	border-color: #dfdfdf;
	border-style: solid;
	width: 400px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#pwArea {
	margin-left: 50px;
}

#pw {
	border-color: #dfdfdf;
	border-style: solid;
	width: 400px;
	height: 30px;
	margin-top: 10px;
}

#pwInfo {
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: small;
	color: grey;
}

#re_pw {
	border-color: #dfdfdf;
	border-style: solid;
	width: 400px;
	height: 30px;
	margin-bottom: 10px;
}

#nameAgender {
	display: flex;
	margin-left: 50px;
}

#nameArea {
	margin-right: 40px;
}

#name {
	border-color: #dfdfdf;
	border-style: solid;
	width: 200px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
}

input[type="radio"] {
	margin-top: 20px;
}

#bdArea {
	margin-left: 50px;
}

#bd {
	border-color: #dfdfdf;
	border-style: solid;
	width: 400px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#tel {
	border-color: #dfdfdf;
	border-style: solid;
	width: 400px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#upbtn {
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

#pwDemo {
	width: 400px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div id="container">
		<h3 id="topTxt"><a href="myinfopage.jsp" style="text-decoration: none; color: black;"><-</a> 내 정보 수정</h3>
		<img src="icons/logo.png" id="logoImg">
		<div id="idArea">
			아이디<br>
			<input type="text" name="id" id="id" value="${ id }" readonly>
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
				<input type="text" name="name" id="name" value="${ userInfo.getName() }" placeholder="이름 입력">
			</div>
			<div id="genderArea">
				성별<br>
				<c:if test="${ userInfo.getGender() == '남' }">
					<input type="radio" name="gender" value="남" checked>남
					<input type="radio" name="gender" value="여" disabled>여
				</c:if>
				<c:if test="${ userInfo.getGender() != '남' }">
					<input type="radio" name="gender" value="남" disabled>남
					<input type="radio" name="gender" value="여" checked>여
				</c:if>
			</div>
		</div>
		<div id="bdArea">
			생년월일<br>
			<input type="text" name="bd" id="bd" value="${ userInfo.getBirth() }" readonly>
		<div id="telArea">
			휴대폰<br>
			<input type="text" name="tel" id="tel" value="${ userInfo.getTel() }" placeholder="숫자만 입력">
		</div>
	</div>
		<button id="upbtn" onclick="upd()">수정 완료</button>
	</div>
	
	<script>
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
	
	function upd(){
		const id = $('#id');
		const pw = $('#pw');
		const re_pw = $('#re_pw');
		const pwDemo = $('#pwDemo');
		const name = $('#name');
		const gender = $('input[name="gender"]');
		const birth = $('#bd');
		const tel = $('#tel');
		
		if (pw.val().trim().length == 0) {
			alert('비밀번호를 입력하세요.');
			pw.focus();
			return false;
		}
		//8~20자 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합 <- 조건 맞추기
		if (pw.val().trim().length < 8 || pw.val().trim().length > 20) {
			alert('비밀번호는 8~20자리로 입력해주세요.');
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
		if (tel.val().trim().length == 0) {
			alert('휴대폰 번호를 입력하세요.');
			tel.focus();
			return false;
		}
		
		var onlyNum = /^[0-9]*$/;
		if (!onlyNum.test(tel.val())) {
			alert('휴대폰 번호는 숫자만 입력해주세요.');
			tel.focus();
			return false;
		}
		if (tel.val().trim().length < 10 || tel.val().trim().length > 11) {
			alert('휴대폰 번호는 10자리 또는 11자리 숫자를 입력해주세요.');
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
		
		let resp;
		if (rs == "1") {
			//본인 번호인지 확인
			$.ajax({
				url: "TelCheck2",
				type: "GET",
				data: {tel: tel.val()},
				async: false,
				success: function(response){
					resp = response;
				}
			});
		}
		
		if (resp == "no") {
			alert('이미 존재하는 휴대폰 번호입니다.');
			tel.focus();
			return false;
		}
		
		alert('수정이 완료되었습니다.');
		location.href="UpdateUser?id="+id.val()+"&pw="+pw.val()+"&name="+name.val()+"&gender="+gender.val()+"&bd="+birth.val()+"&tel="+tel.val();
	}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		margin-bottom: 50px;
	}
	hr{
		width: 80%;
		color: #6c6c6c;
	}
	#id, #pw{
		border: none;
		margin-left: 50px;
		width: 400px;
	}
	#signup{
		text-decoration: none;
		color: black;
		font-weight: bold;
		margin-left: 50px;
	}
	#find{
		text-decoration: none;
		color: black;
		margin-left: 50px;
		margin-right: 10px;
	}
	#lgBtn{
		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 5px 25px;
		float: right;
		margin-right: 50px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="container">
		<h3 id="topTxt"><a href="MainMusicList" style="text-decoration: none; color: black;"><-</a> 로그인 / 회원가입</h3>
			<input type="text" name="id" id="id" placeholder="사운드웨이브 아이디"><hr><br>
			<input type="password" name="pw" id="pw" placeholder="비밀번호"><hr><br>
			<input type="submit" value="로그인" id="lgBtn" onclick="login()">
		<br><br>
		<a href="signuppage.jsp" id="signup">💁 사운드웨이브 회원가입</a>
	</div>
	
	<script>
		function login(){
			const id = $('#id');
			const pw = $('#pw');
			
			if (id.val().trim().length == 0) {
				alert('아이디를 입력하세요.');
				id.focus();
				return false;
			}
			
			if (pw.val().trim().length == 0) {
				alert('비밀번호를 입력하세요.');
				pw.focus();
				return false;
			}
			
			$.ajax({
                url: "LoginCheck",
                type: "GET",
                data: { id: id.val(), pw: pw.val() },
                success: function(response) {
                    if (response === "success") {
                        alert('로그인 성공!');
                        location.href = "MainMusicList";
                    } else if (response === "wrong") {
                        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
                    } else if (response === "admin"){
                    	alert('관리자 로그인 성공!');
                    	location.href = "adminhomepage.jsp";
                	} else if (response === "fail") {
                        alert('가입된 정보가 없습니다.');
                    }
                }
            });
		}
	</script>
</body>
</html>
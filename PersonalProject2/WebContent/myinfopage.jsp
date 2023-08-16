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
		margin-bottom: 20px;
	}
	#nameInfo{
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-left: 50px;
	}
	#name{
		font-size: large;
		margin-bottom: 5px;
	}
	#loBtn{
		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 5px 15px;
		float: right;
		margin-right: 50px;
		margin-top: 12px;
		cursor: pointer;
	}
	hr{
		width: 80%;
		color: #6c6c6c;
	}
	#upBtn, #delBtn{
		border: none;
		background: white;
		padding: 0;
		margin-left: 50px;
		width: 400px;
		text-align: left;
		cursor: pointer;
	}
	#update, #delete{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#delmodal{
		width: 450px;
	    height: 200px;
	    border: 1px solid green;
	    margin: auto;
	    margin-top: 30px;
	    display: none;
	}
	#xArea{
		text-align: right;
		margin-right: 15px;
	    margin-top: 10px;
	    margin-bottom: 20px;
	}
	#xBtn{
		text-decoration: none;
    	color: grey;
    	cursor: pointer;
	}
	#delTxt{
		text-align: center;
	    font-weight: bold;
	    margin-top: 40px;
	    margin-bottom: 30px;
	}
	#btns{
		display: flex;
		justify-content: center;
	}
	#cancelBtn{
		background: #42b242;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    padding: 5px 20px;
	    margin-right: 20px;
	    cursor: pointer;
	}
	#nonmbBtn{
		background: #42b242;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    padding: 5px 15px;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<div id="container">
		<h3 id="topTxt"><a href="MainMusicList" style="text-decoration: none; color: black;"><-</a> 내 정보</h3>
		<div id="nameInfo">
			<p id="name">${ name }님, 반갑습니다 !</p>
			<input type="button" value="로그아웃" id="loBtn">
		</div>
		<hr>
		<div id="update" onclick="up()">
			<input type="button" id="upBtn" value="내 정보 수정                                                                                     >">
		</div>
		<div id="delete" onclick="del()">
			<input type="button" id="delBtn" value="사운드웨이브 회원 탈퇴                                                                   >">
		</div>
		<!-- 탈퇴 모달창 -->
		<div id="delmodal">
			<div id="xArea"><a onclick="modalNone()" id="xBtn">X</a></div>
			<div id="delTxt">정말 탈퇴하시겠습니까?</div>
			<div id="btns">
				<button id="cancelBtn" onclick="modalNone()">취소</button>
				<button id="nonmbBtn">회원 탈퇴</button>
			</div>
		</div>
	</div>
	
	<script>
		
		$('#loBtn').click(function (){
			alert('로그아웃되었습니다.');
			location.href = "Logout";
		});
	
		function up(){
			location.href="updatememberpage.jsp";
		}
		
		//모달창 나타나게 하기 (x나 취소를 누르면 안보이게 설정)
		const delmodal = document.getElementById('delmodal');
		
		function del(){
			delmodal.style.display = "block";
		}
		
		function modalNone(){
			delmodal.style.display = "none";
		}
		
		$('#nonmbBtn').click(function (){
			alert('회원 탈퇴되었습니다. 이용해주셔서 감사합니다 !');
			location.href = "UserWithdrawal";
		});
		
	</script>
</body>
</html>
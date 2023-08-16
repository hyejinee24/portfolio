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
	}
	#bg{
		width: 460px;
		height: 750px;
		position: absolute;
		background: #d2ffd2;
		border-radius: 15px;
		margin-top: 10px;
		margin-left: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#loBtn{
		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		margin-right: 20px;
		cursor: pointer;
		float: right;
	}
	.top{
		display: flex;
		align-items: center;
    	justify-content: space-between;
	}
</style>
</head>
<body>
<div id="container">
	<div class="top">
	    <h3 id="topTxt">관리자 페이지 - 홈</h3>
	    <input type="button" id="loBtn" value="로그아웃">
    </div>
    <div id="bg">
		<div>아래 메뉴에서 원하는 버튼을 선택하세요.</div>
	</div>

	<%@ include file="footeradmin.jsp" %>
</div>
	<script>
		const loBtn = $('#loBtn');
		loBtn.on('click', function(){
			alert('로그아웃되었습니다.');
			location.href="Logout";
		});
	</script>
</body>
</html>
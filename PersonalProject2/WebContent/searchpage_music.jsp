<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#srLine{
		width: 80%;
		color: #6c6c6c;
	}
	#sr{
		width: 30px;
		margin-left: 60px;
		margin-bottom: -10px;
	}
	#search{
		border: none;
		width: 330px;
		padding: 10px;
		margin-left: 5px;
	}
	#bg{
		width: 460px;
		height: 690px;
		position: absolute;
		background: #d2ffd2;
		border-radius: 15px;
		margin-top: 10px;
		margin-left: 20px;
	}
	#menuTab{
		display: flex;
		justify-content: space-around;
	}
	#menuLine{
		margin: 0;
	}
	#music{
		font-weight: bold;
	}
	p{
		cursor: pointer;
	}
</style>
</head>
<body>
<div id="container">
    <h3 id="topTxt">검색</h3>
	<div id="searchTab">
		<img src="icons/search.png" id="sr">
		<input type="text" name="search" id="search" placeholder="검색어를 입력하세요." onkeyup="">
	</div>
	<hr id="srLine">
	<div id="bg">
		<div id="menuTab"><p id="music">곡</p><p id="album">앨범</p><p id="singer">가수</p><p id="lyrics">가사</p></div>
		<hr id="menuLine">
		<div id="demo"></div>
	</div>

    <%@ include file="footer.jsp" %>
</div>

</body>
</html>
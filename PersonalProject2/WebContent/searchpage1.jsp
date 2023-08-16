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
	hr{
		width: 80%;
		color: #6c6c6c;
	}
	#searchTab{
		display: flex;
		align-items: center;
	}
	#sr{
		width: 30px;
		margin-left: 60px;
	}
	#search{
		border: none;
		width: 300px;
		padding: 10px;
		margin-left: 5px;
	}
	#search:focus{
		outline: none;
	}
	#bg{
		width: 460px;
		height: 700px;
		position: absolute;
		background: #d2ffd2;
		border-radius: 15px;
		margin-top: 10px;
		margin-left: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#rsBtn{
		border: none;
		background: white;
		color: grey;
		font-weight: bold;
		font-size: large;
		cursor: pointer;
		display: none;
	}
	#demo{
		
	}
</style>
</head>
<body>
<div id="container">
    <h3 id="topTxt">검색</h3>
	<div id="searchTab">
		<img src="icons/search.png" id="sr">
		<input type="text" name="search" id="search" placeholder="검색어를 입력하세요." onkeyup="checkSearchValue()">
		<input type="button" id="rsBtn" value="X" onclick="reset()">
	</div>
	<hr>
	<div id="bg">
		<div id="demo">검색창에 찾으려는 정보를 입력하세요.</div>
	</div>

    <%@ include file="footer.jsp" %>
</div>

	<script>
		
		const search = document.getElementById("search");
		const rsBtn = document.getElementById("rsBtn");
		
		function checkSearchValue() {
			rsBtn.style.display = search.value ? "inline" : "none";
		}
		
		function reset() {
		    search.value = "";
		    rsBtn.style.display = "none";
		}
	</script>
</body>
</html>
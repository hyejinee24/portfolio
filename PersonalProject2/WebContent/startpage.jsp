<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
	#container{
		width: 500px;
		height: 900px;
		border: 1px solid green;
		margin: auto;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: center;
		background: #f6fff3;
	}
	#img{
		width: 400px;
		margin: auto;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="container">
		<img src="icons/logo.png" id="img" onclick="main()">
	</div>
	
	<script>
		function main(){
			location.href="MainMusicList";
		}
	</script>
</body>
</html>
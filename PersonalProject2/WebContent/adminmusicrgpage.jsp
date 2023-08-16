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
	#menuTab{
		display: flex;
		justify-content: space-around;
	}
	#menuLine{
		width: 90%;
		margin: 0;
		margin-left: 20px;
	}
	#regist{
		font-weight: bold;
	}
	p{
		cursor: pointer;
	}
	#mp3Area{
		margin-left: 50px;
		margin-top: 10px;
	}
	#musicFile{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#albumArea{
		margin-left: 50px;
	}
	#album{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#reldateArea{
		margin-left: 50px;
	}
	#reldate{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#albumImgArea{
		margin-left: 50px;
		margin-top: 10px;
	}
	#albumImg{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#titleAgenre{
		display: flex;
		margin-left: 50px;
	}
	#titleArea{
		margin-right: 30px;
	}
	#title{
		border-color: #dfdfdf;
		border-style: solid;
		width: 190px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#genre{
		border-color: #dfdfdf;
		width: 180px;
		height: 33px;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;
	}
	#singerArea{
		margin-left: 50px;
	}
	#singer{
		border-color: #dfdfdf;
		border-style: solid;
		width: 400px;
		height: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#lyricsArea{
		margin-left: 50px;
	}
	#lyrics{
		margin-top: 10px;
	}
	#rgbtn{
 		background: #42b242;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 6px 50px;
		margin-top: 10px;
		margin-left: auto;
		margin-right: auto;
		display: block;
		cursor: pointer;
 	}
</style>
</head>
<body>
<div id="container">
	<div class="top">
	    <h3 id="topTxt">관리자 페이지 - 음악 관리</h3>
	    <input type="button" id="loBtn" value="로그아웃">
    </div>
		<div id="menuTab"><p id="show">조회</p><p id="regist">등록</p></div>
		<hr id="menuLine">
	<form id="ulForm" action="MusicRegist" method="post" enctype="multipart/form-data">
		<div id="mp3Area">
			음악(mp3)<br>
			<input type="file" name="musicFile" id="musicFile" placeholder="음악을 등록하세요.">
		</div>
		<div id="albumArea">
			앨범명<br>
			<input type="text" name="album" id="album" placeholder="앨범명을 입력하세요.">
		</div>
		<div id="reldateArea">
			발매일<br>
			<input type="text" name="reldate" id="reldate" placeholder="발매일을 입력하세요. (8자리 숫자만 입력)">
		</div>
		<div id="albumImgArea">
			앨범 이미지<br>
			<input type="file" name="albumImg" id="albumImg" placeholder="이미지를 등록하세요.">
		</div>
		<div id="titleAgenre">
			<div id="titleArea">
				곡명<br>
				<input type="text" name="title" id="title" placeholder="곡명을 입력하세요.">
			</div>
			<div id="genreArea">
				장르<br>
				<select id="genre" name="genre">
					<option value="dance" selected>댄스</option>
					<option value="hiphop">힙합</option>
					<option value="balad">발라드</option>
					<option value="pop">해외 팝</option>
				</select>
			</div>
		</div>
		<div id="singerArea">
			가수명<br>
			<input type="text" name="singer" id="singer" placeholder="가수명을 입력하세요.">
		</div>
		<div id="lyricsArea">
			가사 (txt)<br>
			<input type="file" name="lyrics" id="lyrics" placeholder="가사를 등록하세요.">
		</div>
		<button type="submit" id="rgbtn" onclick="return regist()">등록</button>
	</form>
	
	<%@ include file="footeradmin.jsp" %>
</div>

	<script>
		const loBtn = $('#loBtn');
		loBtn.on('click', function(){
			alert('로그아웃되었습니다.');
			location.href="Logout";
		});
	
		$('#show').click(function(){
			location.href = "ShowMusicList";
		});
		
		function regist(){
			const musicfile = $('#musicFile');
			const album = $('#album');
			const reldate = $('#reldate');
			const albumimg = $('#albumImg');
			const title = $('#title');
			const genre = $('#genre');
			const singer = $('#singer');
			const lyrics = $('#lyrics');
			
			//음악 파일을 등록하세요 ~ (파일 있는지 검사)
			if (musicfile[0].files.length === 0) {
			  alert('음악 파일을 등록하세요.');
			  return false;
			}
			
			var fileName = musicfile[0].files[0].name;
			var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

			if (fileExtension !== 'mp3') {
			  alert('음악 파일은 mp3 파일을 등록하세요.');
			  return false;
			}
			
			if (album.val().trim().length == 0) {
				alert('앨범명을 입력하세요.');
				album.focus();
				return false;
			}
			if (reldate.val().trim().length == 0) {
				alert('발매일을 입력하세요.');
				reldate.focus();
				return false;
			}
			//숫자만 입력하기 (reldate)
			var onlyNum = /^[0-9]*$/;
			if (!onlyNum.test(reldate.val())) {
				alert('발매일은 숫자만 입력하세요.');
				reldate.focus();
				return false;
			}
			if (reldate.val().trim().length != 8) {
				alert('발매일은 8자리 숫자를 입력하세요.');
				reldate.focus();
				return false;
			}
			
			//앨범 이미지를 등록하세요 ~ (파일 있는지 검사)
			if (albumimg[0].files.length === 0) {
			  alert('앨범 이미지를 등록하세요.');
			  return false;
			}
			
			var albumimgName = albumimg[0].files[0].name;
			var fileExtension = albumimgName.substring(albumimgName.lastIndexOf('.') + 1).toLowerCase();

			if (fileExtension != 'jpg' && fileExtension != 'jpeg' && fileExtension != 'png') {
			  alert('앨범 이미지는 jpg 또는 jpeg 또는 png 파일을 등록하세요.');
			  return false;
			}
			
			if (title.val().trim().length == 0) {
				alert('곡명을 입력하세요.');
				title.focus();
				return false;
			}
			
			//장르는 이미 선택되어 있으니까 유효성 검사 생략!
			
			if (singer.val().trim().length == 0) {
				alert('가수명을 입력하세요.');
				singer.focus();
				return false;
			}

			//가사 파일을 등록하세요 ~ (파일 있는지 검사)
			if (lyrics[0].files.length === 0) {
			  alert('가사 파일을 등록하세요.');
			  return false;
			}
			
			var lyricsName = lyrics[0].files[0].name;
			var fileExtension = lyricsName.substring(lyricsName.lastIndexOf('.') + 1).toLowerCase();

			if (fileExtension !== 'txt') {
			  alert('가사 파일은 txt 파일을 등록하세요.');
			  return false;
			}
			
			$('#ulForm').submit();
			alert('음악 등록이 완료되었습니다.');
			return true;
		}
		
		
	</script>
</body>
</html>
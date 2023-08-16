<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	#sr{
		width: 30px;
		margin-left: 10px;
	}
	#search{
		background: none;
		border: none;
		width: 360px;
		padding: 10px;
		margin-left: 5px;
	}
	#search:focus{
		outline: none;
	}
	#bg{
		width: 460px;
		height: 50px;
		background: #d2ffd2;
		border-radius: 10px;
		margin-top: 10px;
		margin-left: 20px;
		display: flex;
		align-items: center;
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
	#show{
		font-weight: bold;
	}
	p{
		cursor: pointer;
	}
	#rsBtn{
		border: none;
		background: none;
		color: grey;
		font-weight: bold;
		font-size: large;
		cursor: pointer;
		display: none;
	}
	#musicList{
		position: relative;
		text-align: center;
		margin : 10px;
		overflow: auto;
		height: 600px;
	}
	thead{
		background: green;
		color: white;
	}
	.img{
		line-height: 10px;
	}
	#searchRsMsg{
		margin-top: 280px;
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
	<div id="bg">
		<img src="icons/search.png" id="sr">
		<input type="text" name="search" id="search" placeholder="검색어를 입력하세요." onkeyup="checkSearchValue(); srInfo();">
		<input type="button" id="rsBtn" value="X" onclick="reset()">
	</div>
	<div id="musicList">
		<div id="searchRsMsg" style="display: none;">검색 결과가 없습니다.</div>
		<table border="1">
			<thead>
			    <tr>
			        <th>이미지</th>
			        <th>앨범명</th>
			        <th>발매일</th>
			        <th>제목</th>
			        <th>가수명</th>
			        <th>장르</th>
			        <th>음악</th>
			        <th>가사</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="music" items="${ list }">
					<tr>
						<td class="img"><img src = "albumImg/${ music.getAlbumImg() }" style='width: 80px;'></td>
						<td>${ music.getAlbum() }</td>
						<td>${ music.getReldate() }</td>
						<td>${ music.getTitle() }</td>
						<td>${ music.getSinger() }</td>
						<td>${ music.getGenre() }</td>
						<td>${ music.getMfile() }</td>
						<td>${ music.getLyrics() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<input type="button" class="upBtn" value="수정">
	<input type="button" class="delBtn" value="삭제">
	
	<%@ include file="footeradmin.jsp" %>
</div>

	<script>
		const loBtn = $('#loBtn');
		loBtn.on('click', function(){
			alert('로그아웃되었습니다.');
			location.href="Logout";
		});
	
		$('#regist').click(function(){
			location.href = "adminmusicrgpage.jsp";
		});
	
		const search = document.getElementById("search");
		const rsBtn = document.getElementById("rsBtn");
		
		function checkSearchValue() {
			rsBtn.style.display = search.value ? "inline" : "none";
		}
		
		function reset() {
		    search.value = "";
		    rsBtn.style.display = "none";
		    displayAllResults();
		}
		
		function srInfo(){
			//onkeyup으로 검색결과 바로 보여주기
			const searchValue = search.value.trim();
			if (searchValue != "") {
				$.ajax({
					url: "SearchMusicAd",
					method: "Post",
					data: { search: searchValue },
					success: function(resp){
						displaySearchResults(resp);
					}
				});
			} else {
				//검색어가 비어있을 때, 전체 결과를 보여준다.
				displayAllResults();
			}
		}
		
		function displaySearchResults(results){
			const tbody = document.querySelector("tbody");
			const thead = document.querySelector("thead");
			tbody.innerHTML = ""; //검색 결과 표시 전에 기존 내용 지우기
			
			//검색 결과 보여주기(onkeyup)
			const searchRsMsg = document.getElementById("searchRsMsg");
			if (results.length > 0) { //검색 결과가 있을 때
				results.forEach(function (music){
					const row = document.createElement("tr");
					row.innerHTML = '<td class="img"><img src="albumImg/' + music.albumImg + '" style="width: 80px;"></td>'
							        + '<td>' + music.album + '</td>'
							        + '<td>' + music.reldate + '</td>'
							        + '<td>' + music.title + '</td>'
							        + '<td>' + music.singer + '</td>'
							        + '<td>' + music.genre + '</td>'
							        + '<td>' + music.mfile + '</td>'
							        + '<td>' + music.lyrics + '</td>';
					tbody.appendChild(row);
				});
				
				searchRsMsg.style.display = "none";
				thead.style.display = "table-header-group"; // thead를 보이도록 설정
			} else { //검색 결과 없을 때
				searchRsMsg.style.display = "block";
				thead.style.display = "none"; // thead를 숨기도록 설정
			}
		}
		
		function displayAllResults(){
			$.ajax({
	            url: "SearchMusicAd",
	            method: "Post",
	            data: { search: "" }, // 검색어를 비워서 전체 목록 요청
	            success: function(resp){
	                displaySearchResults(resp); // 검색 결과를 보여주는 함수 호출
	            }
	        });
		}
	</script>
</body>
</html>
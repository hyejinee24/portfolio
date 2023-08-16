<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		align-items: flex-start;
		overflow: auto;
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
	table{
		width: 420px;
		margin-top: 15px;
		margin-bottom: 10px;
		overflow: auto;
	}
	#img{
		width: 80px;
		line-height: 10px;
	}
	.title-wrapper {
	    display: flex;
	    flex-direction: column;
	    justify-content: flex-end; /*vertical-align: bottom과 같은 기능 */
	    width: 280px;
	    height: 40px;
	}
	#title {
	    padding-left: 10px;
	    font-size: large;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	.singer-wrapper {
	    display: flex;
	    flex-direction: column;
	    width: 280px;
	    height: 40px;
	}
	#singer{
		color: grey;
		height: 40px;
		padding-left: 10px;
		font-size: medium;
		white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	#play{
		width: 16px;
		text-align: center;
	}
	.dropdownTd{
		width: 20px;
		text-align: center;
	}
	.trBlank{
		height: 3px;
	}
	#btn{
		cursor: pointer;
	}
	#info{
		padding-left: 4px;
		padding-right: 3px;
	}
	#delb{
		background: none;
		border: none;
		cursor: pointer;
	}
	.dropdown{
		position: relative;
		display: inline-block;
	}
	.dropdown-content{
		display: none;
		position: absolute;
		background-color: white;
		border: 1px solid #ccc;
		border-radius: 5px;
		min-width: 60px;
		padding: 4px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		left: -36px;
    	top: 30px;
    	
	}
	.dropdown-content button{
		border: none;
		background: none;
		padding: 2px 16px;
	}
	.dropdown-content button:hover{
		background: #f0f0f0;
	}
</style>
</head>
<body>
<div id="container">
    <h3 id="topTxt">플레이리스트</h3>
	<div id="searchTab">
		<img src="icons/search.png" id="sr">
		<input type="text" name="search" id="search" placeholder="플레이리스트에서 검색" onkeyup="checkSearchValue()">
		<input type="button" id="rsBtn" value="X" onclick="reset()">
	</div>
	<hr>
	<div id="bg" style="<c:if test='${empty playlist}'>align-items: center;</c:if>">
		<c:if test="${ empty playlist }">
			<div>플레이리스트 목록이 없습니다.</div>
		</c:if>
		<c:if test="${ not empty playlist }">
			<table>
				<c:forEach var="play" items="${ playlist }">
					<tr>
						<td rowspan="2" id="img"><img src="albumImg/${ play.getAlbumImg() }" style="width:80px;"></td>
						<td>
							<div class="title-wrapper">
								<span id="title">${ play.getTitle() }</span>
							</div>
						</td>
						<td rowspan="2" id="play"><span id="btn" data-title="${ play.getTitle() }" data-singer="${ play.getSinger() }">▷</span></td>
						<td rowspan="2" class="dropdownTd">
					      <span id="info" class="dropdown">
					        <a id="delb" onclick="toggleDropdown()">:</a>
					        <div class="dropdown-content">
					        	<button id="delbtn" data-title="${ play.getTitle() }" data-singer="${ play.getSinger() }" onclick="del()">삭제</button>
					        </div>
					      </span>
					    </td>
						
					</tr>
					<tr>
						<td>
							<div class="singer-wrapper">
								<span id="singer">${ play.getSinger() }</span>
							</div>
						</td>
					</tr>
					<tr class="trBlank"></tr>
				</c:forEach>
			</table>
		</c:if>
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
		
		const playButtons = document.querySelectorAll("#btn");

		function playMusic(title, singer){
		    location.href = "MusicPlaylist?title=" + title + "&singer=" + singer;
		}

		playButtons.forEach(function(btn) {
		    btn.addEventListener("click", function () {
		        const title = this.getAttribute("data-title");
		        const singer = this.getAttribute("data-singer");
		        playMusic(title, singer);
		    });
		});
		
		//드롭다운 메뉴
		const delbs = document.querySelectorAll('#info');
		delbs.forEach(function (info){
			const btn = info.querySelector('#delb');
			btn.addEventListener('click', function(){
				toggleDropdown(this);
			});
		});
		
		let dropdownOpen = false;
		let currentBtn = null;
		
		//dropdown에서 dropdown-content를 찾는 함수
		function toggleDropdown(btn) {
			const dropdownContainer = btn.closest('.dropdown');
			if (!dropdownContainer)
				return;

			const content = dropdownContainer
					.querySelector('.dropdown-content');
			if (!content)
				return;

			if (currentBtn !== btn) {
				if (currentBtn) {
					const prevContent = currentBtn.nextElementSibling;
					prevContent.style.display = "none";
				}
				currentBtn = btn;
			}

			dropdownOpen = !dropdownOpen;
			content.style.display = dropdownOpen ? "block" : "none";
		}

		//다른 곳 눌렀을 때 메뉴 안보이게 설정
		document.addEventListener("click", function(event) {
			const dropdowns = document.querySelectorAll('.dropdown-content');
			dropdowns.forEach(function(content) {
				if (event.target != currentBtn
						&& !content.contains(event.target)) {
					content.style.display = "none";
				}
			});
		});
		
		//삭제버튼 눌렀을 때 해당 음악을 플레이리스트에서 삭제
		function del(title, singer) {
			location.href="MusicDelPl?title="+ title + "&singer=" + singer;
		}
		
		const delbtns = document.querySelectorAll("#delbtn");

		delbtns.forEach(function(delbtn) {
			delbtn.addEventListener("click", function () {
		        const title = this.getAttribute("data-title");
		        const singer = this.getAttribute("data-singer");
				
		        alert('플레이리스트에서 삭제되었습니다.');
		        del(title, singer);
		    });
		});
	</script>
</body>
</html>
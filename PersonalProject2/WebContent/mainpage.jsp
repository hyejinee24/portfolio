<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#fullM{
		text-decoration: none;
		color: black;
		margin-left: 20px;
	}
	#chart{
		width: 480px;
		margin-left: 10px;
		position: absolute;
		background: #d2ffd2;
		border-radius: 10px;
		display: flex;
		flex-direction: column;
	}
	#chartName{
		font-weight: bold;
		margin: 15px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	#chartTbl{
		position: relative;
		margin: 10px;
		margin-top: 5px;
		table-layout: fixed;
	}
	#chartTbl0{
		margin-top: 2px;
		margin-bottom: 10px;
	}
	.title{
		font-size: large;
		padding-left: 10px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		display: block;
		width: 295px;
	}
	.singer{
		font-size: medium;
		color: grey;
		padding-left: 10px;
	}
	.img{
		width: 70px;
		text-align: center;
	    line-height: 10px;
	}
	.album{
		width: 50px;
		height: 50px;
	}
	.grade{
		width: 20px;
		text-align: center;
	}
	.play{
		width: 15px;
	}
	.blank{
		width: 15px;
	}
	#musicList{
		width: 500px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.musicRow{
        /*width: calc(33.33% - 20px);*/ /* 셀 너비를 1/3로 설정하고 간격을 줌 */
        margin: 5px;
        box-sizing: border-box;
        display: flex;
        vertical-align: top;
        cursor: pointer;
	}
	.musicCell {
		width: 100%;
        box-sizing: border-box;
        vertical-align: top;
        cursor: pointer;
    }
	#musicTbl{
		display: flex;
		flex-wrap: wrap;
		justify-content: space-around;
	}
	.abTitle{
		font-weight: bold;
		font-size: large;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis; /*길면 ..로 표시*/
	    width: 120px;
	    margin-top: 3px;
	    margin-bottom: 3px;
	}
	.abImg, .ab{
		width: 120px;
		height: 120px;
	}
	.sing{
		padding-bottom: 10px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis; /*길면 ..로 표시*/
	    width: 120px;
	}
	.trBlank{
		height: 3px;
	}
	.playbtn{
		height: 20px;
		cursor: pointer;
	}
</style>
</head>
<body>
<div id="container">
    <h3 id="topTxt">홈</h3>
    <a href="#" id="fullM">전체 음악 ></a>

	<div id="musicList">
	    <div id="musicTbl">
	        <c:forEach var="music" items="${list}" varStatus="status">
                <div class="musicRow">
	                <div class="musicCell" data-album="${music.getAlbum()}" data-singer="${music.getSinger()}">
	                    <div class="abImg"><img src="albumImg/${music.getAlbumImg()}" alt="앨범표지" class="ab"></div>
	                    <div class="abTitle">${music.getAlbum()}</div>
	                    <div class="sing">${music.getSinger()}</div>
	                </div>
                </div>
	        </c:forEach>
	    </div>
	</div>
	
	<div id="chart">
		<p id="chartName">사운드웨이브 차트 ></p>
		<table id="chartTbl0">
			<tr>
				<td class="img" rowspan="2"><img src="albumImg/Get Up.png" alt="사진1" class="album"></td>
				<td class="grade">1</td>
				<td class="title">ETA</td>
				<td rowspan="2" class="play"><span class="playbtn" data-title="ETA" data-singer="NewJeans">▷</span></td>
				<td rowspan="2" class="blank"></td>
			</tr>
			<tr>
				<td></td>
				<td class="singer">NewJeans</td>
			</tr>
			<tr class="trBlank"></tr>
			<tr>
				<td class="img" rowspan="2"><img src="albumImg/GOODTHING.jpeg" alt="사진2" class="album"></td>
				<td class="grade">2</td>
				<td class="title">GOOD THING</td>
				<td rowspan="2" class="play"><span class="playbtn" data-title="GOOD THING" data-singer="LOVELOVELOVE">▷</span></td>
				<td rowspan="2" class="blank"></td>
			</tr>
			<tr>
				<td></td>
				<td class="singer">LOVELOVELOVE</td>
			</tr>
			<tr class="trBlank"></tr>
			<tr>
				<td class="img" rowspan="2"><img src="albumImg/Can't Blame A Girl For Trying.jpg" alt="사진3" class="album"></td>
				<td class="grade">3</td>
				<td class="title">Can't Blame A Girl For Trying</td>
				<td rowspan="2" class="play"><span class="playbtn" data-title="Can't Blame A Girl For Trying" data-singer="Anja Kotar">▷</span></td>
				<td rowspan="2" class="blank"></td>
			</tr>
			<tr>
				<td></td>
				<td class="singer">Anja Kotar</td>
			</tr>
			<tr class="trBlank"></tr>
			<tr>
				<td class="img" rowspan="2"><img src="albumImg/BrainGames.png" alt="사진4" class="album"></td>
				<td class="grade">4</td>
				<td class="title">Brain Games</td>
				<td rowspan="2" class="play"><span class="playbtn" data-title="Brain Games" data-singer="Young Len">▷</span></td>
				<td rowspan="2" class="blank"></td>
			</tr>
			<tr>
				<td></td>
				<td class="singer">Young Len</td>
			</tr>
			<tr class="trBlank"></tr>
			<tr>
				<td class="img" rowspan="2"><img src="albumImg/CookingPotatoes.jpg" alt="사진5" class="album"></td>
				<td class="grade">5</td>
				<td class="title">Cooking Potatoes</td>
				<td rowspan="2" class="play"><span class="playbtn" data-title="Cooking Potatoes" data-singer="Weissa G">▷</span></td>
				<td rowspan="2" class="blank"></td>
			</tr>
			<tr>
				<td></td>
				<td class="singer">Weissa G</td>
			</tr>
		</table>
	</div>

	<%@ include file="footer.jsp" %>
</div>
	<script>
		
		//음악 목록 랜덤으로 보여주기 (Fisher-Yates 알고리즘 ..이라고 함)
		  function randomArray(array){
		    for (var i = array.length - 1; i > 0; i--) {
		      const j = Math.floor(Math.random() * (i + 1));
		      [array[i], array[j]] = [array[j], array[i]];
		    }
		    return array;
		  }
	
		  const musicCells = document.querySelectorAll('.musicCell');
		  const musicRows = document.querySelectorAll('.musicRow');
	
		  musicRows.forEach(function(row){
			  row.style.display = "none";
		  });
		  
		  // 랜덤으로 음악 목록 섞기
		  const randomList = randomArray(Array.from(musicRows));
		  for (var i = 0; i < 6; i++) {
		    if (i < randomList.length) {
		      randomList[i].style.display = "block";
		    }
		  }
	
		//앨범 정보 화면으로 넘어가기
		$('.musicCell').click(function(){
			var album = $(this).data('album');
			var singer = $(this).data('singer');
			location.href="ShowAlbumInfo?album="+album+"&singer="+singer;
		});

		
		$('.playbtn').click(function(){
			//플레이리스트에 넣고 음악 재생 (회원만!)
			if (${ id == null }) {
				alert('이용 권한이 없습니다.');
			} else {
				//제목이랑 가수 찾아야댐 .... 파라미터 !!
				var title = $(this).data('title');
   				var singer = $(this).data('singer');
				location.href="AddPlaylist?title="+title+"&singer="+singer;
			}
		});
	</script>

</body>
</html>
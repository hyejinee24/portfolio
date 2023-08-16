<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jq/jquery-3.7.0.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
	#container {
		width: 500px;
		height: 900px;
		border: 1px solid green;
		margin: auto;
		position: relative;
	}
	#album, #albumImg{
		width: 497px;
		height: 450px;
	}
	#bg{
		width: 497px;
		height: 438px;
		position: relative;
		background: #d2ffd2;
	}
	#progressBar {
        width: 497px;
        height: 10px;
        background-color: #ebebeb;
    }
    #progress {
        width: 0%;
        height: 100%;
        background-color: grey;
    }
    #timeDisplay{
		/*bg의 맨 위에 위치*/
		display: flex;
		align-items: flex-start;
		justify-content: space-between;
		margin-bottom: 10px;
    }
    #currentTime{
		/*bg의 맨 위, 왼쪽에 위치*/
		font-size: large;
		margin-top: 5px;
		margin-left: 10px;
    }
    #duration{
		/*bg의 맨 위, 오른쪽에 위치*/
		font-size: large;
		margin-top: 5px;
		margin-right: 10px;
    }
    .glyphicon{
    	font-size: 2em;
    	color: grey;
    	cursor: pointer;
    }
    #icons{
		font-size: x-large;
		display: flex;
		justify-content: space-around;
		align-items: center;
    }
    .glyphicon-retweet, .glyphicon-random{
    	font-size: xx-large;
    }
    #drop{
    	display: flex;
    	justify-content: flex-end;
    	margin-right: 30px;
    	font-size: xx-large;
    }
    #delb{
    	text-decoration: none;
    	color: black;
    }
    #musicInfo{
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	flex-direction: column;
    	height: 120px;
    	margin-bottom: 20px;
    }
    .glyphicon-list{
    	color: green;
    	float: right;
    }
    #moveplp{
    	position: absolute;
    	right: 15px;
    	bottom: 20px;
    }
    .dropdown-menu.pull-right{
    	min-width: 60px;
    }
    #lyrics{
    	position: absolute;
    	top: 0;
    	left: 0;
    	z-index: 1;
    	display: none;
    	
    	width: 497px;
		height: 450px;
		overflow: auto;
		background-color: #ffffffe0;
    	text-align: center;
    }
</style>

</head>
<body>
<div id="container">
    <div id="album">
    	<img src="albumImg/${ musicInfo.getAlbumImg() }" alt="앨범표지" id="albumImg">
    	<div id="lyrics">
    		<span id="lyricsTxt"></span>
    	</div>
    	
    </div>
    <audio id="audioElement" src="mp3/${ musicInfo.getMfile() }"></audio>
	<div id="progressBar">
		<div id="progress"></div>
	</div>
	<div id="bg">
		<div id="timeDisplay">
			<span id="currentTime">00:00</span>
			<span id="duration">00:00</span>
		</div>
			<div class="dropdown" id="drop">
				<a data-toggle="dropdown" href="#" id="delb">:</a>
				<ul class="dropdown-menu pull-right" role="menu">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" onclick="del()">삭제</a></li>
				</ul>
			</div>
			<div id="musicInfo">
			<h3 id="mTitle">${ musicInfo.getTitle() }</h3>
			<p id="mSinger">${ musicInfo.getSinger() }</p>
		</div>
		<div id="icons">
	        <span class="glyphicon glyphicon-retweet"></span>
	        <span class="glyphicon glyphicon-backward" id="preBtn"></span>
	        <span class="glyphicon glyphicon-play" id="playBtn"></span>
	        <span class="glyphicon glyphicon-forward" id="nextBtn"></span>
	        <span class="glyphicon glyphicon-random"></span>
	    </div>
	    <div id="moveplp" onclick="moveplp()">
	    	<span class="glyphicon glyphicon-list"></span>
	    </div>
	</div>
</div>

	<script>
		const audioElement = document.querySelector('#audioElement');
		const progressBar = document.getElementById('progress');
		const currentTimeDisplay = document.getElementById('currentTime');
		const durationDisplay = document.getElementById('duration');
		const playBtn = document.querySelector('#playBtn');
	
		window.onload = function(){ //페이지 실행 시, 음악 자동 실행
			playAudio();
		}
		
		playBtn.addEventListener('click', function(){
			if(playBtn.classList.contains('glyphicon-play')){
				playBtn.classList.remove('glyphicon-play');
				playBtn.classList.add('glyphicon-pause');
                playAudio();
            } else{
            	playBtn.classList.remove('glyphicon-pause');
            	playBtn.classList.add('glyphicon-play');
                pauseAudio();
            }
		});
	
	    audioElement.addEventListener('timeupdate', function(){
	        const currentTime = audioElement.currentTime;
	        const duration = audioElement.duration;
	        const progressPercent = (currentTime / duration) * 100;
	        progressBar.style.width = progressPercent + '%';
	        currentTimeDisplay.textContent = formatTime(currentTime);
	        durationDisplay.textContent = formatTime(duration);
	    });
	
	    function formatTime(time) {
	        const minutes = Math.floor(time / 60);
	        const seconds = Math.floor(time % 60);
	        return minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');

	    }
	
	    function playAudio() {
	        if (audioElement.paused) {
	            audioElement.play();
	            playBtn.classList.remove('glyphicon-play');
	            playBtn.classList.add('glyphicon-pause');
	        } else {
	            audioElement.pause();
	            playBtn.classList.remove('glyphicon-pause');
	            playBtn.classList.add('glyphicon-play');
	        }
	    }

	    function pauseAudio() {
	        audioElement.pause();
	    }

		function moveplp() {
			location.href="ShowPlaylist"; //-> 페이지 이동을 하니까 음악이 멈추게 된다... ajax로 플레이리스트를 보이게하면 음악이 계속 나올까..
		}
		
		function del(){
			alert('플레이리스트에서 삭제되었습니다.');
			location.href="MusicDelPl?title=${ musicInfo.getTitle() }&singer=${ musicInfo.getSinger() }";
		}
		
		const albumImg = document.getElementById('albumImg');
		const lyricDiv = document.getElementById('lyrics');
		const lyricsTxt = document.getElementById('lyricsTxt');
		
		albumImg.addEventListener('click', function(){ //앨범 이미지 클릭 시 가사 보이게 한다.
			const lyricsFilename = "${ musicInfo.getLyrics() }";
			
			$.ajax({
				url: "ShowLyrics", //서블릿 명
				method: "GET",
				data: { filename : lyricsFilename },
				dataType: "text",
				success: function(resp){
					lyricsTxt.innerHTML = resp;
					lyricDiv.style.display = 'block';
				}
			});
		});
		
		lyricDiv.addEventListener('click', function(event) {
	 		if (event.target == lyricDiv) {
	            lyricDiv.style.display = 'none';
			}
	    });
	</script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	
</body>
</html>
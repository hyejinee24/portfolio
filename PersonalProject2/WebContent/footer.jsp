<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#homeImg{
		width: 45px;
		margin-bottom: -10px;
	}
	#plImg{
		width: 45px;
		margin-bottom: -12px;
	}
	#srImg{
		width: 40px;
		margin-bottom: -10px;
	}
	#mpImg{
		width: 40px;
		margin-bottom: -10px;
	}
	.txt{
		font-weight: bold;
		display: inline-block;
		margin-bottom: 15px;
	}
	#footer{
		width: 500px;
		position: absolute;
		bottom: 10px;
	}
	.box{
		cursor: pointer;
	}
</style>

<div id="footer">
        &nbsp;&nbsp;<span onclick="main()" class="box"><span class="txt">홈</span>&nbsp;<img src="icons/home.png" id="homeImg"></span>&nbsp;&nbsp;
        <span onclick="pl()" class="box"><span class="txt">플레이리스트</span>&nbsp;<img src="icons/music.png" id="plImg"></span>&nbsp;&nbsp;
        <span onclick="sr()" class="box"><span class="txt">검색</span>&nbsp;&nbsp;<img src="icons/search.png" id="srImg"></span>&nbsp;&nbsp;
        <span onclick="mp()" class="box"><span class="txt">마이페이지</span>&nbsp;<img src="icons/mypage.png" id="mpImg"></span>
</div>

<script>
		function main(){
			location.href = "MainMusicList";
		}
		function pl(){
			if (${ id == null }) {
				alert('로그인 후 이용하세요.');
			} else {
				location.href = "ShowPlaylist";
			}
		}
		function sr(){
			location.href = "searchpage1.jsp";
		}
		function mp(){
			location.href = "mypage.jsp";
		}
</script>
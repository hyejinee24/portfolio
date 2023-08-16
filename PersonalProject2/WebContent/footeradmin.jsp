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
		margin-bottom: -12px;
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
        <span onclick="pl()" class="box"><span class="txt">회원 관리</span>&nbsp;<img src="icons/mypage.png" id="plImg"></span>&nbsp;&nbsp;
        <span onclick="sr()" class="box"><span class="txt">통계 조회</span>&nbsp;&nbsp;<img src="icons/statisctics.png" id="srImg"></span>&nbsp;&nbsp;
        <span onclick="mp()" class="box"><span class="txt">음악 관리</span>&nbsp;<img src="icons/music.png" id="mpImg"></span>
</div>

<script>
		function main(){
			location.href = "adminhomepage.jsp";
		}
		function pl(){
			location.href = "ShowMemberList"; //회원관리페이지
		}
		function sr(){
			location.href = "adminstgenderpage.jsp"; //통계조회페이지
		}
		function mp(){
			location.href = "ShowMusicList"; //음악관리페이지
		}
</script>
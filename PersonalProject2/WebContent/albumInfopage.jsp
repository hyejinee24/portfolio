<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <!-- 숫자 나눠서 보여주기 위해 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		overflow: hidden;
	}
	#contentWrapper{
		height: 92%;
		overflow-y: auto;
	}
	#topTxt{
	    margin-left: 15px;
	    margin-bottom: 7px;
	    text-decoration: none;
	    color: black;
	    font-size: 30px;
	}
	#musicList{
		width: 440px;
		margin-left: 20px;
		margin-top: 5px;
	}
	.title{
		font-size: large;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		display: block;
		width: 350px;
	}
	.singer{
		font-size: medium;
		color: grey;
	}
	.img{
		width: 70px;
		text-align: center;
	    line-height: 10px;
	}
	#album{
	    margin-left: 20px;
	    margin-top: 0;
	    margin-bottom: 0;
	    font-size: 25px;
	}
	.nums{
		width: 30px;
		text-align: left;
		padding-left: 7px;
	}
	#singerList{
		text-decoration: none;
	    color: black;
	    font-size: x-large;
	    margin-left: 20px;
	}
	#reldate{
	    margin-left: 20px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    font-size: 20px;
	    color: grey;
	    font-weight: normal;
	}
	.play{
		width: 20px;
	}
	.add{
		width: 10px;
		text-align: center;
	}
	#rvCount{
		float: right;
		margin-right: 20px;
	    margin-bottom: 10px;
		font-size: 20px;
	}
	#abImg{
		width: 440px;
		height: 440px;
		margin-left: 25px;
	}
	.playbtn{
		height: 20px;
		cursor: pointer;
	}
	.trBlank{
		height: 3px;
	}
	#rev{
		text-decoration: none;
		color: #959595;
	    cursor: pointer;
	}
	.rv{
		display: inline-block;
	}
	.reviewTxt{
		margin-left: 20px;
	}
	#review{
		display: flex;
    	align-items: center;
    	margin-top: 30px;
	}
	#comment{
		margin-left: 20px;
		border-style: solid;
	    border-color: #dfdfdf;
	    border-radius: 7px;
	    width: 360px;
	    height: 40px;
	    margin-bottom: 10px;
	    margin-right: 10px;
	    padding-left: 10px;
	}
	#cmbtn{
		background: #42b242;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    padding: 7px 15px;
	    cursor: pointer;
	}
	.rvtbl{
		width: 440px;
		margin-left: 20px;
		margin-top: 10px;
		border-top: 1px solid lightgrey;
	}
	.userid{
		width: 405px;
		font-weight: bold;
		font-size: large;
		padding-top: 10px;
	}
	.cmdate{
		color: grey;
		font-size: 15px;
	}
	#info{
		cursor: pointer;
	}
	#add{
		background: none;
		border: none;
		cursor: pointer;
	}
	.drop, .dropdw{
		position: relative;
		display: inline-block;
	}
	.dropdown-content, .dropdown-content2{
		display: none;
		position: absolute;
		background-color: white;
		border: 1px solid #ccc;
		border-radius: 5px;
		min-width: 60px;
		padding: 4px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		left: -45px;
    	top: 30px;
	}
	.dropdown-content button, .dropdown-content2 button{
		border: none;
		background: none;
		padding: 2px 16px;
	}
	.dropdown-content button:hover, .dropdown-content2 button:hover{
		background: #f0f0f0;
	}
	.upbtn{
		float: right;
		margin-right: 15px;
	    font-size: x-large;
        text-decoration: none;
	    border-radius: 20px;
	    line-height: 25px;
        color: black;
	    background: #e8ff99;
	    border: 1px solid #cfcfcf;
	    padding: 10px 10px;
	    cursor: pointer;
	}
	.rvinfo{
	    padding-top: 10px;
	}
	#del{
		background: none;
	   	border: none;
		cursor: pointer;
	}
</style>
</head>
<body>
<div id="container">
    <div id="contentWrapper"> <%-- footer 빼고 내용만 스크롤하기 위해 만듦 --%>
	    <h3 style="margin-bottom: 10px; margin-top: 15px;"><a href="MainMusicList" id="topTxt">←</a></h3>
	    
	    <div>
	    	<c:forEach var="music" items="${ list }" varStatus="status">
	    		<c:if test="${ status.index == 0 }"> <!-- 첫번째꺼 하나만 나오게 설정 -->
			    <h2 id="album">${ music.album }</h2>
			    <a href="#" id="singerList">${ music.singer } ></a>
			    
			    <c:set var="reldate" value="${ music.reldate }"/>
			    <h4 id="reldate">
			    	${fn:substring(reldate,0,4)}.${fn:substring(reldate,4,6)}.${fn:substring(reldate,6,8)}
			    </h4>
			    </c:if>
			</c:forEach>
	    </div>
	    <div id="rvCount">
	    	<a href="#review" id="rev">🗨️ ${ count }</a>
	    </div>
	    <div>
	    	<c:forEach var="music" items="${ list }" varStatus="status">
	    		<c:if test="${ status.index == 0 }">
					<img src="albumImg/${ music.albumImg }" alt="앨범표지" id="abImg">
				</c:if>
			</c:forEach>
			<table id="musicList">
				<c:forEach var="music" items="${ list }" varStatus="status">
					<tr>
						<td class="nums">${ status.index + 1 }</td>
						<td class="title">${ music.title }</td>
						<td rowspan="2" class="play"><span class="playbtn" data-title="${ music.title }" data-singer="${ music.singer }">▷</span></td>
						<td rowspan="2" class="add">
							<span id="info" class="drop">
								<a id="add" onclick="toggleDropdown()">:</a>
								<div class="dropdown-content">
									<button id="addbtn" data-title="${ music.title }" data-singer="${ music.singer }">추가</button>
								</div>
							</span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="singer">${ music.singer }</td>
					</tr>
					<tr class="trBlank"></tr>
				</c:forEach>
			</table>
		</div>
		
		<%-- 감상평 공간 --%>
		<div>
			<div id="review">
				<h3 class="reviewTxt rv">감상평</h3>&nbsp;&nbsp;
				<span class="rvNum rv">${ count }</span>
				
			</div>
				<c:if test="${ id == null }"> <!-- 비회원일 때 -->
					<input type="text" name="comment" id="comment" placeholder="감상평을 입력하세요." disabled>
				</c:if>
				<c:if test="${ id != null }">
					<input type="text" name="comment" id="comment" placeholder="감상평을 입력하세요.">
				</c:if>
				<input type="button" id="cmbtn" value="등록"><br>
				<c:forEach var="rv" items="${ rvList }">
					<table class="rvtbl">
						<tr>
							<td class="userid">${ rv.id }</td>
							<th class="rvinfo">
								<span id="rvif" class="dropdw">
									<a id="del" onclick="toggleDropdown2()">:</a>
									<div class="dropdown-content2">
										<button id="delbtn" data-id="${ rv.id }" data-rno="${ rv.rno }">삭제</button>
									</div>
								</span>
							</th>
						</tr>
						<tr>
							<td class="cm">${ rv.content }</td>
							<td></td>
						</tr>
						<tr>
							<td class="cmdate"><fmt:formatDate value="${ rv.regdate }" pattern="yyyy.MM.dd"/></td>
							<td></td>
						</tr>
					</table>
				</c:forEach>
				
				<span><a href="#topTxt" class="upbtn">▲</a></span> <%-- 이동은 되는데 스크롤 내렸을 때 나타나게 하는게 안되네 ... 일단 보류 --%>
			
		</div>
	</div>
	
	
	<%@ include file="footer.jsp" %>
</div>

	<script>
	        $('.playbtn').click(function(){
	        	const id = "${ sessionScope.id }";
	            // 플레이리스트에 넣고 음악 재생 (회원만!)
	            
	            if (id == "") {
	                alert('이용 권한이 없습니다.');
	            } else {
	                // 제목이랑 가수 찾아야댐 .... 파라미터 !!
	                var title = $(this).data('title');
	                var singer = $(this).data('singer');
	                location.href = "AddPlaylist?title=" + title + "&singer=" + singer;
	            }
	        });
	        
	      	//드롭다운 메뉴 (추가)
			const adds = document.querySelectorAll('#info');
			adds.forEach(function (drop){
				const btn = drop.querySelector('#add');
				btn.addEventListener('click', function(){
					toggleDropdown(this);
				});
			});
			
			let dropdownOpen = false;
			let currentBtn = null;
			
			//dropdown에서 dropdown-content를 찾는 함수
			function toggleDropdown(btn) {
				const dropdownContainer = btn.closest('.drop');
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
	        
			//추가 버튼 클릭 시 플레이리스트에 추가
			function add(title,singer){
				location.href="AddPl?title="+ title + "&singer=" + singer;
			}
			
			const addbtns = document.querySelectorAll('#addbtn');
			
	        addbtns.forEach(function(addbtn) {
	        	addbtn.addEventListener('click', function(){
	        		const id = "${ sessionScope.id }";
	        		const title = this.getAttribute("data-title");
			        const singer = this.getAttribute("data-singer");
			        
			        if (id == "") { //회원만 이용가능 (플레이리스트니까)
						alert('로그인 후 이용하세요.');
					} else{
			        	alert('플레이리스트에 추가되었습니다.');
			        	add(title,singer);
					}
	        	})
	        });
			
	        //감상평 등록
	        $('#cmbtn').click(function(){
	        	const id = "${ sessionScope.id }";
	        	if (id == "") {
					alert('로그인 후 이용하세요.');
					return false;
				} else {
			        let comment = document.querySelector('#comment');
		        	if ($('#comment').val().trim().length == 0) {
						alert('감상평을 입력하세요.');
						return false;
					}
		        	alert('감상평이 등록되었습니다.');
		        	const encodedComment = encodeURIComponent($('#comment').val());
		            const encodedAlbum = encodeURIComponent($("#album").text());
		        	location.href="ReviewRegist?comment=" + encodedComment + "&album=" + encodedAlbum;
				}
	        });
	       
	      //드롭다운 메뉴 (감상평 삭제)
			const dels = document.querySelectorAll('#rvif');
			dels.forEach(function (dropdw){
				const btn2 = dropdw.querySelector('#del');
				btn2.addEventListener('click', function(){
					toggleDropdown2(this);
				});
			});
			
			let dropdownOpen2 = false;
			let currentBtn2 = null;
			
			//dropdown에서 dropdown-content를 찾는 함수
			function toggleDropdown2(btn2) {
				const dropdownContainer2 = btn2.closest('.dropdw');
				if (!dropdownContainer2)
					return;

				const content2 = dropdownContainer2
						.querySelector('.dropdown-content2');
				if (!content2)
					return;

				if (currentBtn2 !== btn2) {
					if (currentBtn2) {
						const prevContent2 = currentBtn2.nextElementSibling;
						prevContent2.style.display = "none";
					}
					currentBtn2 = btn2;
				}

				dropdownOpen2 = !dropdownOpen2;
				content2.style.display = dropdownOpen2 ? "block" : "none";
			}

			//다른 곳 눌렀을 때 메뉴 안보이게 설정
			document.addEventListener("click", function(event) {
				const dropdowns2 = document.querySelectorAll('.dropdown-content2');
				dropdowns2.forEach(function(content2) {
					if (event.target != currentBtn2
							&& !content2.contains(event.target)) {
						content2.style.display = "none";
					}
				});
			});
	        
			//삭제 버튼 클릭 시 감상평 삭제
			//문제점 발견 !!! 음악번호, 아이디, 내용, 시간까지 같은 댓글이 있으면 모두 삭제될텐데 어떡하지?!?! -> rno 저장해서 보내기 !!
			//다시 문제점 발견 !!! 등록할 때 여러번 한 거처럼 지울 때도 해당하는 음악 다 지워야 하는데 해당하는 rno를 어떻게 찾지 ???
			function del(rno){
				location.href="ReviewDel?rno="+ rno;
			}
			
			const delbtns = document.querySelectorAll('#delbtn');
			
			delbtns.forEach(function(delbtn) {
				delbtn.addEventListener('click', function(){
					const id = "${ sessionScope.id }";
	        		const targetId = this.getAttribute("data-id");
	        		const rno = this.getAttribute("data-rno");
			        
	        		if (id == "") {
						alert('권한이 없습니다.');
					} else{
				        if (id != targetId) { //본인만 가능
							alert('권한이 없습니다.');
						} else{
				        	alert('감상평이 삭제되었습니다.');
				        	del(rno);
						}
					}
	        	})
	        });
	</script>

</body>
</html>
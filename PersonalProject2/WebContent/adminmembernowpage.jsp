<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <!-- 숫자 나눠서 보여주기 위해 사용 -->
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
	#nowMember{
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
	#memberList{
		position: relative;
		text-align: center;
		margin : 10px;
		overflow: auto;
		height: 630px;
	}
	table{
		margin: auto;
	}
	thead{
		background: green;
		color: white;
		height: 40px;
	}
	tr{
		height: 30px;
	}
	.img{
		line-height: 10px;
	}
	#searchRsMsg{
		margin-top: 280px;
	}
	#usId{
		width: 100px;
	}
	#usName{
		width: 70px;
	}
	#usTel{
		width: 120px;
	}
	#usBirth{
		width: 100px;
	}
	#usGender{
		width: 40px;
	}
</style>
</head>
<body>
<div id="container">
	<div class="top">
	    <h3 id="topTxt">관리자 페이지 - 회원 관리</h3>
	    <input type="button" id="loBtn" value="로그아웃">
    </div>
		<div id="menuTab"><p id="nowMember">현재 회원 (${ count })</p><p id="notMember">탈퇴 회원</p></div>
		<hr id="menuLine">
	<div id="bg">
		<img src="icons/search.png" id="sr">
		<input type="text" name="search" id="search" placeholder="검색어를 입력하세요." onkeyup="checkSearchValue(); srInfo();">
		<input type="button" id="rsBtn" value="X" onclick="reset()">
	</div>
	<div id="memberList">
		<div id="searchRsMsg" style="display: none;">검색 결과가 없습니다.</div>
		<table border="1">
			<thead>
			    <tr>
			        <th>ID</th>
			        <th>이름</th>
			        <th>연락처</th>
			        <th>생년월일</th>
			        <th>성별</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${ list }">
					<tr>
						<td id="usId">${ user.getId() }</td>
						<td id="usName">${ user.getName() }</td>
						<c:set var="tel" value="${ user.getTel() }"/>
						<td id="usTel">${fn:substring(tel,0,3)}-${fn:substring(tel,3,7)}-${fn:substring(tel,7,11)}</td>
						<c:set var="birth" value="${ user.getBirth() }"/>
						<td id="usBirth">${fn:substring(birth,0,4)}.${fn:substring(birth,4,6)}.${fn:substring(birth,6,8)}</td>
						<td id="usGender">${ user.getGender() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%@ include file="footeradmin.jsp" %>
</div>

	<script>
		const loBtn = $('#loBtn');
		loBtn.on('click', function(){
			alert('로그아웃되었습니다.');
			location.href="Logout";
		});
	
		$('#notMember').click(function(){
			location.href = "ShownotMemberCnt"; //탈퇴 회원 페이지
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
					url: "SearchUserAd",
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

			function formatTel(tel){
				return tel.substring(0,3) + '-' + tel.substring(3,7) + '-' + tel.substring(7);
			}
			
			function formatBirth(birth){
				return birth.substring(0,4) + '.' + birth.substring(4,6) + '.' + birth.substring(6);
			}
			
			//검색 결과 보여주기(onkeyup)
			const searchRsMsg = document.getElementById("searchRsMsg");
			if (results.length > 0) { //검색 결과가 있을 때
				results.forEach(function (user){
					const row = document.createElement("tr");
					row.innerHTML = '<td id="usId">' + user.id + '</td>'
							        + '<td id="usName">' + user.name + '</td>'
							        + '<td id="usTel">' + formatTel(user.tel) + '</td>'
							        + '<td id="usBirth">' + formatBirth(user.birth) + '</td>'
							        + '<td id="usGender">' + user.gender + '</td>';
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
	            url: "SearchUserAd",
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
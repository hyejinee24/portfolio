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
	#notMember{
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
		height: 600px;
	}
	#yearNmonth{
		display: flex;
		justify-content: flex-end;
	}
	table{
		width: 460px;
		margin: auto;
		margin-top: 10px;
	}
	thead{
		background: green;
		color: white;
		height: 40px;
	}
	tr{
		height: 30px;
	}
	select{
		height: 30px;
		margin-right: 10px;
	}
	#date{
		width: 300px;
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
	<div id="memberList">
		<div id="yearNmonth">
			<select id="years">
				<option value="년도 선택">년도 선택</option>
				<c:forEach var="year" items="${ years }">
					<option value="${ year }">${ year }년</option>
				</c:forEach>
			</select>
			<select id="months">
				<option value="월 선택">월 선택</option>
				<c:forEach var="month" items="${ months }">
					<option value="${ month }">${ month }월</option>
				</c:forEach>
			</select>
		</div>
		<table border="1">
			<thead>
			    <tr>
			        <th id="date">날짜</th>
			        <th id="cnt">탈퇴 회원 수</th>
			    </tr>
			</thead>
			<tbody>
				<c:if test="${ list eq null }">
					<tr>
						<td colspan="2" style="text-align: center;">데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ list ne null }">
					<c:forEach var="wd" items="${ list }">
						<tr>
							<td id="wddate">${ wd.wddate }</td>
							<td id="wdcnt">${ wd.wdcnt }명</td>
						</tr>
					</c:forEach>
				</c:if>
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
	
		$('#nowMember').click(function(){
			location.href = "ShowMemberList"; //현재 회원 페이지
		});
	</script>
	
	<script>
		//년도와 월이 선택되면 테이블 업데이트
		$('#years, #months').change(function(){
			showData();
		})
		
		//년도와 월 선택하면 해당하는 결과값 보여주기
		function showData(){
			const selYear_ = $('#years').val();
			const selMonth_ = $('#months').val();
			
			if (selYear_ == "년도 선택" && selMonth_ == "월 선택") {
				// 모든 데이터를 가져와서 표시
		        $.ajax({
		            url: "ShowWithdrawalData",
		            type: "POST",
		            dataType: "json",
		            success: function (resp) {
		                const tableBody = $('table tbody');
		                tableBody.empty();
		                
		                if (resp.length == 0) { //데이터가 없을 때
		                	const row = $('<tr><td colspan="2" style="text-align: center;">데이터가 없습니다.</td></tr>');
		                    tableBody.append(row);
						} else {
			                resp.forEach(function (item) {
			                    const row = $('<tr><td>' + item.wddate + '</td><td>' + item.wdcnt + '명</td></tr>');
			                    tableBody.append(row);
			                });
						}
		            }
		        });
			} else {
				if (selYear_ != "년도 선택" && selMonth_ != "월 선택") {
					//년,월 글자를 빼고 숫자만 추출하기
					const selYear = selYear_.replace('년','');
					const selMonth = selMonth_.replace('월','');
				
					$.ajax({
						url: "ShowWithdrawalData",
						type: "POST",
						data: {
							year: selYear,
							month: selMonth
						},
						dataType: "json",
						success: function(resp){
							//테이블 내용 업데이트
							const tableBody = $('table tbody');
							tableBody.empty();
							
							if (resp.length == 0) { //데이터가 없을 때
			                	const row = $('<tr><td colspan="2" style="text-align: center;">해당하는 데이터가 없습니다.</td></tr>');
			                    tableBody.append(row);
							} else {
								resp.forEach(function(item){
									const row = $('<tr><td>' + item.wddate + '</td><td>' + item.wdcnt + '명</td></tr>');
									tableBody.append(row);
								});
							}
						}
					});
				}
				//년도만 선택된 경우
				else if (selYear_ != "년도 선택"){
					const selYear = selYear_.replace('년','');
					
					$.ajax({
						url: "ShowWithdrawalData",
						type: "POST",
						data: {
							year: selYear
						},
						dataType: "json",
						success: function(resp){
							//테이블 내용 업데이트
							const tableBody = $('table tbody');
							tableBody.empty();
							
							if (resp.length == 0) { //데이터가 없을 때
			                	const row = $('<tr><td colspan="2" style="text-align: center;">해당하는 데이터가 없습니다.</td></tr>');
			                    tableBody.append(row);
							} else {
								resp.forEach(function(item){
									const row = $('<tr><td>' + item.wddate + '</td><td>' + item.wdcnt + '명</td></tr>');
									tableBody.append(row);
								});
							}
						}
					});
				}
				//월만 선택된 경우
				else if (selMonth_ != "월 선택"){
					const selMonth = selMonth_.replace('월','');
					
					$.ajax({
						url: "ShowWithdrawalData",
						type: "POST",
						data: {
							month: selMonth
						},
						dataType: "json",
						success: function(resp){
							//테이블 내용 업데이트
							const tableBody = $('table tbody');
							tableBody.empty();
							
							if (resp.length == 0) { //데이터가 없을 때
			                	const row = $('<tr><td colspan="2" style="text-align: center;">해당하는 데이터가 없습니다.</td></tr>');
			                    tableBody.append(row);
							} else {
								resp.forEach(function(item){
									const row = $('<tr><td>' + item.wddate + '</td><td>' + item.wdcnt + '명</td></tr>');
									tableBody.append(row);
								});
							}
						}
					});
				}
			}
		}
	</script>
</body>
</html>
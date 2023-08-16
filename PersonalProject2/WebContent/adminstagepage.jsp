<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
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
	#bg{
		width: 460px;
		height: 290px;
		background: #d2ffd2;
		border-radius: 10px;
		margin-top: 10px;
		margin-left: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
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
	#stAge{
		font-weight: bold;
	}
	p{
		cursor: pointer;
	}
	#rmBtn{
		border: 1px solid grey;
	    border-radius: 5px;
	    background: green;
	    color: white;
	    padding: 5px 15px;
	    font-size: large;
	    cursor: pointer;
	}
	#stChart{
		position: relative;
		text-align: center;
		margin : 10px;
		overflow: auto;
	}
	#chart{
		max-width: 400px;
		margin: 35px auto;
	}
</style>
</head>
<body>
<div id="container">
	<div class="top">
	    <h3 id="topTxt">관리자 페이지 - 통계 조회</h3>
	    <input type="button" id="loBtn" value="로그아웃">
    </div>
		<div id="menuTab"><p id="stGender">회원 성별 분포도</p><p id="stAge">회원 연령 분포도</p></div>
		<hr id="menuLine">
	<div id="stChart">
		<div id="chart"></div>
	</div>
	<div id="bg">
		<div>추천버튼을 누르면 모달창이 뜨게 ..? 아니면 자동으로 ...?</div> <!-- 내용 -->
		<br>
		<input type="button" id="rmBtn" value="추천">
	</div>
	
	<%@ include file="footeradmin.jsp" %>
</div>

	<script>
		const loBtn = $('#loBtn');
		loBtn.on('click', function(){
			alert('로그아웃되었습니다.');
			location.href="Logout";
		});
	
		$('#stGender').click(function(){
			location.href = "adminstgenderpage.jsp"; //회원 성별 분포도 페이지
		});
	</script>
	<script>
	$.ajax({
		url: 'UserSt2',
		dataType: 'json',
		success: function(data){
			var categories = data.map(item => item.genre);
			var ageGroups = ["10대(0~19세)", "20대(20~29세)", "30대(30~39세)", "40대 이상"];
			
			var series = ageGroups.map(function(ageGroup, index){
				return {
					name: ageGroup,
					data: data.map(item => item.ageCnts[ageGroup] || 0) // 해당 장르의 나이대 데이터가 없을 경우 0으로 채우기
				};
			});
			
			var options = {
	          series: series,
          	  chart: {
		        type: 'bar',
		        height: 300,
		        stacked: true,
		        stackType: '100%'
		      },
	          plotOptions: {
	            bar: {
	              horizontal: true,
	            },
	          },
	          stroke: {
	            width: 1,
	            colors: ['#fff']
	          },
	          xaxis: {
	            categories: categories,
	          },
	          tooltip: {
	            y: {
	              formatter: function (val) {
	                return val + "회"
	              }
	            }
	          },
	          fill: {
	            opacity: 1
	        
	          },
	          legend: {
	            position: 'bottom',
	            horizontalAlign: 'center',
	            offsetX: 40
	          }
	         };

	          var chart = new ApexCharts(document.querySelector("#chart"), options);
	          chart.render();
		  }
	  });
	
	</script>
</body>
</html>
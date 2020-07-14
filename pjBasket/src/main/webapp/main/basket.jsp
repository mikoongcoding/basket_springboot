<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../resources/js/googleChart.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>바스켓</title>
<style type="text/css">
.con_basket > div{
	width: 50%;
	float: left;
	margin-top: 60px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../main/header.jsp"%>
	</header>
		<div class="container con_basket">
			<div id="chart_div">
				 <div class="jumbotron">
				    <h2>오늘의 총매출액</h2>
				    <h1 id="money" style="display:inline"></h1><h1 style="display:inline">원</h1>      
				   
  				</div>
			</div>
			<div id="chart_div2" ></div>
		</div>
		<div class="container con_basket">
			<div id="chart_div3"></div>
			<div id="chart_div4"></div>
		</div>
	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>
	<script>
	function makeComma(str) {
		 str = String(str);
		 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	var today_money=0;
		$(document).ready(function(){
			$.ajax({
				url:'main_money.do',
				type : 'get',
				dataType : 'text',
				success : function(data){
					//alert(data);
					money = makeComma(data);
					$('#money').text(money);
				}
			});
		});
	</script>
	
	<script>
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1', {
			'packages' : [ 'corechart' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(drawChart);

		function drawChart() {
			var jsonData = $.ajax({
				url : "main_graph.do",
				dataType : "json",
				async : false
			}).responseText;

			// Create our data table out of JSON data loaded from server.

			var data = new google.visualization.DataTable(jsonData);

			var options = {
					titleTextStyle: {
					      color: '#01579b',
					      fontSize: 15,
					      fontName: 'Arial',
					      bold: true,
					      italic: true
					   },
				pieSliceText: 'value',
				title:"이번달 매출액 베스트 품목",
				width : "100%",
				height : "100%",
				bar : {groupWidth : "100%"},
				legend: {align: 'left'},  //  or 'left', 'bottom', 'right'(default)
				chartArea : {
					left : "10%",
					top : "13%",
					width : "100%",
					height : "150%"
				}
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document
					.getElementById('chart_div2'));
			chart.draw(data, options);
		}
	</script>

	<script>
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1', {
			'packages' : [ 'corechart' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(drawChart3);

		function drawChart3() {
			var jsonData = $.ajax({
				url : "main_graph3.do",
				dataType : "json",
				async : false
			}).responseText;

			// Create our data table out of JSON data loaded from server.
			var data = new google.visualization.DataTable(jsonData);

			var options = {
					titleTextStyle: {
					      color: '#01579b',
					      fontSize: 16,
					      fontName: 'Arial',
					      bold: true,
					      italic: true
					   },
				title : "남녀별 이용 고객현황",
				legend : 'bottom',
				width : "150%",
				height : "100%",
					
				bar : {
					groupWidth : "95%"
				},
			
				series : {
					0 : {
						color : '#e2431e'
					},
					1 : {
						color : '#e7711b'
					},
					2 : {
						color : '#f1ca3a'
					},
					3 : {
						color : '#6f9654'
					},
					4 : {
						color : '#1c91c0'
					},
					5 : {
						color : '#43459d'
					}
				},
				chartArea : {
					left : "10%",
					top : "20%",
					width : "150%",
					height : "65%"
				}
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.LineChart(document
					.getElementById('chart_div3'));
			chart.draw(data, options);
		}
	</script>
	<script>
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1', {
			'packages' : [ 'corechart' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(drawChart4);

		function drawChart4() {
			var jsonData = $.ajax({
				url : "main_graph4.do",
				dataType : "json",
				async : false
			}).responseText;

			// Create our data table out of JSON data loaded from server.

			var data = new google.visualization.DataTable(jsonData);

			var options = {
					titleTextStyle: {
					      color: '#01579b',
					      fontSize: 16,
					      fontName: 'Arial',
					      bold: true,
					      italic: true
					   },
				title : "이번달 입고금액, 판매금액 현황",
				width : "20%",
				height : "100%",
				bar : {
					groupWidth : "95%"
				},
				legend : 'bottom',
				chartArea : {
					left : "30%",
					top : "10%",
					width : "50%",
					height : "70%"
				}
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.ColumnChart(document
					.getElementById('chart_div4'));
			chart.draw(data, options);
		}
	</script>

</body>
</html>
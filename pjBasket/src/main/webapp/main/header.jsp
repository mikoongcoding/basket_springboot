<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ include file="../resources/checkSession.jsp" %>
<%@ include file="../resources/commonMainBootstrapcss.jsp" %>

<style type="text/css">
.navbar-default{
	border : none;
}
.nav_header{
	width : 100%;
	margin : 0px;
	text-align : center;
	font-size : 22px;
}

.navbar-nav .h_dropdown .nav-link{
	color : #FFFFFF;
}

.dropdown-menu>li>a {
	text-align : center;
}
.onTop{
	text-align : right;
	padding : 6px;
}
.onTop2{
	padding-left : 22px;
}
.onTop, .onTop2{
	width : 100%;
}
.header, .navbar-default, .navbar .navbar-nav{
	margin : 0px;
	background-color : #3b5998;
}
.h_dropdown-menu, .h_dropdown {
    width: 160px;
}

</style>
<script type="text/javascript">
	function dropDown() {
		$('.dropdown-toggle').dropdown();
	};
	function admin_logout() {
		location.href="logout.jsp";
	};
</script>

<div class="container-fluid header">
	<div class="onTop">
	  	<span id="sto_name" style="color:white; font-size:30px; font-style:bold;"><%= sto_name%></span> 
		<button type="button" onclick="admin_logout()" class="btn btn-primary" data-toggle="button" aria-pressed="false" style="font-size:20px; margin-bottom:16px;">
	  	로그아웃
		</button>
	</div>
	<div class="onTop2">
		<a href="../main/basket.jsp" id="logo"><img src="../resources/img/basketAdminMainLogo.png"/></a>
	</div>
</div>
<nav class="navbar navbar-default">
	<ul class="nav navbar-nav nav_header">
		<li class="dropdown h_dropdown"><a class="nav-link" href="../main/basket.jsp">판매분석</a></li>
		<li class="dropdown h_dropdown"><a class="nav-link" href="../member/member.jsp">회원관리</a></li>
        <li class="dropdown h_dropdown"><a class="nav-link" href="../sales/sales.jsp">매출현황</a></li>
        <li class="dropdown h_dropdown"><a class="nav-link" href="../supplier/supplier.jsp">거래처관리</a></li>
        <li class="dropdown h_dropdown"><a class="nav-link" href="../product/product.jsp">상품관리</a></li>
        <li class="dropdown h_dropdown"><a class="nav-link" href="../event/event.jsp">이벤트&쿠폰</a></li>
		<li class="dropdown h_dropdown"><a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-expanded="false" id="dropdownMenu3" onClick="dropDown()">재고관리<span class="caret"></span></a>
	 		<ul class="dropdown-menu h_dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
	            <li class="header_li"><a href="../logistic/stock.jsp">재고조회</a></li>
	            <li class="header_li"><a href="../logistic/warehousing.jsp">입고현황</a></li>
	        </ul>
        </li>
	</ul>
</nav>
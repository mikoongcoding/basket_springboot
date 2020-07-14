<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String eve_code = null;
	String eve_name = null;
	String eve_detail_img = null;
	String eve_des = null;
	String eve_start = null;
	String eve_end = null;
	String eve_img = null;
	List<Map<String, Object>> eve_detail = (List<Map<String, Object>>)request.getAttribute("eve_detail");
	if(eve_detail != null) {
		eve_code = (eve_detail.get(0).get("EVE_CODE")).toString();		
		eve_name = (String)eve_detail.get(0).get("EVE_NAME");		
		eve_detail_img = (String)eve_detail.get(0).get("EVE_DETAIL_IMG");		
		eve_des = (String)eve_detail.get(0).get("EVE_DES");		
		eve_start = (String)eve_detail.get(0).get("EVE_START");		
		eve_end = (String)eve_detail.get(0).get("EVE_END");		
		eve_img = (String)eve_detail.get(0).get("EVE_IMG");		
	} else {
		response.sendRedirect("error/error.jsp");
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eve_detail</title>
    <style type="text/css">
    input {
    	display: block;
    	width: 100%;
    	font-size: 100%;
    }
    .row {
    	margin-bottom: 7%;
    }
    #eveimg {
    	border:1px solid black;     
    }
    </style>
  </head>
<body>
	<header>
		<jsp:include page="../../../main/header.jsp" />
	</header>
    <div class="container">
      <div class="row">
        <div class="col-md-12">

          <div class="page-header"

            style="border-bottom: 1px solid #000000; margin-bottom: 40px">

            <h1 style="display: inline-block;">이벤트 상세</h1>

          </div>

        </div>
      </div>



          

<!--=====================================================================================
        테이블
======================================================================================== -->
      <div class="row" style="margin-bottom:0px;">
        <div class="col-md-1"></div>      
        <div class="col-md-5" id="eveimg">
        	<img name="eveImg" src="<%=request.getContextPath()%><%=eve_detail_img%>" style="width:100%;">
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-4">
        	<form action="eve_update.jsp" style="font-size: 200%;">
				<div class="row">
				<input name="eve_code" type="text" value="<%=eve_code%>">				
				</div>

        		<input name="eve_detail_img" type="hidden" value="<%=request.getContextPath()%><%=eve_detail_img%>">
        		<img name="eve_img" src="<%=request.getContextPath()%><%=eve_img%>">

				<div class="row">
        		<input name="eve_name" type="text" value="<%=eve_name%>">
				</div>

				<div class="row">
        		<input name="eve_des" type="text" value="<%=eve_des%>">
				</div>

				<div class="row">
        		<input name="eve_start" type="text" value="<%=eve_start%>">
				</div>

				<div class="row">
        		<input name="eve_end" type="text" value="<%=eve_end%>">
				</div>
				
        		<input type="submit" class="btn btn-default" value="수정하기" style="width:40%; margin-left:5%;">
	        	<a href="eve_delete.do?eve_code=<%=eve_code%>" class="btn btn-default" role="button" style="width:40%; margin-left:9%;">삭제</a>
        	</form>
        </div>      
      </div>
<!--=====================================================================================
        버튼
======================================================================================== -->
   

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
  </body>
</html>
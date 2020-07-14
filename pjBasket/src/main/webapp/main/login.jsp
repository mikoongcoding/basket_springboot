<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<%@ include file="../resources/commonMainBootstrapcss.jsp" %>
<style type="text/css">
  body {
        background: #f8f8f8;
        padding: 370px 0;
    }
    
#login-form{
width : 410px; 
}
</style>
<script type="text/javascript">
function admin_login(){
	var admin_id = $('#admin_id').val();
	var admin_pw = $('#admin_pw').val();
	if(admin_id != '' && admin_pw != '') {
		$.ajax({
			url: "try_login?admin_id="+admin_id+"&admin_pw="+admin_pw,
			method: "post",
			dataType: "JSON",
			success: function(data){
				var res = JSON.stringify(data);
				var doc = JSON.parse(res);
				var sto_name = doc[0].STO_NAME;
				var sto_code = doc[0].STO_CODE;
				if(sto_name === '2') {
					alert("비밀번호가 틀렸습니다.");
				} else if (sto_name === '-1') {
					alert("존재하는 아이디가 없습니다.");
				} else {
					location.href="basket.jsp";
				}
			}
		});
	} else {
		alert("아이디와 비밀번호를 모두 입력해주세요.");		
	}
}

</script> 
</head>
<body>
<div class="container"  align="center">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" align="center">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title"></div>
            </div>
            <div class="panel-body">
                <form id="login-form">
					<div class="img_logo" style="text-align:center">
					      <img class="img-responsive center-block" src="../resources/img/basketAdminLogo.png"/>
					</div>
                    <div>
                        <input id="admin_id" type="text" class="form-control" name="admin_id" placeholder="ID" style="text-align:center;" autofocus>
                    </div>
                    <div>
                        <input id="admin_pw" type="password" class="form-control" name="admin_pw" placeholder="Password" style="text-align:center;">
                    </div>
                    <div>
                        <button onclick="admin_login()" type="button" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<%@ include file="../resources/commonMainBootstrapjs.jsp" %>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<title>마이페이지</title>
	<link rel="stylesheet" type="text/css" href="resources/css/myinfoupdateForm.css"/>
	
	<!-- 제이쿼리 불러오기 -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript">
	function show_layer(div_name){
		// 메뉴 숫자에 따라 늘려주세요
 		document.all.div_01.style.display="none";
 		document.all.div_02.style.display="none";
 		document.all.div_03.style.display="none";
 		document.all.div_04.style.display="none"; 
	  	
 		switch(div_name) {
	  		case '1':
	  		document.all.div_01.style.display="";
	  		break;
	
	  		case '2':
	  		document.all.div_02.style.display="";
	  		break;
	
	  		case '3':
	  		document.all.div_03.style.display="";
	  		break;
	
	 		case '4':
	  		document.all.div_04.style.display="";
	  		break;
	 	}	
	}
	
	function nmCheck() {
		
	}
	
	/* function nmSubmit() {
		var nickname=$('#nickname').val();
		
		if (nickname.length<2) {
			$('#nMessage').html('닉네임은 2글자 이상 입력하세요.');
			$('#nickname').focus();
			return false;
		} else if (nickname.replace(/[a-z.가-힇]/gi,'').length>0) {
			$('#nMessage').html('닉네임은 한글 또는 영문으로만 입력하세요.');
			$('#nickname').focus();
			return false;
		} else {
			$('#nMessage').html('');	
			return true;
			
			$.ajax({
				type: "Post",
				url: "nickupdate",
				data:{
					id:$("#id").val(),
					nickname : $("#nickname").val()
				},
				success:function(data){
					if(data.fCode=="PS"){
						alert("닉네임이 변경 되었습니다");
						location.href="mypagef";
					}else if (data.fCode=="PF") {
						location.reload();
						alert("서버 상 문제발생");
					} else {
						location.reload();
						alert("다시 시도해 주세요.");
					}
				}
			}); //ajax
		} 
	} */
	</script>
	
	<style type="text/css">
	/* 공통 */
	button:hover { background-color: aliceblue; }
	input:focus { outline: 2px solid #ffbb008f; }
	table { 
		width: 100%;
		border: 0;
	 }
	
	.wrap {  }
	.container01 { margin-bottom: 10px; }
	.container02 {   }
	
	.input { 
    	height: 50px; 
    	padding: 10px;
	}
	
	.inp01 { width: 250px; }
	.inp02 { width: 250px; }
	
	.btn {
	    appearance: none;
	    background: ffc107;
	    color: lightgray;
	    margin: 0;
	    padding: 0.5rem 1rem;
	    text-align: center;
	    text-decoration: none;
	    border: none;
	    border-radius: 4px;
	    width: auto;
	    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
	    cursor: pointer;
	    transition: 0.5s;
	}
	</style>
	
	<%@ include file="../header.jsp" %>
</head>
<body>
  	<div class="center">
      	<!-- 회원정보 -->
      	<div class="infowrap">
      	
	      	<!-- 닉네임 변경 -->
	      	<div id=div_01>
	 			<table>
			  		<tr>
			   			<td class="active">닉네임<br>변경</td>
			   			<td><a href="javascript:show_layer('2');">비밀번호<br>변경</a></td>
			   			<td><a href="javascript:show_layer('3');">이메일<br>변경</a></td>
			   			<td><a href="javascript:show_layer('4');">이미지<br>변경</a></td>    
			  		</tr>
					
					<tr>
						<td class="activecontent" colspan=4 align=center>
							<form action="nickupdate" method="post">	
								<div class="wrap">
									<div class="container01">
										<input class="input inp01" type="text" value="${myInfo.nickname}" readonly="readonly">
									</div>
									
									<div class="container02">
										<input type="text" name="id" id="id" value="${myInfo.id}" hidden=true>
										<!-- <input id="nickname" class="nickname input inp02" type="text" value="" placeholder="변경할 닉네임을 입력해주세요."> -->
										<input name="nickname" id="nickname" class="nickname input inp02" type="text" value="" placeholder="변경할 닉네임을 입력해주세요.">
										<br>
										<p id="nMessage"></p>
										<br>
										<button class="btn" onclick="nmCheck();">중복확인</button>
									</div>
									
									<div class="submitwrap">
										<input type="submit" value="확인">&nbsp;&nbsp; <!-- onclick="return nmSubmit()" -->
								  		<input type="reset" value="취소">
									</div>
								</div>
							</form>	
						</td>
					</tr>
				</table>
			</div>
			<!-- //닉네임 변경 -->
		
			<!-- 비밀번호 변경 -->
			<div id=div_02 style="display: none">
	 			<table>
					<tr>
						<td><a href="javascript:show_layer('1');">닉네임<br>변경</a></td>
						<td class="active">비밀번호<br>변경</td>
						<td><a href="javascript:show_layer('3');">이메일<br>변경</a></td>
						<td><a href="javascript:show_layer('4');">이미지<br>변경</a></td> 
					</tr>
	
					<tr>
						<td class="activecontent" colspan=4 align=center>
							<form action="pwupdate" method="post">
								<div class="wrap">
									<div class="container01">
										<input class="input inp01" type="text" value="${myInfo.pw}" hidden=true>
										<input name="pw" id="pw" class="pw input inp02" type="text" value="" placeholder="현재 비밀번호를 입력해주세요.">
									</div>
									
									<div class="container02">
										<input type="text" name="id" id="id" value="${myInfo.id}" hidden=true>
										<input name="pw" id="pw" class="pw input inp02" type="text" value="" placeholder="변경할 비밀번호를 입력해주세요.">
										<br>
										<p id="pMessage"></p>
										<br>
									</div>
									
									<div class="submitwrap">
										<input type="button" onclick="pwCheck();" class="submit" value="확인">&nbsp;&nbsp; <!-- onclick="return nmSubmit()" -->
								  		<input type="reset" value="취소">
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<!-- //비밀번호 변경 -->

			<!-- 이메일 변경 -->
			<div id=div_03 style="display: none">
				<table>
	  				<tr>
					   <td><a href="javascript:show_layer('1');">닉네임<br>변경</a></td>
					   <td><a href="javascript:show_layer('2');">비밀번호<br>변경</a></td>
					   <td class="active">이메일<br>변경</td>
					   <td><a href="javascript:show_layer('4');">이미지<br>변경</a></td>    
	  				</tr>
	
	  				<tr>
	  					<td class="activecontent" colspan=4 align=center>
	  						<form>	
								<div class="wrap">
									<div class="container01">
										<input class="input inp01" type="text" value="${myInfo.email}" readonly="readonly">
									</div>
									
									<div class="container02">
										<input type="text" name="id" id="id" value="${myInfo.id}" hidden=true>
										<input id="email" class="nickname input inp02" type="text" value="" placeholder="변경할 이메일을 입력해주세요.">
										<input id="email" class="nickname input inp02" type="text" value="" placeholder="인증번호를 입력해주세요.">
										<br>
										<p id="eMessage"></p>
										<br>
										<button class="btn" onclick="emCheck();">인증번호 발송</button>
									</div>
									
									<div class="submitwrap">
										<!-- <input type="button" onclick="return emSubmit()" value="전송">&nbsp;&nbsp; -->
										<input type="button" class="submit" value="전송">&nbsp;&nbsp;
								  		<input type="reset" value="취소">
									</div>
								</div>
							</form>	
	  					</td>
	  				</tr>
				</table>
			</div>
			<!-- //이메일 변경 -->
		
			<!-- 프로필 사진 변경 -->
			<div id=div_04 style="display: none">
	 			<table>
	  				<tr>
						<td><a href="javascript:show_layer('1');">닉네임<br>변경</a></td>
						<td><a href="javascript:show_layer('2');">비밀번호<br>변경</a></td>
						<td><a href="javascript:show_layer('3');">이메일<br>변경</a></td>
						<td class="active">이미지<br>변경</td>    
	  				</tr>
	
	  				<tr>
	  					<td class="activecontent" colspan=4 align=center>
	  						<form>	
								<div class="wrap">
									<div class="container01">
										<img src="${myInfo.memimg}" width="70" height="80" class="select_img">
										<input type="text" name="id" id="id" value="${myInfo.id}" hidden=true>
										<input type="text" name="memimg" value="${myInfo.memimg}" hidden="true"><br>
										<input type="file" name="uploadfilef" id="uploadfilef">
										
										<script>
							 			$("#uploadfilef").change(function(){
							   				if(this.files && this.files[0]) {
							    				var reader = new FileReader;
							   					reader.onload = function(data) {
							    					$(".select_img").attr("src", data.target.result)
							    						.width(70).height(80); 
							    					} // onload_function
							   		 			reader.readAsDataURL(this.files[0]);
							    			} // if
							  			}); // change 
						 				</script>	
										
									</div>
									
									<div class="submitwrap">
										<input type="button" onclick="return imgSubmit()" value="전송">&nbsp;&nbsp;
								  		<input type="reset" value="취소">
									</div>
								</div>
							</form>	
	  					</td>
	  				</tr>
				</table>
			</div>
			<!-- 프로필 사진 변경 -->
      	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>웹게임천국</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
    </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
#home {
	width: 100%;
	height: 150px;
	max-height: 25%;
	background-color: #b9ebff;
}

#modal.modal-overlay {
	display: none;
}

#modal {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
	border: none;
	overflow: hidden;
	background: rgba(0, 0, 0, 0.7);
}

#modalcontent {
	width: 30%;
	height: 50%;
	overflow: hidden;
}

#loginID, #loginPW {
	height: 1em;
}

#card-body {
	position: relative;
}

#loginBtn {
	height: 80px;
	position: absolute;
	top: 12px;
	left: 250px;
}
</style>
</head>

<body id="game" class="d-flex flex-column justify-content-center vh-300">
	<%
	String userId = (String)session.getAttribute("userId");
		String username = (String) session.getAttribute("username");
		String isDuplicated = request.getParameter("isDuplicated");
	%>
	<header class="d-flex flex-column">
		<form action="${pageContext.request.contextPath}/home" method="post">
			<button id="home"
				class="d-flex flex-column justify-content-center align-items-center">웹게임천국</button>
		</form>
		<nav class="navbar navbar-expand-lg bg-body" data-bs-theme="dark">
			<div class="container-fluid">

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/game_avoidBall">공피하기</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game/">조원2</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game/">조원3</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game/">조원4</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/board">게시판</a></li>
					</ul>
					<span id="time" class="text-white m-2 p-0" style="min-width: 100px"></span>
					<div id="dashboard"
						class="d-flex flex-row justify-content-center align-items-center">
						<%
							if (username == null) {
						%>
						<div id="none-login">
							<span class="d-flex" role="search">
								<button class="btn btn-outline-info" id="signBtn" type="submit">sign</button>
							</span>
						</div>
						<%
							} else {
						%>
						<form action="${pageContext.request.contextPath }/logout"
							method="get">
							<div id="on-login d-flex flex-row" class="">
								<a class="text-white" id="showUserName">user:<%=username%></a>
								<button class="btn btn-info" id="logoutBtn" type="submit">logout</button>
							</div>
						</form>
						<%
							}
						%>
					</div>

				</div>
			</div>
		</nav>
	</header>
	<main>
		<div class="container border" style="width: 80%;">

			<div class="w-100 text-center">
				<h1>회원 정보</h1>
			</div>
			Id :
				<div id="idInfo" class=" mb-5  pb-3 d-flex flex-row align-items-center" style="margin-left:30px;margin-top:20px;border-bottom:1px solid #aaaaaa; ">
						<h4><%=userId %></h4>
				</div>
			닉네임 :
					<form action="${pageContext.request.contextPath }/modify_member" method="post">
				<div id="nameInfo" class=" mb-5 pb-3 d-flex flex-row align-items-center" style="margin-left:30px; ">
					<input type="text" name="nameUser" value="${userName }" style="margin-left: 1.3em;"  id="inputTitle">
				</div>
			PW :
				<div id="pwInfo" class=" mb-5 pb-3 d-flex flex-row align-items-center" style="margin-left:30px; border-bottom:1px solid #aaaaaa;">
					 <input type="password" name="pwUser" value="${userPw }" style="margin-left: 1.3em;"  id="inputTitle">
					 <button type="submit" class="btn btn-info my-3">수정</button>(닉네임과 함께 수정됩니다.)
				</div>
					 </form>
			공피하기 기록 :
				<div id="vallInfo" class=" mb-5 pb-3 d-flex flex-row align-items-center" style="margin-left:30px;border-bottom:1px solid #aaaaaa; ">

					 <H3>최고 기록 : <strong>asd</strong></H3>  위
				</div>
			게임2 기록 :
				
				<div id="game2Info" class=" mb-5 pb-3 d-flex flex-row align-items-center" style="margin-left:30px;">

					 <h3>게임 시간 : </h3>
				</div>
				<div id="deleteAndBack" class=" mb-5 d-flex flex-row align-items-center justify-content-center" style="margin-left:30px; border-top:1px solid #aaaaaa;">

					 <form action="${pageContext.request.contextPath }/delete_member" method="post">
					  <button type="submit" class="btn btn-danger my-3">회원 탈퇴</button>
					  <a href="${pageContext.request.contextPath }/home" class="btn btn-secondary my-3">취소</a>
					 </form>
				</div>
			
				

			
		</div>


		<script>
    
    function Checklogin(){
    	loginID = document.getElementById("loginID");
    	loginPW = document.getElementById("loginPW");
    	
    		if (loginID.value === "") {
    			loginID.focus();
				alert("ID를 입력해 주세요.");
				return false;
			}
			if (loginPW.value === "") {
				loginPW.focus();
				alert("비밀번호를 입력해 주세요.");
				return false;
			}

			window.addEventListener('keydown', e => {
			      if (modal.style.display === "flex"&& e.keyCode == 13){
			    	  
			      }
			    })
			return true;
    	}
   
    let loginCheck = "";
    	loginCheck = ${FoundInfo};
    	
    if(loginCheck===false){
    	
    	alert("로그인 정보가 틀렸습니다.");
    	loginCheck = "";
    }
    if(loginCheck===true ){
    	alert("환영합니다!");
    	loginCheck = "";
    	}

  </script>

	
	</main>

	<script>
    function clock() {
      let today = new Date();
      let hour = today.getHours();
      let minute = Number(today.getMinutes());
      let sec = Number(today.getSeconds());

      if (minute < 10) {
        minute = "0" + minute;
      }
      if (sec < 10) {
        sec = "0" + sec;
      }
      if (hour < 10) {
        hour = "0" + hour;
      }

      let timeElement = document.getElementById('time');
      timeElement.innerHTML = hour + " : " + minute + " : " + sec + "<br>";
    }
    clock();
    setInterval(clock, 1000);
    let isDuplicated = "${isDuplicated}";
    if(isDuplicated==="Y"){
    	alert("새로운 이용자가 로그인하여 중복되었습니다. 로그아웃됩니다.");
    }
  </script>

</body>

</html>
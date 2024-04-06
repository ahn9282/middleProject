<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

#ID, #PW {
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
	<hedear class="d-flex flex-column"> <a id="home"
		class="d-flex flex-column justify-content-center align-items-center"
		href="${pageContext.request.contextPath}/home">웹게임천국</a>
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
						href="${pageContext.request.contextPath}/game/">조원1</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath }/game_puzzle">퍼즐</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath }/game_rsp">가위바위보</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${pageContext.request.contextPath }/asd">아바타
							채팅</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath }/board">게시판</a></li>
				</ul>
				<span class="d-flex" role="search"> <span id="time"
					class="text-white m-2 p-0" style="min-width: 100px"></span>
					<button class="btn btn-outline-info" id="signBtn" type="submit">회원가입
						중</button>
				</span>
			</div>
		</div>
	</nav>
	</hedear>
	<div id="gomodal"></div>
	<div id="modal" class="modal-overlay">


		<div
			class="card card-border d-flex flex-column justify-content-center align-items-center"
			id="modalcontent">
			<div class="card-header w-100">
				<h2>Sign</h2>
			</div>
			<div id="card-body" class="card-body p-3 w-100 d-flex flex-row">
				<form action="${pageContext.request.requestURI}" method="post">

					<input id="ID" class=" mx-auto p-3" type="text" name="ID" value=""
						style="border-radius: 5px;" placeholder="userId"><br>

					<input id="PW" class=" mx-auto p-3" type="text" name="PW" value=""
						style="border-radius: 5px;" placeholder="Password">
					<button id="loginBtn" class="btn btn-primary me-auto" type="submit">로그인</button>

				</form>
			</div>

			<div
				class="card-footer w-100 d-flex flex-row justify-content-between">
				<form action="${pageContext.request.contextPath}/join_member"
					method="post">
					<button class="btn btn-primary me-auto">회원가입</button>
				</form>

				<a class="btn btn-secondary" id="closebtn">취소</a>
			</div>
		</div>
	</div>

	<main class="d-flex flex-column align-items-center">
		<div class="w-50 d-flex justify-content-center" style="height: 500px">


			<div
				class="card card-border d-flex flex-column justify-content-center"
				id="join_container"
				style="width: 80%; min-width: 800px; height: 100%">
				<div class="card-header w-100">
					<h2>회원 가입: 아이디 조회는 필수적으로 해주세요</h2>
				</div>
				<div class="card-body p-3 w-100">
					<form onsubmit="return CheckID()"
						action="${pageContext.request.contextPath }/join_member"
						method="post">
						<div class="d-flex flex-row">
							<p>id 조회</p>
							<input type="text" name="showID" value="${validId}"
								id="veritifyID">
							<button type="submit" class="btn btn-primary" id="researchId">조회</button>
						</div>
					</form>
					<form action="${pageContext.request.contextPath }/save_member"
						name="joinForm" method="post" onsubmit="return Checkform()">
						<p class="mb-0">닉네임 :</p>
						<input class="w-100 mx-auto p-3" type="text" name="youname"
							value="" style="border-radius: 5px;" id="joinNAME">
						<p class="mb-0">ID :</p>
						<input class="w-100 mx-auto p-3" type="text" name="userID"
							value="${validId}" style="border-radius: 5px;" id="joinID">

						<p class="mb-0">비밀번호 :</p>
						<input class="w-100 mx-auto p-3" type="password" name="userPW"
							value="" style="border-radius: 5px;" id="joinPW">
						<div
							class="card-footer w-100 d-flex flex:row jusitfy-content-center">
							<button class="btn btn-primary me-auto" type="submit"
								id="joinBtn">가입</button>
							<a class="btn btn-secondary" id="closebtn"
								href="${pageContext.request.contextPath }">취소</a>
						</div>
					</form>
				</div>
			</div>
			<script>
				function Checkform() {
					let userName = document.getElementById("joinNAME");
					let userID = document.getElementById("joinID");
					let userPW = document.getElementById("joinPW");

					if (userName.value === "") {
						userName.focus();
						alert("닉네임을 입력해 주세요.");
						return false;
					}else if(userName.value.length >=20){
						userName.focus();
						alert("닉네임의 길이는 20글자가 최대 입니다.");
						userName.value="";
						return false;
					}
					if (userID.value.length <6) {
						userID.focus();
						alert("ID는 6글자 이상으로 지어주세요. ");
						return false;
					}
					if (userID.value === "") {
						userID.focus();
						alert("ID를 입력해 주세요.");
						return false;
					}else if(userID.value.length >=50){
						userID.focus();
						alert("ID는 50글자가 최대 입니다.");
						userID.value="";
						return false;
					}
					if (userPW.value === "") {
						userPW.focus();
						alert("비밀번호를 입력해 주세요.");
						return false;
					}else if(userPW.value.length >=50){
						userPW.focus();
						alert("PW는 50글자가 최대 입니다.");
						userPW.value="";
						return false;
					}

					alert("가입을 환영합니다. 로그인해주시길 바랍니다.");
					return true;
				}
				
				function CheckID() {
					let userID = document.getElementById("veritifyID");
					if (userID.value === "") {
						userID.focus();
						alert("ID를 입력후 조회하여 주세요.");
						return false;
					}else if(userID.value.length >=50){
						userID.focus();
						alert("ID는 50글자가 최대 입니다.");
						userID.value="";
						return false;
					}
					return true;
				}
				
				
			</script>
		</div>
		<script>
		let userID = document.getElementById("veritifyID");
		if(${existingId} == true){
			alert("중복되는 아이디 입니다.");
			existId="";
		}
		if(${existingId} == false){
			alert("사용가능한 ID입니다.");
			userID.value=${validId};
			existId="";
		}
		</script>
	</main>

	<script>
		function clock() {
			let today = new Date();
			let hour = today.getHours();
			let minute = Number(today.getMinutes());
			let sec = Number(today.getSeconds());

			//document.write(hour + " : " + minute + " : " + sec+ "<br>") ;
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
			timeElement.innerHTML = hour + " : " + minute + " : " + sec
					+ "<br>";
		}
		clock();
		setInterval(clock, 1000);
	</script>


</body>

</html>
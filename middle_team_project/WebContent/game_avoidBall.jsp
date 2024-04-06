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

canvas {
	position: absolute;
	border: 1px solid #aaaaaa;
}

#result {
	margin-left: 550px;
	margin-top: 5%;
}

#titleAndDescription {
	width: 400px;
	margin-left: 50px;
	padding: 0px;
}

main {
	height: 80%;
}

#gameStartBtn, #reStartBtn {
	width: 300px;
	height: 100px;
	position: absolute;
	top: 62%;
	left: 14%;
	transform: translate(-50%, -50%);
}

#reStartBtn {
	display: none;
}

#recordBtn {
	margin-left: 550px;
	margin-top: 5%;
	display: none;
	position: absolute;
	top: 420px;
}

#ranktable {
	margin-left: 900px;
	position: absolute;
	top: 40%;
	width: 600px;
	text-align: center;
	border: 1px solid #aaaaaa;
	border-collapse: collapse;
}

#ranktable tr td {
	border: 1px solid #aaaaaa;
	padding: 8px;
}

.gold {
	background-color: gold;
}

.silver {
	background-color: silver;
}

.bronze {
	background-color: #cd7f32; /* 동 색 */
}

#ranktablehead {
	background: black;
}
</style>
</head>

<body id="game" class="d-flex flex-column justify-content-center vh-300">
	<%
		String username = (String) session.getAttribute("username");
		String userId = (String) session.getAttribute("userId");
		String topRecord = request.getParameter("topRecord");
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
							href="${pageContext.request.contextPath }/game_puzzle">퍼즐</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game_rsp">가위바위보</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/asd">아바타 채팅</a></li>
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
								<a class="text-white" id="showUserName"
									href="${pageContext.request.contextPath }/inquery_member">user:<%=username%></a>
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
	<main id="game">
		<div id="gomodal"></div>
		<div id="modal" class="modal-overlay">


			<div
				class="card card-border d-flex flex-column justify-content-center align-items-center"
				id="modalcontent" style="max-height: 500px;">
				<div class="card-header w-100">
					<h2>Sign</h2>
				</div>
				<div id="card-body" class="card-body p-3 w-100 d-flex flex-row">
					<form action="${pageContext.request.contextPath}/check_member"
						method="post" onsubmit="return Checklogin()">

						<input id="loginID" class=" mx-auto p-3" type="text"
							name="loginID" value="" style="border-radius: 5px;"
							placeholder="userId"><br> <input id="loginPW"
							class=" mx-auto p-3" type="password" name="loginPW" value=""
							style="border-radius: 5px;" placeholder="Password">
						<button id="loginBtn" class="btn btn-primary me-auto"
							type="submit">로그인</button>

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



		<script>
    const gomodal = document.getElementById("gomodal");
    const modal = document.getElementById("modal");
    const btnModal = document.getElementById("signBtn");
    const txtId = document.getElementById("ID");
    const txtPw = document.getElementById("PW");
    
    function modalOn() {
      modal.style.display = "flex";
    
    }
    function modalOff() {
      modal.style.display = "none";
      
    }
  




    btnModal.addEventListener("click", e => {
      modalOn()

    })
    const closeBtn = document.getElementById("closebtn");
    closeBtn.addEventListener("click", e => {
      modalOff()

    })

    window.addEventListener("keyup", e => {
      if (modal.style.display === "flex" && e.key === "Escape") {
        modalOff()

      }
    })
    mainCancel = document.getElementById("main");
    window.addEventListener('click', e => {
      if (e.target == modal)
        modalOff();

    }, true)
    
    if(<%=username%>==null){
 	   alert("로그인 후 시작하실 수 있습니다.");
 	   
 	   setTimeout(function(){modalOn();},500);
 	   //로그인 모달 활성화 함수  modalIn()
    }
    </script>
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
    	console.log(loginCheck);
    if(loginCheck==false){
    	
    	alert("로그인 정보가 틀렸습니다.");
    	loginCheck = "";
    }
    if(loginCheck==true){
    	alert("환영합니다!");
    	loginCheck = "";
    	}
    	console.log(loginCheck)
  </script>

		<div class="title" id="titleAndDescription">
			<h2>
				<strong>Avoid RedBall!!</strong>
			</h2>
			<h4>방향키로 빨간 공을 피하세요!</h4>
		</div>
		<canvas id="canvas1" width="500" height="400"></canvas>
		<canvas id="canvas2" width="500" height="400"></canvas>
		<canvas id="canvas3" width="500" height="400"></canvas>
		<div id="result"></div>
		<button id="gameStartBtn" class="btn btn-primary">Game
			Start!!</button>
		<button id="reStartBtn" class="btn btn-primary">다시 하기</button>

		<form action="${pageContext.request.contextPath}/game_avoidBall"
			method="post">
			<input type="hidden" id="recordtext" name="recordtext" value="">
			<input type="hidden" id="recordName" name="recordtext"
				value="<%=username%>"> <input type="hidden" id="recordId"
				name="recordtext" value="<%=userId%>">
			<button id="recordBtn" class="btn btn-warning">점수 기록하기</button>
		</form>

		<%
			int rank = 0;
		%>
		<table id="ranktable">
			<tr id="ranktablehead" class="text-white">
				<th>TOP5</th>
				<th>이름</th>
				<th>점수</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="top" items="${topList}">
				<%
					rank++;
						String rankColor = "";
						if (rank == 1) {
							rankColor = "gold";
						} else if (rank == 2) {
							rankColor = "silver";
						} else if (rank == 3) {
							rankColor = "bronze";
						}
				%>
				<tr>
					<td class="<%=rankColor%>"><%=rank%></td>
					<td>${top.getPname() }</td>
					<td>${top.getPlayerRecord() }</td>
					<td>${top.getPlayerdate() }</td>
				</tr>

			</c:forEach>


		</table>

		<script>
    let canvas1 = document.getElementById("canvas1");
    let ctx1 = canvas1.getContext("2d");
    let canvas2 = document.getElementById("canvas2");
    let ctx2 = canvas2.getContext("2d");
    let canvas3 = document.getElementById("canvas3");
    let ctx3 = canvas3.getContext("2d");

    let x = canvas1.width / 2;
    let y = canvas1.height / 2;
    let rectWidth = 20;
    let rectHeight = 20;
    let redWidth = 12;
    let redHeight = 12;
    let rectX = (canvas1.width - rectWidth) / 2;
    let rectY = (canvas1.height + 250 - rectHeight) / 2;

    let rightPressed = false;
    let leftPressed = false;
    let upPressed = false;
    let downPressed = false;

    let redX = (canvas2.width / 2 - redWidth);
    let redY = ((canvas2.height - 200) / 2 - redHeight);
    let red2X = (canvas3.width / 2 - redWidth);
    let red2Y = ((canvas3.height - 200) / 2 - redHeight);

    let startTime;
    let endTime;
    let result;
    let $result = document.querySelector("#result");

    document.addEventListener("keydown", keyDownHandler, false);
    document.addEventListener("keyup", keyUpHandler, false);

    let $startBtn = document.getElementById("gameStartBtn");
    let $restartBtn = document.getElementById("reStartBtn");
    let $recordBtn = document.getElementById("recordBtn");
    let $recordtext = document.getElementById("recordtext");
    let $player = document.getElementById("player");

    function keyDownHandler(e) {
        if (e.key == 37 || e.key == "ArrowRight") {
            rightPressed = true;
        } else if (e.key == 39 || e.key == "ArrowLeft") {
            leftPressed = true;
        } else if (e.key == 38 || e.key == "ArrowUp") {
            upPressed = true;
        } else if (e.key == 40 || e.key == "ArrowDown") {
            downPressed = true;
        }
    }

    function keyUpHandler(e) {
        if (e.key == 37 || e.key == "ArrowRight") {
            rightPressed = false;
        } else if (e.key == 39 || e.key == "ArrowLeft") {
            leftPressed = false;
        } else if (e.key == 38 || e.key == "ArrowUp") {
            upPressed = false;
        } else if (e.key == 40 || e.key == "ArrowDown") {
            downPressed = false;
        }
    }

    function figure() {
        ctx1.fillStyle = 'blue';
        ctx1.fillRect(rectX, rectY, rectWidth, rectHeight);
        ctx2.fillStyle = 'red';
        ctx2.beginPath();
        ctx2.arc(redX, redY, redWidth, 0, Math.PI * 2);
        ctx2.fill();
        ctx3.fillStyle = 'red';
        ctx3.beginPath();
        ctx3.arc(red2X, red2Y, redWidth, 0, Math.PI * 2);
        ctx3.fill();
        ctx1.closePath();
        ctx2.closePath();
        ctx3.closePath();
    }

    let moveX = 10;
    let moveY = -10;
    let moveX2 = -7;
    let moveY2 = 12;

    function moveRed() {
    	redX += moveX;
        redY += -moveY;

        if (redX + redWidth > canvas2.width || redX - redWidth < 0) {
            moveX = -moveX;
        }
        if (redY + redWidth > canvas2.height || redY - redWidth < 0) {
            moveY = -moveY;
        }
    }

    function moveRed2() {
        red2X += moveX2;
        red2Y += moveY2;

        if (red2X + redWidth > canvas3.width || red2X - redWidth < 0) {
            moveX2 = -moveX2;
        }
        if (red2Y + redWidth > canvas3.height || red2Y - redWidth < 0) {
            moveY2 = -moveY2;
        }
    }

    function endGame() {
        if ((redX <= rectX + rectWidth &&
            redX + redWidth >= rectX &&
            redY <= rectY + rectHeight &&
            redY + redHeight >= rectY) ||
            (red2X <= rectX + rectWidth &&
                red2X + redWidth >= rectX &&
                red2Y <= rectY + rectHeight &&
                red2Y + redHeight >= rectY)) {
        	
            clearInterval(gameInterval);
            clearInterval(gameOver);
            alert("Game Over!!!");
            $startBtn.style.display = "none";
            $restartBtn.style.display = "block";
            endTime = new Date();
            result = endTime - startTime;
            let resultSpan = document.createElement("span");
            resultSpan.textContent ="결과 : " + result + "ms";
            let $br = document.createElement("br");
            let topRecordSpan = document.createElement("span");
            topRecordSpan.textContent = "최고 기록 : " +(Number(${topRecord}));
            
                $result.appendChild(resultSpan);
                $result.appendChild($br);
                if((Number(${topRecord})) <result){
                	resultSpan.textContent ="결과 : " + result + "ms"+" 갱신!!";
            $recordBtn.style.display = "flex";
                }
                $result.appendChild(topRecordSpan);
        }
    }

    function move() {
        ctx1.clearRect(0, 0, canvas1.width, canvas1.height);
        ctx2.clearRect(0, 0, canvas1.width, canvas1.height);
    	ctx3.clearRect(0, 0, canvas1.width, canvas1.height);
        
        figure();
        moveRed();
        moveRed2();

        if (rightPressed && rectX < canvas1.width - rectWidth) {
            rectX += 5;
        } else if (leftPressed && rectX > 0) {
            rectX -= 5;
        } else if (downPressed && rectY < canvas1.height - rectHeight) {
            rectY += 5;
        } else if (upPressed && rectY > 0) {
            rectY -= 5;
        }
    }

    let gameInterval;
    let gameOver;

    $startBtn.addEventListener('click', e => {
        $startBtn.style.display = "none";
        $recordBtn.style.display = "none";
        startTime = new Date();
        gameInterval = setInterval(move, 10);
        gameOver = setInterval(endGame, 10);
       
    })

    $restartBtn.addEventListener('click', e => {
        $restartBtn.style.display = "none";
        $recordBtn.style.display = "none";
        $result.textContent = "";
        redX = (canvas2.width / 2 - redWidth);
        redY = ((canvas2.height - 200) / 2 - redHeight);
        red2X = (canvas3.width / 2 - redWidth);
        red2Y = ((canvas3.height - 200) / 2 - redHeight);
        rectX = (canvas1.width - rectWidth) / 2;
        rectY = (canvas1.height + 250 - rectHeight) / 2;

        rightPressed = false;
        leftPressed = false;
        upPressed = false;
        downPressed = false;
        startTime = new Date();
        gameInterval = setInterval(move, 10);
        gameOver = setInterval(endGame, 10);
        
    })
    
 $recordBtn.addEventListener('click', e => {
    if (result <= 0) {
        alert("기록이 없습니다.");
    } else {
        
        $recordtext.value = result;
        
       
        document.querySelector("form").submit();
    }
});
    	const ranktable = document.getElementById("ranktable");
    	const canvasBorders = document.querySelectorAll('canvas');
    	
    		
    if(<%=username%>==null){
    	ranktable.style.display = "none";
    	 $startBtn.style.display = "none";
    
    }else{
    	 $startBtn.style.display = "flex";
    	ranktable.style.display = "flex";
    	
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
  </script>

</body>

</html>
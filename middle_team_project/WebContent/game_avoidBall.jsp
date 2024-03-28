<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>웹게임천국</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    canvas {
      border: 1px solid #aaaaaa;
      position: absolute;
    }
    #result{
      margin-left:550px;
      margin-top: 5%;
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

    #loginID,
    #loginPW {
      height: 1em;
    }
    #card-body{
      position: relative;
    }
    #loginBtn {
      height: 80px;
      position:absolute;
      top:12px;
      left: 250px;

    }
    main{
    overflow:hidden;
    width:70%;
    }
   
    
  </style>
</head>

<body id="game" class="d-flex flex-column justify-content-center vh-300">
<%
  String username= (String)session.getAttribute("username");
  %>
  <hedear class="d-flex flex-column">
  <form action="${pageContext.request.contextPath}/" method="post">
    <button id="home" class="d-flex flex-column justify-content-center align-items-center" >웹게임천국</button>
  </form>
    <nav class="navbar navbar-expand-lg bg-body" data-bs-theme="dark">
      <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/game_avoidBall">공피하기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/game/">조원2</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/game/">조원3</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/game/">조원4</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page"
                href="${pageContext.request.contextPath }/board">게시판</a>
            </li>
          </ul>
            <span id="time" class="text-white m-2 p-0" style="min-width:100px"></span>
            <div id="dashboard" class="d-flex flex-row justify-content-center align-items-center">
          <% if(username == null){ %>
          <div id="none-login">
          <span class="d-flex" role="search">
            <button class="btn btn-outline-info" id="signBtn" type="submit">sign</button>        
          </span>
          </div>
          <%}else{ %>
          <form action="${pageContext.request.contextPath }/logout" method="get">
          <div id="on-login d-flex flex-row" class="">
          <p class="text-white" id="showUserName">user:<%=username %></p>
          <button class="btn btn-info" id="logoutBtn" type="submit">logout</button>   
          </div>
          </form>
          <%} %>
            </div>
          
        </div>
      </div>
    </nav>
  </hedear>
  <div id="gomodal"></div>
  <div id="modal" class="modal-overlay">


    <div class="card card-border d-flex flex-column justify-content-center align-items-center" id="modalcontent">
      <div class="card-header w-100">
        <h2>Sign</h2>
      </div>
      <div id="card-body" class="card-body p-3 w-100 d-flex flex-row">
        <form action="${pageContext.request.contextPath}/check_member" method="post" onsubmit="return Checklogin()">

          <input id="loginID" class=" mx-auto p-3" type="text" name="loginID" value="" style="border-radius: 5px;" placeholder="userId" ><br>

          <input id="loginPW" class=" mx-auto p-3" type="password" name="loginPW" value="" style="border-radius: 5px;" placeholder="Password" >
          <button id="loginBtn" class="btn btn-primary me-auto" type="submit">로그인</button>

        </form>
      </div>

      <div class="card-footer w-100 d-flex flex-row justify-content-between">
        <form action="${pageContext.request.contextPath}/join_member" method="post">
          <button class="btn btn-primary me-auto" >회원가입</button>
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
  <main>
     <div class="title">
    <strong>Avoid RedBall!!</strong>
    <p>방향키로 빨간 공을 피하세요!</p>
  </div>
  <canvas id="canvas1" width="500" height="400"></canvas>
  <canvas id="canvas2" width="500" height="400"></canvas>
  <canvas id="canvas3" width="500" height="400"></canvas>
  <div id="result"></div>



  <script>
    let canvas1 = document.getElementById("canvas1");
    let ctx1 = canvas1.getContext("2d");
    let canvas2 = document.getElementById("canvas2");
    let ctx2 = canvas1.getContext("2d");
    let canvas3 = document.getElementById("canvas2");
    let ctx3 = canvas1.getContext("2d");


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


    function keyDownHandler(e) {
      if (e.key == 37 || e.key == "ArrowRight") {
        rightPressed = true;
      }
      else if (e.key == 39 || e.key == "ArrowLeft") {
        leftPressed = true;
      }
      else if (e.key == 38 || e.key == "ArrowUp") {
        upPressed = true;
      }
      else if (e.key == 40 || e.key == "ArrowDown") {
        downPressed = true;
      }
      



    }


    function keyUpHandler(e) {
      if (e.key == 37 || e.key == "ArrowRight") {
        rightPressed = false;
      }
      else if (e.key == 39 || e.key == "ArrowLeft") {
        leftPressed = false;
      }
      else if (e.key == 38 || e.key == "ArrowUp") {
        upPressed = false;
      }
      else if (e.key == 40 || e.key == "ArrowDown") {
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
        moveX = - moveX;
      }
      if (redY + redWidth > canvas2.height || redY - redWidth < 0) {

        moveY = -moveY;
      }
    }

    function moveRed2() {
      red2X += moveX2;
      red2Y += moveY2;


      if (red2X + redWidth > canvas3.width || red2X - redWidth < 0) {
        moveX2 = - moveX2;
      }
      if (red2Y + redWidth > canvas3.height || red2Y - redWidth < 0) {

        moveY2 = -moveY2;
      }
    }
    function endGame(){
      if ((redX <= rectX + rectWidth &&
        redX + redWidth >= rectX &&
        redY <= rectY + rectHeight &&
        redY + redHeight >= rectY) ||
        (red2X <= rectX + rectWidth &&
          red2X + redWidth >= rectX &&
          red2Y <= rectY + rectHeight &&
          red2Y + redHeight >= rectY)) {

        clearInterval(gameInterval)
        endTime = new Date();
        
        result = endTime - startTime;
        
        setTimeout(() => alert("실패"), 100);
        let resultSpan = document.createElement("span");
        resultSpan.textContent = "결과 : " +result+"ms";
            $result.appendChild(resultSpan);
      }
    }
    function move() {
      ctx1.clearRect(0, 0, canvas1.width, canvas1.height);
     
      figure();
      moveRed();
      moveRed2();
      endGame();

      if (rightPressed && rectX < canvas1.width - rectWidth) {
        rectX += 5;
      }
      else if (leftPressed && rectX > 0) {
        rectX -= 5;
      }
      else if (downPressed && rectY < canvas1.height - rectHeight) {
        rectY += 5;
      }
      else if (upPressed && rectY > 0) {
        rectY -= 5;
      }

    }
    startTime = new Date();
    let gameInterval = setInterval(move, 10);
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
      timeElement.innerHTML = hour + " : " + minute + " : " + sec + "<br>";
    }
    clock();
    setInterval(clock, 1000);
  </script>

 
 


</body>

</html>
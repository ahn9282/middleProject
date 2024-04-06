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
      min-width:350px;
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
   
      /* 로또 번호 스타일 */
  main {
    height: 100%;
    margin: 0;
    margin-top:10%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f0f0f0;
  } 

  #lottoNumbers {
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 80%;
    text-align: center; /* 추가: 번호들을 가운데로 정렬 */
  }

  .lotto-number {
    display: inline-block;
    padding: 10px;
    margin: 0.5cm; /* 간격을 2cm로 조절 */
    border-radius: 50%;
    font-size: 50px;
    font-weight: bold;
    color: white;
    text-align: center;
    width: 150px;
    height: 100px;
    line-height: 100px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    margin-bottom: 50px; /* 추가: 번호 사이의 간격 조정 */
  }

  /* 가위바위보 게임 스타일 */
  .container {
    text-align: center;
  }

  .choice {
    display: inline-block;
    margin: 10px;
    cursor: pointer;
    width: 200px; /* 이미지의 폭을 조절 */
    height: auto; /* 이미지의 높이를 자동 조절하여 비율 유지 */
  }

  .btn {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    cursor: pointer;
    border-radius: 5px;
  }

  h1 {
    color: #000000; /* 제목 흰색으로 변경 */
  }

  #result {
    font-family: Arial, sans-serif; /* 결과 값 폰트 설정 */
    font-size: 18px; /* 결과 값 사이즈 설정 */
    color: #000000; /* 결과 값 흰색으로 변경 */
  }

  /* 숨김 처리 */
  .hidden {
    display: none;
  }
  </style>
</head>

<body id="game" class="d-flex flex-column justify-content-center vh-300">
<%
  String username= (String)session.getAttribute("username");

  
  %>
  <header class="d-flex flex-column">
  <form action="${pageContext.request.contextPath}/home" method="post">
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
          <a class="text-white" id="showUserName"
									href="${pageContext.request.contextPath }/inquery_member">user:<%=username%></a>
          <button class="btn btn-info" id="logoutBtn" type="submit">logout</button>   
          </div>
          </form>
          <%} %>
            </div>
          
        </div>
      </div>
    </nav>
  </header>
   <!-- 로또 번호를 표시할 div -->
  <div id="lottoNumbers"></div>

  <!-- 가위바위보 게임 -->
  <div class="container" id="gameContainer">
    <h1>가위바위보 게임</h1>
    <p>팁: 컴퓨터 상대로 3 번 이상 승리 할시 소정한 보상을 받을 수 있습니다.</p>
    <div class="choices">
      <img src="https://velog.velcdn.com/images/dsw018/post/46e51840-ad67-4de6-a543-e879b5d06f96/image.png" alt="바위" class="choice" onclick="playGame('rock')">
      <img src="https://velog.velcdn.com/images/dsw018/post/b8a0a904-73aa-4d21-8f2a-9595a11aef3a/image.png" alt="보" class="choice" onclick="playGame('paper')">
      <img src="https://velog.velcdn.com/images/dsw018/post/981a83e0-3080-4218-b17b-0dff924c549a/image.png" alt="가위" class="choice" onclick="playGame('scissors')">
    </div>
    <p id="result"></p>
    <p id="record"></p>
    <button class="btn" onclick="resetGame()">리셋</button>
    <button class="btn" onclick="claimReward()" id="rewardBtn" disabled>보상 받기</button> <!-- 보상 받기 버튼 추가 -->
  </div>
  <main>
  <script>
    // 로또 번호 생성자 함수
    function LottoGenerator() {
      // 생성된 로또 번호를 저장할 배열
      this.numbers = [];

      // 생성된 로또 번호를 초기화하는 함수
      this.resetNumbers = function() {
        this.numbers = [];
      };

      // 원하는 개수의 랜덤한 로또 번호를 생성하는 함수
      this.generateNumbers = function(quantity) {
        // 이전에 생성된 로또 번호 초기화
        this.resetNumbers();

        // 원하는 개수만큼 로또 번호 생성
        while (this.numbers.length < quantity) {
          // 랜덤한 번호 생성 (1부터 45까지)
          var randomNumber = Math.floor(Math.random() * 45) + 1;

          // 생성된 번호가 배열에 이미 존재하지 않는 경우에만 추가
          if (!this.numbers.includes(randomNumber)) {
            this.numbers.push(randomNumber);
          }
        }

        // 생성된 로또 번호를 정렬
        this.numbers.sort(function(a, b) {
          return a - b;
        });

        // 생성된 로또 번호 반환
        return this.numbers;
      };
    }

    // 생성자 함수를 사용하여 로또 번호 생성
    var lottoGenerator = new LottoGenerator();
    var generatedNumbers = []; // 초기에는 빈 배열로 설정

    // 생성된 로또 번호를 HTML에 표시하는 함수
    function displayLottoNumbers(numbers) {
      // 로또 번호를 표시할 div 요소 가져오기
      var lottoNumbersDiv = document.getElementById('lottoNumbers');
      
      // 기존의 로또 번호를 모두 제거
      lottoNumbersDiv.innerHTML = '';

      // 각 로또 번호에 배경색 적용 및 표시
      numbers.forEach(function(number) {
        // 새로운 div 요소 생성
        var lottoNumberDiv = document.createElement('div');
        // 로또 번호 스타일 클래스 부여
        lottoNumberDiv.className = 'lotto-number';
        // 로또 번호 내용 추가
        lottoNumberDiv.textContent = number;
        // 배경 색상 설정
        lottoNumberDiv.style.backgroundColor = getColor(number);
        // 로또 번호를 표시할 div에 추가
        lottoNumbersDiv.appendChild(lottoNumberDiv);
      });
    }

    // 번호에 따라 색상을 반환하는 함수
    function getColor(number) {
      if (number >= 1 && number <= 10) {
        return '#FFFF00'; // 노란색
      } else if (number >= 11 && number <= 20) {
        return '#87CEEB'; // 하늘색
      } else if (number >= 21 && number <= 30) {
        return '#FF0000'; // 빨간색
      } else if (number >= 31 && number <= 40) {
        return '#808080'; // 회색
      } else {
        return '#008000'; // 초록색
      }
    }

    // 가위바위보 게임 스크립트
    let playerWins = 0;
    let computerWins = 0;

    function playGame(playerChoice) {
      const choices = ['rock', 'paper', 'scissors'];
      const computerChoice = choices[Math.floor(Math.random() * choices.length)];

      let result;

      if (playerChoice === computerChoice) {
        result = '비겼습니다!';
      } else if (
        (playerChoice === 'rock' && computerChoice === 'scissors') ||
        (playerChoice === 'paper' && computerChoice === 'rock') ||
        (playerChoice === 'scissors' && computerChoice === 'paper')
      ) {
        result = '이겼습니다!';
        playerWins++;
      } else {
        result = '졌습니다!';
        computerWins++;
      }

      document.getElementById('result').innerText = "플레이어: " + playerChoice + ", 컴퓨터: " + computerChoice + ". 결과: " + result;
      document.getElementById('record').innerText = "플레이어: " + playerWins + " 대 컴퓨터: " + computerWins + ".";


      // 플레이어가 3:0 이상으로 이겼을 때 보상 받기 버튼 활성화
      if (playerWins >= 3 && playerWins > computerWins) {
        document.getElementById('rewardBtn').disabled = false;
      } else {
        document.getElementById('rewardBtn').disabled = true;
      }

      // 플레이어가 3:0 초과로 졌을 때 게임 종료
      if (computerWins > 3) {
        alert('게임 종료! 아쉽지만 컴퓨터가 이겼습니다.');
        resetGame();
      }
    }

    function resetGame() {
      playerWins = 0;
      computerWins = 0;
      document.getElementById('record').innerText = '';
      document.getElementById('rewardBtn').disabled = true; // 게임 리셋 시 보상 받기 버튼 비활성화
    }

    // 보상 받기 버튼 클릭 시 실행되는 함수
    function claimReward() {
      alert('축하드립니다! 보상은 운수가 좋은 로또 번호입니다.'); // 보상 받았을 때 출력되는 메시지
      generatedNumbers = lottoGenerator.generateNumbers(6); // 새로운 로또 번호 생성
      displayLottoNumbers(generatedNumbers); // 새로 생성된 로또 번호를 화면에 표시
      resetGame(); // 게임 리셋
      document.getElementById('gameContainer').classList.add('hidden'); // 가위바위보 게임 숨김 처리
    }
  </script>
  
  

  <div id="gomodal"></div>
  <div id="modal" class="modal-overlay">


    <div class="card card-border d-flex flex-column justify-content-center align-items-center" id="modalcontent">
      <div class="card-header w-100" style="max-height:500px;">
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
  </script>

</body>

</html>
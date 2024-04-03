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
          <ol class="navbar-nav me-auto mb-2 mb-lg-0">
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
          </ol>
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
  </header>
  <main>
  
<%--   /*본인 내용*/
  
    <div class=" w-100 d-flex justify-content-center" style="height:500px">
      <h1 style="line-height:500px">내용</h1>
      <h1><%=username %></h1><br>
      <h1>중복여부 : ${DuplicateLogin }</h1>
    </div>
 --%>  

  
  
  
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
  
  
  
  
  <style>
  
	* {
	    margin: 0;
	    padding: 0;
	}
	:root {
	 --facebook : #3b5998
	}
	ul {
	    list-style: none;
	    padding: 0;
	}
	.wrapper {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	}
	.play-time {
	    font-size: 3rem;
	    margin-top: 2rem;
	    color: var( --facebook); 
	}
	ul {
	    list-style: none;
	    margin-top: 1rem;
	    border: 2px solid var( --facebook);
	    display: grid;
	    grid-template-columns: repeat(4, 1fr);
	}
	ul > li {
	    width: 100px;
	    height: 100px;
	    background: #ccc;
	    color: #fff;
	    background: url("https://picsum.photos/600/600/?random");
	
	}
	.start-button {
	    background: var( --facebook);
	    color: #fff;
	    border: none;
	    padding: 1rem 2rem;
	    margin-top: 1rem;
	}

	
	.list0 {
	    background-position-x: 0px;
	    background-position-y: 0px;
	}
	.list1 {
	    background-position-x: -100px;
	    background-position-y: 0px;
	}
	.list2 {
	    background-position-x: -200px;
	    background-position-y: 0px;
	}
	.list3 {
	    background-position-x: -300px;
	    background-position-y: 0px;
	}
	.list4 {
	    background-position-x: 0px;
	    background-position-y: -100px;
	}
	.list5 {
	    background-position-x: -100px;
	    background-position-y: -100px;
	}
	.list6 {
	    background-position-x: -200px;
	    background-position-y: -100px;
	}
	.list7 {
	    background-position-x: -300px;
	    background-position-y: -100px;
	}
	.list8 {
	    background-position-x: 0px;
	    background-position-y: -200px;
	}
	.list9 {
	    background-position-x: -100px;
	    background-position-y: -200px;
	}
	.list10 {
	    background-position-x: -200px;
	    background-position-y: -200px;
	}
	.list11 {
	    background-position-x: -300px;
	    background-position-y: -200px;
	}
	.list12 {
	    background-position-x: 0px;
	    background-position-y: -300px;
	}
	.list13 {
	    background-position-x: -100px;
	    background-position-y: -300px;
	}
	.list14 {
	    background-position-x: -200px;
	    background-position-y: -300px;
	}
	.list15 {
	    background-position-x: -300px;
	    background-position-y: -300px;
	}
	
	.game-text {
	    position: absolute; 
	    font-size: 45px; 
	    color: purple;
	    display: none;
	}  

  </style>
  
    <div class="wrapper">
        <p class="play-time">0</p>
        <ul class="image-container">
            <li class="list0" data-type="0" draggable="true"></li>
            <li class="list1" data-type="1" draggable="true"></li>
            <li class="list2" data-type="2" draggable="true"></li>
            <li class="list3" data-type="3" draggable="true"></li>
            <li class="list4" data-type="4" draggable="true"></li>
            <li class="list5" data-type="5" draggable="true"></li>
            <li class="list6" data-type="6" draggable="true"></li>
            <li class="list7" data-type="7" draggable="true"></li>
            <li class="list8" data-type="8" draggable="true"></li>
            <li class="list9" data-type="9" draggable="true"></li>
            <li class="list10" data-type="10" draggable="true"></li>
            <li class="list11" data-type="11" draggable="true"></li>
            <li class="list12" data-type="12" draggable="true"></li>
            <li class="list13" data-type="13" draggable="true"></li>
            <li class="list14" data-type="14" draggable="true"></li>
            <li class="list15" data-type="15" draggable="true"></li>
        </ul>
        <button class="start-button">Start</button>
        <p class="game-text">Complete!!</p>
    </div>
    
    
    <script>
    
	    
	    const container = document.querySelector(".image-container")
	    const startButton = document.querySelector(".start-button")
	    const gameText = document.querySelector(".game-text")
	    const playTime = document.querySelector(".play-time")
	    const tiles = document.querySelectorAll(".image-container > li");

	
	
	    let isPlaying = false; 
	    let timeInterval = null;
	    let time = 0;
	
	
	    const dragged = {
	        el: null, 
	        class: null,
	        index: null,
	    }
	
	    startButton.addEventListener("click",() =>{
	        setGame()
	    })
	
	    function setGame(){
	        time = 0; 
	        gameText.style.display = "none"
	        timeInterval = setInterval(() =>{
	            time++;
	            playTime.innerText = time; 
	        },1000)
	
	        const gameTiles = shuffle([...tiles]); 
	        gameTiles.forEach(tile=>{
	            container.appendChild(tile)
	        })
	    }
	
	    function checkStatus(){
	        const currentList = [...container.children]; 
	        const unMatched = currentList.filter((list,index)=>{
	            return Number(list.getAttribute("data-type")) !== index
	        })
	        if(unMatched.length === 0){
	            isPlaying = false;
	            clearInterval(timeInterval)
	            gameText.style.display = "block"
	        }
	    }
	
	    function shuffle(array){
	        let index = array.length -1; 
	        while(index > 0){
	            const randomIndex = Math.floor(Math.random()*(index +1)); 
	            [array[index], array[randomIndex]] = [array[randomIndex], array[index]]
	            index--;
	        }
	        return array; 
	    }
	
	
	
	    container.addEventListener('dragstart', e => {
	        const obj = e.target; 
	        console.log({ obj })
	        dragged.el = obj; 
	        dragged.class = obj.className; 
	        dragged.index = [...obj.parentNode.children].indexOf(obj)
	    })
	    container.addEventListener('dragover', e => {
	        e.preventDefault()
	        //console.log(e)
	    })
	    container.addEventListener('drop', e => {
	        const obj = e.target;
	        let originPlace; 
	        let isLast = false;  
	        if(dragged.el.nextSibling){
	            originPlace = dragged.el.nextSibling; 
	        }else {
	            originPlace = dragged.el.previousSibling;
	            isLast = true; 
	        }
	        const droppedIndex = [...obj.parentNode.children].indexOf(obj)
	        dragged.index > droppedIndex ? obj.before(dragged.el) : obj.after(dragged.el);
	        isLast ? originPlace.after(obj) : originPlace.before(obj);
	        checkStatus()
	    })    
	    
    
    
    </script>
  
  
  
 
  
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
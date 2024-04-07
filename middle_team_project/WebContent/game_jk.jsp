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
	@font-face {
	    font-family: 'NeoDunggeunmo';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	#title { 
	    font-family: "NeoDunggeunmo", Verdana, Tahoma;
	    color: green;
	}	   
  </style>
</head>

<body id="game" class="d-flex flex-column justify-content-center vh-300">
<%
  String username= (String)session.getAttribute("username");
	String isDuplicated = request.getParameter("isDuplicated");
  
  %>
  <header class="d-flex flex-column">
  <form action="${pageContext.request.contextPath}/home" method="post">
    <button id="home" class="d-flex flex-column justify-content-center align-items-center" >
		<h1 id="title" class="display-1 fw-bold">웹게임천국</h1>
    </button>
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
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/game_puzzle">퍼즐</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/game_rsp">가위바위보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/jk/game.do">아바타 채팅</a>
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
          <a class="text-white" id="showUserName" href="${pageContext.request.contextPath }/inquery_member">user:<%=username %></a>
          <button class="btn btn-info" id="logoutBtn" type="submit">logout</button>   
          </div>
          </form>
          <%} %>
            </div>
          
        </div>
      </div>
    </nav>
  </header>
  <main></main>

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


<script>


        let userId = "<%= session.getAttribute("userId") %>";
        let username = "<%= session.getAttribute("username") %>";
        
        console.log("userId: " + userId);
        
        if(username == "null"){
      	   alert("로그인 후 시작하실 수 있습니다.");
      	   
      	   setTimeout(function(){modalOn();},500);
      	   
      	   $("main").css("display","none");
        };
        
        
        
        let member_id_text = "";
        let timestamp_latest_text = "";
        let timestamp_first_text = "";
        let member_name_text = "";
        let model_number_text = "";
        let map_number_text = "";
        let tile_number_text = "";
        let is_moving_text = "";
        let from_where_text = "";
        let is_flip_text = "";
        let is_chaton_text = "";
        let chat_text_text = "";
        let is_jump_text = "";
        
        
        /*
        let returnCharacter = function(id) {
        	//let a = "";
        	var a = "";
            $.ajax({
                type: "post",
                url: "jk.controller.GameController",
                data: {
                    eventNumber: 1,
                	//member_id: userId,
                	member_id: id,
                },
                async: false,
                success: function (resultData) {
                	console.log("s1");
                	console.log(resultData);
                    
                    member_id_text = $(resultData).find("member_id").text();
                    timestamp_latest_text = $(resultData).find("timestamp_latest").text();
                    timestamp_first_text = $(resultData).find("timestamp_first").text();
                    member_name_text = $(resultData).find("member_name").text();
                    model_number_text = $(resultData).find("model_number").text();
                    map_number_text = $(resultData).find("map_number").text();
                    tile_number_text = $(resultData).find("tile_number").text();
                    is_moving_text = $(resultData).find("is_moving").text();
                    from_where_text = $(resultData).find("from_where").text();
                    is_flip_text = $(resultData).find("is_flip").text();
                    is_chaton_text = $(resultData).find("is_chaton").text();
                    chat_text_text = $(resultData).find("chat_text").text();
                    is_jump_text = $(resultData).find("is_jump").text();
                    
                    console.log("member_id_text: " + member_id_text);
                    console.log("timestamp_latest_text: " + timestamp_latest_text);
                    console.log("timestamp_first_text: " + timestamp_first_text);
                    console.log("member_name_text: " + member_name_text);
                    console.log("model_number_text: " + model_number_text);
                    console.log("map_number_text: " + map_number_text);
                    console.log("tile_number_text: " + tile_number_text);
                    console.log("is_moving_text: " + is_moving_text);
                    console.log("from_where_text: " + from_where_text);
                    console.log("is_flip_text: " + is_flip_text);
                    console.log("is_chaton_text: " + is_chaton_text);
                    console.log("chat_text_text: " + chat_text_text);
                    console.log("is_jump_text: " + is_jump_text);
                    
                    console.log(resultData);
                    //return resultData;
                    a = resultData;
                },
                error: function () {
                    console.log("e1");
                }
            });
            //return 
            console.log(a);
            return a;
        };
        
        //returnCharacter(userId);
        
        console.log("returnCharacter: " + returnCharacter(userId));
        */
        
        
        $.ajax({
            type: "post",
            url: "jk.controller.GameController",
            data: {
                eventNumber: 1,
                //gridNumberHeavy: gridNumberHeavy,
                
            	//member_id: member_id,
            	member_id: userId,
            },
            async: false,
            success: function (resultData) {
            	console.log("s1");
            	//console.log(resultData);

                //console.log("member_id: " + $(this).find("member_id").text());
                //console.log("member_id: " + $(resultData).find("member_id").text());
                
                

                
                member_id_text = $(resultData).find("member_id").text();
                timestamp_latest_text = $(resultData).find("timestamp_latest").text();
                timestamp_first_text = $(resultData).find("timestamp_first").text();
                member_name_text = $(resultData).find("member_name").text();
                model_number_text = $(resultData).find("model_number").text();
                map_number_text = $(resultData).find("map_number").text();
                tile_number_text = $(resultData).find("tile_number").text();
                is_moving_text = $(resultData).find("is_moving").text();
                from_where_text = $(resultData).find("from_where").text();
                is_flip_text = $(resultData).find("is_flip").text();
                is_chaton_text = $(resultData).find("is_chaton").text();
                chat_text_text = $(resultData).find("chat_text").text();
                is_jump_text = $(resultData).find("is_jump").text();
                
                console.log("member_id_text: " + member_id_text);
                console.log("timestamp_latest_text: " + timestamp_latest_text);
                console.log("timestamp_first_text: " + timestamp_first_text);
                console.log("member_name_text: " + member_name_text);
                console.log("model_number_text: " + model_number_text);
                console.log("map_number_text: " + map_number_text);
                console.log("tile_number_text: " + tile_number_text);
                console.log("is_moving_text: " + is_moving_text);
                console.log("from_where_text: " + from_where_text);
                console.log("is_flip_text: " + is_flip_text);
                console.log("is_chaton_text: " + is_chaton_text);
                console.log("chat_text_text: " + chat_text_text);
                console.log("is_jump_text: " + is_jump_text);
                
                
                
                
            },
            error: function () {
                console.log("e1");
            }
        });        
        
        
        
        
</script>


<script src="https://cdn.jsdelivr.net/gh/KeyvanOh/kdt@latest/test27.js"></script>



<script>




  d.ready(function () {
  	if (username != null) {
    	member_id = userId;
    	member_name = username;
  	};
	  
	  
    let count = <%=request.getAttribute("count")%>;

    let hereLink = "<%=request.getContextPath()%>" + "/jk/game.do";

    let refreshLink = "<%=request.getContextPath()%>" + "/jk/refresh.do";
    let data = "";
    //let interval = setInterval(function() {
    	
    	
    

    let hundrend_from_one_second = 0;
    	
    /*	
    setInterval(function() {
        //let tile_number_from_where = 0;

    }, 1000);
    */
    
    let h = 0;
    let v = 0;
    
    setInterval(function() {
    	$(".otherCharacter").css("top", sin * 8 + "px");
    	//data);
    	
    	
        $(".otherCharacter").parent().css("background", "none");
        $(".otherCharacter").remove();
        $(".otherChat").remove();
    	
        $(data).find("character").each(function () {
        	let character_data = $(this);
        	if (member_id == character_data.find("member_id").text()) {
        	} else {
                
        		let grid = $(".grid" + character_data.find("from_where").text());
        		let characterImage = $('<img class="otherCharacter" src="" />');
        		//let characterImage;
        		
        		
        		
        		
    			switch(character_data.find("model_number").text()) {
					case "1": {
						if (hundrend_from_one_second <= 0.25) {
							characterImage.attr("src", character_1_0);
						} else if (hundrend_from_one_second <= 0.5) {
							characterImage.attr("src", character_1_1);
						} else if (hundrend_from_one_second <= 0.75) {
							characterImage.attr("src", character_1_2);
						} else {
							characterImage.attr("src", character_1_3);
						}
						break;
					}
					case "2": {
						if (hundrend_from_one_second <= 0.25) {
							characterImage.attr("src", character_2_0);
						} else if (hundrend_from_one_second <= 0.5) {
							characterImage.attr("src", character_2_1);
						} else if (hundrend_from_one_second <= 0.75) {
							characterImage.attr("src", character_2_2);
						} else {
							characterImage.attr("src", character_2_3);
						}
						break;
					}
					case "3": {
						if (hundrend_from_one_second <= 0.25) {
							characterImage.attr("src", character_3_0);
						} else if (hundrend_from_one_second <= 0.5) {
							characterImage.attr("src", character_3_1);
						} else if (hundrend_from_one_second <= 0.75) {
							characterImage.attr("src", character_3_2);
						} else {
							characterImage.attr("src", character_3_3);
						}
						break;
					}
					case "4": {
						if (hundrend_from_one_second <= 0.25) {
							characterImage.attr("src", character_4_0);
						} else if (hundrend_from_one_second <= 0.5) {
							characterImage.attr("src", character_4_1);
						} else if (hundrend_from_one_second <= 0.75) {
							characterImage.attr("src", character_4_2);
						} else {
							characterImage.attr("src", character_4_3);
						}
						break;
					}
					default: {
						if (hundrend_from_one_second <= 0.25) {
							characterImage.attr("src", character_mary_0);
						} else if (hundrend_from_one_second <= 0.5) {
							characterImage.attr("src", character_mary_1);
						} else if (hundrend_from_one_second <= 0.75) {
							characterImage.attr("src", character_mary_3);
						} else {
							characterImage.attr("src", character_mary_2);
						}
					}
				}
        		
        		
        		/*
        		if(character_data.find("model_number").text() == "1") &&  {
        			characterImage.css("transform", "scaleX(-1)");
        			
        		};
        		*/
        		
        		/*
        		if (Math.floor(hundrend_from_one_second * 100) % 20 == 0) {
        			
        			switch(character_data.find("model_number").text()) {
        				case "1": {
        			        if (characterImage.attr("src") == character_1_0) {
        			            characterImage.attr("src", character_1_1);
        			        } else if (characterImage.attr("src") == character_1_1) {
        			            characterImage.attr("src", character_1_3);
        			        } else if (characterImage.attr("src") == character_1_3) {
        			            characterImage.attr("src", character_1_2);
        			        } else {
        			            characterImage.attr("src", character_1_0);
        			        };
        					"smile");
        					console.log(characterImage.attr("src"));
        					break;
        				}
        				default: {
        			        if (characterImage.attr("src") == character_mary_0) {
        			            characterImage.attr("src", character_mary_1);
        			        } else if (characterImage.attr("src") == character_mary_1) {
        			            characterImage.attr("src", character_mary_3);
        			        } else if (characterImage.attr("src") == character_mary_3) {
        			            characterImage.attr("src", character_mary_2);
        			        } else {
        			            characterImage.attr("src", character_mary_0);
        			        };
        			        console.log(characterImage.attr("src"));
        					console.log("MS");
        				}
        			}
        		}
         		*/
        		
        		if(character_data.find("is_flip").text() == "1") {
        			//console.log(character_data.find("member_id").text() + " is flipped now.");
        			//characterImage.css("transform", "scaleX(-1)");
        			//grid.css("transform", "scaleX(-1)");
        			characterImage.css("transform", "scaleX(-1)");
        			
        		};
        		
        		/*
       	      if (jump) {
       	          h -= v;
       	          t += 0.01;
       	          v -= t;
       	          if (h >= 0) {
       	            h = 0;
       	            jump = false;
       	            is_jump = 0;
       	          }
       	        }
        		*/
        		
        		let top_base = sin * 8;
        		
        		if(character_data.find("is_jump").text() == "1") {
        			//characterImage.css("transform", "scaleX(-1)");
        			
        			/*
        			if (h == 0) {
        				//v = V;
        				v = 16;
        				h -= v;
        			} else if (h > 0){
        				h -= v;
        				v -= hundrend_from_one_second;
        			} else {
        				h = 0;
        			}
        			*/
        			if (h == 0 && v < V) {
        				v = V;
        				h -= v;
        			} else if(h < 0) {
        				v -= hundrend_from_one_second;
        				h -= v;
        			} else {
        				h = 0;
        			}
        			
        			top_base += h;
        			
        			
        			
        			//console.log("h: " + h);
        			//console.log("v: " + v);
        			//console.log("hundrend_from_one_second: " + hundrend_from_one_second);
        			
        		};
        		
        		
        		
        		
        		
        		if (character_data.find("from_where").text() != character_data.find("tile_number").text()) {
        			//let grid1 = $(".grid" + character_data.find("from_where").text());
        			let grid2 = $(".grid" + character_data.find("tile_number").text());
        			let chat_text_here = character_data.find("chat_text").text();
        			
        			/*
            		//let grid = $(".grid" + character_data.find("tile_number").text());
                    //let grid = $(".grid" + character_data.find("from_where").text());
                    if (grid.css("background") == "none") {
                        //grid.css("background", "blue");
                        grid.css("background", "red");
                    }
                   	$('<img class="otherCharacter" src="" />').appendTo(grid)
                   		.attr("src", $("#characterBox>img").attr("src"))
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		.css("top", sin * 8 + "px");
                   	//let chat_text_here = character_data.find("chat_text").text();
    				if (chat_text_here != "null") {
                       	$('<p class="otherChat"></p>').appendTo(grid)
                   		.css("color", "white")
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		.css("top", sin * 8 + "px")
                   		.text(chat_text_here);                        		
                    }; 
                    
                    //let grid2 = $(".grid" + character_data.find("tile_number").text());
                    //let grid2 = $(".grid" + character_data.find("from_where").text());
                    if (grid2.css("background") == "none") {
                    	grid2.css("background", "blue");
                        //grid.css("background", "red");
                    }
                   	$('<img class="otherCharacter" src="" />').appendTo(grid2)
                   		.attr("src", $("#characterBox>img").attr("src"))
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		.css("top", sin * 8 + "px");
                   	//let chat_text_here = character_data.find("chat_text").text();
    				if (chat_text_here != "null") {
                       	$('<p class="otherChat"></p>').appendTo(grid2)
                   		.css("color", "white")
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		.css("top", sin * 8 + "px")
                   		.text(chat_text_here);                        		
                    };
                    */
                    
                    
                    //console.log(grid.position());
                    let position1 = grid.position();
                    let position2 = grid2.position();
                    //console.log(position1.left - position2.left);
                    //console.log(position1.top - position2.top);
                    
                    //let left_dif = position1.left - position2.left
                    //let top_dif = position1.top - position2.top
                    let left_dif = position2.left - position1.left
                    let top_dif = position2.top - position1.top
                    
                    
                   
                    //let grid3 = $(".grid" + character_data.find("tile_number").text());
                    //let grid3 = $(".grid" + character_data.find("from_where").text());
                    if (grid.css("background") == "none") {
                    	//grid3.css("background", "blue");
                    	grid.css("background", "yellow");
                        //grid.css("background", "red");
                    }
                   	//$('<img class="otherCharacter" src="" />').appendTo(grid)
                   	characterImage.appendTo(grid)
                   		//.attr("src", $("#characterBox>img").attr("src"))
                   		.css("position", "absolute")
                   		//.css("left", "0px")
                   		//.css("left", "10px")
                   		.css("left", left_dif * hundrend_from_one_second + "px")
                   		//.css("top", sin * 8 + "px");
                   		//.css("top", sin * 8 + top_dif * hundrend_from_one_second + "px");
                   		//.css("top", sin * 8 + top_dif * hundrend_from_one_second + h + "px");
                   		.css("top", top_base + top_dif * hundrend_from_one_second + "px");
                   	//let chat_text_here = character_data.find("chat_text").text();
    				if (chat_text_here != "null") {
                       	$('<p class="otherChat"></p>').appendTo(grid)
                   		.css("color", "white")
                   		.css("position", "absolute")
                   		//.css("left", "0px")
                   		//.css("top", sin * 8 + "px")
                   		.css("left", left_dif * hundrend_from_one_second + "px")
                   		//.css("top", sin * 8 + top_dif * hundrend_from_one_second + "px")
                   		//.css("top", sin * 8 + top_dif * hundrend_from_one_second + h + "px")
                   		.css("top", top_base + top_dif * hundrend_from_one_second + "px")
                   		.text(chat_text_here);                        		
                    }; 
        			
        		} else {
        			
                    //let grid = $(".grid" + character_data.find("from_where").text());
                    if (grid.css("background") == "none") {
                        grid.css("background", "blue");
                        //grid.css("background", "red");
                    }
                   	//$('<img class="otherCharacter" src="" />').appendTo(grid)
                   	characterImage.appendTo(grid)
                   		//.attr("src", $("#characterBox>img").attr("src"))
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		//.css("top", sin * 8 + "px");
                   		//.css("top", sin * 8 + h + "px");
                   		.css("top", top_base + "px");
                   	let chat_text_here = character_data.find("chat_text").text();
    				if (chat_text_here != "null") {
                       	$('<p class="otherChat"></p>').appendTo(grid)
                   		.css("color", "white")
                   		.css("position", "absolute")
                   		.css("left", "0px")
                   		//.css("top", sin * 8 + "px")
                   		//.css("top", sin * 8 + h + "px")
                   		.css("top", top_base + "px")
                   		.text(chat_text_here);                        		
                    };         			
        		}
        		
               
                
        	};
        });    	
    	
    	
    	if (hundrend_from_one_second >= 1.0) {
    		
    		
    		
    		
    		
    		
        	$.ajax({
                type: "post",
                url: "jk.controller.GameController",
                data: {
                    eventNumber: 0,
                    gridNumberHeavy: 0,
                    
                	member_id: member_id,
    	        	timestamp_latest: timestamp_latest,
    	        	timestamp_first: timestamp_first,
    	        	member_name: member_name,
    	        	model_number: model_number,
    	        	map_number: map_number,
    	        	tile_number: tile_number,
    	        	is_moving: is_moving,
    	        	from_where: from_where,
    	        	is_flip: is_flip,
    	        	is_chaton: is_chaton,
    	        	chat_text: chat_text,
    	        	is_jump: is_jump   
                    
                },
                async: false,
                success: function (resultData) {
                    console.log("s");
                    //console.log(resultData);
                    data = resultData;
                    
                    $(".otherCharacter").parent().css("background", "none");
                    $(".otherCharacter").remove();
                    $(".otherChat").remove();
                    
                    $(resultData).find("character").each(function () {
                    	let character_data = $(this);
                    	//if (member_id == $(this).find("member_id").text()) {
                    	if (member_id == character_data.find("member_id").text()) {
                    		console.log(member_id);
                    		
                    		
                            $.ajax({
                                type: "post",
                                url: "jk.controller.GameController",
                                data: {
                                    eventNumber: 2,
                                    
                                	member_id: member_id,
                    	        	timestamp_latest: timestamp_latest,
                    	        	timestamp_first: timestamp_first,
                    	        	member_name: member_name,
                    	        	model_number: model_number,
                    	        	map_number: map_number,
                    	        	tile_number: tile_number,
                    	        	is_moving: is_moving,
                    	        	//from_where: from_where,
                    	        	//from_where: 19,
                    	        	//from_where: tile_number,
                    	        	from_where: character_data.find("tile_number").text(),
                    	        	//from_where: parseInt(character_data.find("tile_number").text()),
                    	        	//from_where: $(this).find("tile_number").text(),
                    	        	is_flip: is_flip,
                    	        	is_chaton: is_chaton,
                    	        	chat_text: chat_text,
                    	        	is_jump: is_jump   
                                },
                                success: function (resultData) {
                                    console.log("s2");
                                },
                                error: function () {
                                    console.log("e2");
                                }
                            });                		
                    	} else {
                            let grid = $(".grid" + character_data.find("tile_number").text());
                            if (grid.css("background") == "none") {
                                grid.css("background", "blue");
                            }
                            
                           	$('<img class="otherCharacter" src="" />').appendTo(grid)
                           		//.attr("src", $("#characterBox>img").attr("src"))
                           		.css("position", "absolute")
                           		.css("left", "0px")
                           		.css("top", sin * 8 + "px");
                           	let chat_text_here = character_data.find("chat_text").text();
                           	
    						if (chat_text_here != "null") {
                               	$('<p class="otherChat"></p>').appendTo(grid)
                           		//.attr("src", $("#characterBox>img").attr("src"))
                           		.css("color", "white")
                           		.css("position", "absolute")
                           		.css("left", "0px")
                           		.css("top", sin * 8 + "px")
                           		.text(chat_text_here);                        		
                            }; 
                    	};
                    });
                },
                error: function () {
                    console.log("e");
                }
            });
			/*
            console.log(userId);
        	
            console.log("------------------");
            console.log("member_id: " + member_id);
            console.log("timestamp_latest: " + timestamp_latest);
            console.log("timestamp_first: " + timestamp_first);
            console.log("member_name: " + member_name);
            console.log("model_number: " + model_number);
            console.log("map_number: " + map_number);
            console.log("tile_number: " + tile_number);
            console.log("is_moving: " + is_moving);
            console.log("from_where: " + from_where);
            console.log("is_flip: " + is_flip);
            console.log("is_chaton: " + is_chaton);
            console.log("chat_text: " + chat_text);
            console.log("is_jump: " + is_jump);    		
    		*/
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		hundrend_from_one_second -= 1.0;
    	} else {
            //console.log(Math.floor(hundrend_from_one_second * 1000) % 20);
            //console.log(Math.floor(hundrend_from_one_second * 100));
            //console.log(Math.floor(hundrend_from_one_second * 100) % 20);
            //console.log(hundrend_from_one_second * 100);
            
            /*
            if (Math.floor(hundrend_from_one_second * 100) % 20 == 0) {
            	
            	
            	//console.log("image");
            	
            }
            */
    		
    		hundrend_from_one_second += 0.01;
    	}
        
        //console.log(hundrend_from_one_second);
    }, 10);
    
    setInterval(function() {
        //$(".otherCharacter").attr("src", $("#characterBox>img").attr("src"));
    }, 200);
  });
</script>


</html>

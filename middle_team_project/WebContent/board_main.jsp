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
	min-width:350px;
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

#boardNum, #boardHit, #boardGood {
	width: 8%;
}

#boardEtc {
	width: 15%;
}

#boardDate {
	width: 20%;
}

#boardWriter {
	width: 15%;
}

#boardtable {
	text-align: center;
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
		String username = (String) session.getAttribute("username");
		String userId = (String) session.getAttribute("userId");
		String topRecord = request.getParameter("topRecord");
	%>
	<header class="d-flex flex-column">
		<form action="${pageContext.request.contextPath}/home" method="post">
			<button id="home"
				class="d-flex flex-column justify-content-center align-items-center">
				<h1 id="title" class="display-1 fw-bold">웹게임천국</h1>
			</button>
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
							href="${pageContext.request.contextPath}/game_avoidBall">공피하기게임</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game_puzzle">퍼즐</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/game_rsp">가위바위보</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath }/jk/game.do">아바타 채팅</a></li>
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

	<main id="board">

		<div class="container">

			<h2 class="my-3 text-center">자유 게시판</h2>
			<div class="card shadow">
				<div class="card-header ">
					<h5 class="text-primary">DataTables Example</h5>
				</div>
				<div class="card-body p-3">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="boardtable">

							<thead>
								<tr class="text-center">
									<th id="boardNum">번호</th>
									<th id="boardTitle">제목</th>
									<th id="boardWriter">작성자</th>
									<th id="boardDate">날짜</th>
									<th id="boardHit">조회수</th>
									<th id="boardGood">좋아요</th>
									<th id="boardEtc">비고</th>
								</tr>
							</thead>
							<%
								int boardNum = 1;
							%>
							<c:forEach var="board" items="${boardList }">
								<tr>
									<td><%=boardNum%></td>
									<td><a href="board_view?bid=${board.bid}">${board.bTitle}</a></td>
									<td>${board.bWriter}</td>
									<td>${board.bDate}</td>
									<td>${board.bHit}</td>
									<td>${board.bGood}</td>
									<td class="m-0 d-flex flex-row justify-content-center"><c:if
											test="${userId != null && userId == board.bWriterId}">
											<form
												action="${pageContext.request.contextPath }/board_modifyView"
												method="post">
												<input type="hidden" name="modifyBid" value="${board.bid}">
												<input type="hidden" name="modifyBtitle"
													value="${board.bTitle}"> <input type="hidden"
													name="modifyBcontent" value="${board.bContent}">
												<button type="submit" class="btn btn-warning p-0" id="mdBtn">수정</button>
											</form>
											<form
												action="${pageContext.request.contextPath }/board_delete"
												method="post">
												<input type="hidden" name="deleteBid" value="${board.bid}">
												<button type="submit" class="btn btn-secondary p-0"
													id="dlBtn">삭제</button>
											</form>
										</c:if></td>
								</tr>
								<%
									boardNum++;
								%>
							</c:forEach>

							<tbody>

							</tbody>

						</table>
					</div>
					<div id="board_page"
						class="container my-3 d-flex flex-row justify-content-center text-center">
					</div>
					<div class="card-footer d-flex justify-content-center  ">
						<c:if test="${userId != null}">
							<a class="btn btn-primary" id="writeBoardBtn"
								href="${pageContext.request.contextPath }/board_WriteForm">글
								작성</a>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</main>

	<div id="gomodal"></div>
	<div id="modal" class="modal-overlay">


		<div
			class="card card-border d-flex flex-column justify-content-center align-items-center"
			id="modalcontent" style="max-height: 600px;">
			<div class="card-header w-100">
				<h2>Sign</h2>
			</div>
			<div id="card-body" class="card-body p-3 w-100 d-flex flex-row">
				<form action="${pageContext.request.contextPath}/check_member"
					method="post" onsubmit="return Checklogin()">

					<input id="loginID" class=" mx-auto p-3" type="text" name="loginID"
						value="" style="border-radius: 5px;" placeholder="userId"><br>

					<input id="loginPW" class=" mx-auto p-3" type="password"
						name="loginPW" value="" style="border-radius: 5px;"
						placeholder="Password">
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
    	console.log(loginCheck);
    if(loginCheck==false){
    	
    	alert("로그인 정보가 틀렸습니다.");
    	loginCheck = "";
    }
    if(loginCheck==true){
    	alert("환영합니다!");
    	loginCheck = "";
    	}
    	
<%--     const $wbBtn = document.getElementById('writeBoardBtn');
    	
    <% if(userId != null) { %>
    $wbBtn.style.display="block";
<% } %> --%>
 
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
  </script>

</body>

</html>
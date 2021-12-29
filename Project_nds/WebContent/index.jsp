<%@page import="com.snsDAO.snsDAO"%>
<%@page import="com.memberDAO.memberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.snsDTO.snsDTO"%>
<%@page import="com.memberDTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>title</title>
<style>
#outer {
	display: flex;
	justify-content: center;
	align-items: center;
}

#user_feed {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	margin-bottom: 10px;
}

textarea {
	width: 96%;
	height: 100px;
	margin: 5px 0.5%;
	padding: 3px 1%;
	border: 1px solid pink;
}

.heart_btn {
	margin-left: 250px;
	cursor: pointer;
}

.user_name {
	display: flex;
	justify-content: center;
	align-items: center;
}

.user_juno {
	border: 1;
}

.comment-detail {
	
}

.user_feedbox {
	margin-top: 3px;
	margin-bottom: 3px;
	outline: 2px solid rgb(228, 90, 178);
	border-radius: 10px;
	border-color: pink;
}

article>div {
	position: relative;
	width: 500px;
	height: auto;
}

body {
	background-color: pink;
}

#actor_comment {
	border: 3px solid skyblue;
	border-radius: 10px;
	border-block-style: inherit;
	resize: none;
}

#reg_btn {
	background-color: skyblue;
	border: none;
	color: #ffffff;
	cursor: pointer;
	font-family: 'BenchNine', Arial, sans-serif;
	line-height: 1em;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
	padding: 4px 12px;
	font-size: 12px;
	margin-left: 88%;
	margin-bottom: 10px;
}

.contents {
	outline: 1px solid rgb(228, 90, 178);
	border-radius: 100px;
}
</style>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">


</head>
<%
HttpSession se = request.getSession();
memberDTO dto = (memberDTO) se.getAttribute("dto");
snsDAO dao = new snsDAO();

%>
<%
ArrayList<snsDTO> post_info = (ArrayList<snsDTO>) request.getAttribute("post_info");
String mbid = "";
String hash = "";
int cnt = 0;
int like_count = 0;
String comment = "";
String j_id = "";
int span_id = 10001;
int k = 0;

for (int i = 0; i < post_info.size(); i++) {
	hash = post_info.get(i).getHash_tag();
	mbid = post_info.get(i).getMb_id();
	comment = post_info.get(i).getSns_content();
	like_count = post_info.get(i).getSns_likes();
}
%>

<body>
	<script type="text/javascript" src=js/jquery-3.6.0.min.js></script>
	<script>
    let like_boolean = 0;
    let sc = false;
  </script>
	<section id="container">
		<header id="header">
			<section class="inner">

				<h1 class="logo">
					<a href="SnsService">
						<div class="sprite_insta_icon"></div>
						<div class="sprite_write_logo"></div>
					</a>
				</h1>
				<div class="search_box">
					<input type="text" placeholder="검색" id="search-field">
					<div class="fake_field">
						<span class="sprite_small_search_icon"></span> <span>검색</span>
					</div>
				</div>
				<div>
					<input type="submit" onClick="search_post()">
				</div>
				<div class="right_icons">
					<a href="new_post.html">
						<div class="sprite_camera_icon"></div>
					</a> <a href="login.html">
						<div class="sprite_compass_icon"></div>
					</a> <a href="follow.html">
						<div class="sprite_heart_icon_outline"></div>
					</a> <a href="profile.html">
						<div class="sprite_user_icon_outline"></div>
					</a>
				</div>


			</section>
		</header>
		<section id="main_container">
			<div id="inner">
				<div class="contents_box">
					<article class="contents">
						<header class="top">
							<div class="user_container">
								<div class="profile_img">
									<img src="imgs/thumb.jpeg" alt="프로필이미지">
								</div>
								<div class="user_name">
									<div class="nick_name m_text" id="actor_id"><%=dto.getId() %></div>
								</div>
							</div>
						</header>

						<textarea id="actor_comment" placeholder="지금 무슨생각을 하고 계신가요?"> </textarea>
						<div>
							<button type="submit" id=reg_btn onClick="sum()">등록</button>
						</div>
						<form id = "for_moon">
						<%
							while (k < 10) { %>
							<script type="text/javascript">
							console.log(sc);
							</script>
							<%
							hash = post_info.get(cnt).getHash_tag();
							mbid = post_info.get(cnt).getMb_id();
							comment = post_info.get(cnt).getSns_content();
							like_count = post_info.get(cnt).getSns_likes();
							j_id = post_info.get(cnt).getSns_seq();
							span_id = span_id + 1;
							k++;
						%>
						</form>
						<div class="user_feedbox">
							<div class="top">
								<div class="user_container">
									<div class="profile_img">
										<img src="imgs/thumb.jpeg" alt="프로필이미지">
									</div>
									<div class="user_name">
										<div class="nick_name m_text" id="outer"><%=mbid%></div>
									</div>
								</div>
								<div class="heart_btn" id="outer">
									<div class="sprite_heart_icon_outline" id=<%=j_id%> name="39"
										data-name="heartbeat"
										onClick="like_click(<%=like_count%>,this.id)"></div>
								</div>
								<div>
									<span class="<%=j_id%>"><%=like_count%></span>
								</div>
							</div>
							<div id="user_feed"><%=comment%></div>
							<div class="comment_container">
								<div class="comment" id="comment-list-ajax-post37">
									<div class="comment-detail">
										<div class="nick_name m_text">박경섭</div>
										<div class="user_juno">강아지가 너무 귀여워요~!</div>
									</div>
								</div>
							</div>
						</div>
						<%
							cnt = cnt + 1;
						%>
						<%
							}
						%>
					
				</div>
				</article>
			</div>
			</div>
		</section>
	</section>
	<h1></h1>



	<script type="text/javascript">
    function like_click(yn,click_id){
    	console.log(yn)
      if(yn == document.getElementsByClassName(click_id)[0].innerText) {
        document.getElementById(click_id).style.background = "url('imgs/background01.png')";
        document.getElementById(click_id).style.backgroundPositionX = "-26px";
        document.getElementById(click_id).style.backgroundPositionY = "-261px";
        /* document.getElementById("1").className = "sprite_heart_icon_click" */
        document.getElementsByClassName(click_id)[0].innerText= parseInt(document.getElementsByClassName(click_id)[0].innerText) +1 ;        
      } else if (yn != document.getElementsByClassName(click_id)[0].innerText) {
        document.getElementById(click_id).style.background = "url('imgs/background01.png')";
        document.getElementById(click_id).style.backgroundPositionX = "-52px";
        document.getElementById(click_id).style.backgroundPositionY = "-261px";
        /* document.getElementById("1").className = "sprite_heart_icon_outline" */
        document.getElementsByClassName(click_id)[0].innerText= parseInt(document.getElementsByClassName(click_id)[0].innerText)  - 1 ;        
      }
    }
   </script>
	<script type="text/javascript">
	var mb_id = document.getElementById("actor_id").innerHTML;
   	function sum(){
   			   $.ajax({
		   url : "actor_comment.do",
		   type : "get",
		   data :{
			   "comment" : $('#actor_comment').val(),
			   "mbid"	: mb_id
		   },
		   success : function(res) {
			   console.log(res);
			   location.reload();
		   },
		   error : function(){
				alert("요청실패");
			}
	   });
	   
   }
   
   </script>

	<script>
	var cnt = <%=cnt%>
	console.log(cnt);
	

	let loadData = function(){
		$.ajax({
		url : 'SnsService2',
		dataType : 'json',
		success : function(data){
			console.log(data);
					  var mb_id = data[cnt]["mb_id"];
					  var j_id = data[cnt]["sns_seq"];
					  var like_count = data[cnt]["sns_likes"];
					  var comment = data[cnt]["sns_content"]
				  	  console.log(cnt);
				      // 브라우저 표시 높이 + 스크롤 Y이동량이 실제 높이보다 크면 함수 작동
				      if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight && sc == false) {
				        setTimeout(function () { 
				        	
				        	// ========  태그 생성 ======================
				          var addComment = document.createElement("div");
				          addComment.classList.add("user_feedbox")
				          addComment.innerHTML = `<div class="top">
								<div class="user_container">
								<div class="profile_img">
									<img src="imgs/thumb.jpeg" alt="프로필이미지">
								</div>
								<div class="user_name">
									<div class="nick_name m_text" id="outer">` + mb_id +`</div>
								</div>
							</div>
							<div class="heart_btn" id="outer">
								<div class="sprite_heart_icon_outline" id=` + j_id + ` name="39"
									data-name="heartbeat"
									onClick="like_click(`+ like_count + `,this.id)"></div>
							</div>
							<div>
								<span class="` + j_id + `">` + like_count + `</span>
							</div>
						</div>
						<div id="user_feed">` + comment +`</div>
						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
									<div class="nick_name m_text">박경섭</div>
									<div class="user_juno">강아지가 너무 귀여워요~!</div>
								</div>
							</div>
						</div>`;
						// ========  태그 생성 ======================
				            
				            
				          document.querySelector('article').appendChild(addComment);
				          console.log(document.querySelector('article'));
				          
				        }, 300)
				        
				      }
				      // db result set = null commnet = " 페이지의 끝입니다 "
				    
				  cnt++;
		},
		error : function(){
			alert('실패');
		}
		
	});
	}
	
    window.onscroll = function(){
    	 if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight && sc == false) {
    		 
    		 loadData();
    		
    	 }
    }
    
  </script>
	<script type="text/javascript">
  	function search_post(){
			
			$.ajax({
				url: "search_post.do",
				type: "get",
				data : {
					"search_post" : $('#search-field').val()
				},
				dataType:"json",
				success : function(res) {
					console.log(res);
					console.log(res[0]["mb_id"]);
					console.log(res.length)
					$('.user_feedbox').html('');
					$('#for_moon').html('');
					let div = "";
					for ( let i = 0; i < res.length; i++){
						div = `<div class="top">
							<div class="user_container">
							<div class="profile_img">
								<img src="imgs/thumb.jpeg" alt="프로필이미지">
							</div>
							<div class="user_name">
								<div class="nick_name m_text" id="outer">`+res[i].mb_id+`</div>
							</div>
						</div>
						<div class="heart_btn" id="outer">
							<div class="sprite_heart_icon_outline" id="`+res[i].sns_seq+`"name="39"
								data-name="heartbeat"
								onClick="like_click(`+res[i].sns_likes+`,this.id)"></div>
						</div>
						<div>
							<span class="`+res[i].sns_seq+`">`+res[i].sns_likes+`</span>
						</div>
					</div>
					<div id="user_feed">`+res[i].sns_content+`</div>
					<div class="comment_container">
						<div class="comment" id="comment-list-ajax-post37">
							<div class="comment-detail">
								<div class="nick_name m_text">박경섭</div>
								<div class="user_juno">강아지가 너무 귀여워요~!</div>
							</div>
						</div>
					</div>`;
					}
				$('.user_feedbox').append(div);
				<%k = 10; %>
				let k = <%=k%>;
				console.log(<%=k%>);
				},
				error : function(){
					alert("요청 실패!");
				}
			});
		}
  
  </script>
</body>
</html>
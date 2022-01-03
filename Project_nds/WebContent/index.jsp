<%@page import="java.util.Arrays"%>
<%@page import="com.snsDAO.snsDAO"%>
<%@page import="com.memberDAO.memberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.snsDTO.snsDTO"%>
<%@page import="com.memberDTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd";>
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
   font-size: 12px;
   font: -webkit-mini-control;
   
}

textarea {
   outline: none;
   width: 97.8%;
   height: 6.25em;
   border: ridge;
   margin-top: 2px;
}

.heart_btn {
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
   outline: 2px solid #fafafa;
   border-radius: 10px;
   border-color: #fafafa;
}

article>div {
   position: relative;
   width: 500px;
   height: auto;
}

body {
   background-color: #fafafa;
}

#actor_comment {
   resize: none;
}

#reg_btn {
   background-color: #fafafa;
   border: revert;
   color: #262626;
   cursor: pointer;
   font-family: 'BenchNine', Arial, sans-serif;
   line-height: 1rem;
   outline: none;
   text-transform: uppercase;
   font-weight: 600;
   padding: 4px 14px;
   font-size: 12px;
   margin-left: 220px;
   margin-top: 10px;
   margin-bottom: 10px;
   border-radius: 15px
}

.contents {
   outline: 1px solid #fafafa;
   border-radius: 100px;
}

#259{
   position: relative;
   left:20px
}


</style>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">


<script type="text/javascript" src=js/jquery-3.6.0.min.js></script>

</head>
<%
HttpSession se = request.getSession();
memberDTO dto = (memberDTO) se.getAttribute("dto");
snsDAO dao = new snsDAO();
se.setAttribute("dto", dto);
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
if (post_info.size() > 10){
   k = 10;
} else {
   k = post_info.size();
}
String mb_likes = dto.getSns_likes();
String[] mb_seq = mb_likes.split(",");
String a = dto.getId();
String c = dto.getPart();
String d = dto.getPw();
String e = dto.getTel();
String f = dto.getSys();
String g = dto.getAd();
%>

<body id="show">
<script>
    function search_post(){
    	 console.log("test");
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
               $('.contents_box').html('');
               let div = "";
               for ( let i = 0; i < res.length; i++){
                  div += `<article class="contents">
    					<div class="top" style="width: 487px; height: 30px;">
						<div class="user_container">
							<div class="profile_img">
								<img src="imgs/thumb.jpeg" alt="프로필이미지">
							</div>
							<div class="user_name">
								<div class="nick_name m_text" id="actor_id" >`+res[i].mb_id+`</div>
							</div>
						</div>
					</div>
					<div class="middle" style="width: 457px;">
						<img src="Upload/`+res[i].hash_tag+`" width="500" height="250">
					</div>
					<section>
					<div class="like_top">
						<div class="sprite_heart_icon_outline" id=`+res[i].sns_seq+` name="39"
							data-name="heartbeat"
							onClick="like_click(`+res[i].sns_likes+`,this.id); love(this.id); ">
							<span class="`+res[i].sns_seq+`" style="float: left; padding-left: 30px">`+res[i].sns_likes+`</span>
						</div>
					</div>
					</section> <section>
					<div class="comment_container" style="padding-right: 10px; padding-left: 0px; padding-right: 0px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
						<div id="user_feed" style="line-height: 22px; letter-spacing: 1px; display: block; float: left; width: 407px; height: 200px; padding-bottom: 35px;">`+res[i].sns_content+`</div>
						<div class="comment" id="comment-list-ajax-post37">
						<div class="comment-detail">
						<div class="heart_btn" id="outer">
						</div>
						<br>
						<div class="nick_name m_text"></div>
						<div class="user_juno">
							<input type="text" id="b`+res[i].sns_seq+`" class="`+res[i].sns_seq+`">
							<button type=submit onclick="sendCmCt(`+res[i].sns_seq+`)">작성</button>
							<button type=submit onclick="loadCmct(`+res[i].sns_seq+`)">댓글보기</button>
							<br>
							<p class="a`+res[i].sns_seq+`"></p>
						</div>`;
               }
            $('.contents_box').append(div);
            sc=true;
            },
            error : function(){
               alert("요청 실패!");
            }
         });
      }
     
  
  </script> 
	<!-- <script type="text/javascript" src=js/jquery-3.6.0.min.js></script> -->
	<script>
    let like_boolean = 0;
    let sc = false;
  </script>
	<section id="container"> 
	<header id="header"> 
	<section class="inner" style="width : 550px">

	<h1 class="logo">
		<a href="SnsService">
			<div class="sprite_insta_icon"></div>
			<div class="sprite_write_logo"></div>
		</a>
	</h1>
	<div class="search_box">
		<input type="text" placeholder="검색" id="search-field">
		 <input	type="submit" onClick="search_post()">
		<div class="fake_field">
			<span class="sprite_small_search_icon"></span> <span>검색</span>
		</div>
	</div>
	<div></div>
	<div class="right_icons" style="width: 10px">
		<a href="Start.jsp" class="cicon"><div class="sprite_home_icon"></div></a>
		<a href="mb_part1Cn.jsp" class="cicon"><div class="sprite_phone_icon"></div></a>
		<a href="survey_connect.jsp" class="cicon"><div class="sprite_heart_icon_outline"></div></a> 
		<a href="KaKaoMap2.jsp" class="cicon"><div class="sprite_map_icon"></div></a> 
		<a href="newpost.jsp" class="cicon"><div class="sprite_user_icon_outline" onClick=""></div></a>
	</div>
	</section> 
	</header> 
	<section id="main_container">
	<div id="inner">
		<div class="contents_box">
			<article class="contents">
			<form id="for_moon">
				<%
                              for (int i = 0; i < 3; i++) { 
                                    hash = post_info.get(cnt).getHash_tag();
                                    mbid = post_info.get(cnt).getMb_id();
                                    comment = post_info.get(cnt).getSns_content();
                                    like_count = post_info.get(cnt).getSns_likes();
                                    j_id = post_info.get(cnt).getSns_seq();
                                    span_id = span_id + 1;
                              
                     %>
			</form>
			<div id="inner">
				<div class="contents_box">
					<article class="contents">
					<div class="top" style="width: 487px; height: 30px;">
						<div class="user_container">
							<div class="profile_img">
								<img src="imgs/thumb.jpeg" alt="프로필이미지">
							</div>
							<div class="user_name">
								<div class="nick_name m_text" id="actor_id"><%=mbid%></div>
							</div>
						</div>
					</div>
					<div class="middle" style="width: 457px;">
						<img src="Upload/<%=hash%>" width="500" height="250">
					</div>
					<section>
					<div class="like_top">
						<div class="sprite_heart_icon_outline" id=<%=j_id%> name="39" data-name="heartbeat" onClick="like_click(<%=like_count%>,this.id); love(this.id);">
							<span class="<%=j_id%>" style="float: left; padding-left: 30px"><%=like_count%></span>
						</div>
					</div>
					</section> <section>
					<div class="comment_container"  style="padding-right: 10px; padding-left: 0px; padding-right: 0px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
						<div id="user_feed" style="line-height: 22px; letter-spacing: 1px; display: block; float: left; width: 407px; height: 200px; padding-bottom: 35px;"><%=comment%></div>
						<div class="nick_name m_text" id="cm_mb_id" style="padding-bottom: 80px; width: 100px; height: 150px;"><%=dto.getId()%></div>
						<div class="comment-detail">
								<div class="heart_btn" id="outer">
									<%
                                       if (Arrays.asList(mb_seq).contains(j_id) == true) {
                                       System.out.println(Arrays.asList(mb_seq).contains(j_id));
                                    %>

									<%
                                       } else {
                                    %>

									<%
                                       }
                                    %>


								</div>


								<br>
								<div class="nick_name m_text" id="cm_mb_id"></div>
								<div class="user_juno">
									<input type="text" id="b<%=j_id%>" class="<%=j_id%>">
									<button type=submit onclick="sendCmCt(<%=j_id%>)">작성</button>
									<button type=submit onclick="loadCmct(<%=j_id%>)">댓글보기</button>
									<br>
									<p class="a<%=j_id%>"></p>
								</div>
							</div>
						<div class="comment" id="comment-list-ajax-post37">
							
						</div>
					</div>
					</section>
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

	<script>
   var cnt = <%=cnt%>;
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
                 var comment = data[cnt]["sns_content"];
                 var image = data[cnt]["hash_tag"];
                   console.log(cnt);
                  // 브라우저 표시 높이 + 스크롤 Y이동량이 실제 높이보다 크면 함수 작동
                  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight && sc == false) {
                    setTimeout(function () { 
                       // ========  태그 생성 ======================
                      var addComment = document.createElement("div");
                      addComment.classList.add("contents_box")
                      addComment.innerHTML = `<article class="contents">
      					<div class="top" style="width: 487px; height: 30px;">
  						<div class="user_container">
  							<div class="profile_img">
  								<img src="imgs/thumb.jpeg" alt="프로필이미지">
  							</div>
  							<div class="user_name">
  								<div class="nick_name m_text" id="actor_id" >`+mb_id+`</div>
  							</div>
  						</div>
  					</div>
  					<div class="middle" style="width: 457px;">
  						<img src="Upload/`+image+`" width="500" height="250">
  					</div>
  					<section>
  					<div class="like_top">
  						<div class="sprite_heart_icon_outline" id=`+j_id+` name="39"
  							data-name="heartbeat"
  							onClick="like_click(`+like_count+`,this.id); love(this.id); ">
  							<span class="`+j_id+`" style="float: left; padding-left: 30px">`+like_count+`</span>
  						</div>
  					</div>
  					</section> <section>
  					<div class="comment_container" style="padding-right: 10px; padding-left: 0px; padding-right: 0px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
  						<div id="user_feed" style="line-height: 22px; letter-spacing: 1px; display: block; float: left; width: 407px; height: 200px; padding-bottom: 35px;">`+comment+`</div>
  						<div class="comment" id="comment-list-ajax-post37">
  						<div class="comment-detail">
						<div class="heart_btn" id="outer">
						</div>
						<br>
						<div class="nick_name m_text"></div>
						<div class="user_juno">
							<input type="text" id="b`+j_id+`" class="`+j_id+`">
							<button type=submit onclick="sendCmCt(`+j_id+`)">작성</button>
							<button type=submit onclick="loadCmct(`+j_id+`)">댓글보기</button>
							<br>
							<p class="a`+j_id+`"></p>
						</div>
  								`;
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
   
   </script> <script>
   
/*    window.onscroll = function(){
    	consle.log("작동함");
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        
           loadData();
          
        }
    }  */
    
  

   window.onscroll = function(){
/*     	var limit = Math.max( document.body.scrollHeight, document.body.offsetHeight, 
                document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight );
     */
		console.log((window.innerHeight + window.scrollY));
		console.log(document.body.offsetHeight);
	   //if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	   if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		   loadData();
	     
	   }
	} 
   
/*    document.body.addEventListener('scroll',function(){
   	console.log("test");
		/if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			
	           loadData();
	          
	        } 
	}); */
    function like_click(yn,click_id){
       console.log(yn)
      if(yn == document.getElementsByClassName(click_id)[0].innerText) {
/*         document.getElementById(click_id).style.background = "url('imgs/background01.png')";
        document.getElementById(click_id).style.backgroundPositionX = "-26px";
        document.getElementById(click_id).style.backgroundPositionY = "-261px"; */
        document.getElementById(click_id).className = "sprite_heart_icon_click"
        document.getElementsByClassName(click_id)[0].innerText= parseInt(document.getElementsByClassName(click_id)[0].innerText) +1;
      } else if (yn != document.getElementsByClassName(click_id)[0].innerText) {
/*         document.getElementById(click_id).style.background = "url('imgs/background01.png')";
        document.getElementById(click_id).style.backgroundPositionX = "-52px";
        document.getElementById(click_id).style.backgroundPositionY = "-261px"; */
        document.getElementById(click_id).className = "sprite_heart_icon_outline"
        document.getElementsByClassName(click_id)[0].innerText= parseInt(document.getElementsByClassName(click_id)[0].innerText)  - 1 ;        
      }
    }
    function love(click_id){
       let love_cnt = parseInt(document.getElementsByClassName(click_id)[0].innerText);
       let mb = document.getElementById("actor_id").innerHTML;
        $.ajax({
         url: "love.do",
         type: "get",
         data : {
            "love_cnt" : love_cnt,
            "sns_seq" : click_id,
            "mb" : mb
         },
         success : function(res){
            console.log(res)
         },
         error : function() {
            alert("요청실패")
         }
        });
     }
    

   
   </script> <script type="text/javascript">
   function sendCmCt(seq) {
      let mbid = "<%=dto.getId()%>";
      let jid = seq.toString();
      $.ajax({
         url : "comment.do",
         type : "get",
         data: {
            "mb_id" : mbid,
            "cm_ct" : $('#b'+seq).val(),
            "cm_snsseq" : seq
         },
         success : function(cm_ct) {
            
            if(mbid != null){
               $('.a'+jid).after(cm_ct+"<br>");
               console.log("성공");
            }
            else{
               $('.a'+jid).html("작성 실패");
            }
         },
         error : function () {
             alert("요청실패!");
         }
         
      });
   }
   </script> <script type="text/javascript">
   function loadCmct(seq) {
      console.log(seq)
      $.ajax({
         url : "loadcomment.do",
         type : "get",
         dataType : "json",
         data: {
            "lcm_sns_seq" : seq,
         },
         success : function(res) {
            
            if(res != null){
               for (let i = 0; i < res.length; i++) {
                  $('.a'+seq).append(res[i].lmb_id +" : "+res[i].lcm_ct+"<br>");
               }
            }
            else{
               $('.a'+seq).html("작성된 댓글이 없습니다");
            }
         },
         error : function () {
             alert("요청실패!");
         }
         
      });
   }
   
   function loadCmct(seq) {
       let mbid =document.getElementById("cm_mb_id").innerHTML;
      console.log(seq)
      $.ajax({
         url : "loadcomment.do",
         type : "get",
         dataType : "json",
         data: {
            "lcm_sns_seq" : seq,
         },
         success : function(res) {
            console.log(res);
              $('.a'+seq).html('');
            if(res != null){
               for (let i = 0; i < res.length; i++) {
                  if(res[i].lmb_id == mbid){
                  $('.a'+seq).append(res[i].lmb_id +" : "+res[i].lcm_ct + "<a href='DeleteCmCon.do?delete_CmCt_seq="+res[i].cm_sns_seq+"'>삭제 </a><br>");
                  }else{
                     $('.a'+seq).append(res[i].lmb_id +" : "+res[i].lcm_ct+"<br>");
                  }
                  
                  }
            }
            else{
               $('.a'+seq).html("작성된 댓글이 없습니다");
            }
         },
         error : function () {
             alert("요청실패!");
         }
         
      });
   }
   
   
   </script>
</body>
</html>
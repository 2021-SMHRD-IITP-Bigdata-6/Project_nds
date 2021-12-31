<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <title>Easy Fullscreen HTML5 Background Video</title>
  <meta name="keywords" content="css3, html5, js, background video, fullscreen video">
  <meta name="description" content="Super easy to implement HTML5 fullscreen background video library in JavaScript.">
  		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
  <style>
    * {
      margin: 0; padding: 0;
    }

    html, body {
      width: 100%;
      height: 100%;
      overflow: hidden;
    }

    #container {
      overflow: hidden;
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
    }

    #background_video {
      position: absolute;

      top: 50%; left: 50%;
      transform: translate(-50%, -50%);

      object-fit: cover;
      height: 100%; width: 100%;
    }

    #video_cover {
      position: absolute;

      width: 100%; height: 100%;

      background: url('video_cover.jpeg') no-repeat;
      background-size: cover;
      background-position: center;
    }

    #video_controls {
      position: absolute;
      left: 50%;
      transform: translate(-50%, 0);
    }

    #play img {
      width: 100px;
    }
    #pause img {
      width: 90px;
    }
    #pause {
      display: none;
    }

    @media (min-width: 768px) {
      #video_controls {
        display: none;
      }
    }

    /* Demo page specific styles */

    body {
      text-align: center;
      font-family: 'proxima-nova', Helvetica;
    }

    #container {
      height: 100%;
    }

    #overlay {
      position: absolute;
      top: 0; right: 0; left: 0; bottom: 0;
      background: rgba(0,0,0,0.5);
    }

    #main_content {
      z-index: 2;
      position: relative;
      display: inline-block;

      /* Vertical center */
      top: 50%;
      transform: translateY(-50%);
    }

    #main_content h1 {
      text-transform: uppercase;
      font-weight: 600;
      font-family: 'proxima-nova-condensed', Helvetica;
      color: #fff;
      font-size: 35px;
    }

    #main_content .sub_head {
      color: rgba(255,255,255,0.5);
      font-size: 18px;
    }

    #main_content .info {
      color: rgba(255,255,255,0.5);
      font-size: 12px;
      margin-top: 10px;
    }

    #links {
      margin-top: 50px;
    }

    #links input {
      border: 2px solid rgba(255,255,255,0.20);
      border-radius: 61px;
      font-size: 12px;
      color: white;
      letter-spacing: 1px;
      text-decoration: none;
      text-transform: uppercase;
      padding: 10px 25px;
      display: inline-block;
      margin-right: 15px;
      cursor: pointer;
      background-color:transparent;
    }
    
    #links > .submit_btn {
      margin-left: 20px;
    }

    .submit_btn {
      border: 2px solid rgba(255,255,255,0.20);
      border-radius: 61px;
      font-size: 12px;
      color: white;
      letter-spacing: 1px;
      text-decoration: none;
      text-transform: uppercase;
      padding: 10px 25px;
      display: inline-block;
      margin-right: 15px;
      cursor: pointer;
      background-color:transparent;
      margin-top: 20px;
    }
    
    #footer {
      position: absolute;
      bottom: 0; left: 0; right: 0;
    }
    #footer a {
      color: rgba(255,255,255,0.5);
      text-decoration: none;
      margin: 10px;
      font-size: 12px;
    }
    #footer a:first-child {
      float: left;
    }
    #footer a:last-child {
      float: right;
    }

    .show-modal {
         opacity: 1;
         visibility: visible;
         transform: scale(1.0);
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
     }
    form {
      background-color: gray;
      width: 250px;
      height: 250px;
    }


  </style>
  <style>
      /* ------------------------------------ Click on login and Sign Up to  changue and view the effect
---------------------------------------
*/

      * {
         margin: 0px auto;
         padding: 0px;
         text-align: center;
         font-family: 'Open Sans', sans-serif;
      }

      .cotn_principal {
         position: absolute;
         width: 100%;
         height: 100%;
         /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#cfd8dc+0,607d8b+100,b0bec5+100 */
         background: #cfd8dc;
         /* Old browsers */
         background: -moz-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
         /* FF3.6-15 */
         background: -webkit-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
         /* Chrome10-25,Safari5.1-6 */
         background: linear-gradient(135deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
         /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
         filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#cfd8dc', endColorstr='#b0bec5', GradientType=1);
         /* IE6-9 fallback on horizontal gradient */

      }


      .cont_centrar {
         position: relative;
         float: left;
         width: 100%;
      }

      .cont_login {
         position: relative;
         width: 640px;
         left: 50%;
         margin-left: -320px;

      }

      .cont_back_info {
         position: relative;
         float: left;
         width: 640px;
         height: 280px;
         overflow: hidden;
         background-color: #fff;
         margin-top: -250px;
         box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
      }

      .cont_forms {
         position: absolute;
         overflow: hidden;
         top: -250px;
         left: 0px;
         width: 320px;
         height: 280px;
         background-color: transparent;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
      }

      .cont_forms_active_login {
         box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
         height: 420px;
         top: -300px;
         left: 0px;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
         background-color: black; /* 그라데이션 지원하지 않는 브라우저 */
      }

      .cont_forms_active_sign_up {
         box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
         height: 600px;
         top: -300px;
         left: 320px;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
         background-color: black;
      }

      .cont_img_back_grey {
         position: absolute;
         width: 950px;
         top: -80px;
         left: -116px;
      }

      .cont_img_back_grey>img {
         width: 100%;
         -webkit-filter: grayscale(100%);
         filter: grayscale(100%);
         opacity: 0.2;
         animation-name: animar_fondo;
         animation-duration: 20s;
         animation-timing-function: linear;
         animation-iteration-count: infinite;
         animation-direction: alternate;

      }

      .cont_img_back_ {
         position: absolute;
         width: 950px;
         top: -80px;
         left: -116px;
      }

      .cont_img_back_>img {
         width: 100%;
         opacity: 0.3;
         animation-name: animar_fondo;
         animation-duration: 20s;
         animation-timing-function: linear;
         animation-iteration-count: infinite;
         animation-direction: alternate;
      }

      .cont_forms_active_login>.cont_img_back_ {
         top: 0px;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
      }

      .cont_forms_active_sign_up>.cont_img_back_ {
         top: 0px;
         left: -435px;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
      }


      .cont_info_log_sign_up {
         position: absolute;
         width: 640px;
         height: 280px;
         top: -250px;
         z-index: 1;
      }

      .col_md_login {
         position: relative;
         float: left;
         width: 50%;
      }

      .col_md_login>h2 {
         font-weight: 400;
         margin-top: 70px;
         color: #757575;
      }

      .col_md_login>p {
         font-weight: 400;
         margin-top: 15px;
         width: 80%;
         color: #37474F;
      }

      .btn_login {
         background-color: #26C6DA;
         border: none;
         padding: 10px;
         width: 200px;
         border-radius: 3px;
         box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
         color: #fff;
         margin-top: 10px;
         cursor: pointer;
      }

      .col_md_sign_up {
         position: relative;
         float: left;
         width: 50%;
      }

      .cont_ba_opcitiy>h2 {
         font-weight: 400;
         color: #fff;
      }

      .cont_ba_opcitiy>p {
         font-weight: 400;
         margin-top: 15px;
         color: #fff;
      }

      /* ----------------------------------
background text    
------------------------------------
 */
      .cont_ba_opcitiy {
         position: relative;
         background-color: rgba(120, 144, 156, 0.55);
         width: 80%;
         border-radius: 3px;
         margin-top: 60px;
         padding: 15px 0px;
         opacity: 0.7;
      }

      .btn_sign_up {
         background-color: #ef5350;
         border: none;
         padding: 10px;
         width: 200px;
         border-radius: 3px;
         box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
         color: #fff;
         margin-top: 10px;
         cursor: pointer;
      }

      .cont_forms_active_sign_up {
         z-index: 2;
      }


      @-webkit-keyframes animar_fondo {
         from {
            -webkit-transform: scale(1) translate(0px);
            -moz-transform: scale(1) translate(0px);
            -ms-transform: scale(1) translate(0px);
            -o-transform: scale(1) translate(0px);
            transform: scale(1) translate(0px);
         }

         to {
            -webkit-transform: scale(1.5) translate(50px);
            -moz-transform: scale(1.5) translate(50px);
            -ms-transform: scale(1.5) translate(50px);
            -o-transform: scale(1.5) translate(50px);
            transform: scale(1.5) translate(50px);
         }
      }

      @-o-keyframes identifier {
         from {
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transform: scale(1);
         }

         to {
            -webkit-transform: scale(1.5);
            -moz-transform: scale(1.5);
            -ms-transform: scale(1.5);
            -o-transform: scale(1.5);
            transform: scale(1.5);
         }

      }

      @-moz-keyframes identifier {
         from {
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transform: scale(1);
         }

         to {
            -webkit-transform: scale(1.5);
            -moz-transform: scale(1.5);
            -ms-transform: scale(1.5);
            -o-transform: scale(1.5);
            transform: scale(1.5);
         }

      }

      @keyframes identifier {
         from {
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transform: scale(1);
         }

         to {
            -webkit-transform: scale(1.5);
            -moz-transform: scale(1.5);
            -ms-transform: scale(1.5);
            -o-transform: scale(1.5);
            transform: scale(1.5);
         }
      }

      .cont_form_login {
         position: absolute;
         opacity: 0;
         display: none;
         width: 320px;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
      }

      .cont_forms_active_login {
         z-index: 2;
      }

      .cont_forms_active_login>.cont_form_login {}

      .cont_form_sign_up {
         position: absolute;
         width: 320px;
         float: left;
         opacity: 0;
         display: none;
         -webkit-transition: all 0.5s;
         -moz-transition: all 0.5s;
         -ms-transition: all 0.5s;
         -o-transition: all 0.5s;
         transition: all 0.5s;
      }


      .cont_form_sign_up>input {
         text-align: left;
         padding: 15px 5px;
         margin-left: 10px;
         margin-top: 20px;
         width: 260px;
         border: none;
         color: #757575;
      }

      .cont_form_sign_up>h2 {
         margin-top: 50px;
         font-weight: 400;
         color: #fff;
      }


      .cont_form_login>input {
         padding: 15px 5px;
         margin-left: 10px;
         margin-top: 20px;
         width: 260px;
         border: none;
         text-align: left;
         color: #757575;
      }

      .cont_form_login>h2 {
         margin-top: 100px;
         font-weight: 400;
         color: #fff;
      }

      .cont_form_login>a,
      .cont_form_sign_up>a {
         color: #757575;
         position: relative;
         float: left;
         margin: 10px;
         margin-left: 30px;
      }
   </style>

  <script src="https://use.typekit.net/nlq1kdt.js"></script>
  <script>try{Typekit.load({ async: true });}catch(e){}</script>
</head>
<body>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->

  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  <div id="container">
    <video id="background_video" loop muted></video>
    <div id="video_cover"></div>
    <div id="overlay"></div>
    <div id="video_controls">
      <span id="play">
        <img src="play.png">
      </span>
      <span id="pause">
        <img src="pause.png">
      </span>
    </div>
    <section id="main_content">
      <div id="head">
        <h1>Project_NDS</h1>
        <p class="sub_head">공감이 필요한 사람들의 쉼터</p>
        <p class="info">이동현 나현우 박경섭</p>
      </div>
      <div id="links">
        <input class ="submit_btn" type="submit" type ="text" value="Go">
      </div>
    </section>
  </div>
  <div id="footer">
    <a href="https://github.com/2021-SMHRD-IITP-Bigdata-6/Project_nds">Git</a>
  <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
  </div>
  <script src="bideo.js"></script>
  <script src="main.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
    if (window.location.host.indexOf('github.io') !== -1 && window.location.protocol !== "https:") {
      window.location.protocol = "https";
    }
    let a = document.querySelector('input')
    a.addEventListener('click', toggleModal);
    function toggleModal() { 
      $("#main_content").html('');
      div = `
      <div class="cotn_principal">
      <div class="cont_centrar">
         <div class="cont_login">
            <div class="cont_info_log_sign_up">
               <div class="col_md_login">
                  <div class="cont_ba_opcitiy">
                     <h2>LOGIN</h2>
                     <p></p>
                     <button class="btn_login" onclick="cambiar_login(); onclick_forms();">LOGIN</button>
                  </div>
               </div>
               <div class="col_md_sign_up">
                  <div class="cont_ba_opcitiy">
                     <h2>SIGN UP</h2>
                     <p></p>
                     <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
                  </div>
               </div>
            </div>
            <div class="cont_forms">
               <div class="cont_img_back_">
                  <img
                     src="https://www.gtagangwars.de/suite/images/styleLogo-6bd77433ddf78bd8477ea7306e804f677bc925d0.png"
                     alt="" />
               </div>
               <div class="cont_form_login">
                  <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons"></i></a>
                  <h2>LOGIN</h2>
                  <input type="text" placeholder="Username" />
                  <input type="password" placeholder="Password" />
                  <button class="btn_login" onclick="cambiar_login(); onclick_forms()">LOGIN</button>
               </div>
               <div class="cont_form_sign_up">
                  <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons"></i></a>
                  <h2>SIGN UP</h2>
                  <input type="text" name="mb_id" id="Join_ID" placeholder="Username" />
                  <button type="button" id ="Check" class="submit_btn"onclick="IdCheck()">중복체크</button>
								  <p id="result"> </p>
                  <input type="password" name="mb_pw" id="Join_PW" placeholder="Password" />
                  <input type="password" name="mb_nick" id="Join_Nick" placeholder="Nick" />
                  <input type="password" name="mb_tel" id="Join_TEL" placeholder="Tel" />
                  <input type="password" placeholder="Nick" />
						      <label>상담사 <input type="radio" value="0" name='mb_part'>
						      </label> 
						      <label> 일반회원 <input type="radio" value="1" name='mb_part' checked="checked">
						      </label>
                  <button type="submit" id="submit_btn" class="btn_sign_up" onclick="cambiar_sign_up(); join_form();">SIGN UP</button>
               </div>
            </div>
         </div>
      </div>
   </div>`
      $('#main_content').append(div);
    }
  </script>
  <script>
    function cambiar_login() {
       document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
       document.querySelector('.cont_form_login').style.display = "block";
       document.querySelector('.cont_form_sign_up').style.opacity = "0";

       setTimeout(function () { document.querySelector('.cont_form_login').style.opacity = "1"; }, 400);

       setTimeout(function () {
          document.querySelector('.cont_form_sign_up').style.display = "none";
       }, 200);
    }
    function cambiar_sign_up(at) {
       document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
       document.querySelector('.cont_form_sign_up').style.display = "block";
       document.querySelector('.cont_form_login').style.opacity = "0";

       setTimeout(function () {
          document.querySelector('.cont_form_sign_up').style.opacity = "1";
       }, 100);

       setTimeout(function () {
          document.querySelector('.cont_form_login').style.display = "none";
       }, 400);


    }



    function ocultar_login_sign_up() {

       document.querySelector('.cont_forms').className = "cont_forms";
       document.querySelector('.cont_form_sign_up').style.opacity = "0";
       document.querySelector('.cont_form_login').style.opacity = "0";

       setTimeout(function () {
          document.querySelector('.cont_form_sign_up').style.display = "none";
          document.querySelector('.cont_form_login').style.display = "none";
       }, 500);

    }

    function onclick_forms(){
      document.querySelector('.cont_forms').style.backgroundcolor = "#eee";
    }


 </script>
 			<script src="js/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
			function IdCheck() {
				$.ajax({
					url : "check.do",
					type : "get",
					data: {
						"id" : $('#Join_ID').val()
					},
					success : function(res) {
						console.log(res)
						
						if(res == 'true'){
							$('#result').html("중복된 아이디 입니다.").css("color","red");
						}
						else{
							$('#result').html("사용가능한 아이디 입니다.").css("color","green");
						}
					},
					error : function () {
					 	alert("요청실패!");
					}
					
				});
			}
			function join_form(){
				$.ajax({
					url : "JoinCon.do",
					type : "post",
					data: {
						mb_id : $('#Join_ID').val(),
						mb_pw : $('#Join_PW').val(),
						mb_nick : $('#Join_Nick').val(),
						mb_tel : $('#Join_TEL').val(),
						mb_part : $('input[name = mb_part]').val()
					},
					success : function() {
						console.log("회원가입 성공");
						location.replace("login.jsp")
	
					},
					error : function () {
					 	alert("요청실패!");
					}
					
				});
			}
			</script>
</body>
</html>

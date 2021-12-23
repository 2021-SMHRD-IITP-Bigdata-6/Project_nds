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
    }

    .user_name {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .user_juno {
      border: 1;
    }

    .comment-detail {}

    .user_feedbox {
      margin-top: 3px;
      margin-bottom: 3px;
      outline: 2px solid palegoldenrod;
    }

    article >div {
      position: relative;
      width: 500px;
      height: auto;

    }
  </style>
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/snowflake.css">
</head>

<body>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="js/main.js"></script>

  <section id="container">
    <header id="header">
      <section class="inner">

        <h1 class="logo">
          <a href="index.jsp">
            <div class="sprite_insta_icon"></div>
            <div class="sprite_write_logo"></div>
          </a>
        </h1>

        <div class="search_box">
          <input type="text" placeholder="검색" id="search-field">

          <div class="fake_field">
            <span class="sprite_small_search_icon"></span>
            <span>검색</span>
          </div>
        </div>

        <div class="right_icons">
          <a href="new_post.html">
            <div class="sprite_camera_icon"></div>
          </a>
          <a href="login.html">
            <div class="sprite_compass_icon"></div>
          </a>
          <a href="follow.html">
            <div class="sprite_heart_icon_outline"></div>
          </a>
          <a href="profile.html">
            <div class="sprite_user_icon_outline"></div>
          </a>
        </div>

      </section>

    </header>
    <section id="main_container">
      <div id = "inner">
      <div class="contents_box">
        <article class="contents">
          <header class="top">
            <div class="user_container">
              <div class="profile_img">
                <img src="imgs/thumb.jpeg" alt="프로필이미지">
              </div>
              <div class="user_name">
                <div class="nick_name m_text">KindTiger</div>
              </div>
            </div>
          </header>
          <textarea placeholder="지금 무슨생각을 하고 계신가요?"> </textarea>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div class="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
          <div class="user_feedbox">
            <div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div id="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>
          </div>
      </div>
      </article>
      </div>
    </div>
    </section>
  </section>
  <h1></h1>
  <script>
    var comment = document.getElementById("user_juno").innerHTML;
    var likeCount = document.getElementById('like-count-39').innerHTML;
    window.onscroll = function (e) {
      console.log(window.innerHeight, window.scrollY, document.body.offsetHeight)
      if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        setTimeout(function () {
          var addComment = document.createElement("div");
          addComment.classList.add("user_feedbox")
          addComment.innerHTML = `<div class="top">
              <div class="user_container">
                <div class="profile_img">
                  <img src="imgs/thumb.jpeg" alt="프로필이미지">
                </div>
                <div class="user_name">
                  <div class="nick_name m_text" id="outer">KindTiger</div>
                </div>
              </div>
              <div class="heart_btn" id="outer">
                <div id="end_li" class="sprite_heart_icon_outline" name="39" data-name="heartbeat"></div>
              </div>
              <div><span id="like-count-39">2,346</span> </div>
            </div>
            <div id="user_feed"> 강아지 귀엽다</div>
            <div class="comment_container">
              <div class="comment" id="comment-list-ajax-post37">
                <div class="comment-detail">
                  <div class="nick_name m_text">dongdong2</div>
                  <div id="user_juno">강아지가 너무 귀여워요~!</div>
                </div>
              </div>
            </div>`
          document.querySelector('article').appendChild(addComment);
          console.log(document.querySelector('article'))
        }, 300)
      }
      // db result set = null commnet = " 페이지의 끝입니다 "
    }
  </script>
</body>

</html>
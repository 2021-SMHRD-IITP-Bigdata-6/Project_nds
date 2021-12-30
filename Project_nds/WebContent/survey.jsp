<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name = "author" content ="HyunwooCoding">
    <meta name = "keywords" content="십이간지 연애유형">
    <meta name = "description" content="십이간지 연애유형">

    <!-- sns share -->
    <meta property = "og:url" content="https://ndssurvey7.netlify.app">
    <meta property = "og:title" content="십이간지 연애유형">
    <meta property = "og:type" content="website">
    <meta property = "og:image" content="/img/share.png">
    <meta property = "og:description" content="십이간지로 알아보는 연애유형">
    
    <!-- favicon -->
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/img/favicon.ico" />
    <title>십이간지 연애유형</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/qna.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/qna.css">
    <link rel="stylesheet" href="./css/animation.css">
    <link rel="stylesheet" href="./css/result.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">

</head>
<body>
    <div class="container">
    <section id = "main" class="mx-auto my-5 py-5 px-3">
        <h1 class="pt-5">십이간지로 알아보는 연애 유형</h1>
        <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto mt-5">
            <img src="./imgs/main.png" alt="mainImage" class="img-fluid">
        </div>
        <p>
            나만의 MBTI 사이트입니다! <br>
            아래 시작하기버튼을 눌러 시작해 주십시오.
        </p>
        <button type="button" class="btn btn-outline-danger mt-3" onclick="js:begin()">시작하기</button>
    </section>
    
    <section id = "qna">
        <div class="status mx-auto mt-5" >
            <div class="statusBar">
            </div>    
        </div>
        <div class="qBox my-5 py-3 mx-auto">
            


        
        </div>
        <div class="answerBox">


        </div>


    </section>

    <section id ="result" class="mx-auto my-5 py-5 px-3">
        <h1>당신의 결과는???</h1>
        <div class="resultname" >

        </div>
        
        <div class="resultDesc">

        </div>
        <div id="resultImg" class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto mt-5">
            
        </div>
        <button type="button">저장하기</button>
    </section>
    <script src="./js/data.js" charset="utf-8"></script>
    <script src="./js/start.js" charset="utf-8"></script>
</div>
</body>
</html>
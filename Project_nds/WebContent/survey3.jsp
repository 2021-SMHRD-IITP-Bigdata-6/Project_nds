<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="padding: 0%;">
<head>
 
    <!-- favicon -->
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/img/favicon.ico" />
    <title>코로나 우울증</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/default3.css">
    <link rel="stylesheet" href="./css/main3.css">
    <link rel="stylesheet" href="./css/qna3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="./css/main3.css">
    <link rel="stylesheet" href="./css/qna3.css">
    <link rel="stylesheet" href="./css/animation3.css">
    <link rel="stylesheet" href="./css/result3.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
    <style>
        .btn-outline-danger {
    color: #0a0a0a;
    border-color: #0a0a0a;
}

#mainContainer{
    height : 919px;
}
    </style>

</head>
<body>
    <div class="container" id="mainContainer">
    <section id = "main" class="mx-auto my-5 py-5 px-3"; style="height: 581.672px" >
        <h1 class="pt-5">코로나 우울증 검사</h1>
        <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto mt-5">
            <img src="imgs/main.png" alt="mainImage" class="img-fluid">
        </div>
        <p>
            설문에 응시할 준비가 되시면 <br>
            아래 시작하기버튼을 눌러 시작해 주십시오.
        </p>
        <button type="button" class="btn btn-outline-danger mt-3" onclick="js:begin() ">시작하기</button>
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
        <h1 style="font-size: 4,5rem;">당신의 결과는???</h1>
        <div class="resultname" >

        </div>
        
        <div class="resultDesc" style="padding-top: 100px; padding-bottom: 100px; font-size: 32px">

        </div>
        <div id="resultImg" class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto mt-5">
            
        </div>
        <button type="button">공유하기</button>
    </section>
    <script src="./js/data3.js" charset="utf-8"></script>
    <script src="./js/start3.js" charset="utf-8"></script>
</div>
</body>
</html>
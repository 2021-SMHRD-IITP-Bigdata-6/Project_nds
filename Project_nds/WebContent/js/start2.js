const main = document.querySelector("#main");
const qna = document.querySelector("#qna");
const endPoint = 15;


let sum = 0;
function calResult(select){
        sum += parseInt(select);
        console.log(sum);
    }

function setResult(){
    let point;
    if(sum > 45){
        point = 4;
    }else if(sum > 30){
        point = 3;
    }else if(sum > 15){
        point = 2;
    }else{
        point = 1;
    }


    const resultName = document.querySelector('.resultname');
    resultName.innerHTML = infoList[point-1].name;

    var resultImg = document.createElement('img');
    const imgDiv = document.querySelector('#resultImg');
    var imgURL = '/img/image2-' + point + '.jpg'
    resultImg.src = imgURL;
    resultImg.alt = point;
    resultImg.classList.add('img-fluid');
    imgDiv.appendChild(resultImg);

    const resultDesc = document.querySelector('.resultDesc');
    resultDesc.innerHTML = infoList[point-1].desc;
    
}

function goResult(){                                                                                       
    qna.style.WebkitAnimation = "fadeOut 1s";
    qna.style.animation = "fadeOut 1s";
    setTimeout(() => {
        result.style.WebkitAnimation = "fadeIn 1s";
        result.style.animation = "fadeIn 1s";
        setTimeout(() => {
            qna.style.display = "none"; 
            result.style.display = "block";
        }, 450)})
        setResult();
}   


function addAnswer(answerText, qIdx, idx){
    var a = document.querySelector('.answerBox');
    var answer = document.createElement('button');
    answer.classList.add('answerList');
    a.appendChild(answer);
    answer.innerHTML = answerText;
    
    answer.classList.add('my-3');
    answer.classList.add('py-3');
    answer.classList.add('mx-auto');
    answer.classList.add('fadeIn');

    answer.addEventListener("click", function(){
        var children = document.querySelectorAll('.answerList');
        for(let i = 0; i < children.length; i++){
            children[i].disabled = true;
            children[i].style.WebkitAnimation = "fadeOut 0.5s";
            children[i].style.animation = "fadeOut 0.5s"; 
        }
        setTimeout(() => {
            var target = qnaList[qIdx].a[idx];
            calResult(target.answer[0]);
            for(let i = 0; i < target.length; i++){
            select[target[i]] += 1;
        }
           
            for(let i =0; i < children.length; i++){
            children[i].style.display = 'none';
            }
        goNext(++qIdx);    
        },450)
        
    }, false);
}


function goNext(qIdx){
    if(qIdx+1 === endPoint){
        goResult();
        return;
    }
    var q = document.querySelector('.qBox');
    q.innerHTML = qnaList[qIdx].q;
    for(let i in qnaList[qIdx].a){
        addAnswer(qnaList[qIdx].a[i].answer, qIdx, i);
    }
    var status = document.querySelector('.statusBar')
    status.style.width = (100/endPoint) * (qIdx+1) + '%';
}

function begin(){
    main.style.WebkitAnimation = "fadeOut 1s";
    main.style.animation = "fadeOut 1s";
    setTimeout(() => {  
        qna.style.WebkitAnimation = "fadeIn 1s";
        qna.style.animation = "fadeIn 1s";
        setTimeout(() => {
            main.style.display = "none"; 
            qna.style.display = "block";
        }, 450)
        let qIdx = 0;
        goNext(qIdx);
    }, 450);

}

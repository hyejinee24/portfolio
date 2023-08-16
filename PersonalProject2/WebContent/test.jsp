<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .glyphicon{
           font-size: 2em;
        }
    </style>
</head>
<body>
    <div>
        <span class="glyphicon glyphicon-retweet"></span>
        <span class="glyphicon glyphicon-backward"></span>
        <span class="glyphicon glyphicon-play" id="btn"></span>
        <span class="glyphicon glyphicon-forward"></span>
        <span class="glyphicon glyphicon-random"></span>
    </div>

    <script>
        var btn = document.getElementById('btn');

        btn.addEventListener('click', function(){
            if(btn.classList.contains('glyphicon-play')){
                btn.classList.remove('glyphicon-play');
                btn.classList.add('glyphicon-pause');
            } else{
                btn.classList.remove('glyphicon-pause');
                btn.classList.add('glyphicon-play');
            }
        });
    </script>
</body>
</html>
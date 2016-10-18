var myApp = angular.module('myApp', []);


myApp.controller('QuestionController', function($scope) {
     
    $scope.question={
        text: 'Какой js-фреймворк лучше использовать?',
        author: 'Иван Иванов',
        date: '20/10/2013',
        answers: 
        [{
            text: 'AngularJS!',
            author: 'Вова Сидоров',
            date: '20/10/2013',
            rate:2
        },{
            text: 'AngularJS лучше всех',
            author: 'Олег Кузнецов',
            date: '20/10/2013',
            rate:0
        },{
            text: 'Я бы использовал knockout',
            author: 'Неизвестный',
            date: '21/10/2013',
            rate:0
        }]
    };
     
    $scope.voteUp = function (answer){
        answer.rate++;
    };
    $scope.voteDown = function (answer){
        answer.rate--;
    };
    $scope.questColorClass= "questcolor";
    $scope.changeClass = function (e) {
         
        $scope.questColorClass = e.type == "mouseover" ? "questselectedcolor" : "questcolor";
    }
});


myApp.filter('formatText', function(){
    return function(text){
        if(text.indexOf("бы")!==-1){
            return "***";
        }
        else{
            return text;
        }
    }
});



myApp.controller('AnswerController', 
    function AnswerController($scope){
        $scope.save = function (answer, answerForm){
            if(answerForm.$valid){
                // действия по сохранению
                alert(answer.author + ", ваш ответ сохранен");
            }
        };
});



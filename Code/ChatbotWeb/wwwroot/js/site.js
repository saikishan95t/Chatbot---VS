// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var app = angular.module("chatbot", ['ngRoute']);

app.controller("preReg", ['$http', '$scope', '$window', '$timeout', function ($http, $scope, $window, $timeout) {

	$scope.requestDone = false;
    $scope.chatClosed = true;
    $scope.input = {};
    $scope.conversationIndex = 1;

    $scope.webControllerURL = "https://localhost:44342/";
    $scope.metaDataURL = "api/getMetaData?ConversationType=";
    $scope.postUserURL = "api/userDetails"
    $scope.preRegConvoType = "PRE_REGISTRATION";
    $scope.preRegURL = $scope.webControllerURL + $scope.metaDataURL + $scope.preRegConvoType
    $scope.postUserDetails = $scope.webControllerURL + $scope.postUserURL

    $http({
        method: "GET",
        url: $scope.preRegURL
    }).then(function mySuccess(response) {
        $scope.questions = response.data;
        $scope.requestDone = true;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.conversation = []
    $scope.finalConvo = []

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.Questions[0]);
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = false;
        $scope.chatClosed = false;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = true;
    }

    $scope.submitInput = function () {
        $scope.validEmail = true;
        $scope.conversation.push({ "Question": $scope.input.Text, "Answers": null })
        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_EMAIL") {
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($scope.input.Text)) {
                $scope.validEmail = true;
            }
            else {
                $scope.conversation.push({
                    "QuestionType": "QUESTION",
                    "QuestionKey": "QUE_EMAIL",
                    "Question": "Sorry, you have entered an incorrect E-mail address. Please enter a valid E-mail.",
                    "Answers": [
                        {
                            "AnswerType": "TEXT",
                            "AnswerKey": "EMAIL",
                            "Answer": null
                        }
                    ]
                })
                $scope.validEmail = false;
            }
        }
        if ($scope.validEmail) {
            $scope.finalConvo.push(
                {
                    "questionKey": $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey,
                    "answerType": $scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType,
                    "answer": $scope.input.Text
                })

            if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_NAME") {
                $scope.userName = $scope.input.Text;
            }
            if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_EMAIL") {
                $scope.postUserDetails();
            }
            if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_TRIAL_VERSION" && $scope.input.Text == "No") {
                $scope.conversation.push({
                    "QuestionType": "ASSERTION",
                    "QuestionKey": "AS_TRIAL_VERSION",
                    "Question": "Thank you so much. It was a pleasure talking to you, " + $scope.userName + ".",
                    "Answers": [
                        {
                            "AnswerType": "NONE",
                            "AnswerKey": "TRIAL",
                            "Answer": null
                        }
                    ]
                })
                $scope.conversationIndex = $scope.questions.Questions.length;
            }

            $scope.input.Text = "";
            $scope.input.Number = "";
            if ($scope.questions.Questions.length - 1 == $scope.conversationIndex - 1) {
            }
            else {
                $timeout(function () {
                    $scope.conversation.push($scope.questions.Questions[$scope.conversationIndex]);
                    $scope.conversationIndex += 1;
                }, 2000);
            }
        }
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
        if ($scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType != 'TEXT')
            document.getElementById("userInput").disabled = true;
        else
            document.getElementById("userInput").disabled = false;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
        $scope.input.Radio = "";
    }

    $scope.selectNumber = function () {
        $scope.input.Text = $scope.input.Number;
    }

    $scope.selectDate = function () {
        $scope.input.Text = $scope.input.Date;
        $scope.submitInput();
        $scope.input.Date = "";
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown.Answer;
        $scope.submitInput();
        $scope.input.dropdown = "";
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.Answer.Answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.Answer.Answer[$index];
        }
    }

    $scope.postUserDetails = function () {

        $http({
            method: "POST",
            url: "https://localhost:44342/api/userDetails",
            data: JSON.stringify($scope.finalConvo),
            headers: { 'Content-Type': 'application/json' }
        }).then(function mySuccess(response) {
            $scope.estimate = response.data;
        }, function myError(response) {
            $scope.myWelcome = response.statusText;
        });
    }

}]);


app.controller("missing", ['$http', '$scope', '$window', '$timeout', function ($http, $scope, $window, $timeout) {

    $scope.requestDone = false;
    $scope.chatClosed = true;
    $scope.input = {};
    $scope.conversationIndex = 1;

    $scope.webControllerURL = "https://localhost:44342/";
    $scope.metaDataURL = "api/getMetaData?ConversationType=";
    $scope.postUserURL = "api/missingData"
    $scope.missingConvoType = "MISSING_DATA";
    $scope.preRegURL = $scope.webControllerURL + $scope.metaDataURL + $scope.missingConvoType
    $scope.postUserDetails = $scope.webControllerURL + $scope.postUserURL

    $http({
        method: "GET",
        url: $scope.preRegURL
    }).then(function mySuccess(response) {
        $scope.questions = response.data;
        $scope.requestDone = true;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.conversation = []
    $scope.finalConvo = []

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.Questions[0]);
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = false;
        $scope.chatClosed = false;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = true;
    }

    $scope.submitInput = function () {
        $scope.conversation.push({ "Question": $scope.input.Text, "Answers": null })
        $scope.finalConvo.push(
            {
                "questionKey": $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey,
                "answerType": $scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType,
                "answer": $scope.input.Text
            })

        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_BEDS") {
            $scope.postMissingData();
        }
        if (($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_INCENTIVE" || $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_MISSING_DATA") && $scope.input.Text == "No") {
            $scope.conversation.push({
                "QuestionType": "ASSERTION",
                "QuestionKey": "AS_THANK",
                "Question": "Thank you so much for your time. Have a great day!!",
                "Answers": [
                    {
                        "AnswerType": "NONE",
                        "AnswerKey": "THANK",
                        "Answer": null
                    }
                ]
            })
            $scope.conversationIndex = $scope.questions.Questions.length;
        }

        $scope.input.Text = "";
        $scope.input.Number = "";
        if ($scope.questions.Questions.length - 1 == $scope.conversationIndex - 1) {
        }
        else {
            $timeout(function () {
                $scope.conversation.push($scope.questions.Questions[$scope.conversationIndex]);
                $scope.conversationIndex += 1;
            }, 2000);
        }
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
        if ($scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType != 'TEXT')
            document.getElementById("userInput").disabled = true;
        else
            document.getElementById("userInput").disabled = false;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
        $scope.input.Radio = "";
    }

    $scope.selectNumber = function () {
        $scope.input.Text = $scope.input.Number;
    }

    $scope.selectDate = function () {
        $scope.input.Text = $scope.input.Date;
        $scope.submitInput();
        $scope.input.Date = "";
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown.Answer;
        $scope.submitInput();
        $scope.input.dropdown = "";
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.Answer.Answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.Answer.Answer[$index];
        }
    }

    $scope.postMissingData = function () {

        $http({
            method: "POST",
            url: "https://localhost:44342/api/missingData",
            data: JSON.stringify($scope.finalConvo),
            headers: { 'Content-Type': 'application/json' }
        }).then(function mySuccess(response) {
            $scope.estimate = response.data;
        }, function myError(response) {
            $scope.myWelcome = response.statusText;
        });
    }

}]);

app.controller("query", ['$http', '$scope', '$window', '$timeout', function ($http, $scope, $window, $timeout) {

    $scope.requestDone = false;
    $scope.chatClosed = true;
    $scope.queryOther = false;
    $scope.input = {};
    $scope.conversationIndex = 1;
    $scope.estimate = Math.random() * (10000000 - 500000) + 500000;

    $scope.webControllerURL = "https://localhost:44342/";
    $scope.metaDataURL = "api/getMetaData?ConversationType=";
    $scope.postUserURL = "api/valuation"
    $scope.missingConvoType = "USER_QUERY";
    $scope.preRegURL = $scope.webControllerURL + $scope.metaDataURL + $scope.missingConvoType
    $scope.postUserDetails = $scope.webControllerURL + $scope.postUserURL

    $http({
        method: "GET",
        url: $scope.preRegURL
    }).then(function mySuccess(response) {
        $scope.questions = response.data;
        $scope.requestDone = true;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.conversation = []
    $scope.finalConvo = []

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.Questions[0]);
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = false;
        $scope.chatClosed = false;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = true;
    }

    $scope.submitInput = function () {
        $scope.conversation.push({ "Question": $scope.input.Text, "Answers": null })
        $scope.finalConvo.push(
            {
                "questionKey": $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey,
                "answerType": $scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType,
                "answer": $scope.input.Text
            })
        if (($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_QUERY" || $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_QUERY_AGAIN") && $scope.input.Text == "No") {
            $scope.conversationIndex = $scope.questions.Questions.length - 1;
        }
        else if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_QUERY_AGAIN" && $scope.input.Text == "Yes") {
            $scope.conversationIndex = 1;
        }
        else if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_QUERY_LIST" && $scope.input.Text == "Other") {
            $scope.conversation.push({
                "QuestionType": "QUESTION",
                "QuestionKey": "QUE_OTHER_QUERY",
                "Question": "I'm sorry about not being able to answer your query. Please type in your query:",
                "Answers": [
                    {
                        "AnswerType": "TEXT",
                        "AnswerKey": "OTHER_QUERY",
                        "Answer": null
                    }
                ]
            })
            $scope.queryOther = true;
            $scope.conversationIndex = $scope.questions.Questions.length;
            $scope.input.Text = "";

        }

        else if ($scope.queryOther) {
            $scope.postUserQuery();
            $scope.conversation.push({
                "QuestionType": "ASSERTION",
                "QuestionKey": "AS_QUERY_POSTED",
                "Question": "Your query will be answered soon by someone from our team. Thank you for your patience. Have a good day!",
                "Answers": [
                    {
                        "AnswerType": "NONE",
                        "AnswerKey": "NO_ANSWER",
                        "Answer": null
                    }
                ]
            })
        }
        else if ($scope.questions.Questions[$scope.conversationIndex].QuestionKey == 'QUE_QUERY_AGAIN') {
            $scope.AnswerKey = "";
            $scope.ActualQuestion = "";
            for (answer in $scope.questions.Questions[$scope.conversationIndex - 1].Answers) {
                if ($scope.questions.Questions[$scope.conversationIndex - 1].Answers[answer].Answer == $scope.input.Text) {
                    $scope.AnswerKey = $scope.questions.Questions[$scope.conversationIndex - 1].Answers[answer].AnswerKey;
                }
            } 
            $scope.QueryAnswer = "";
            for (answer in $scope.questions.Questions[$scope.questions.Questions.length - 1].Answers) {
                if ($scope.questions.Questions[$scope.questions.Questions.length - 1].Answers[answer].AnswerKey == $scope.AnswerKey) {
                    $scope.QueryAnswer = $scope.questions.Questions[$scope.questions.Questions.length - 1].Answers[answer].Answer;
                }
            }
            $scope.ActualQuestion = $scope.questions.Questions[$scope.conversationIndex].Question;
            $scope.QueryAnswer = $scope.ActualQuestion.replace("<ANSWER>", $scope.QueryAnswer);
        }
        $scope.input.Text = "";
        $scope.input.Number = "";
        if ($scope.questions.Questions.length - 1 == $scope.conversationIndex - 1) {
        }
        else {
            $timeout(function () {
                $scope.conversation.push($.extend({},$scope.questions.Questions[$scope.conversationIndex]));
                if ($scope.questions.Questions[$scope.conversationIndex].QuestionKey == 'QUE_QUERY_AGAIN') {
                    $scope.conversation[$scope.conversation.length - 1].Question = $scope.QueryAnswer;
                }
                $scope.conversationIndex += 1;
            }, 2000);
        }
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
        if ($scope.conversation.Answers[0].AnswerType != 'TEXT')
            document.getElementById("userInput").disabled = true;
        else
            document.getElementById("userInput").disabled = false;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
        $scope.input.Radio = "";
    }

    $scope.selectNumber = function () {
        $scope.input.Text = $scope.input.Number;
    }

    $scope.selectDate = function () {
        $scope.input.Text = $scope.input.Date;
        $scope.submitInput();
        $scope.input.Date = "";
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown.Answer;
        $scope.submitInput();
        $scope.input.dropdown = "";
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.Answer.Answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.Answer.Answer[$index];
        }
    }

    $scope.postUserQuery = function () {
        $http({
            method: "POST",
            url: "https://localhost:44342/api/userQuery",
            data: JSON.stringify($scope.finalConvo),
            headers: { 'Content-Type': 'application/json' }
        }).then(function mySuccess(response) {
            $scope.estimate = response.data;
        }, function myError(response) {
            $scope.myWelcome = response.statusText;
        });
    }

}]);

app.controller("value", ['$http', '$scope', '$window', '$timeout', function ($http, $scope, $window, $timeout) {

    $scope.requestDone = false;
    $scope.chatClosed = true;
    $scope.input = {};
    $scope.conversationIndex = 1;
    $scope.estimate = Math.random() * (10000000 - 500000) + 500000;

    $scope.webControllerURL = "https://localhost:44342/";
    $scope.metaDataURL = "api/getMetaData?ConversationType=";
    $scope.postUserURL = "api/valuation"
    $scope.missingConvoType = "VALUATION";
    $scope.preRegURL = $scope.webControllerURL + $scope.metaDataURL + $scope.missingConvoType
    $scope.postUserDetails = $scope.webControllerURL + $scope.postUserURL

    $http({
        method: "GET",
        url: $scope.preRegURL
    }).then(function mySuccess(response) {
        $scope.questions = response.data;
        $scope.requestDone = true;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.conversation = []
    $scope.finalConvo = []

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.Questions[0]);
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = false;
        $scope.chatClosed = false;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = true;
    }

    $scope.submitInput = function () {
        $scope.conversation.push({ "Question": $scope.input.Text, "Answers": null })
        $scope.finalConvo.push(
            {
                "questionKey": $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey,
                "answerType": $scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType,
                "answer": $scope.input.Text
            })
        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_VALUATION" && $scope.input.Text == "No") {
            $scope.conversation.push({
                "QuestionType": "ASSERTION",
                "QuestionKey": "AS_VALUATION",
                "Question": "Thank you so much. Have a great day!",
                "Answers": [
                    {
                        "AnswerType": "NONE",
                        "AnswerKey": "VALLUATION",
                        "Answer": null
                    }
                ]
            })
            $scope.conversationIndex = $scope.questions.Questions.length;
        }
        if ((($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_IF_SIZE" || $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_IF_LAND_SITE") && $scope.input.Text == "No") || $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_LAND_SITE") {
            $scope.postValuation();
            $scope.conversationIndex = $scope.questions.Questions.length - 1;
        }

        $scope.input.Text = "";
        $scope.input.Number = "";
        if ($scope.questions.Questions.length - 1 == $scope.conversationIndex - 1) {
        }
        else {
            if ($scope.questions.Questions[$scope.conversationIndex].QuestionKey == 'AS_PROP_VALUE') {
                $scope.questions.Questions[$scope.conversationIndex].Question = $scope.questions.Questions[$scope.conversationIndex].Question + $scope.estimate;
            }
            $timeout(function () {
                $scope.conversation.push($scope.questions.Questions[$scope.conversationIndex]);
                $scope.conversationIndex += 1;
            }, 2000);
        }
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
        if ($scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType != 'TEXT')
            document.getElementById("userInput").disabled = true;
        else
            document.getElementById("userInput").disabled = false;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
        $scope.input.Radio = "";
    }

    $scope.selectNumber = function () {
        $scope.input.Text = $scope.input.Number;
    }

    $scope.selectDate = function () {
        $scope.input.Text = $scope.input.Date;
        $scope.submitInput();
        $scope.input.Date = "";
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown.Answer;
        $scope.submitInput();
        $scope.input.dropdown = "";
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.Answer.Answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.Answer.Answer[$index];
        }
    }

    $scope.postValuation = function () {

        $http({
            method: "POST",
            url: "https://localhost:44342/api/valuation",
            data: JSON.stringify($scope.finalConvo),
            headers: { 'Content-Type': 'application/json' }
        }).then(function mySuccess(response) {
            $scope.estimate = response.data;
        }, function myError(response) {
            $scope.myWelcome = response.statusText;
        });
    }

}]);

app.controller("feedback", ['$http', '$scope', '$window', '$timeout', function ($http, $scope, $window, $timeout) {

    $scope.requestDone = false;
    $scope.chatClosed = true;
    $scope.input = {};
    $scope.conversationIndex = 1;

    $scope.webControllerURL = "https://localhost:44342/";
    $scope.metaDataURL = "api/getMetaData?ConversationType=";
    $scope.postUserURL = "api/missingData"
    $scope.missingConvoType = "FEEDBACK";
    $scope.preRegURL = $scope.webControllerURL + $scope.metaDataURL + $scope.missingConvoType
    $scope.postUserDetails = $scope.webControllerURL + $scope.postUserURL

    $http({
        method: "GET",
        url: $scope.preRegURL
    }).then(function mySuccess(response) {
        $scope.questions = response.data;
        $scope.requestDone = true;
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });

    $scope.conversation = []
    $scope.finalConvo = []

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.Questions[0]);
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = false;
        $scope.chatClosed = false;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = true;
    }

    $scope.submitInput = function () {
        $scope.conversation.push({ "Question": $scope.input.Text, "Answers": null })
        $scope.finalConvo.push(
            {
                "questionKey": $scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey,
                "answerType": $scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType,
                "answer": $scope.input.Text
            })

        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_COMMENTS") {
            $scope.postFeedback();
        }
        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_IF_FEEDBACK" && $scope.input.Text == "No") {
            $scope.conversation.push({
                "QuestionType": "ASSERTION",
                "QuestionKey": "AS_THANK",
                "Question": "Thank you so much for your time. Have a great day!!",
                "Answers": [
                    {
                        "AnswerType": "NONE",
                        "AnswerKey": "THANK",
                        "Answer": null
                    }
                ]
            })
            $scope.conversationIndex = $scope.questions.Questions.length;
        }
        if ($scope.questions.Questions[$scope.conversationIndex - 1].QuestionKey == "QUE_FEEDBACK" && ($scope.input.Text == "5 - Excellent" || $scope.input.Text == "4 - Very Good")) {
            $scope.conversationIndex += 1;
            $scope.postFeedback();
        }


        $scope.input.Text = "";
        $scope.input.Number = "";
        if ($scope.questions.Questions.length - 1 == $scope.conversationIndex - 1) {
        }
        else {
            $timeout(function () {
                $scope.conversation.push($scope.questions.Questions[$scope.conversationIndex]);
                $scope.conversationIndex += 1;
            }, 2000);
        }
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
        if ($scope.questions.Questions[$scope.conversationIndex - 1].Answers[0].AnswerType != 'TEXT')
            document.getElementById("userInput").disabled = true;
        else
            document.getElementById("userInput").disabled = false;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
        $scope.input.Radio = "";
    }

    $scope.selectNumber = function () {
        $scope.input.Text = $scope.input.Number;
    }

    $scope.selectDate = function () {
        $scope.input.Text = $scope.input.Date;
        $scope.submitInput();
        $scope.input.Date = "";
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown.Answer;
        $scope.submitInput();
        $scope.input.dropdown = "";
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.Answer.Answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.Answer.Answer[$index];
        }
    }

    $scope.postFeedback = function () {
        $http({
            method: "POST",
            url: "https://localhost:44342/api/feedback",
            data: JSON.stringify($scope.finalConvo),
            headers: { 'Content-Type': 'application/json' }
        }).then(function mySuccess(response) {
            $scope.estimate = response.data;
        }, function myError(response) {
            $scope.myWelcome = response.statusText;
        });
    }

}]);
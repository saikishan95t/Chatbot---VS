// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var app = angular.module("chatbot", ['ngRoute']);

app.controller("preReg", ['$http', '$scope', '$window', function ($http, $scope, $window) {

	$scope.requestDone = false;
    $scope.chatClosed = false;
    $scope.input = {};
    $scope.conversationIndex = 1;
    //$scope.questions =
    //{
    //    "conversationType": "preReg",
    //    "questions":
    //        [
    //            {
    //                "question": "Hello!! My name is Jarvis, you are?",
    //                "answer": {
    //                    "answerType": "TEXT",
    //                    "answer": null
    //                }
    //            },
    //            {
    //                "question": "And you are a...",
    //                "answer":
    //                    {
    //                        "answerType": "RADIO_BUTTON",
    //                        "answer": [
    //                            "Realtor",
    //                            "Banker",
    //                            "Govt. Official",
    //                            "Other"
    //                        ]
    //                    }
    //            },
    //            {
    //                "question": "And you are a...",
    //                "answer":
    //                {
    //                    "answerType": "DROPDOWN",
    //                    "answer": [
    //                        "Realtor",
    //                        "Banker",
    //                        "Govt. Official",
    //                        "Other",
    //                        "Realtor",
    //                        "Banker",
    //                        "Govt. Official",
    //                        "Other",
    //                        "Realtor",
    //                        "Banker",
    //                        "Govt. Official",
    //                        "Other"
    //                    ]
    //                }
    //            },
    //            {
    //                "question": "And you are a...",
    //                "answer":
    //                {
    //                    "answerType": "MULTI_SELECT",
    //                    "answer": [
    //                        "Realtor",
    //                        "Banker",
    //                        "Govt. Official",
    //                        "Other"
    //                    ]
    //                }
    //            },
    //            {
    //                "question": "My name is Jarvis, you are?",
    //                "answer":
    //                    {
    //                        "answerType": "TEXT",
    //                        "answer": null
    //                    }
    //            }
    //        ]
    //}

    $scope.metaDataURL = "https://localhost:44342/api/getMetaData?ConversationType="
    $scope.preRegConvoType = "PRE_REGISTRATION"
    $scope.preRegURL = $scope.metaDataURL + $scope.preRegConvoType

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

    $scope.firstConv = function () {
        $scope.conversation.push($scope.questions.questions[0]);
        console.log($scope.conversation)
    }

    $scope.toggleChatWindow = function () {
        $scope.requestDone = !$scope.requestDone;
        $scope.chatClosed = !$scope.chatClosed;
    }

    $scope.closeWindow = function () {
        $scope.chatClosed = !$scope.chatClosed;
    }

    $scope.submitInput = function () {

        $scope.conversation.push({"question": $scope.input.Text, "answer": null})
        $scope.input.Text = "";
        $scope.conversation.push($scope.questions.questions[$scope.conversationIndex]);
        $scope.conversationIndex += 1;
    }

    $scope.scrollDown = function () {
        var elem = document.getElementById('convoBox');
        elem.scrollTop = elem.scrollHeight;
    }

    $scope.selectRadio = function () {
        $scope.input.Text = $scope.input.Radio;
        $scope.submitInput();
    }

    $scope.selectDropdown = function () {
        $scope.input.Text = $scope.input.dropdown;
        $scope.submitInput();
    }

    $scope.selectCheckbox = function (convo, $index) {
        if ($scope.input.Text == "") {
            $scope.input.Text = convo.answer.answer[$index];
        }
        else {
            $scope.input.Text = $scope.input.Text + " & " + convo.answer.answer[$index];
        }
    }

}]);
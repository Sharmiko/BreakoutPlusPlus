// Select canvas from HTML and get its context
var canvas = document.querySelector("#canvas");
var ctx = canvas.getContext("2d");

/*
*   Canvas Object that contains
*   widht and height of the canvas
*   window and controls canvas
*   animations.
*/
const Canvas = {
    width: canvas.width,
    height: canvas.height,
    animation: null,
    menuClicked: false,
    pause: false,
    isGameStarted: false,
    restartGame: false,
    askForRestart: false,
    playClicked: false,
    levelBricks: [],
    text: "",
    textColor: "",
    terminateLevelHover: false
}
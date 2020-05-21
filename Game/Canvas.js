/*
*
*   Author: Giorgi Sharmiashvili
*
*   Project: Breakout++
*
*   Description: Advanced Version of arcanoid/breakout/break breaker
*                game with more features and improvements. This game
*                is being improved from time to time, so this is not
*                the last working version of it.
*   
*/


class Canvas 
{
    constructor() 
    {
        console.log("Canvas init");
        // Select canvas from HTML and get its context
        this.canvas = document.querySelector("#canvas");
        this.ctx = canvas.getContext("2d");
        
        /*
        *   Canvas Object that contains
        *   widht and height of the canvas
        *   window and controls canvas
        *   animations.
        */
        this.properties = {
            width: this.canvas.width,
            height: this.canvas.height,
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
        };
    }
}

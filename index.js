/*
#
#   Author: Giorgi Sharmiashvili
#
#   Project: Breakout++
#
#   Description: Advanced Version of arcanoid/breakout/break breaker
#                game with more features and improvements. This game
#                is being improved from time to time, so this is not
#                the last working version of it.
#   
*/

// Select canvas from HTML and get its context
var canvas = document.querySelector("#canvas");
var ctx = canvas.getContext("2d");

window.onload = () => {
    init();
}

/*
#   Canvas Object that contains
#   widht and height of the canvas
#   window and controls canvas
#   animations.
*/
const Canvas = {
    width: canvas.width,
    height: canvas.height,
    animation: null,
    pause: false,
    isGameStarted: false,
    restartGame: false,
    askForRestart: false,
    text: "",
    textColor: ""
}

/*
#   Heart Object that controls
#   player's lives, one heart
#   is decremented when ball
#   falls down, if heart count
#   reaches to zero, player looses.
*/
const Heart = {
    total: 3,
    alive: 3,
    x: 100,
    y: 100,
    width: 12,
    height: 25,
    hearts: []

}

/*
#   Paddle(moving brick) that moves
#   in order to collide with the ball.
#   It can be controlled with both
#   keyboard and a mouse. 
*/
const Paddle = {
    width: 120,
    height: 20,
    speed: 7.5,
    x: Canvas.width / 2,
    y: Canvas.height - 80,
    left: false,
    right: false,
    color: "#E27D60"
}

/*
#   Moving Ball, player should interact
#   with this ball to play a game, if ball
#   falls down player looses one haert. 
#   Player should destroy all bricks 
#   using this ball.
*/
const Ball = {
    radius: 15,
    x: Canvas.width / 2,
    y: Canvas.height - 300,
    speedX: 4.5,
    speedY: 4.5,
    color: "#41B3A3"
}

/*
#   Bricks object, player should 
#   destroy all bricks displayed 
#   on canvas. Once player destroyes
#   all bricks(total = rows * columns)
#   player wins.
#
*/
const Bricks = {
    arr: [],
    width: 60,
    height: 15,
    originX: 0,
    originY: 0, 
    originXPadding: 15,
    originYPadding: 10,
    paddingX: 5,
    paddingY: 5,
    rows: 10,
    columns: 8,
    total: 0, 
    color: "#E8A87C"
}

/*
#   Function that initializes the game:
#       *initializes bricks
#       *initializes hearts
#       *draws bricks, ball and paddle on canvas
#       *starts animations
*/
function init() {
    initBricks();
    initHearts();

    draw();

    waitForGameStart();
    //
}

/*
#   Function that draws
#   every object on a canvas
*/
function draw() {
    drawBricks();
    drawBall();
    drawPaddle();
}

/*
#   Main function responsible for
#   animations. {Canvas.pause} variable
#   controls the state of the animation
#
*/
function animations() {
    if (Canvas.pause) {
        return;
    }
    ctx.clearRect(0, 0, Canvas.width, Canvas.height);
    ctx.fillStyle = "#85CDCA";
    ctx.fillRect(0, 0, Canvas.width, Canvas.height);
    drawBricks();
    moveBall();
    movePaddle();

    requestAnimationFrame(animations);
}

// Event Listeners
///////////////////////////////////////////////////////////////////////////////

/*
#   Event listener responsible
#   for keyboard controller
*/
document.onkeydown = (event) => {
    if (!Canvas.isGameStarted) {
        Canvas.isGameStarted = true;
    }
    if (Canvas.askForRestart) {
        Canvas.restartGame = true;
    }
    if (event.keyCode == 39) { // right key
        Paddle.right = true;
    }

    if (event.keyCode == 37) { // left key
        Paddle.left = true;
    }
}

/*
#   Event listener responsible
#   for keyboard controller
*/
document.onkeyup = (event) => {
    if (event.keyCode == 39) {
        Paddle.right = false;
    }

    if (event.keyCode == 37) {
        Paddle.left = false;
    }
}

/*
#   Event listeners responsible
#   for mouse controller
*/
document.addEventListener("mousemove", (event) => {
    var relativeX = event.clientX - canvas.offsetLeft;
    if (relativeX > 0 && relativeX < canvas.width) {
        Paddle.x = relativeX - Paddle.width / 2;
    }

}, false);

document.onmousedown = () => {
    if (Canvas.askForRestart) {
        Canvas.restartGame = true;
    }
    Canvas.isGameStarted = true;
    return;
}

// Paddle 
///////////////////////////////////////////////////////////////////////////////

/*
#   Draws paddle on canvas
#   with given properties
*/
const drawPaddle = () => {
    ctx.save();
    ctx.beginPath();
    ctx.rect(Paddle.x - Paddle.width / 2, Paddle.y, Paddle.width, Paddle.height);
    ctx.fillStyle = Paddle.color;
    ctx.fill();
    ctx.restore();
}

/*
#   Function responsible for  
#   canvas movement that is 
#   dependant on keyboard controller
#
*/
const movePaddle = () => {
    ctx.save();
    
    if (Paddle.right) {
        if (Paddle.x + Paddle.width / 2 <= Canvas.width) {
            Paddle.x += Paddle.speed;
        }

    }
    
    if (Paddle.left) {
        if (Paddle.x - Paddle.width / 2>= 0) {
            Paddle.x -= Paddle.speed;
        }
    }
    drawPaddle();
    ctx.restore();  
}

// Ball
///////////////////////////////////////////////////////////////////////////////

/*
#   Draws ball on canvas
#   with given properties
*/
const drawBall = () => {
    ctx.save();
    ctx.beginPath();
    ctx.arc(Ball.x, Ball.y, Ball.radius, 0, 2 * Math.PI);
    ctx.fillStyle = Ball.color;
    ctx.fill();
    ctx.restore();
}

/*
#   Function responsible for ball movement
*/
const moveBall = () => {  
    Ball.x += Ball.speedX;
    Ball.y += Ball.speedY;
    checkBall_Bricks();
    checkCollision();
    checkBall_Paddle();
    drawBall();
}

/*
#   Function that checks ball's collision.  
#   It checks whether ball hit left, top, or 
#   right side of canvas and reflects it.
#   In case Ball goes past the bottom of the 
#   canvas(falls down) player looses one heart,
#   and ball is redrawn on canvas.
#
*/
const checkCollision = () => {
    if (Ball.x + Ball.radius >= Canvas.width || Ball.x <= Ball.radius) {
        Ball.speedX *= (-1);
    }
    if ( Ball.y <= Ball.radius) {
        Ball.speedY *= (-1);
    }
    if (Ball.y + Ball.radius / 2 >= Canvas.height) {
        Heart.alive -= 1;
        Heart.hearts[Heart.alive].style.visibility = 'hidden';
        console.log(Heart.alive);
        if (Heart.alive == 0) {
            youLoose();
            Canvas.text = "You Loose";
            Canvas.textColor = "red";
            Canvas.askForRestart = true;
            Canvas.pause = true;
            waitForGameRestart();
        }
        // reset ball position
        Ball.x = Canvas.width / 2;
        Ball.y = Canvas.height - 300;
        drawBall();
    }
}

/*
#   Function that checks collision  
#   between ball and paddle, if ball
#   and paddle come in contact ball
#   is reflected.
*/
const checkBall_Paddle = () => {
    if(Ball.x + Ball.radius > (Paddle.x - Paddle.width / 2) &&
    Ball.x - Ball.radius < (Paddle.x + Paddle.width / 2) &&
    Ball.y + Ball.radius > (Paddle.y - Paddle.height / 2) &&
    Ball.y - Ball.radius < (Paddle.y + Paddle.height / 2)) 
    {    
        Ball.speedY *= (-1);
    }
}


// Bricks
//////////////////////////////////////////////////////////

/*
#   Draws brick on canvas
#   with given properties
*/
const drawBrick = (x, y) => {
    ctx.save();
    ctx.beginPath()
    ctx.rect(x, y, Bricks.width, Bricks.height);
    ctx.stroke();
    ctx.fillStyle = Bricks.color;
    ctx.fill();
    ctx.restore();
}

/*
#   Function that initializes Bricks
#   with bricks(total = columns * rows)  
#   Each brick's x and y coordinate is 
#   calculated, padding is taken into
#   account. And lastly brick object is
#   pushed into main Bricks Object.
#
*/
const initBricks = () => {
    let xCount = Bricks.originXPadding;
    let yCount = Bricks.originYPadding;
    for (var i = 0; i < Bricks.rows; i++) {
        for (var k = 0; k < Bricks.columns; k++) {
            let brick = {};
            brick.gotHit = 0;
            brick.x = xCount;
            xCount += Bricks.width + Bricks.paddingX;

            brick.y = yCount;

            Bricks.arr.push(brick)
        }
        xCount = Bricks.originXPadding;
        yCount += Bricks.height + Bricks.paddingY;
    }

    Bricks.total = Bricks.columns * Bricks.rows;
}

/*
#   Function that draws all initialized  
#   bricks on canvas, this function 
#   is dependant on drawBrick method. 
*/
const drawBricks = () => {
    for (var i = 0; i < Bricks.rows * Bricks.columns; i++) {
        if (Bricks.arr[i].gotHit == 0 && 
            Bricks.arr[i].x != null && 
            Bricks.arr[i].y != null) {

            ctx.save();
            let x = Bricks.arr[i].x;
            let y = Bricks.arr[i].y;
            drawBrick(x, y);
            ctx.restore();
        }
    }
}

/*
#   This function checks whether
#   ball and one of the bricks came
#   with contact, in case it is true
#   brick dissapears, ball is reflected 
#   and total brick count is decremented
#   by one.
*/
const checkBall_Bricks = () => {
    var x = Canvas.width / 2;
    var y = Canvas.height - 80;
    for (var i = 0; i < Bricks.columns * Bricks.rows; i++) {
        var brick = Bricks.arr[i];
        if(Ball.x + Ball.radius > (brick.x - Bricks.width / 2) &&
        Ball.x - Ball.radius < (brick.x + Bricks.width / 2) &&
        Ball.y + Ball.radius > (brick.y - Bricks.height / 2) &&
        Ball.y - Ball.radius < (brick.y + Bricks.height / 2)) 
        {    
            Ball.speedY = -Ball.speedY;
            Bricks.arr[i].gotHit = 1;
            Bricks.arr[i].x = null;
            Bricks.arr[i].y = null;
            Bricks.total -= 1;
        }
        if (Bricks.total == 0) {
            youWin();
            Canvas.text = "You Win";
            Canvas.textColor = "green";
            Canvas.askForRestart = true;
            Canvas.pause = true;
            waitForGameRestart();
        }
    }
}

// Heart
/////////////////////////////////////////////////////////////////////

/*
#   Function that initializes heart
*/
const initHearts = () => {
    var hearts = document.querySelectorAll('.heart_container');
    for (heart of hearts) {
        Heart.hearts.push(heart);
    }
}


// Game Controls
/////////////////////////////////////////////////////////////////////

/*
#   In case player looses the games,
#   (ball falls down 3 times),
#   corresponding message is displayed.
*/
const youLoose = () => {
    //ctx.clearRect(0, 0, Canvas.width, Canvas.height);
    ctx.font = '24px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'red'
    ctx.fillText('You Loose', Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
}

/*
#   In case player wins the game,
#   (all bricks are destroyed).
#   corresponding message is displayed.
#   
*/
const youWin = () => {
    ctx.font = '24px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'green'
    ctx.fillText('You Win', Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
}

/*
#   Function that displays message
#   to start a game, and wait user
#   to either click the mouse on
#   press any key on keyboard, after
#   any user interaction game is started
*/
const waitForGameStart = () => {
    ctx.font = '24px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'grey'
    ctx.fillText('Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
    ctx.restore();
    
    var decision = 0;
    var interval = setInterval(() => {
        console.log("Inside a interval");
        if (Canvas.isGameStarted){
            console.log("started");
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            draw();
            canvasAnimation = requestAnimationFrame(animations);
            clearInterval(interval);
        }
        if (decision == 0) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            ctx.font = '24px Comic Sans MS';
            ctx.textAlign = 'center';
            ctx.fillStyle = 'grey'
            ctx.fillText('Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
            ctx.restore();
            draw();
            decision = 1;
        }
        else if (decision == 1) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            ctx.font = '30px Comic Sans MS';
            ctx.textAlign = 'center';
            ctx.fillStyle = 'grey'
            ctx.fillText('Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
            ctx.restore();
            draw();
            decision = 0;
        }
    }, 500);
}

/*
#   Funtion that wait for user
#   to interact to restart the game
*/
const waitForGameRestart = () => {
    ctx.font = '24px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'grey'
    ctx.fillText('Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);

    ctx.font = '24px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = Canvas.textColor
    ctx.fillText(Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
    
    var decision = 0;
    var interval = setInterval(() => {
        if (Canvas.restartGame){
            console.log("restarting");
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            resetStats();
            draw();
            canvasAnimation = requestAnimationFrame(animations);
            clearInterval(interval);
        }
        if (decision == 0) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            ctx.font = '24px Comic Sans MS';
            ctx.textAlign = 'center';
            ctx.fillStyle = 'grey'
            ctx.fillText('Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);

            ctx.font = '24px Comic Sans MS';
            ctx.textAlign = 'center';
            ctx.fillStyle = Canvas.textColor
            ctx.fillText(Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
            ctx.restore();
            draw();
            decision = 1;
        }
        else if (decision == 1) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            ctx.font = '30px Comic Sans MS';
            ctx.textAlign = 'center';
            ctx.fillStyle = 'grey'
            ctx.fillText('Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);
            ctx.font = '24px Comic Sans MS';

            ctx.textAlign = 'center';
            ctx.fillStyle = Canvas.textColor
            ctx.fillText(Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
            ctx.restore();
            draw();
            decision = 0;
        }
    }, 500);
}

/*
#   Function that reinitializes
#   every state of the object to
#   restart the game
*/
const resetStats = () => {
    initBricks();
    Canvas.pause = false;
    Heart.total = 3;
    Heart.alive = 3;
    resetHearts();
    initHearts();
}

/*
#   Function that resets the visibility of hearts
*/
const resetHearts = () => {
    Heart.hearts[0].style.visibility = "visible";
    Heart.hearts[1].style.visibility = "visible";
    Heart.hearts[2].style.visibility = "visible";
}
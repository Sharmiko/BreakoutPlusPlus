var canvas = document.querySelector("#canvas");
var ctx = canvas.getContext("2d");
var pause = false;

window.onload = () => {
    init();
}

const Canvas = {
    width: canvas.width,
    height: canvas.height,
    animation: null
}

const Heart = {
    total: 3,
    alive: 3,
    x: 100,
    y: 100,
    width: 12,
    height: 25,
    hearts: []

}

const Paddle = {
    width: 600,
    height: 20,
    speed: 7.5,
    x: Canvas.width / 2,
    y: Canvas.height - 40,
    left: false,
    right: false,
    color: "#00CECB"
}

const Ball = {
    radius: 15,
    x: Canvas.width / 2,
    y: Canvas.height - 300,
    speedX: 15.5,
    speedY: 15.5,
    color: "#FFED66"
}

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
    color: "#9999FF"
}

function init() {
    initBricks();
    initHearts();

    drawBricks();
    drawBall();
    drawPaddle();
    canvasAnimation = requestAnimationFrame(animations);
}

function animations() {
    if (pause) {
        return;
    }
    ctx.clearRect(0, 0, Canvas.width, Canvas.height);
    ctx.fillStyle = "#D8D8D8";
    ctx.fillRect(0, 0, Canvas.width, Canvas.height);
    drawBricks();
    moveBall();
    movePaddle();

    requestAnimationFrame(animations);
}

// Paddle 
///////////////////////////////////////////////////////////////////////////////
const drawPaddle = () => {
    ctx.save();
    ctx.beginPath();
    ctx.rect(Paddle.x - Paddle.width / 2, Paddle.y, Paddle.width, Paddle.height);
    ctx.fillStyle = Paddle.color;
    ctx.fill();
    ctx.restore();
}

document.onkeydown = (event) => {
    if (event.keyCode == 39) {
        Paddle.right = true;
    }

    if (event.keyCode == 37) {
        Paddle.left = true;
    }
}

document.onkeyup = (event) => {
    if (event.keyCode == 39) {
        Paddle.right = false;
    }

    if (event.keyCode == 37) {
        Paddle.left = false;
    }
}

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
const drawBall = () => {
    ctx.save();
    ctx.beginPath();
    ctx.arc(Ball.x, Ball.y, Ball.radius, 0, 2 * Math.PI);
    ctx.fillStyle = Ball.color;
    ctx.fill();
    ctx.restore();
}

const moveBall = () => {  
    Ball.x += Ball.speedX;
    Ball.y += Ball.speedY;
    checkBall_Bricks();
    checkCollision();
    checkBall_Paddle();
    drawBall();
}

const checkCollision = () => {
    if (Ball.x + Ball.radius >= Canvas.width || Ball.x <= Ball.radius) {
        Ball.speedX *= (-1);
    }
    if ( Ball.y <= Ball.radius) {
        Ball.speedY *= (-1);
    }
    if (Ball.y + Ball.radius / 2 >= Canvas.height) {
        Heart.alive -= 1;
        Heart.hearts[Heart.alive].style.display = 'none';
        console.log(Heart.alive);
        if (Heart.alive == 0) {
            youLoose();
            pause = true;
            return;
        }
        // reset ball position
        Ball.x = Canvas.width / 2;
        Ball.y = Canvas.height - 300;
        drawBall();
    }
}

const checkBall_Paddle = () => {
    // if(Ball.x + Ball.radius >=  Paddle.x &&
    //     Ball.x - Ball.radius <= (Paddle.x + Paddle.width) &&
    //     Ball.y + Ball.radius >=  Paddle.y &&
    //     Ball.y - Ball.radius <= (Paddle.y + Paddle.height)) 
    //  {  
    //     //Ball.speedX *= (-1);
    //     Ball.speedY *= (-1);
    //  }
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

const drawBrick = (x, y) => {
    ctx.save();
    ctx.beginPath()
    ctx.rect(x, y, Bricks.width, Bricks.height);
    ctx.stroke();
    ctx.fillStyle = Bricks.color;
    ctx.fill();
    ctx.restore();
}

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

const checkBall_Bricks = () => {
    for (var i = 0; i < Bricks.columns * Bricks.rows; i++) {
        var brick = Bricks.arr[i];
        // if (Ball.x > brick.x && Ball.x < brick.x + Bricks.width &&
        //     Ball.y > brick.y && Ball.y < brick.y + Bricks.height) {
        //         Ball.speedY *= (-1);
        //         Bricks.arr[i].gotHit = 1;
        //     }
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
        // If Bricks.total == 0 
        // Then Player won the game
        if (Bricks.total == 0) {
            youWin();
            pause = true;
        }

    }
}

// Heart
/////////////////////////////////////////////////////////////////////

const initHearts = () => {
    var hearts = document.querySelectorAll('.heart_container');
    for (heart of hearts) {
        Heart.hearts.push(heart);
    }
}


// Game Controls
/////////////////////////////////////////////////////////////////////

const youLoose = () => {
    //ctx.clearRect(0, 0, Canvas.width, Canvas.height);
    ctx.font = '30px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'red'
    ctx.fillText('You Loose', Canvas.width / 2, Canvas.height / 2);
    ctx.restore();
}

const youWin = () => {
    ctx.font = '30px Comic Sans MS';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'green'
    ctx.fillText('You Win', Canvas.width / 2, Canvas.height / 2);
    ctx.restore();
}



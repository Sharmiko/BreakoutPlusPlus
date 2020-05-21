/*
*   Moving Ball, player should interact
*   with this ball to play a game, if ball
*   falls down player looses one haert. 
*   Player should destroy all bricks 
*   using this ball.
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
*   Draws ball on canvas with given properties
*/
const drawBall = () => 
{
    ctx.save();
    ctx.beginPath();
    ctx.arc(Ball.x, Ball.y, Ball.radius, 0, 2 * Math.PI);
    ctx.fillStyle = Ball.color;
    ctx.fill();
    ctx.restore();
}

/*
*   Function responsible for ball movement
*/
const moveBall = () => 
{  
    console.log("shevida");
    Ball.x += Ball.speedX;
    Ball.y += Ball.speedY;
    checkBall_Bricks();
    checkCollision();
    checkBall_Paddle();
    drawBall();
}
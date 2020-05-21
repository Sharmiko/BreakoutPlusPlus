/*
*   Paddle(moving brick) that moves
*   in order to collide with the ball.
*   It can be controlled with both
*   keyboard and a mouse. 
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
*   Draws paddle on canvas with given properties
*/
const drawPaddle = () => 
{
    ctx.save();
    ctx.beginPath();
    ctx.rect(Paddle.x - Paddle.width / 2, Paddle.y, Paddle.width, Paddle.height);
    ctx.fillStyle = Paddle.color;
    ctx.fill();
    ctx.restore();
}

/*
*   Function responsible for  
*   canvas movement that is 
*   dependant on keyboard controller
*/
const movePaddle = () => 
{
    ctx.save();
    
    if (Paddle.right) 
    {
        if (Paddle.x + Paddle.width / 2 <= Canvas.width) 
        {
            Paddle.x += Paddle.speed;
        }
    }
    
    if (Paddle.left) 
    {
        if (Paddle.x - Paddle.width / 2>= 0) 
        {
            Paddle.x -= Paddle.speed;
        }
    }

    drawPaddle();
    ctx.restore();  
}

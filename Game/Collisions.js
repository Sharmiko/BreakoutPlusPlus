/*
*   Function that checks ball's collision.  
*   It checks whether ball hit left, top, or 
*   right side of canvas and reflects it.
*   In case Ball goes past the bottom of the 
*   canvas(falls down) player looses one heart,
*   and ball is redrawn on canvas.
*/
const checkCollision = () => 
{
    if (Ball.x + Ball.radius >= Canvas.width || Ball.x <= Ball.radius) 
    {
        Ball.speedX *= (-1);
    }
    if ( Ball.y <= Ball.radius) 
    {
        Ball.speedY *= (-1);
    }
    if (Ball.y + Ball.radius / 2 >= Canvas.height) 
    {
        Heart.alive -= 1;
        Heart.hearts[Heart.alive].style.visibility = 'hidden';

        if (Heart.alive == 0) {
            youLose();
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
*   Function that checks collision  
*   between ball and paddle, if ball
*   and paddle come in contact ball
*   is reflected.
*/
const checkBall_Paddle = () => {
    if (
        (Ball.x + Ball.radius > (Paddle.x - Paddle.width / 2)) &&
        (Ball.x - Ball.radius < (Paddle.x + Paddle.width / 2)) &&
        (Ball.y + Ball.radius > (Paddle.y - Paddle.height / 2)) &&
        (Ball.y - Ball.radius < (Paddle.y + Paddle.height / 2))
    ) {    
        Ball.speedY *= (-1);
    }
}


/*
*   This function checks whether
*   ball and one of the bricks came
*   with contact, in case it is true
*   brick dissapears, ball is reflected 
*   and total brick count is decremented
*   by one.
*/
const checkBall_Bricks = () => 
{
    var x = Canvas.width / 2;
    var y = Canvas.height - 80;

    for (var i = 0; i < Bricks.columns * Bricks.rows; i++) 
    {
        var brick = Bricks.arr[i];
        if (Canvas.levelBricks[i] > 0) 
        {
            if(
                (Ball.x + Ball.radius > (brick.x - Bricks.width / 2)) &&
                (Ball.x - Ball.radius < (brick.x + Bricks.width / 2)) &&
                (Ball.y + Ball.radius > (brick.y - Bricks.height / 2)) &&
                (Ball.y - Ball.radius < (brick.y + Bricks.height / 2))
            ) {    
                Ball.speedY = -Ball.speedY;
                Canvas.levelBricks[i] -= 1;       
            }
            if (Canvas.levelBricks[i] == 0) 
            {
                Bricks.arr[i].gotHit = 1;
                Bricks.arr[i].x = null;
                Bricks.arr[i].y = null;
                Bricks.total -= 1;
            }
            if (Bricks.total == 0) 
            {
                youWin();
                Canvas.text = "You Win";
                Canvas.textColor = "green";
                Canvas.askForRestart = true;
                Canvas.pause = true;
                waitForGameRestart();
            }
        }
    }
}
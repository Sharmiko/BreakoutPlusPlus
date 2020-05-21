/*
*   In case player looses the games,
*   (ball falls down 3 times),
*   corresponding message is displayed.
*/
const youLose = () => 
{
    //ctx.clearRect(0, 0, Canvas.width, Canvas.height);
    drawText(24, 'red', 'You Lose', Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
}


/*
*   In case player wins the game,
*   (all bricks are destroyed).
*   corresponding message is displayed.
*   
*/
const youWin = () => 
{
    drawText(24, 'green', 'You Win', Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
}


/*
*   Function that reinitializes
*   every state of the object to
*   restart the game
*/
const resetStats = () => 
{
    initBricks();
    Canvas.pause = false;
    Heart.total = 3;
    Heart.alive = 3;
    resetHearts();
    initHearts();
}


/*
*   Function that displays message
*   to start a game, and wait user
*   to either click the mouse on
*   press any key on keyboard, after
*   any user interaction game is started
*/
const waitForGameStart = () => 
{
    drawText(24, 'gray', 'Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
    ctx.restore();
    
    var decision = 0;
    var interval = setInterval(() => 
    {
        console.log("Inside a interval");
        if (Canvas.isGameStarted)
        {
            console.log("started");
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            draw();
            canvasAnimation = requestAnimationFrame(animations);
            clearInterval(interval);
        }
        if (decision == 0) 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            drawText(24, 'gray', 'Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
            ctx.restore();
            draw();
            decision = 1;
        }
        else if (decision == 1) 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            drawText(30, 'gray', 'Press any key to Start!', Canvas.width / 2, Canvas.height / 2);
            ctx.restore();
            draw();
            decision = 0;
        }
    }, 500);
}



/*
*   Funtion that wait for user to interact to restart the game
*/
const waitForGameRestart = () => 
{
    drawText(24, 'gray', 'Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);
    drawText(24, Canvas.textColor, Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
    ctx.restore();
    
    var decision = 0;
    var interval = setInterval(() => 
    {
        if (Canvas.restartGame)
        {
            console.log("restarting");
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            resetStats();
            draw();
            canvasAnimation = requestAnimationFrame(animations);
            clearInterval(interval);
        }
        if (decision == 0) 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            drawText(24, 'gray', 'Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);
            drawText(24, Canvas.textColor, Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
            ctx.restore();
            draw();
            decision = 1;
        }
        else if (decision == 1) 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            drawText(30, 'gray', 'Press any key to Restart the Game', Canvas.width / 2, Canvas.height / 2);
            drawText(24, Canvas.textColor, Canvas.text, Canvas.width / 2, Canvas.height / 2 - 50);
            ctx.restore();
            draw();
            decision = 0;
        }
    }, 500);
}
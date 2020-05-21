window.onload = () => 
{
    init();
}


/*
*   Function that initializes the game:
*       *initializes bricks
*       *initializes hearts
*       *draws bricks, ball and paddle on canvas
*       *starts animations
*/
function init() 
{
    initHearts();
    //displayLevelsIcon();
    welcomeMenu();
    //animations();
    //draw();

    //waitForGameStart();
    //
}


/*
*   Function that draws every object on a canvas
*/
function draw() 
{
    drawBall();
    drawPaddle();
}

/*
*   Main function responsible for
*   animations. {Canvas.pause} variable
*   controls the state of the animation
*/
function animations() 
{
    if (Canvas.pause) 
    {
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
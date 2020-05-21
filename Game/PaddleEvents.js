/*
*   Event listener responsible for keyboard controller
*/
document.onkeydown = (event) => 
{
    if (!Canvas.isGameStarted) 
    {
        Canvas.isGameStarted = true;
    }

    if (Canvas.askForRestart) 
    {
        Canvas.restartGame = true;
    }

    if (event.keyCode == 39) // right key
    { 
        Paddle.right = true;
    }

    if (event.keyCode == 37) // left key
    { 
        Paddle.left = true;
    }
}


/*
*   Event listener responsible for keyboard controller
*/
document.onkeyup = (event) => {
    if (event.keyCode == 39) 
    {
        Paddle.right = false;
    }

    if (event.keyCode == 37) 
    {
        Paddle.left = false;
    }
}


/*
*   Event listeners responsible for mouse controller
*/
document.addEventListener("mousemove", (event) => 
{
    var relativeX = event.clientX - canvas.offsetLeft;
    if (relativeX > 0 && relativeX < canvas.width) 
    {
        Paddle.x = relativeX - Paddle.width / 2;
    }

}, false);


document.onmousedown = () => 
{
    if (Canvas.askForRestart) 
    {
        Canvas.restartGame = true;
    }
    Canvas.isGameStarted = true;
    return;
}
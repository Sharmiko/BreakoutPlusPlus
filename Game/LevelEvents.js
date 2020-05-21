/*
*   Event listener that checks 
*   if user hovered over level icon
*/
const levelIconHoverListener = (e) => 
{
    if (Canvas.terminateLevelHover == true) 
    {
        console.log("terminated");
        e.stopImmediatePropagation();
        
    }

    var rect = canvas.getBoundingClientRect();
    var x = e.clientX - rect.left;
    var y = e.clientY - rect.top;
    var numLevels = Object.keys(Levels).length - 1;
    var Pos = Levels.position;
    var arr = Levels.position.levelIconPositions;

    for (let i = 0; i < numLevels; i++) 
    {
        if (
            (x > Levels.position.levelIconPositions[i][0] && x < Levels.position.levelIconPositions[i][0] 
                + Levels.position.width) && 
            (y > Levels.position.levelIconPositions[i][1] && y < Levels.position.levelIconPositions[i][1] 
                + Levels.position.height)
        ) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            drawLevelIcon(arr[i][0], arr[i][1], Pos.width, Pos.height, Levels[`level_${i + 1}`].text, 20, Levels.position.hoverPadding);
            canvas.style.cursor = "pointer";
            break;
        }
        else 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            canvas.style.cursor = "auto";
            displayLevelIcons();
        }
    }
}


/*
*   Event listener that waits for level icon to be clicked 
*   to load proper level
*/
const levelIconClickListener = (e) => 
{
    var rect = canvas.getBoundingClientRect();
    var x = e.clientX - rect.left;
    var y = e.clientY - rect.top;
    var numLevels = Object.keys(Levels).length - 1;

    for (let i = 0; i < numLevels; i++) 
    {
        if (
            (x > Levels.position.levelIconPositions[i][0] && x < Levels.position.levelIconPositions[i][0] 
                + Levels.position.width) && 
            (y > Levels.position.levelIconPositions[i][1] && y < Levels.position.levelIconPositions[i][1] 
                + Levels.position.height)
        ) {

            initBricks(Levels[`level_${i+1}`].arr);

            console.log("Clicked level", i + 1);

            canvas.style.cursor = "auto";
            canvas.removeEventListener("mousemove", levelIconHoverListener);
            canvas.removeEventListener("mousedown", levelIconClickListener);

            Canvas.terminateLevelHover = true;

            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            
            drawBricks();
            draw();
            waitForGameStart();
        }
    }
}
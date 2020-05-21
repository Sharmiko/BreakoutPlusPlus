/*
*   Event listener that checks
*   if user hovered over the
*   menu icon, if that is true
*   then menu icon is scaled and
*   mouse is pointed to it
*/
canvas.onmousemove = (e) => 
{
    console.log("SHEVIDA");
    var rect = canvas.getBoundingClientRect();
    var x = e.clientX - rect.left;
    var y = e.clientY - rect.top;

    if (Canvas.menuClicked == false) 
    {
        // Hovering over play icon
        if (
            (x > Menu.play.x && x < Menu.play.x + Menu.play.width) && 
            (y > Menu.play.y && y < Menu.play.y + Menu.play.height)
        ) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            var padding = 10;
            var fontSize = 32;
            canvas.style.cursor = "pointer";
            drawPlayIcon(fontSize, padding);
            drawOptionsIcon(28, 0);
            drawAboutIcon(24, 0);
        }
        // Hovering over options icon
        else if (
            (x > Menu.options.x && x < Menu.options.x + Menu.options.width) && 
            (y > Menu.options.y && y < Menu.options.y + Menu.options.height)
        ) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            var padding = 10;
            var fontSize = 30;
            canvas.style.cursor = "pointer";
            drawPlayIcon(30, 0);
            drawOptionsIcon(fontSize, padding);
            drawAboutIcon(24, 0);
        }
        // Hovering over about icon
        else if (
            (x > Menu.about.x && x < Menu.about.x + Menu.about.width) && 
            (y > Menu.about.y && y < Menu.about.y + Menu.about.height)
        ) {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            var padding = 10;
            var fontSize = 32;
            canvas.style.cursor = "pointer";
            drawPlayIcon(30, 0);
            drawOptionsIcon(28, 0);
            drawAboutIcon(fontSize, padding);
        }

        // mouse outside the icons
        else 
        {
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            canvas.style.cursor = "auto";

            drawPlayIcon(30, 0);
            drawOptionsIcon(28, 0);
            drawAboutIcon(24, 0);
        }
    }
}


/*
*   Event listener that waits
*   for user click on hovered
*   menu icon to start the
*   proper event
*/
canvas.onmousedown = (e) => 
{
    var rect = canvas.getBoundingClientRect();
    var x = e.clientX - rect.left;
    var y = e.clientY - rect.top;

    // Hovering over menu icon
    if (Canvas.menuClicked == false) 
    {
        if (
            (x > Menu.play.x && x < Menu.play.x + Menu.play.width) && 
            (y > Menu.play.y && y < Menu.play.y + Menu.play.height)
        ) {
            e.stopImmediatePropagation();
            Canvas.menuClicked = true;
            canvas.style.cursor = "auto";
            
            ctx.clearRect(0, 0, Canvas.width, Canvas.height);
            initLevelIcons();
            displayLevelIcons();
            canvas.addEventListener("mousemove", levelIconHoverListener);
            canvas.addEventListener("mousedown", levelIconClickListener);
            //canvas.onmousemove = levelIconHoverListener;
            //canvas.onmousedown = levelIconClickListener;
        }
        else if ((
            x > Menu.options.x && x < Menu.options.x + Menu.options.width) && 
            (y > Menu.options.y && y < Menu.options.y + Menu.options.height)
        ) {
            alert("Coming Soon!");
        }
        else if (
            (x > Menu.about.x && x < Menu.about.x + Menu.about.width) && 
            (y > Menu.about.y && y < Menu.about.y + Menu.about.height)
        ) {
            alert("Coming Soon!");
        }
    }
}
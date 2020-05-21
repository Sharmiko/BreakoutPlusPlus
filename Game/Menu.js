/*
*   Menu object that contains 
*   3 menu icon objects: play,
*   options, and about. Each 
*   one with their unique
*   properties 
*/
const Menu = {
    play: {
        width: 140,
        height: 70,
        x: Canvas.width / 2,    // - width / 2
        y: Canvas.height / 2,    // - 150
        text: "Play"
    },
    options: {
        width: 120,
        height: 60,
        x: Canvas.width / 2,
        y: Canvas.width / 2,
        text: "Options"
    },
    about: {
        width: 90,
        height: 45,
        x: Canvas.width / 2,
        y: Canvas.height / 2,
        text: "About"
    },
    padding: 35
}

/*
*   Function that reajusts Menu object
*   parameters to fit the canvas with proper    
*   coordinate values
*/
const adjustMenuParameters = () => 
{
    // adjust menu icon
    Menu.play.x -= Menu.play.width / 2;
    Menu.play.y -= 150;

    // adjust options icon
    Menu.options.y = Menu.play.y + Menu.play.height + Menu.padding;
    Menu.options.x -= Menu.options.width / 2;

    // adjust about icon
    Menu.about.y = Menu.options.y + Menu.options.height + Menu.padding;
    Menu.about.x -= Menu.about.width / 2;
}


/*
*   Function that draws menu icon
*   at specified location with
*   custom text and style
*/
const drawMenuIcon = (x, y, width, height, text, fontSize, padding = 0) => 
{
    ctx.save();
    ctx.beginPath();
    ctx.rect(x - padding, y - padding, width + 2 * padding, height + 2 * padding);
    ctx.stroke();
    ctx.closePath();

    ctx.font = `${fontSize}px Comic Sans MS`;
    ctx.textAlign = 'center';
    ctx.fillStyle = 'grey'
    ctx.fillText(text, x + width / 2, y + 10 + height / 2);

    ctx.restore();
}


/*
*   Function that draws Play menu icon
*/
const drawPlayIcon = (fontSize, padding = 0) =>
{
    drawMenuIcon(
        Menu.play.x, 
        Menu.play.y, 
        Menu.play.width, 
        Menu.play.height, 
        Menu.play.text, 
        fontSize, 
        padding
    );
}


/*
*   Function that draws Options menu icon
*/
const drawOptionsIcon = (fontSize, padding = 0) =>
{
    drawMenuIcon(
        Menu.options.x, 
        Menu.options.y, 
        Menu.options.width, 
        Menu.options.height, 
        Menu.options.text, 
        fontSize, 
        padding
    );
}


/*
*   Function that draws About menu icon
*/
const drawAboutIcon = (fontSize, padding = 0) =>
{
    drawMenuIcon(
        Menu.about.x, 
        Menu.about.y, 
        Menu.about.width, 
        Menu.about.height, 
        Menu.about.text, 
        fontSize, 
        padding
    );
}

/*
*   Function that displays three menu icons
*/
const welcomeMenu = () => 
{
    adjustMenuParameters();
    // draw play button
    drawPlayIcon(30, 0);
    // draw options button
    drawOptionsIcon(28, 0);
    // draw about button
    drawAboutIcon(24, 0);
}
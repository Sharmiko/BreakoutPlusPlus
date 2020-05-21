/*
*   Function that draws text on the canvas
*   with given style and customization
*/
function drawText(fontSize = 24, color, text, width, height)
{
    ctx.font = `${fontSize}px Comic Sans MS`;
    ctx.textAlign = 'center';
    ctx.fillStyle = color;
    ctx.fillText(text, width, height);
}
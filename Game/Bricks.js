/*
*   Bricks object, player should 
*   destroy all bricks displayed 
*   on canvas. Once player destroyes
*   all bricks(total = rows * columns)
*   player wins.
*
*/
const Bricks = {
    arr: [],
    width: 60,
    height: 15,
    originX: 0,
    originY: 0, 
    originXPadding: 15,
    originYPadding: 10,
    paddingX: 5,
    paddingY: 5,
    rows: 10,
    columns: 8,
    total: 0,
    type: [
        "#E8A87C",
        "#C38D9E",
    ]
}


/*
*   Draws brick on canvas with given properties
*/
const drawBrick = (x, y, color) => 
{
    ctx.save();
    ctx.beginPath()
    ctx.rect(x, y, Bricks.width, Bricks.height);
    ctx.stroke();
    ctx.fillStyle = color;
    ctx.fill();
    ctx.restore();
}


/*
*   Function that draws all initialized  
*   bricks on canvas, this function 
*   is dependant on drawBrick method. 
*/
const drawBricks = () => {
    //Bricks.arr[i].gotHit == 0 && 
    //Bricks.arr[i].x != null && 
    //Bricks.arr[i].y != null
    for (let i = 0; i < Bricks.rows * Bricks.columns; i++) 
    {
        if (Canvas.levelBricks[i] > 0) 
        {
            console.log("drawn");
            ctx.save();
            let x = Bricks.arr[i].x;
            let y = Bricks.arr[i].y;
            drawBrick(x, y, Bricks.type[Canvas.levelBricks[i] - 1]);
            ctx.restore();
        }
    }
}


/*
*   Function that initializes Bricks
*   with bricks(total = columns * rows)  
*   Each brick's x and y coordinate is 
*   calculated, padding is taken into
*   account. And lastly brick object is
*   pushed into main Bricks Object.
*
*/
const initBricks = (brickArray) => 
{
    let xCount = Bricks.originXPadding;
    let yCount = Bricks.originYPadding;

    for (var i = 0; i < Bricks.rows; i++) 
    {
        for (var k = 0; k < Bricks.columns; k++) 
        {
            let brick = {};
            brick.gotHit = 0;
            brick.x = xCount;
            xCount += Bricks.width + Bricks.paddingX;

            brick.y = yCount;

            Bricks.arr.push(brick)
        }
        xCount = Bricks.originXPadding;
        yCount += Bricks.height + Bricks.paddingY;
    }

    Bricks.total = Bricks.columns * Bricks.rows;
    var linearBrickArray = [];

    for (let i = 0; i < brickArray.length; i++) 
    {
        for (let k = 0; k < brickArray[0].length; k++) 
        {
            linearBrickArray.push(brickArray[i][k]);
        }
    }

    Canvas.levelBricks = linearBrickArray;
}
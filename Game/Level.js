/*
*   Object that contains level objects
*   that contains information about
*   how each level should be loaded.
*   It also contains information about
*   level text and number of starts that
*   can be acquired
*/
/*  Template

    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0]
    
*/
const Levels = {
    level_1: {
        arr: [
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1]
        ],
        x: 0,
        y: 0, 
        text: "Level 1",
        stars: 3,
        taken: 0
    },
    level_2: {
        arr: [
            [1, 0, 1, 0, 0, 1, 0, 1],
            [1, 0, 1, 0, 0, 1, 0, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [1, 0, 1, 0, 0, 1, 0, 1],
            [1, 0, 1, 0, 0, 1, 0, 1],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 1, 1, 1, 1, 1, 1, 0],
            [0, 0, 0, 1, 1, 0, 0, 0],
            [0, 1, 1, 1, 1, 1, 1, 0]
        ],
        text: "Level 2",
        stars: 3,
        taken: 0

    },
    level_3: {
        arr:[
            [1, 1, 0, 0, 0, 0, 1, 1],
            [2, 2, 0, 1, 1, 0, 2, 2],
            [0, 0, 0, 2, 2, 0, 0, 0],
            [1, 1, 0, 0, 0, 0, 1, 1],
            [2, 2, 0, 1, 1, 0, 2, 2],
            [0, 0, 0, 2, 2, 0, 0, 0],
            [1, 1, 0, 0, 0, 0, 1, 1],
            [2, 2, 0, 1, 1, 0, 2, 2],
            [0, 0, 0, 2, 2, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0]
        ],
        text: "Level 3",
        stars: 3,
        taken: 0
    },
    position: {
        x: 75,
        y: 0,
        width: 80,
        height: 60,
        padding: 80,
        startPaddingX: 20,
        startPaddingY: 15,
        levelIconPositions: [],
        hoverPadding: 10
    }
}

/*
*   Function that initializes level icon
*   coordinates that is stored in an array
*/
const initLevelIcons = () => 
{
    var numLevels = Object.keys(Levels).length - 1;
    var Pos = Levels.position;
    for (let i = 1; i <= numLevels; i++) 
    {
        if (i % 4 == 0) 
        {
            Pos.y += Pos.height + Pos.padding;
        }
        Levels.position.levelIconPositions.push([Pos.x, Pos.y + Pos.padding]);
        Pos.x += Pos.width + Pos.padding; 
    }
}


/*
*   Function that displays level icons 
*/
const displayLevelIcons = () => 
{
    var numLevels = Object.keys(Levels).length - 1;
    var arr = Levels.position.levelIconPositions;
    var Pos = Levels.position;
    for (let i = 0; i < numLevels; i++) 
    {
        drawLevelIcon(
            arr[i][0], 
            arr[i][1], 
            Pos.width, 
            Pos.height, 
            Levels[`level_${i + 1}`].text, 
            18, 
            0
        );
    }
}


/*
*   Function that draws Level icon with proper level text and 
*   3 unfilled stars
*/
const drawLevelIcon = (x, y, width, height, text, fontSize, padding = 0) => 
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

    drawStar(x + Levels.position.startPaddingX, y + Levels.position.startPaddingY - padding, 5, 5, 2.5);
    drawStar(x + Levels.position.startPaddingX * 2, y + Levels.position.startPaddingY - padding, 5, 5, 2.5);
    drawStar(x + Levels.position.startPaddingX * 3, y + Levels.position.startPaddingY - padding, 5, 5, 2.5);

    ctx.restore();
}


/*
*   Function that draws a star
*/
const drawStar = (cx, cy, spikes, outerRadius, innerRadius) => 
{
    var rot = Math.PI / 2 * 3;
    var x = cx;
    var y = cy;
    var step = Math.PI / spikes;

    ctx.strokeSyle = "#000";
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius)

    for (i = 0; i < spikes; i++) 
    {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y)
        rot += step

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y)
        rot += step
    }

    ctx.lineTo(cx, cy - outerRadius)
    ctx.closePath();
    ctx.lineWidth = 3;
    ctx.strokeStyle = 'black';
    ctx.stroke();
    ctx.fillStyle = 'white';
    ctx.fill();
}
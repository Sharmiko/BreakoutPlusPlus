/*
*   Heart Object that controls
*   player's lives, one heart
*   is decremented when ball
*   falls down, if heart count
*   reaches to zero, player looses.
*/
const Heart = {
    total: 3,
    alive: 3,
    x: 100,
    y: 100,
    width: 12,
    height: 25,
    hearts: []
}


/*
*   Function that initializes heart
*/
const initHearts = () => 
{
    var hearts = document.querySelectorAll('.heart_container');
    for (heart of hearts) 
    {
        Heart.hearts.push(heart);
    }
}


/*
*   Function that resets the visibility of hearts
*/
const resetHearts = () => 
{
    Heart.hearts[0].style.visibility = "visible";
    Heart.hearts[1].style.visibility = "visible";
    Heart.hearts[2].style.visibility = "visible";
}
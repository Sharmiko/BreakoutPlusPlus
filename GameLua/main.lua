function love.load()
    Object = require "classic"

    require "Paddle"
    require "Ball"
    require "Menu"
    require "Level"
    require "Bricks"

    paddle = Paddle()
    ball = Ball()
    menu = Menu()
    level = Level()
    bricks = Bricks(level.levels[1]["arr"])

    state = {
        playButtonClicked =  false,
        optionsButtonClicked =  false,
        aboutButtonClicked = false,
        levelButtonClicked = false,
        level = nil
    }

end 


function love.update(dt)
    if (state["playButtonClicked"])
    then
        level:update(state)
    elseif (state["levelButtonClicked"])
    then 
        bricks:update()
    elseif(state["optionsButtonClicked"])
    then
        --state["optionsButtonClicked"] = false
    elseif(state["aboutButtonClicked"])
    then
        --state["aboutButtonClicked"] = false 
    else
        menu:update(state)
    end
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    if (state["playButtonClicked"])
    then 
        level:draw()
    elseif (state["levelButtonClicked"])
    then
        print("Bricks")
        bricks:draw()
    else
        menu:draw()
    end 
end 
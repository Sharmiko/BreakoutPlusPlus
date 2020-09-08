function love.load()
    Object = require "classic"

    require "Paddle"
    require "Ball"
    require "Menu"
    require "Level"

    paddle = Paddle()
    ball = Ball()
    menu = Menu()
    level = Level()

    state = {
        playButtonClicked =  false,
        optionsButtonClicked =  false,
        aboutButtonClicked = false,
        levelButtonClicked = false
    }

end 


function love.update(dt)
    --paddle:update(dt)
    --ball:update(dt, paddle)
    if (state["playButtonClicked"])
    then
        --love.mouse.setCursor()
        --state["playButtonClicked"] = false
        level:update()
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
    else
        menu:draw()
    end 
    --paddle:draw()
    --ball:draw()
end 
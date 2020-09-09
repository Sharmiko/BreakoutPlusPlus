function love.load()
    Object = require "classic"

    require "Menu"
    require "Level"
    require "Game"

    menu = Menu()
    level = Level()
    game = Game()

    love.window.setMode(800, 800)

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
        level:update(state, game)
    elseif (state["levelButtonClicked"])
    then 
        game:update(dt)
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
        game:draw()
    else
        menu:draw()
    end 
end 